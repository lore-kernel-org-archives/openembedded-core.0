Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D4CFA3741
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:24:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.783.1666970637168034952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C58EA1FB;
	Fri, 28 Oct 2022 08:24:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 111B63F534;
	Fri, 28 Oct 2022 08:23:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] sanity: check for GNU tar specifically
Date: Fri, 28 Oct 2022 16:23:53 +0100
Message-Id: <20221028152354.652211-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172258

We need the system tar to be GNU tar, as we reply on --xattrs.  Some
distributions may be using libarchive's tar binary, which is definitely
not as featureful, so check for this and abort early with a clear
message instead of later with mysterious errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/sanity.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
index 15067e78d3c..606444cae18 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -504,6 +504,14 @@ def check_tar_version(sanity_data):
     version =3D result.split()[3]
     if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have=
 the support needed to enable reproducible builds. Please install a newer=
 version of tar (you could use the project's buildtools-tarball from our =
last release or use scripts/install-buildtools).\n"
+
+    try:
+        result =3D subprocess.check_output(["tar", "--help"], stderr=3Ds=
ubprocess.STDOUT).decode('utf-8')
+        if "--xattrs" not in result:
+            return "Your tar doesn't support --xattrs, please use GNU ta=
r.\n"
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute tar --help, exit code %d\n%s\n" % (e.r=
eturncode, e.output)
+
     return None
=20
 # We use git parameters and functionality only found in 1.7.8 or later
--=20
2.34.1


