Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6A6744F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 17:15:24 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id w126-v6so11104674oie.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XB0Vga/aQyBhYhVIPtwUbTxun59wnGa3dOsclc+R614=;
	b=VqEQK01myhb0diz9/EeS/eppyrt4A+1vdEULKTaV5FNB2lAzQJLd4ENBQURnT+NwV8
	HzLYFHceNc19jihsVd93CbiPCiKwwHVT4iRhOjWfe1EnsW27+xiyDkTdp/ouj6X9tr7o
	h7zXCGeDApcz0NoOQJGWiJxaCTSzmSZY4/nVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XB0Vga/aQyBhYhVIPtwUbTxun59wnGa3dOsclc+R614=;
	b=Bzw7xRBMp4t0xUDk57GAQti01gkZBUrfIRSqH6qUfQgCsq6y8nvIgyGhP7gkZeso1G
	QwcOLeqSWyTdZbHQSaiE7i2rwNBst+d610CNOuf/xcmehYN6ECVr+R4wXjJxlX7aJFXt
	slMonfPrg48KpDELRNfRbClV6hPVbfyOAg3TqsPG5bkINwrXFShPnm1c5mv/aVNS1DE2
	U6YBQ4uDfB28EN3S2xHBdrzwwlvdALogU5YbBVTlHoUtvK/0hoaoY//m8NtOTyKn0fji
	0qfRl27u2S3G1lQQ6V3RK28Pc0LvA1oBvgWGAetBgyYCn4zituBrwcnteyNCNF/0GO8J
	gVrA==
X-Gm-Message-State: AOUpUlGF3MRRFNO3Lxhy82Sj4ijE7CR4wHT5volG5xlwVahx4CWowaIx
	Lei85V4Fnom2RJZ8cqyuEQCpdRty7Hs=
X-Google-Smtp-Source: AA+uWPw3ap+11JbRuzq0CZBOn/4OBbVUkzd/8Y3+IW6WbA7CMRCrPmtOWKtg/6aF1Ot8qr67IESbug==
X-Received: by 2002:aca:e0c2:: with SMTP id
	x185-v6mr2729355oig.220.1533834924483; 
	Thu, 09 Aug 2018 10:15:24 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-193-121.PCs.InterCable.net. [187.161.193.121])
	by smtp.googlemail.com with ESMTPSA id
	m203-v6sm10884127oig.42.2018.08.09.10.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Aug 2018 10:15:23 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 12:14:53 -0500
Message-Id: <1533834894-4576-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Make bits/wordsize.h multilibbed again
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
X-List-Received-Date: Thu, 09 Aug 2018 17:15:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As reported by ChenQi, leaving bits/wordsize.h out of being
multilibbed introduced a problem in building the SDK for
arm64:
  Error: Transaction check error:
    file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.27-r0.armv7vet2hf_vfp and libc6-dev-2.27-r0.aarch64

This effectively reverts commit a74c77d6.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a4f61f8..8ac01ce 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -136,7 +136,7 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
-- 
2.7.4


