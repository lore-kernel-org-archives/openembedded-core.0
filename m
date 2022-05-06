Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685A3C4332F
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11346.1651852569765968982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41565153B;
	Fri,  6 May 2022 08:56:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC3023F885;
	Fri,  6 May 2022 08:56:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] scripts/git: Ensure we don't have circular references
Date: Fri,  6 May 2022 16:56:03 +0100
Message-Id: <20220506155604.2401829-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506155604.2401829-1-ross.burton@arm.com>
References: <20220506155604.2401829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165347

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is horrible but I'm running out of better ideas. We hit circular ref=
erence
issues which we were trying to avoid in the core HOSTTOOLS code. When bui=
lding
the eSDK, there can be two copies of the script.

Therefore assume git will never be in a directory called scripts. This
fixes eSDK build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/git | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/git b/scripts/git
index 8adf5c9ecb..644055e540 100755
--- a/scripts/git
+++ b/scripts/git
@@ -10,7 +10,14 @@ os.environ['PSEUDO_UNLOAD'] =3D '1'
=20
 # calculate path to the real 'git'
 path =3D os.environ['PATH']
-path =3D path.replace(os.path.dirname(sys.argv[0]), '')
+# we need to remove our path but also any other copy of this script whic=
h
+# may be present, e.g. eSDK.
+replacements =3D [os.path.dirname(sys.argv[0])]
+for p in path.split(":"):
+    if p.endswith("/scripts"):
+        replacements.append(p)
+for r in replacements:
+    path =3D path.replace(r, '/ignoreme')
 real_git =3D shutil.which('git', path=3Dpath)
=20
 if len(sys.argv) =3D=3D 1:
--=20
2.25.1


