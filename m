Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74B1778361
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 00:48:03 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v190so10242550pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 17:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+IA77MKvtUCU19PMGy1R1HNCLNgmm4NIgFSnbXP0+gc=;
	b=AbOcedzglWolETBJtNWS/dJRwi2VCZfhzVhlUy6syWm5eMNJKVdeQjgXYdoi0+j9lz
	2Uks14/C07V2WxJUHd5m/b34KSVEJv53mSeIgF+uJhxxJ2tQG73M8ciKAA7G/jferNJi
	EGJ3x5rPHAs5PSXngPQ4G45hmSEyq7KBDnTxR8kQ5yr5NlDI1g5SZppWOi/Tqvd2i4eg
	/LHlnm32lAqhg2QwJAKl1mm5FMap9I1FcLnIHjdkul1ySZ0D9LvT+c6qDMjcr2fzNGwu
	G/XOIDOXt6PQItlKQpGSSKbUQiZdZgP+9bDajX1HUnjxfslh34YcuiLhOGm/Fybge0Uj
	zMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+IA77MKvtUCU19PMGy1R1HNCLNgmm4NIgFSnbXP0+gc=;
	b=qewjZv71O0J4tzOiuyCxYTrpNhvkDsR3uvZMcR5VqavYfRm9HLnMvNKNZCfKmKQ7DX
	XsZ8w5axMdrRBXHwqUNHpZmjCfHy8c8qyiRtXUTFwvrcAm/pv8t+uTpMjiVhSLlMD3An
	humn4rGZW9ojeb8umzS4GBBF4zm7y8KPTC9J4AQESOn7iJbftiIfzPdSErg7R5B40pR+
	ueevKEl4bTCZH1vVhgrHKdQREtfmxzfZutm8a/wb6EQUT1Po9HaYYktegUxxL9Tp76l9
	geowOfz7LUHJfC3f3bWPk+p8/p9jLvbUe5eZ4iauKisQhC3nNKWj6rSE7nKtmhCEIovk
	Vp+w==
X-Gm-Message-State: AIVw113V7xckn03i2KeiTUFkmPthD6IkUriV4C6VKvOfbXcIsAoL+dTZ
	wP81YWrWeu1uhqHC
X-Received: by 10.98.160.146 with SMTP id p18mr14588746pfl.322.1500857284799; 
	Sun, 23 Jul 2017 17:48:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s3sm18228742pgn.70.2017.07.23.17.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Jul 2017 17:48:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 17:47:48 -0700
Message-Id: <20170724004748.14778-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724004748.14778-1-raj.khem@gmail.com>
References: <20170724004748.14778-1-raj.khem@gmail.com>
Subject: [PATCH 6/6] go: Remove -fPIE -pie from SECURITY_PIE_CFLAGS
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
X-List-Received-Date: Mon, 24 Jul 2017 00:48:03 -0000

External compilers will explicitly pass -fPIE -pie flags
unlike internal toolchain which does not use them, so the build
fails with external toolchains because, its passing these
flags to linker when building with -r option and fails to link

| /mnt/a/oe/build/tmp/work/corei7-64-bec-linux/go/1.8.3-r0/recipe-sysroot-native/usr/bin/x86_64-bec-linux/x86_64-bec-linux-ld: -r and -pie may not be used together

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
index 091b1318af..ef8bc14383 100644
--- a/meta/recipes-devtools/go/go_1.8.bb
+++ b/meta/recipes-devtools/go/go_1.8.bb
@@ -1,3 +1,4 @@
 require go-${PV}.inc
 require go.inc
 TUNE_CCARGS_remove = "-march=mips32r2"
+SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.13.3


