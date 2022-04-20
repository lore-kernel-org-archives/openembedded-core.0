Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443B7C63716
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.9263.1650469515132596606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=O4lVgKeX;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 407675C01D7;
	Wed, 20 Apr 2022 11:45:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 20 Apr 2022 11:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1650469514; x=1650555914; bh=RwRRmnKBopQ1bEAsEUO12qu5u
	XjLXDHwAe0AStFFd4k=; b=O4lVgKeXJsElR77JfIcPzezkjMX6GoHjTG9XqlXx0
	wQXg4115tUaLB7h/SVo7gQK1U/vgJ5C25NXpN5hVsIOpsQSM1R8Qx8E8PEeqzwGV
	YdwalZAsOGmLfKI9bWBmesRhgukqA+blp3tQpTxnmoPI8voMaBRmfCkwIF08wph6
	+oInB8mavOpuCeFywsfWihc4yecPxyb/NU2Y+vq3m2XVsMiiUrHxhBLmtVKy6InV
	73sAcgqWxuCCOvREWdPF1ESzsqXO4Z4Lmb0LknR2hP7hq3T1gpG6JgunxgxvWfuI
	uNnYgR8lRLh7rI9wutPeUp4TYXhFabHQIqU86Ud6PFKbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1650469514; x=1650555914; bh=R
	wRRmnKBopQ1bEAsEUO12qu5uXjLXDHwAe0AStFFd4k=; b=DjeDYcBOEVOa70jn1
	FS8yx/d5fReeJDDBPt+UcoEYEW0ze7q0y0LY7CoRlGz5EO9iBLdQFDaEhSdkVUPw
	goDURgtbuW184bTaxaVgGOmKEWclzKGqhVRODRhZcDs4qPzMmorbCCtdOxWAyEcX
	ibzeYCDMEqTXnmHR7RkRYTegQYPJVzRX3iNSwUo/rfqIcSx7u5GlDZV6cqlCySmC
	96dgHKbuJM6KTF9USmT00LRjOW3/Y3kyyAMG9QNv4zqUnXCDTkBwOL8tTrDO1Gvx
	mzrMQJXyKjAGpuBm3TJHDXdr8kHfgcGPbL0vMSI60zppwAbg4Azt7B1WCn7Nh05N
	llTNA==
X-ME-Sender: <xms:iSpgYrWPxUWDk4xOKwAbhAuVdE91Zl5By2t28ATe3qX1dRnIRrj5Sg>
    <xme:iSpgYjnqDO2uybk5psHuSJ5ObP0wFcyiMknUwGue8XNEl6_ue1ePbZIcJ1muaOYNU
    K6f1iiBndGBR7pW3MU>
X-ME-Received: 
 <xmr:iSpgYnZI29rHxV-0gDvsYV9I3Q6TCwEI2mYEpT684l1lwJM1d-CCWdGyv1gklabULbG2EFAx0SzT1BkAufDapKQ-j_7DDIQ0ZOekDiHjRSi_GX4AsBvf1OMu>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehghhgv
    rhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefteelje
    etvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:iSpgYmVKI5j-744ifHN4g9nsqxoHHuw0U33u67XHbFjKpAqY1iDw3w>
    <xmx:iSpgYlkvPeNLeJNQ5l69PXwj7Ao0JaAS1yhri9wmdfF8ZX5tbnWH3w>
    <xmx:iSpgYje7iQ5RJ800Ru_2A-1WFif8fR6IoozwrOwwe7462bqplMgChQ>
    <xmx:iipgYltdsR5IFlE_2BKXxGUrpP01VkgGhHcHYCfeJ073z7mx7LAAUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 11:45:12 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2 1/1] automake: Drop redundant 'u' flag in ARFLAGS
Date: Wed, 20 Apr 2022 17:44:52 +0200
Message-Id: <20220420154452.1074695-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164708

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../automake/0001-Drop-ar-u-argument.patch    | 35 +++++++++++++++++++
 .../automake/automake_1.16.5.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
new file mode 100644
index 0000000000..f72788c3a6
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
@@ -0,0 +1,35 @@
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
+We also add 'D' flag explicitely to not rely in the default configuration
+for reproducible archives.
+
+Upstream-Status: Inappropriate [OE specific]
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
++  define_variable ('ARFLAGS', 'crD', INTERNAL);
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


