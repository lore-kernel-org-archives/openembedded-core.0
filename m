Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE5974B83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 01:27:07 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id q11-v6so12434980oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 18:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xcaeNq0sPpL5fJRWK921bF7MGNfKLQU6d+nvcgcUup4=;
	b=VsliZOc8UqefCx+W9HR+jz5T1L1lshcnJS4SNhUJJHDQQivSPX1EYDInJuK5DVQpzn
	Q0l573mQvkLUZQGstSVIlMnpnkoBXUc2D5wDinZ11FHdlTdYoGR7QV4X+qsoUD9Dvjk5
	xXSr3JcaLHuvARziIKmzp6GjF9Aeh9Wm+kuOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xcaeNq0sPpL5fJRWK921bF7MGNfKLQU6d+nvcgcUup4=;
	b=Q12LhBma95rdgYty1B0cyVBBEUQdyU7DZm3lOdGg67y3ca4L+qg2JsS1uHoK1A5pPY
	hh6TL/RN1EWKD6MeYHNMKrS+wRRFxiuuw55MWDdw57dOJghpNspbj8s9JhphEgb4lse+
	FQNmy3HU/0SvP5crQmqK67fdrtZMRhIhIXzOhUlWCqzvtalM3eWi3j0jbNzvmvAakRpV
	RP4ps7JPeuPC3Xl/3kTu2j8rH5g1oxd7nOuXjfjl+0TYzARFMnO5UI8Yabi9MRCOeP8l
	kV5f1Jmnnalv89wd58nWVyrQ5OB6KAsrc7mMWtiWtdCXfFnrK1FS+ICI+99A55dqjFri
	Lniw==
X-Gm-Message-State: AOUpUlEwxy1nZFdTawA0lUkCDgBm3cLDe/rfsDh/UtYbOphJyWygfbj7
	Qqrn3weJLImarP9CFelkJWpuv0IMqXc=
X-Google-Smtp-Source: AAOMgpd6MHSbskA2rPs+5hrTJrJLkRs7TAh0o0IL/bUe+3miH+LIV7YvFXyrebucN7x4TT3qK7tkag==
X-Received: by 2002:aca:d4d7:: with SMTP id
	l206-v6mr8326217oig.52.1531963627877; 
	Wed, 18 Jul 2018 18:27:07 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-189-57.PCs.InterCable.net. [187.161.189.57])
	by smtp.googlemail.com with ESMTPSA id
	i132-v6sm8340235oif.20.2018.07.18.18.27.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 18:27:06 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 20:26:58 -0500
Message-Id: <1531963618-29674-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][RFC] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Thu, 19 Jul 2018 01:27:07 -0000
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

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ae3f2f6..a4f61f8 100644
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


