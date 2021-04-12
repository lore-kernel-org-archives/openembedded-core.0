Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
 by mx.groups.io with SMTP id smtpd.web08.3170.1618259329370476489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 13:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=mfCekJ36;
 spf=pass (domain: amazon.com, ip: 207.171.188.200, mailfrom: prvs=729d0702c=pbbudny@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1618259329; x=1649795329;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=LhjsW4UwHgXinwv/8GqtebPdheC0Is3PYeSaLLO65uc=;
  b=mfCekJ361VcdHj0xI6rNEs96qOTAoqUhy3vlV0tfIk1+TC9s1irnJORO
   LoTRBxtvtsDrK5baeL/dO6jZ/MQR2z2vjE2GsjgwvkLaxmeryeLkZZj5z
   LK5yIB7u3aX/Lhx6zTvmeQv7uX6V86bVag9pDeFczDNNOp4Tf+bYO6m3+
   s=;
X-IronPort-AV: E=Sophos;i="5.82,216,1613433600"; 
   d="scan'208,223";a="925429916"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP; 12 Apr 2021 20:28:48 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS id 4FC9FA1866
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 20:28:48 +0000 (UTC)
Received: from EX13D38UWB002.ant.amazon.com (10.43.161.171) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 12 Apr 2021 20:28:47 +0000
Received: from EX13D38UWB003.ant.amazon.com (10.43.161.178) by
 EX13D38UWB002.ant.amazon.com (10.43.161.171) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 12 Apr 2021 20:28:47 +0000
Received: from EX13D38UWB003.ant.amazon.com ([10.43.161.178]) by
 EX13D38UWB003.ant.amazon.com ([10.43.161.178]) with mapi id 15.00.1497.012;
 Mon, 12 Apr 2021 20:28:47 +0000
From: "Budny, Peter" <pbbudny@amazon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] lib/oe/terminal: Fix tmux new-session on older tmux versions
Thread-Topic: [PATCHv2] lib/oe/terminal: Fix tmux new-session on older tmux
 versions
Thread-Index: Adcv2mYJ4IXLqfOWSbe7jyibm4i9rg==
Date: Mon, 12 Apr 2021 20:28:47 +0000
Message-ID: <8b7d9ad8d3564c4e98203b8c337e327f@EX13D38UWB003.ant.amazon.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.102]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 92be587f2c71b6beb6f4f79c882b3c31a4e41f38 Mon Sep 17 00:00:00 2001
From: Peter Budny <pbbudny@amazon.com>
Date: Mon, 12 Apr 2021 20:23:17 +0000
Subject: [PATCH] lib/oe/terminal: Fix tmux new-session on older tmux versio=
ns
 (<1.9)

`tmux new -c` fails on tmux older than 1.9, when that flag was added.
We can omit the flag for older versions of tmux, and the working
directory gets set even without it.

Signed-off-by: Peter Budny <pbbudny@amazon.com>
---
 meta/lib/oe/terminal.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index e4045559fc..c8b8b4d6fe 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -160,7 +160,12 @@ class Tmux(Terminal):
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
@@ -247,13 +252,18 @@ def spawn(name, sh_cmd, title=3DNone, env=3DNone, d=
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

