Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id C24E978970
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:27 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id t6-v6so3830494wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vvQXekchtfmtkAj8dojCHMN7gasI47UB2uWmOO7Qtwg=;
	b=ggjoNMzh+013B5FmQ1/RxwM1SXpeLbga0m+J+cnxGU2ATtBPysE8dEjy1Tffk3yz/A
	Gde1SOp/jfhkMam7dkMJofVG9HdZDge/taTZcCfRmYB6RvuQDRBvovTR/5rx8hPBiDU1
	hA3S8mM3j3Gqgo54xjgwSJn+cwVGb5hLezdPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vvQXekchtfmtkAj8dojCHMN7gasI47UB2uWmOO7Qtwg=;
	b=EFEPhqoiU/fUQ4IUXQN1zd2PstKP0eoon6ik/WETchqQ4b09xe6HFg5cy5ke1MKuVI
	FifGVkm+diNhAodFvySxV3VvWySI8H6OaJ4ZSxmHrvpHKJm3ESH4Vdk882npyGOWSo7U
	oaqtsTt6Vj8ICZ3e+CUU9lYL9WtmoM9VbA32Pf5VcJksKaj5kXv5QFeSqLBjyTO8IPgC
	OntGgBLW4lHC4d1Mb0aqiadG7zkzhi7eIid+gyWxaxfJbniZzBYXpXjVD3OtupZC5vOt
	T9CHP8WxUtgRsuTOMARM5FG4//OrUEyvVL0FeYWfNMMAY/hsG2z2/ogCwh3lrUH6d4zF
	oIEA==
X-Gm-Message-State: APt69E23DvQ4ZTyBDUwlmvujaxkXUiQuyMnUn/x4LmpdZ7yNjfsPbcUM
	4EDRaEYkGcqnRROd/Jc+azg/KgoSTqU=
X-Google-Smtp-Source: AAOMgpf9cKqW2iyxEbASR6AOVWyQi74fYQVSYKryHfjfDNB7+t9Obhfklahaf2LXau9YKrhDUS4uDQ==
X-Received: by 2002:adf:9485:: with SMTP id 5-v6mr15182752wrr.82.1530548848334;
	Mon, 02 Jul 2018 09:27:28 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:18 +0100
Message-Id: <20180702162718.27038-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
References: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] multilib: Fix issues with some cross-canadian toolchain sysroots
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 16:27:28 -0000

MACHINE = "qemumips64"
MULTILIBS = "multilib:lib64 multilib:lib32"
DEFAULTTUNE = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"

bitbake core-image-minimal -c populate_sdk

Results in gcc-cross-canadian-mips failing to build due to the use
of an incorrect sysroot, fix this. All nativesdk pieces should be in
the same sysroot (unprefixed).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 1dcd3502988..3831d2bab29 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -35,6 +35,8 @@ python multilib_virtclass_handler () {
         return
 
     if bb.data.inherits_class('cross-canadian', e.data):
+        # Multilib cross-candian should use the same nativesdk sysroot without MLPREFIX
+        e.data.setVar("RECIPE_SYSROOT", "${WORKDIR}/recipe-sysroot")
         e.data.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-- 
2.17.1


