Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14F3C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:36:11 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.9109.1661333758996810998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=AIxUJfRU;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 525265C00C3;
	Wed, 24 Aug 2022 05:35:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 24 Aug 2022 05:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661333758; x=1661420158; bh=PgUyMF1ilNzuTj0BKECTJfCVz
	bXBu6CyRh+n10iFrPg=; b=AIxUJfRU5ZiCCdRIEz4g6zGYBiib/PGLGd/cmh/m/
	e2BMnZSMBPXD2xTA4Bb0tsu87S6N9kS5M7sF7RqDTzv85eLg+Uei+aS8i+db4Tqg
	do8uRwZrfWOSUHvWGWU2btLiD9etom41DUNDM9PNMegWcAyVa5xRgxEx40OB81Bt
	yZ/3VMJU0YFdqSKCrp5GY20H7o/kcKEQen0/4jk0XX2oOBJMF83QmUAkMXpxNZ7n
	g2w18jSEX2z9mHTUr+L8DQEuwezNlPn6Vyltt6HqaFg/xGVr7hSe78hG3NHlKena
	QFvKR/MbP6gKuxK9z5gx3RJo1L2AQzXps3o3mOHdLAg9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661333758; x=1661420158; bh=PgUyMF1ilNzuTj0BKECTJfCVzbXBu6CyRh+
	n10iFrPg=; b=RnwEPK24hFbHqBa9kTVym4yshQJoRyISZkCVVcjL4jhT0Jf3S+L
	QiQGx2JiXnIJ4zj0mW8T7RRTiDyY4IOnmRAnAuPJD1m1oG3oL3tkBKcq4T4Lz+Ap
	EhBonJTyqFJ+e7841blRC4BTfXesgRQ87P8S7zseteMr4G57ESDZwSc51XBZxTCc
	VXD4AygOgCT9ZxjQaN5cBe/IImJ48hFHzNcfu1t1KmC3yWHaaEadpn9PFku1eLDw
	OnQ7OhxjiWp9fEenWjg/XIKIlK8yu/G3IIPYG8kMNqhBXNKvpyPPESuwKK01uHzp
	yR/Tb4tq77pwamA5JzMIGkLDbw7s/HS8vAA==
X-ME-Sender: <xms:_vAFY2phTvR9eV6FRay3Z1ZoV-mca-k8demB0RgpDF9x14OJaQLNpg>
    <xme:_vAFY0rSknJTR3eemVYGIgtwFjYcoKhGuB6n_mzlRGyTfsL-4Iwg52rLXY_04yN6T
    ieBa6mIB00EFWsi2As>
X-ME-Received: 
 <xmr:_vAFY7NdCrGq7HtqLUBEWNRdUJ_ANu_h8zXZHKd-yOEEAdNk5wYQxl7BbXRMHC8wtmPhvqdU1mdmMfqIHDDrnEnumwbrb46FaMXGTuOPMGtle-CJ6s7DNlm0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:_vAFY14jgJE_RhJ_2be-UdFrm9guF7G17sv4r1IeUQaY4_TB4xpSjQ>
    <xmx:_vAFY15HQW586BAoBHdk0MR7yTyO-h-BnLaeqtZ_dxdSRgL-o8XnsQ>
    <xmx:_vAFY1hzeGc3MdWayFOOwkaNmgfnOqUQ05I2e9a8LOxOvRTpVkNiqw>
    <xmx:_vAFY3T8aPFGgWvSizN8s3dv5gyzeymfvUqh62npJvWdFq7-DwSNTw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 05:35:57 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2 6/6] shadow: Avoid nss warning/error with musl
Date: Wed, 24 Aug 2022 11:35:27 +0200
Message-Id: <20220824093526.2549922-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:36:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169800

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The libnss configuration file is only installed when glibc is used. The
inexistence of it on a musl-based rootfs, will make shadow complain
about it:

Failed opening /etc/nsswitch.conf

This is because shadow will try to use nsswich when dealing with
subordinate IDs and the message is just a warning as the tool will still
generate them correctly in subuid/subgid files.

We drop this log message for class native to avoid an error when rootfs
logs are checked ('Failed' will match the regex bitbake is using to
check for rootfs generation errors).

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...f-message-when-not-in-place-eg.-musl.patch | 27 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
new file mode 100644
index 0000000000..895c09e738
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
@@ -0,0 +1,27 @@
+From 11290e897a49adddee215833944a518443d9b0d6 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 24 Aug 2022 00:54:47 +0200
+Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/issues/557]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ lib/nss.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/nss.c b/lib/nss.c
+index 06fa48e..44245da 100644
+--- a/lib/nss.c
++++ b/lib/nss.c
+@@ -59,7 +59,7 @@ void nss_init(const char *nsswitch_path) {
+ 	//   subid:	files
+ 	nssfp = fopen(nsswitch_path, "r");
+ 	if (!nssfp) {
+-		fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
++		//fprintf(shadow_logfd, "Failed opening %s: %m\n", nsswitch_path);
+ 		atomic_store(&nss_init_completed, true);
+ 		return;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b2f82e9ac7..414bf467ba 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -25,12 +25,14 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 SRC_URI[sha256sum] = "9fdb73b5d2b44e8ba9fcee1b4493ac75dd5040bda35b9ac8b06570cd192e7ee3"
 
+
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/chpasswd \
-- 
2.25.1


