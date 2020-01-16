Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1114751D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 06:31:08 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l35so1087591pje.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 22:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PsGSYJUDotkCTCAn/EM3n2qfMdbJcFhlLpVap6MJekw=;
	b=VXHtsoDAQrXdkoIXaEZIBde8kGol8vB0N1G8vLR6i8MIw2IDNHt2PQdjfqvz+5+iP+
	UqSZC1UQaA4DlMJZ3LIyxNXS4uTsXU39NMS743j5Bcnm0SCFOqxcpmeqeAiiCOfck9R7
	+gLJ9/1/zPhWy5CCY67ksuZAtLrZjPkTtqi1IvFy500EGZkNfmBR1nnSAPQnMZqqKJFC
	82Fi8HQzGisyPbofktkIy8HstWUVv74Bc/ZVjVxkPiz/yafOzl4byQusCj+UtPK3LpFj
	nIOFOa/hwWl7v7Qqhv8dvVEFic6a0KSHNKrpnNyNvroA1wJ7BSyldjcCjD+bIdfUtgpY
	eiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PsGSYJUDotkCTCAn/EM3n2qfMdbJcFhlLpVap6MJekw=;
	b=j8NGbuhDKWbEspUZWMmM32KEgqS2LpCXIeZP8AVo5Yv2QModWg13He1zF5nUW39+AH
	YRgg2uxmblg6QeEDKr11Tv6zxLJu3/WZQJ0vceGgljYNabqOoWFp6QJyQELc7B0oiZwG
	UUcma+phP10IEUzLlMrW3TKoXeuWGdgwFYxalc0ueDuEexoT2Y0W93/o8zp8hWbAQhVn
	HsFaFEByn2ROXmSGNAtfOfjbQHA++a5bUDrHGJida47kSeuP6RmUdtOJurxF/wYhz+Uf
	gZ1aQo+q5b0ceI74MLcF2CbwTqH1R4uBsTs1iUaXoi8zy8Mh7BTpgaXZXLOd7benIVnK
	MbTw==
X-Gm-Message-State: APjAAAWCOf/Z3x5nMIJJzFTp01fj3emW54Zw11HrdBOY6w6eJiRvE92p
	2liJrf26w+KqqZBuZiAqa0BEDlB+gbs=
X-Google-Smtp-Source: APXvYqxOqIt5vjjkx9ZAMtUX+Gq1DPX3109zNTuHSeA1bmvg8L71uA1mcwoa4qUuMjMGeCDUqnlfgQ==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
	t1mr4761908pjv.137.1579156269431; 
	Wed, 15 Jan 2020 22:31:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	u13sm1876871pjn.29.2020.01.15.22.31.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 22:31:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 22:31:08 -0800
Message-Id: <20200116063108.2699403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Disable gold for all mips
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
X-List-Received-Date: Thu, 16 Jan 2020 06:31:08 -0000
Content-Transfer-Encoding: 8bit

If gnu hash is enabled for mips then we can not use gold linker since
gnu hash handling is only supported with good old BFD linker alone

Fixes
.gnu.hash is incompatible with the MIPS ABI

See gold/mips.cc in binutils for reference

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
index bf4697ded7..a223cfd451 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
@@ -84,7 +84,7 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 
-EXTRA_OECMAKE_append_mipsarchn32 = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-- 
2.25.0


