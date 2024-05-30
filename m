Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB4DC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 11:15:55 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.5735.1717067745254650538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 04:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=RkJXo90T;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 85D26240029
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 13:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1717067742; bh=TDaxN2HtXyYpkq/5Kml9cXBKMNU0YEHDTMrHQGrRVGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=RkJXo90TRBUi/V7nWdtLsjNi7V0gZWu/nu7NVqwhPUdWKDr5Q0aJFepllPMZfBZIQ
	 HNfO4TUdERAXrjJ75tHD6pI9cTsAni/khVHEkJsATeAn+Nn+Kb8nljD5Wj3kZIvz+E
	 UgtMWdsg1GM2siE0H45XiKKtxKIqbayvwfUl0DQjiGB4SEVT/Ea+f3l0ptfEKHqZqq
	 L9d3U1uI7cBLxKI7WZm0u4sVgGAsZUGy551aO+n9gB+tUUyYIC8s/4hj8RC830X+Eb
	 9gYvehBAwYpC/Osf367RM6B5oSzhlijMdBhwwKeW1XNYHKmICMU5t7JGv5L9K5mIsI
	 gnas6vGmZNzbw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VqkFT51C3z6tyy;
	Thu, 30 May 2024 13:15:41 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] Sanity: Check if tar is gnutar
Date: Thu, 30 May 2024 11:15:32 +0000
Message-Id: <20240530111532.352867-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200019

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

In sanity.bbclass the tar version is checked as tar needs to be recent en=
ough
for reproducible builds. Tar could also be provided by other means then g=
nutar,
but we mean the version of gnutar in the check. Hence we also should ensu=
re
that the installed tar is gnutar.

[YOCTO #14205]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/classes-global/sanity.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
index 180c6b77d8..1d242f0f0a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -495,12 +495,15 @@ def check_gcc_version(sanity_data):
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducible=
 builds are enabled
+# Gtar is assumed at to be used as tar in poky
 def check_tar_version(sanity_data):
     import subprocess
     try:
         result =3D subprocess.check_output(["tar", "--version"], stderr=3D=
subprocess.STDOUT).decode('utf-8')
     except subprocess.CalledProcessError as e:
         return "Unable to execute tar --version, exit code %d\n%s\n" % (=
e.returncode, e.output)
+    if not "GNU" in result:
+        return "Your version of tar is not gtar. Please install gtar (yo=
u could use the project's buildtools-tarball from our last release or use=
 scripts/install-buildtools).\n"
     version =3D result.split()[3]
     if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have=
 the support needed to enable reproducible builds. Please install a newer=
 version of tar (you could use the project's buildtools-tarball from our =
last release or use scripts/install-buildtools).\n"
--=20
2.39.2


