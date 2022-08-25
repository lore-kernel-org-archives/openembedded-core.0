Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2857FECAA24
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 16:31:00 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.26222.1661445050517636691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 09:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=frWa+sgD;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D5B055C00C4;
	Thu, 25 Aug 2022 12:30:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 25 Aug 2022 12:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661445049; x=1661531449; bh=Hp
	N3IBu06Jj1lqvPunrYIV19nf5nsFFAxvQAGhALhRk=; b=frWa+sgDMXXkgBWQWi
	MbM934PTtggsOiFm6R7M3GAl3LJKTLZqBDZ8MO4pZnoWYl3ja7svm6rWb7oXNZcE
	lRSimXkSRMGzHeUpiU+1wxB3Zdt6GphPmJFqJhk/HZLFhztIUXW7SzZHf5uwXC0Q
	HDCWFqmH0P+Ft4SEqIUF7rXinTPSIMNNKLLI2JnyuoCSoFl62+U4H/4bdMsS91Kk
	FLSfpUNiGclB0XxGhSUrb7/QW+aZ3dXvY8yy/rcYnOdKNktWHo5FYoP3KcregkBY
	7ZxoS5G4iiOE8XofumKZgGJuqMzOMsLvLTmoN6kTU1cfEWtVegq8F3bfLyq5Hx9l
	PETQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661445049; x=1661531449; bh=HpN3IBu06Jj1l
	qvPunrYIV19nf5nsFFAxvQAGhALhRk=; b=uhEGo6yPuFEGj6xUJkqOyPl0yAvuk
	thXfCVuXS8pYksSQIzLYnfpsRvWrsVK9rk4Nhqi/vSe4ZJELgVVAebEClWtFuxmr
	7A5qjagtWmM+ci+M6mHX0TkPBubITzybKAIHVdzGUsIsRnjoNnUtbUeagJH3WqHN
	p6d2gREjvIfU6h07vFTZuYfmaABWSPZMG2RIiHJrM3CqPqVEip60mYKZa21Lf5Su
	6mWQMw+us6c/g4UbmdnmBxjdGD68kdlK2MqrRYH/bnO6Zp5fPGcxxJT9LUX+zdsa
	st8z8jwdCXQTkipKbx2mnqp97OgjW/rRvkMSSGv8HJlTD/y1GI50bUotA==
X-ME-Sender: <xms:uaMHY1ImcXdL3ODBYMxjiOBQxvAZq6yUf3Yi_dmPEZBLeIDBs0yy8w>
    <xme:uaMHYxIZKTuQBvs8EIox_ahDpoUN6lB2CS24syti7gf3d01reNmwV2zsoo0cXUmx0
    gnRb5rFcmTftphQwA4>
X-ME-Received: 
 <xmr:uaMHY9sw_syY_CHcttJDLjZN_dgtFR5cfQRR5eGGcoWv5lJ5TjzkGJMHWxUAPO3WFewYXG5uaEFXXum0IO6tTQq-lbckOU3HkjindntjECV0xTbskV3mqjz5>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:uaMHY2b75uBKNeOkOeSRtUMVkft-fGlsrjYyUopwLGuxDKSXUbk49Q>
    <xmx:uaMHY8Zygrr-LGODe_i_UG_SEKTNzJNMegmlBrD8P3bdvyJKk28G9w>
    <xmx:uaMHY6BeF6DakeOZwym5dV0G-EIpwiX0xGlbEUEVp2DHwEcVM0vhkQ>
    <xmx:uaMHY3zN_z48l0rb9N0XCdG9GPy0CF5obqyAIsyfVF00eOtl9i-jmA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 12:30:49 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH 3/3] shadow: Avoid nss warning/error with musl
Date: Thu, 25 Aug 2022 18:30:41 +0200
Message-Id: <20220825163041.840129-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825163041.840129-1-andrei@gherzan.com>
References: <20220825163041.840129-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 16:31:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169882

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
index 0000000000..6c04769713
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch
@@ -0,0 +1,27 @@
+From aed5a184401fbbe901cb825be4004ced885b6f9a Mon Sep 17 00:00:00 2001
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
+index af3e95a..74e0e16 100644
+--- a/lib/nss.c
++++ b/lib/nss.c
+@@ -57,7 +57,7 @@ void nss_init(char *nsswitch_path) {
+ 	//   subid:	files
+ 	nssfp = fopen(nsswitch_path, "r");
+ 	if (!nssfp) {
+-		fprintf(shadow_logfd, "Failed opening %s: %m", nsswitch_path);
++		//fprintf(shadow_logfd, "Failed opening %s: %m", nsswitch_path);
+ 		atomic_store(&nss_init_completed, true);
+ 		return;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b3ae2b4874..5106b95571 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -26,6 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://0001-Drop-nsswitch.conf-message-when-not-in-place-eg.-musl.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
@@ -33,6 +34,7 @@ SRC_URI:append:class-nativesdk = " \
 
 SRC_URI[sha256sum] = "f262089be6a1011d50ec7849e14571b7b2e788334368f3dccb718513f17935ed"
 
+
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/chpasswd \
-- 
2.25.1


