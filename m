Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A512C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:53:22 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.13766.1707573192128389908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=T5uQojyg;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 69AF6240027
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 14:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707573190; bh=uK3oV8IQNCIyKy3Ad+6Kkw2oCZ+e4/pAjEUzKHNLupM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=T5uQojygDaXU11HKxjNv+wl9mea53qUuxZeIyeSnJ5NUu2K4o2AXjuOOZ+AegV2UO
	 QNfzwu1aw8y2gub8tUiTkxSwnVW+ymQGIHfuepdejszzs9RRePAl5LdTizNPLl1vvH
	 9ALJ6eSkvVLwQbM/IpTmjgQGHQcaTdxXGnnDwTPC0KSvQaI4P7RnzfHMea6O1cs+Zj
	 fTuaZIdOoGdhE1rVpjOsKF3d68tRv1AiR5e6P4iwDj7p4irtnmHSMluV9Uw9qriEqP
	 ezLOWNtViZraHCYqdPWUuCRLdT0ggbSH39fvR1IshTrVH/lcGshpVpRHoI34dt5V++
	 6wYAZDgSMw7wg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TXBxx5m7Qz6tsb;
	Sat, 10 Feb 2024 14:53:09 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] patchtest: Add selftest for test cve_check_ignore
Date: Sat, 10 Feb 2024 13:52:59 +0000
Message-Id: <20240210135259.563083-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195273

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Add a selftest for the recently introduced check for CVE_CHECK_IGNORE.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../TestMetadata.test_cve_check_ignore.fail   | 30 ++++++++++++++++++
 .../TestMetadata.test_cve_check_ignore.pass   | 31 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_c=
ve_check_ignore.fail
 create mode 100644 meta/lib/patchtest/selftest/files/TestMetadata.test_c=
ve_check_ignore.pass

diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_chec=
k_ignore.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_c=
heck_ignore.fail
new file mode 100644
index 0000000000..3574463ade
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignor=
e.fail
@@ -0,0 +1,30 @@
+From c4ca86b9cca3643097db0328e2f34dccffbba309 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@posteo.co=
m>
+Date: Sat, 10 Feb 2024 13:18:44 +0100
+Subject: [PATCH] selftest-hello: add CVE_CHECK_IGNORE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This should fail the test_cve_tag_format selftest.
+
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+---
+ .../recipes-test/selftest-hello/selftest-hello_1.0.bb          | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.=
0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 547587bef4..3ef9b87c34 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -16,4 +16,5 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+=20
+-BBCLASSEXTEND =3D "native nativesdk"
+\ No newline at end of file
++CVE_CHECK_IGNORE =3D "CVE-2024-12345"
++BBCLASSEXTEND =3D "native nativesdk"
+--=20
+2.39.2
+
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_chec=
k_ignore.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_c=
heck_ignore.pass
new file mode 100644
index 0000000000..10f942a6eb
--- /dev/null
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_cve_check_ignor=
e.pass
@@ -0,0 +1,31 @@
+From 7d4d3fee0c7111830ee9b2b049ae3ce265b26030 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Simone=3D20Wei=3DC3=3D9F?=3D <simone.p.weiss@posteo.co=
m>
+Date: Sat, 10 Feb 2024 13:23:56 +0100
+Subject: [PATCH] selftest-hello: add CVE_STATUS
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This should pass the test_cve_tag_format selftest.
+
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+---
+ .../recipes-test/selftest-hello/selftest-hello_1.0.bb         | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.=
0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+index 547587bef4..9908b3b417 100644
+--- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
++++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
+@@ -16,4 +16,6 @@ do_install() {
+ 	install -m 0755 helloworld ${D}${bindir}
+ }
+=20
+-BBCLASSEXTEND =3D "native nativesdk"
+\ No newline at end of file
++CVE_STATUS[CVE-2024-12345] =3D "not-applicable-platform: Issue only app=
lies on Windows"
++
++BBCLASSEXTEND =3D "native nativesdk"
+--=20
+2.39.2
+
--=20
2.39.2


