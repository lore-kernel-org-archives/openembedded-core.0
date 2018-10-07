Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCA3605BA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Oct 2018 01:29:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d4-v6so6779344pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2018 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WQQq8U+FlC0U6ntvR74KdsBnYg9VKjJtvobi0jeb9QU=;
	b=TB8kpRE2QrxqzOWNJ5blecioZOZxnklGkzZgrtE5O0iPZDW2YvB8v/HF9B6SASXHEl
	zPPei97zMUIFjvI2pMoisuIaMS/ck0K1J6g+Kdsxw/U1pfQGBMy0zMhSCYgf5pVuNtX/
	f8ujygCtdQw/DRm9xr6hBl8qVg5iGjM001jWApmaH+VVL3dQ5uqFjmz8uo1iWXOZsPwX
	LNcpI65RJ9L7vxLz3if2F6Q+2lXDjhjaVIkt1N5UY6vwIHJhsOt5WU+vQc+5INiibvTa
	w3yY0asbIFiKfZm6ywIchorS4HBVOJHriWPtUiFXQzP/oC4vGmH7w2Trh48PIvmOep0V
	NWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WQQq8U+FlC0U6ntvR74KdsBnYg9VKjJtvobi0jeb9QU=;
	b=XIgyfxyYAwh1CmGgy+VWxrNjr7B4iDWz7F9Dg1OUrUCVFryBX69QIBPZrELpLnsoYS
	fG2UC27VQYdSZ4D9zdGRm3CV7QI24rYKBRloy7poEYEuGoMyP9ceCMe9I2pDWQC0vx9p
	8FZ8yO296BMBPEstPILAV5dw5bjwOy1D8CBGD/KNPtpJEJsCC3nsWcWkVXR4ztTljKmc
	Q5PCScOm7jHLRaZg1ianuq26GKh0jmcXVS98ivSw4QCwcGguvhbJxxdvkMdu0Bml7TBz
	CqRdTDgLLZZMdNFwwXpi8e1t7x0omPZtehRBFJLaodGBtEldUWev55NllA+k8GmTppLN
	tBvw==
X-Gm-Message-State: ABuFfogn6n5JjF3E7g0tYhBjxFY2EJ+WLfA6w2D9DBHwhwSBujFzc0G8
	bJDe9hoXA3DE6JQzoCyKrNMFGXNe
X-Google-Smtp-Source: ACcGV60vfQb0pbIrN/3wYsqp7KAolmjwdhzHrrMCFPKQm33A3zCaSpFKv/E1hkwnEG+geMajvpp2AQ==
X-Received: by 2002:a62:7788:: with SMTP id
	s130-v6mr18766899pfc.189.1538875766128; 
	Sat, 06 Oct 2018 18:29:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm18464919pfl.126.2018.10.06.18.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Oct 2018 18:29:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Oct 2018 18:29:17 -0700
Message-Id: <20181007012917.27828-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007012917.27828-1-raj.khem@gmail.com>
References: <20181007012917.27828-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] x264: Disable asm on musl/x86
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
X-List-Received-Date: Sun, 07 Oct 2018 01:29:25 -0000
Content-Transfer-Encoding: 8bit

Fixes

WARNING: x264-r2854+gitAUTOINC+e9a5903edf-r0 do_package_qa: QA Issue: ELF binary '/mnt/a/yoe/build/tmp/work/i586-yoe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
has relocations in .text [textrel]
WARNING: x264-r2854+gitAUTOINC+e9a5903edf-r0 do_package_qa: QA Issue: ELF binary '/mnt/a/yoe/build/tmp/work/i586-yoe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index c445d15e69..4174cb2819 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
 inherit lib_package pkgconfig perlnative
 
 X264_DISABLE_ASM = ""
+X264_DISABLE_ASM_x86_libc-musl = "--disable-asm"
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
 X264_DISABLE_ASM_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
-- 
2.19.0


