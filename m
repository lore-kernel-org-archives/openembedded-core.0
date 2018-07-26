Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34CD678C27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:39:04 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id i12-v6so3358270oik.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHuqnINCg8+pJilqj5Riznu1z4v8wiQu/RQmpD0EK4o=;
	b=LZKTjinT5WuQ9kIw3m6XDEFc7cYnq4DObMHd2sd3yNNz3KLB2Xqhs3D9yBzuEZmIte
	oesqZ723xiq2rqngAt9VqE8xBpOqLXEuscy6T3tb2KlMSp6StbIt0zcmkFlC5qmyIu6L
	EVRysrgK26zEyiye5CNaXKjPy01Uq5uzTP8lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHuqnINCg8+pJilqj5Riznu1z4v8wiQu/RQmpD0EK4o=;
	b=cb6B/tt1xC6+xttQYet3O9PuAfsQ1gXaCPMpOkOi7SxUHiFvaINxn4Kf2+u++9FbuG
	nUp/4492PBjoVSc8FvoEQoebmF21lv0VFpUYJCP3wk+PnwghfaTL5FbZCWvyU/CvLlSJ
	NgNYJJb4KLifCKSxCzs1AJWlpacxasmN/1NTsgFreoHDj5BNutYI41dAg9bJppu8HR8t
	PYljPIqOdgmp8gHi29nqS6FYBnzAFo7HcgAaaA5sAF8k7u618kcdpNxufPcG/WZzvhGz
	np7oKclri+LS4iLiIUzEqqMNrEzab2jbEEYTJD+SpJx9BKHFhHjGgRVr50+kGoqG05Yl
	VXDA==
X-Gm-Message-State: AOUpUlHv/7uW53O50qvqYDDza3JodFWVtEbUVTfi/URSoQ+fo/4o70U7
	s1OeFxlEroUIbIKjeBnWAJqr04mLHDE=
X-Google-Smtp-Source: AAOMgpccFw178U0yWYFuxJ4mdfYBtnZWQhPmmb15AUaWy0o2wb7s1T4Lx0vhaDRFzIc7gLgEsevUFQ==
X-Received: by 2002:aca:c484:: with SMTP id
	u126-v6mr2317910oif.209.1532615944780; 
	Thu, 26 Jul 2018 07:39:04 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-193-121.PCs.InterCable.net. [187.161.193.121])
	by smtp.googlemail.com with ESMTPSA id
	m203-v6sm2110840oig.42.2018.07.26.07.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jul 2018 07:39:03 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 09:38:53 -0500
Message-Id: <1532615933-26925-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko][PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 26 Jul 2018 14:39:05 -0000
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
index b6d8074..c360dd9 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -136,8 +136,7 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-
-	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
+	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
-- 
2.7.4


