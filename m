Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DACC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:43:01 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.9032.1661334168081797248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=RQHpVOoW;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B7DE5C00E5;
	Wed, 24 Aug 2022 05:42:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 24 Aug 2022 05:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661334167; x=1661420567; bh=Vx
	ZSTXTBGbALjw2/DPQrmmf+1X/gQd5S9jtdz/XAVdE=; b=RQHpVOoWIDVVyhwMw/
	rO0i4PfUyuz+yBalrP7CFH3gz8/k4MmRnPhcMHrhJ8Fr1IZ/Wab322GcDoX+eKNI
	K8gC1UkTF36TUf33tGwRk8Tcl4iXbnFEyCiYthuW3qy7bkKLZQfCqZ6/m6cA22Xm
	XaTuglF5zpOmkz9v43O7kEDDqJlzAlzM7B1pHIuqeKi+N+7imRCOJlqps6YEteC+
	g0Fkq0bvS6JSiW+8d4lH8/HDLAHFqnKlwtq1qhB06NYqnTEHsgKHkuMCQAELoMUy
	KVFI6GJRg4fEiyM9dufb3OEHYiNlV+taGD40f3AgrSPnBNVu0yEyh7QODuAFXS4a
	jMLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661334167; x=1661420567; bh=VxZSTXTBGbALj
	w2/DPQrmmf+1X/gQd5S9jtdz/XAVdE=; b=KKYmo3pfhciaTG4qyE7TtzdchErcG
	h1peRZYz0cKWKjrlFMd89FImnfoncT+GauNeMCC74eYvrQT+k1/fNlNT1BTJOA99
	QAFZPjHDQgTAPkNLd7aAjBeLEqLzafKojJSxiH4FgfXORBtZ3yUPJ5p+zOM/2TxN
	AGPnBunuUAAyY0wlWi/y/zeFyFeUw0qzGcQwwHjGn3/hy7pDUEpp5TlNK+TLQ94+
	VbjEBEqXBmCcyTdDnlpfgRo63Xzf+UjxkbzWNkr35GWscXRnTyAJ/2KeF8UaCXn3
	eU4ZxFYgSvYNrW403bxOoVQfHoLCGAkPBtGkJTlWsb3bul5OMTOrDomwA==
X-ME-Sender: <xms:l_IFY0ONa4KmKXJohAN80Ae6cp5Tc30YcFG32r5aZM2z6vs0U4T2vw>
    <xme:l_IFY69zb8Ton196DKdo0SvtccZl82Zc-AhpEEKhBy_kEcLhbup_YOAzw3_0fe5w0
    sGcKjoZZA1wnnfMcIY>
X-ME-Received: 
 <xmr:l_IFY7TTFyQzX11ouA9zu3kJizgjxJ35dWZ0ZDkPgEW_rm1GltrBl9HmF8PRa3C3sj1esNKkduTFIcUW-SLsnEvGC64FICLqsZFtzzAAbaIlcnTfFhH0193a>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:l_IFY8tHLE37_2tFWW0pciPo3WY0a-MfMr-1MNvfh-ZYmcbNK6D-Eg>
    <xmx:l_IFY8e3whlufebtgPE1tSNoqRsCEMgrANFz87TkI7Hvnbs2V9dnjA>
    <xmx:l_IFYw2mX2fyqKTOMZR3uM_e1mQF1gBdU0xrfL-eAwcKwbXUICu5kA>
    <xmx:l_IFY4Fh-gOoilS15wXYAUbw8Yvk3Kl2NPyzjUN1USthjmMyoITP6A>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 05:42:46 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v3 6/6] shadow: Avoid nss warning/error with musl
Date: Wed, 24 Aug 2022 11:42:23 +0200
Message-Id: <20220824094222.2554642-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824094222.2554642-1-andrei@gherzan.com>
References: <20220824094222.2554642-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:43:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169804

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
index 0000000000..21c9a1415c
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
@@ -0,0 +1,27 @@
+From 11290e897a49adddee215833944a518443d9b0d6 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 24 Aug 2022 00:54:47 +0200
+Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
+
+Upstream-Status: Inappropriate [issue reported at https://github.com/shadow-maint/shadow/issues/557]
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


