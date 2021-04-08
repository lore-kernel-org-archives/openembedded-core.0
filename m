Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web12.501.1617905374884774211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 11:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=hLWUroWf;
 spf=pass (domain: amazon.com, ip: 52.95.48.154, mailfrom: prvs=72524c249=pbbudny@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1617905375; x=1649441375;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=XyuptfpZDYr72HJsRop7LJTC5o3QyXeC8wZk0uMPgUs=;
  b=hLWUroWfepJcThR/jOpnf4nCh1kgz31S24zUjunagwiekO6Odc8Z+mHN
   TJyi4xo9FQA+uOSvJnjY2HT1Xx+/L5p4oPmDre0RJegw+Fvk+4QcFD2TT
   QG7kEKNRzAsP6fv7AM1EcfNUbUU4hVKMzYgHipNSIQ71fJ3QvJCQOxxdu
   M=;
X-IronPort-AV: E=Sophos;i="5.82,207,1613433600"; 
   d="scan'208";a="106345439"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 08 Apr 2021 18:09:34 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS id A0480A177D
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Apr 2021 18:09:33 +0000 (UTC)
Received: from EX13D38UWB003.ant.amazon.com (10.43.161.178) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 8 Apr 2021 18:09:33 +0000
Received: from EX13D38UWB003.ant.amazon.com (10.43.161.178) by
 EX13D38UWB003.ant.amazon.com (10.43.161.178) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 8 Apr 2021 18:09:32 +0000
Received: from EX13D38UWB003.ant.amazon.com ([10.43.161.178]) by
 EX13D38UWB003.ant.amazon.com ([10.43.161.178]) with mapi id 15.00.1497.012;
 Thu, 8 Apr 2021 18:09:32 +0000
From: pbbudny@amazon.com
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] terminal: Fix tmux new-session on older tmux versions (<1.9)
Thread-Topic: [PATCH] terminal: Fix tmux new-session on older tmux versions
 (<1.9)
Thread-Index: AdcsohBbj2K65eDJQROfVSQJaNdCFQ==
Date: Thu, 8 Apr 2021 18:09:32 +0000
Message-ID: <db9c2955d3904d79b1dc38ed2e655260@EX13D38UWB003.ant.amazon.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.93]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

`tmux new -c` fails on tmux older than 1.9, when that flag was added.
We can omit the flag for older versions of tmux, and the working
directory gets set even without it.
---
 meta/lib/oe/terminal.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index a1daa2bed6..a7aaf3dfe1 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -163,7 +163,12 @@ class Tmux(Terminal):
         # devshells, if it's already there, add a new window to it.
         window_name =3D 'devshell-%i' % os.getpid()
=20
-        self.command =3D 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{comman=
d}}"'.format(window_name)
+        self.command =3D 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{comman=
d}}"'
+        if not check_tmux_version('1.9'):
+            # `tmux new-session -c` was added in 1.9;
+            # older versions fail with that flag
+            self.command =3D 'tmux new -d -s {0} -n {0} "{{command}}"'
+        self.command =3D self.command.format(window_name)
         Terminal.__init__(self, sh_cmd, title, env, d)
=20
         attach_cmd =3D 'tmux att -t {0}'.format(window_name)
@@ -250,13 +255,18 @@ def spawn(name, sh_cmd, title=3DNone, env=3DNone, d=
=3DNone):
         except OSError:
            return
=20
+def check_tmux_version(desired):
+    vernum =3D check_terminal_version("tmux")
+    if vernum and LooseVersion(vernum) < desired:
+        return False
+    return vernum
+
 def check_tmux_pane_size(tmux):
     import subprocess as sub
     # On older tmux versions (<1.9), return false. The reason
     # is that there is no easy way to get the height of the active panel
     # on current window without nested formats (available from version 1.9=
)
-    vernum =3D check_terminal_version("tmux")
-    if vernum and LooseVersion(vernum) < '1.9':
+    if not check_tmux_version('1.9'):
         return False
     try:
         p =3D sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}=
"' % tmux,
--=20
2.23.3

