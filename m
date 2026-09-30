Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA3CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:22:54 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14641.1790778164108932485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=oVctlUHf;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout07.t-online.de (Postfix) with SMTP id CD13EE362;
	Wed, 30 Sep 2026 16:22:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.219]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBvCi-1zxkxd0; Wed, 30 Sep 2026 16:22:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [oe-core][PATCH] staging: keep the mtime of files fixed up in the sysroot
Date: Wed, 30 Sep 2026 16:22:31 +0200
Message-ID: <20260930142231.1818511-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790778160-52FFA862-74DE0C0D/0/0 CLEAN NORMAL
X-TOI-MSGID: 07a57489-d535-4769-ba20-57c2305f7344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790778161; i=f_l_k@t-online.de;
	bh=76QW1RlqXpxWPaljCfOGetNyJoXuLvCmxwZZEGvPdCk=;
	h=From:To:Cc:Subject:Date;
	b=oVctlUHf0/kAIjpKf95viZpEAk2bfW4JffVIHPDPiPW96mDWUQrR2RG4tjDBH8qF5
	 ofy4QkVXceFcFLyb69ngwYKkeDJVnutSmpM1jTpqs9GmYQ4khpaeWT/oIlSVzVjXnF
	 hIqD+bj06xBE6euXCVD8VjdiWgdkGbp1ixdNKLcnFFKuQcLKJCeUGauN34dwWvyHxJ
	 oc3XoduvtIeiU8aOfb6n99F558IcCzAo7kyPs7aTqDaNVOU+dridGFD7zp53V2brMU
	 04FBIKvS3XMXbAUiwDuRXq61gVFT2Ds4dsGkHLtKT53/4WIVRPhEkCyH49bqEUG0y4
	 wW5sW2jsrebsQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 14:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246974

staging_processfixme() replaces the FIXMESTAGINGDIR placeholders with
sed -i, which gives the files the current time. They then look newer
than anything already built against them, and build systems that
compare timestamps consider their outputs out of date. For example, the
Makefile of a cpan recipe depends on perl's Config.pm and config.h; when
perl-native is staged again, make regenerates the Makefile during
do_compile or do_install and fails, asking to be rerun.

Record the times of the files before sed and restore them afterwards.
The list of files is now read in Python instead of being passed through
xargs, and sed is run on chunks of it.

Suggested-by: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-global/staging.bbclass | 34 +++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
index 5833abebc8..f8d476f8f8 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -176,16 +176,42 @@ def staging_copydir(c, target, dest, seendirs):
         seendirs.add(dest)
=20
 def staging_processfixme(fixme, target, recipesysroot, recipesysrootnati=
ve, d):
+    import re
     import subprocess
=20
     if not fixme:
         return
-    cmd =3D "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGI=
NGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme)=
, recipesysroot, recipesysrootnative)
+    files =3D []
+    for fixmefile in fixme:
+        with open(fixmefile) as f:
+            for line in f:
+                line =3D line.strip()
+                if line:
+                    files.append(re.sub(r"^[^/]*/", target + "/", line))
+    if not files:
+        return
+
+    cmd =3D ["sed", "-i", "-e", "s:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMEST=
AGINGDIRHOST:%s:g" % (recipesysroot, recipesysrootnative)]
     for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', '=
PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
         fixme_path =3D d.getVar(fixmevar)
-        cmd +=3D " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
-    bb.debug(2, cmd)
-    subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOU=
T)
+        cmd +=3D ["-e", "s:FIXME_%s:%s:g" % (fixmevar, fixme_path)]
+
+    # sed -i rewrites the files, which would give them the current time =
and
+    # make them look newer than anything already built against them. Bui=
ld
+    # systems that compare timestamps then consider their outputs out of=
 date,
+    # e.g. cpan Makefiles depending on perl's Config.pm. Keep the times =
the
+    # files had when they were staged.
+    times =3D {}
+    for f in files:
+        st =3D os.stat(f)
+        times[f] =3D (st.st_atime_ns, st.st_mtime_ns)
+
+    bb.debug(2, " ".join(cmd) + " <%d files>" % len(files))
+    for i in range(0, len(files), 1000):
+        subprocess.check_output(cmd + files[i:i + 1000], stderr=3Dsubpro=
cess.STDOUT)
+
+    for f, ns in times.items():
+        os.utime(f, ns=3Dns)
=20
=20
 def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d=
):
--=20
2.55.0


