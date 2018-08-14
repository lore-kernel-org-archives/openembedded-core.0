Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 41D346010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:15:13 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b16-v6so34568237oic.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jAvavdTxYNq3hFQU9vpWVZjCoGvJ/3GSj2+bUIHMcwQ=;
	b=f2VhA+QYqczuOrkJgPn5DrNF7VdtM1stof8zCJPHN7ArDAtN/LZ58bb7ro6k33DZCk
	pKS6fXqEZel+wQ9D/dSlJdbC65md4ckQzmg5XpBOveAz+YKbgSI67+QLnKqYTwIyQvdp
	3LoDrkrJBKH+w96qciPh8Fa0L61fczw3Xw9nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jAvavdTxYNq3hFQU9vpWVZjCoGvJ/3GSj2+bUIHMcwQ=;
	b=kSRCRGaH4jUo3Iyvh2JpINI5LuBmlag4ebjkneEp7M32pbC6iTTaqXp77G6YrZ2V/B
	9nfm2anN0n2xPYQt5l+ylqD6BW1W9KX7mmeTwa/UrpksdeTOceiliVmfjGVVutJhuGg6
	rtzAXlw/cR0/JSRo76fJXTDAKGXImemDu37XPlLPvbV5pxiSEocyG+pr6j6pkiWtgkuq
	cgkb7lfCTWlJ+sqbY1yjNKHdnYusL/aXS2ItTOl/JKdXxj/I/4UVsgre5romQIbG8I1u
	kCNUn39qbZSRl3QSfnJD+ZPabwYYGgttvwJLgxbrncT0rT/5hz5Fa2EePsgHKNcC9Ao/
	IK9w==
X-Gm-Message-State: AOUpUlFVQKCqNQnNKHA2R5QIhKICpK12sVNWochffYGY6ie0HbsHmPrR
	FjcTDO1ihYRXWhOiWkmlTjqWZ85KOWTxmA==
X-Google-Smtp-Source: AA+uWPwAMvdK2SO84td8BAUCZGiAal4QsurO6euzVBVEYwe00uGv+qgi6pBcGXOjB4DH5ZWR6lgsHw==
X-Received: by 2002:aca:f305:: with SMTP id
	r5-v6mr24637072oih.230.1534263313611; 
	Tue, 14 Aug 2018 09:15:13 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-144-121.PCs.InterCable.net. [187.161.144.121])
	by smtp.googlemail.com with ESMTPSA id
	d191-v6sm35038343oig.16.2018.08.14.09.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 09:15:12 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 11:14:35 -0500
Message-Id: <1534263276-24467-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [sumo][PATCH 1/2] glibc: Make bits/wordsize.h multilibbed again
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
X-List-Received-Date: Tue, 14 Aug 2018 16:15:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As reported by ChenQi, leaving bits/wordsize.h out of being
multilibbed introduced a problem in building the SDK for
arm64:
  Error: Transaction check error:
    file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.27-r0.armv7vet2hf_vfp and libc6-dev-2.27-r0.aarch64

This effectively reverts commit a74c77d6.

(From OE-Core rev: 90ad502bf8faa233e25cf297c1eeefcb0367aea3)

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 35f5231..c1d186a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -137,7 +137,7 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
-- 
2.7.4


