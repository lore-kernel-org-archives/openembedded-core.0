Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40C8C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:57:18 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.5305.1661299029674188281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=cY85avL1;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id E5C2E320029B;
	Tue, 23 Aug 2022 19:57:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 23 Aug 2022 19:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661299027; x=1661385427; bh=s3
	NWa9woqGqMMxcR1tZLTaU1tMi02jNcJ/Cs2srCVtI=; b=cY85avL1IOoTqvwj/B
	lj18zrkrg2IBEmbq8xF185TiLlroq4oT8T2335Ggir2bfIy0rACBe/i6PL4kdqwh
	SSmPiDRisGjLe6AbiWlq3oj8ziT3aThwMakV6OCaBfzs9vS74XcSsFtzmWKVnh3b
	TtGe1KvVJ9nY0PRHoTuGfGP7jzDEOGSxm80gMvFZz3qljOTL4i/w4l0Iww6taUGL
	o9tp3ZKhpaILlKa0X7ny+T0I7bNOBHNgp+cbE/+/sdyC1GzWIGY2girPCKPZ15+u
	d0ynRnQq/IDelZXFL1o07vgGPOHAKMtSZfrDejYu7fEvraaVvhGJpMCphELpXHWo
	KqXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661299027; x=1661385427; bh=s3NWa9woqGqMM
	xcR1tZLTaU1tMi02jNcJ/Cs2srCVtI=; b=Acx66ONpYKGrGaOzdKG3LM3d0haZD
	oOfqVsi/8s7UvvsDEJEHiaW0c2/Sn46104DXPixJVPZyQe/0SieWlgnzgODgl4F1
	ZlZCYPDvxpzNf6EoiNOcXdaTyFfvdSdNURsvHveT2HutxuVJxUs0XNznRLOAWjHF
	oAXlp9rWIFjX2JPBzPPCm9g6vPmxKk+oeecpKagB6Gg8sl82Lfc4lvTdyTvQSbwY
	YiQu3FmuGmcwTnrsGnYukjXX/FdRzFEWkQnHWsAu0tXvJ/L5V1km7lv717+0Rhd4
	hOOj8El56JWepbWSaT6M5PwYagL591qKoFdL9H4sneYyPI7ZiQwLFYw6w==
X-ME-Sender: <xms:U2kFYyt8Nr96FE9Uwk5ZrhUd4J_Ie1a6k4IA4m5hUA0kDY46zaDyTA>
    <xme:U2kFY3ecW2d_hhvoKbxjp-KItgyyYJVgqYUgAYqVI0TYB5rUQ0vnAKdcqP1ydA282
    azs8wrwjDhFUTV9Wp0>
X-ME-Received: 
 <xmr:U2kFY9zgqLdMd6-AFuqudYPmvBsbaqhxgv0k72b2RQYPnlUmyYYZpkXHypfy6sjBirhlt-ilvxJcChrz086yrJXsuRG8jeUQVqPSV7nfJ9qdGzWJOsE26LcH>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:U2kFY9PRoER4FV6T7ChdeICQDYnhzwDJZyq68PrsD3Llr6zLuE_B0g>
    <xmx:U2kFYy-txFkV1lSFtazd4PH2wPCHsFPMNcXO37cyUrK3D2fPsgQnTQ>
    <xmx:U2kFY1WTkNa5CVPQ0-g_x3cm2TSzrD-VjCcTI72Z1OVPCu7wRfo3Mw>
    <xmx:U2kFY4kk4zY5E705fik5_LisenSv-1VDRLXOpmH_j820qusDJ3SDiA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 19:57:06 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 6/6] shadow: Avoid nss warning/error with musl
Date: Wed, 24 Aug 2022 01:56:24 +0200
Message-Id: <20220823235624.2488133-6-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823235624.2488133-3-andrei@gherzan.com>
References: <20220823235624.2488133-3-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169767

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
index 0000000000..aeb89ff6a0
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
@@ -0,0 +1,27 @@
+From 11290e897a49adddee215833944a518443d9b0d6 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 24 Aug 2022 00:54:47 +0200
+Subject: [PATCH] Drop nsswitch.conf message when not in place - eg. musl
+
+Upstream-Status: Inappropriate [OE specific]
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


