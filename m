Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53EEA744C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 18:36:01 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id i12-v6so15686289oik.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 11:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SibXw9mm5Rj5zeMJe9aIF04VPYDC1X2FuZH7qH58mC4=;
	b=Vx/527kT+g0ZdkwmcrZ3YRzVY0HAMy+FSTYPwQVDKcLdXkNwaVAguvDrgWH8NS7UXB
	EQW1nTODguogMjNfbupVCDYVBmycwfG6TM+zkYORLFMp0pHv9bOBaeZbLb7LtfEQHo80
	4lmZZyz/TEJMCEHIhmPua8IoxPdY1DQDUGUgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SibXw9mm5Rj5zeMJe9aIF04VPYDC1X2FuZH7qH58mC4=;
	b=gnRI+lIM+XF+S1PsYiwoB1PLKWA/ucBCuxlLQk0IVNplXFTpjg712QubMTYYINrHqo
	KC74GOBZegVCWv7o4rDl3xgL4b91IllG5UqZeedKcgpjfKTMVjOxdOIW4EqNaubc1NGu
	IL5wFh2YApq5jVmJy4U/LeJZRGepNLQ1gTevzPPusJY9lokikvKXmabrWPTd9Xqqx/+a
	lw3ZR4WQ6/C0FFEvpfD/1HNu9TSTMplFYPkO/IJsccpdHcmEZWBaImI2B6CvrAMjV1q7
	FWgbTpxoPR++xpm8XGs2fiSlHEjHDp2FilmeuTlKuFt0sk8TQEoPjwDvZozHrhEcj9FU
	+vdQ==
X-Gm-Message-State: AOUpUlHQuLViqw3Ox6Y8K9uqobMi7AV/N+oWQKowtiuCm2gnEG6ukMQg
	ffPTejTCcExIRw9SIhIArPPm1NJtKek=
X-Google-Smtp-Source: AAOMgpeJbu+rLQhv6q/KYFuDwIkqnEk5uo6hvBrRiZ8DgCt2jBUOBT9c2R8SlcdsMrcMGT5k4Elm4A==
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr4209048oif.10.1532543761830; 
	Wed, 25 Jul 2018 11:36:01 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-193-121.PCs.InterCable.net. [187.161.193.121])
	by smtp.googlemail.com with ESMTPSA id
	y85-v6sm16327063oie.25.2018.07.25.11.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jul 2018 11:36:00 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 13:35:34 -0500
Message-Id: <1532543734-17529-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Wed, 25 Jul 2018 18:36:01 -0000
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
Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
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


