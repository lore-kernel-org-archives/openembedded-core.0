Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id E551978C29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:39:35 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so3339679oie.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iDwFbm3Ae6jvky8+Z0XqmVOdYBXo9lhHFsJIJ9G1htw=;
	b=T3pT8lVir9XpNrfB5gQXLzpveZj+Fl64R68MqkoO+uEcWsgAHworMxf6au9aw+9Vd0
	I6A0T9oQFbG7MM9teLJZqBOGqKWo3Y4AXenHvZlq3G4O4BYZwygKCSc0U6js1Pmm7vN1
	5PwUiU8ir8dvF8cURTS81jQAKnjIlFgaSvbnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iDwFbm3Ae6jvky8+Z0XqmVOdYBXo9lhHFsJIJ9G1htw=;
	b=Q6bLBLzGTBkQZ1tYfTlfrlPn62fSIsi0kgTsNDsWNFVoirXa4YGKI2m1uozfRQWRhN
	AtoikUxwuP2fIdPl7ZeOrqLy+VXkphuvgRV9jEGVwPBGFVX1qczMePJnmZhPDLaSMLyk
	WtFwqft76/K+DJqBqB/EWYHxJLHRW5jNpAw7ZvlTZuKpFUbYPetrztxiBvRE74wRGQlj
	QMEGYZwwt/SBxW36kGLYVgXNFuI4td3/y2PDTcFewYItrf9ShmTVPkWSRpozoyW6mBSz
	Cs7hI15s/CUviq+LrF/Q8vwRlskGIruIKFf5Ivh0VDKiBs4v9EVTWWXWgk2OWuYasEUD
	g6Ag==
X-Gm-Message-State: AOUpUlGVv+Dtt8UHJtMogf2vvu8T8vcx2l464e8ZLjxOhRHfmjWJbmMB
	M3JA5ANj34IAkXj97+gqby1XjCGic+A=
X-Google-Smtp-Source: AAOMgpe6TGVnLIKpJga2Rz2QbVWr1lyjeK8oLnDqqJEWZPv3dbMJvsECUdyShTHWtCOrsaANwNxcgw==
X-Received: by 2002:aca:f401:: with SMTP id
	s1-v6mr2388582oih.269.1532615976455; 
	Thu, 26 Jul 2018 07:39:36 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-193-121.PCs.InterCable.net. [187.161.193.121])
	by smtp.googlemail.com with ESMTPSA id
	l204-v6sm850193oia.45.2018.07.26.07.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jul 2018 07:39:35 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 09:39:26 -0500
Message-Id: <1532615966-27414-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [sumo][PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 26 Jul 2018 14:39:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Once another header #includes <bits/wordsize.h>, there is a
potential recursion going on because the
multilib_header_wrapper.h #includes <bits/wordsize.h> again!

This should not happen because an __arm__ (32-bits) or an
__aarch64__ (64-bits) environment guarantees that we will
be getting the correct definition, but when building against
a different target (like BPF), recursion is what happens.

This can be seen, for instance, when building eBPF programs
from the kernel with `clang -target bpf', such as the ones
located in linux/tools/testing/selftests/bpf/.

(From OE-Core rev: a74c77d6168101e88c3a3bce7130f4f52cfab95d)

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 728bc53..35f5231 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -137,8 +137,7 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
-- 
2.7.4


