Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E38C6370B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.9057.1650467868063803499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=r2AchBG9;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B3EB5C0180;
	Wed, 20 Apr 2022 11:17:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 20 Apr 2022 11:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1650467867; x=1650554267; bh=g3A+eezUZj6+sMqF+R4MftMRX
	ZTjhKWMEcjUyrvEHSE=; b=r2AchBG9Q5ngb5tZ5g/PxqVcjo3zLJyN9H01Rqil1
	KmmyJHYxgMGELpThaqfD/wItvpc0LTca5OXgDfBUDeGW5cgbb1K4OtCpBcc2V1kf
	Rpv6/DfT8Cyg3aadyyYUIBQBJx4DrFURipPjivFql4AmHhzf6o/zYB0M7y+koTVQ
	E9a0HU1C+HAocHIWj/yzXIg44LBVsfjoYo3+gLQrOuapl1DA2qIxyaqq26qp4LFf
	Y+1te/eGQplRHIQva0jmQtnG48lPrsTQFnns6CVOclJlLLpy74XPPej0KD5XNCjQ
	r3Ro3KP9homqh243rE3Q1F/6SZeuMx2nZVz18UTXXSqzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650467867; x=1650554267; bh=g
	3A+eezUZj6+sMqF+R4MftMRXZTjhKWMEcjUyrvEHSE=; b=e2LkbxIIRs1+tYcsL
	vmUd7sYkv549cWyINrlN/fLO2h1IofBXChgNG7DQ/GJ4cwhTJDz7j9racPXqkiIs
	skzShVqPsSM4mL809M1slHvRNv1pXhc7plQEnNy14BH3om56aXY9+hvuraRBJhtz
	XuQCEdduA/kSJ6fiGIo7dPfnTvIJ1Y1srGOrprC/ME8c8/ioBGxtFU/jj/3pw6Lt
	DEf3WsdUHalA1LF6/8jAljwPYR8v0w0fg4VkfsAyPsW0T1IhjQBIxcb+56it0dQw
	3aYKYptzmVL6r2woJGwboURKhot4nBu+73I3iry2youX3BjHIu3n4bBMFLtx2Zw6
	Nq/Sw==
X-ME-Sender: <xms:GyRgYnbcBI_ZcpEdZy0IrYjLaBcw3AP3M7ErHAhzE2w8Pc04bQdbNg>
    <xme:GyRgYmb-4RsM12fOwNifl8vf2DJQJs0HKGsi86ls9PKpnynUPVvCePDAVqtf4Kt52
    9hhLvXClFy6M371nGo>
X-ME-Received: 
 <xmr:GyRgYp9NMduO2_B3b6t1bdOv8_p5c8EpRYkE2BMpV5BSAP2PBSJAsixt361aSCIFVhmedw6kVxHNP1o7PFWWQ1hZGR6WG8D8BAjeJL6QQebzFlLtMBKzUr3p>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefteelje
    etvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:GyRgYtpSMlVLZvpNb4O2JCtnCAu2wMnWyaCXty0IcDQ2X0KIgzpGXQ>
    <xmx:GyRgYirnGCZK0VWXadAvpfkz9qFFb3UiqbZvQvL_8UztobK5fV9rUw>
    <xmx:GyRgYjTF6J_fAfXoTXFf3mAnBjmjp6pxPdEaHOa73YbD7mu0vrwgHQ>
    <xmx:GyRgYnAfy7dwPnUsIs5Co5ZwDugu_AMUMZ33qJIQqyu1FmxT278YbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 11:17:46 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 1/1] automake: Drop redundant 'u' flag in ARFLAGS
Date: Wed, 20 Apr 2022 17:17:25 +0200
Message-Id: <20220420151725.468761-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164702

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../automake/0001-Drop-ar-u-argument.patch    | 32 +++++++++++++++++++
 .../automake/automake_1.16.5.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
new file mode 100644
index 0000000000..260c51f517
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
@@ -0,0 +1,32 @@
+From bed646918bc67e9e2151ccbda03aae34717821fe Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 20 Apr 2022 14:57:14 +0200
+Subject: [PATCH] Drop ar 'u' argument
+
+binutils/ar is configured in deterministic mode by default making the
+'u' argument irrelevant while leading to warning massages similar to:
+
+| ar: `u' modifier ignored since `D' is the default (see `U')
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ bin/automake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/automake.in b/bin/automake.in
+index 92bcebe..0f2b84b 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -2678,7 +2678,7 @@ sub handle_libraries ()
+     }
+ 
+   define_variable ('AR', 'ar', INTERNAL);
+-  define_variable ('ARFLAGS', 'cru', INTERNAL);
++  define_variable ('ARFLAGS', 'cr', INTERNAL);
+   define_verbose_tagvar ('AR');
+ 
+   foreach my $pair (@liblist)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/automake/automake_1.16.5.bb b/meta/recipes-devtools/automake/automake_1.16.5.bb
index ba5ce7b9bb..469fcd69f7 100644
--- a/meta/recipes-devtools/automake/automake_1.16.5.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.5.bb
@@ -25,6 +25,7 @@ SRC_URI += "\
            file://new_rt_path_for_test-driver.patch \
            file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
            file://0001-build-fix-race-in-parallel-builds.patch \
+           file://0001-Drop-ar-u-argument.patch \
            "
 
 SRC_URI[sha256sum] = "07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605"
-- 
2.25.1


