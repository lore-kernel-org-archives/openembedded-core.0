Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 844DC7805C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:44 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id j186so33917527pge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=XeEZJtpJupP2nNizceAL1E2vaIzyuXj5el2+TB4Y0KTIUxPkls0c9H8icusclqRDs0
	mKD0/9MSHmSbXB25oJ3vj87xw1gc8ZQUxdNPIRMxQrgS6FONkyi8qfeFilTVOEXfTrgT
	tzZyHqFWDjxBQmADhLazg8GxsSnXtfoQde8htG31rhMB3PqI7kcyok5tz9ug3skxby1+
	0uExc3/pmjFkpZ2YmYiLSo1vNkwgR3R5EPsTI9m5H4mtC/BuZzR8q/tBlJ5kdPK/lwgN
	+fYCuhMK6npfGnNx+IkWikd7Ua4fJN9koZcpRqz7aWjagtTR8N6E3GkYNS9SQYa1KXQZ
	MZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tG4bJD4h2vkzUkRHQptbCqLK/n+3DxBBzMBIflJOOP0=;
	b=LZwoARtvZNvAI+4TrN/zAJ3C3kXOP+30XjEEsu62/weJx9zfQG/jaJFXJPdEyvKG9f
	5l+25w9cJlqP5JrAL16JtlHZYnBaBLmUnUujIctv8QMsUHUpmxC7Zn1pM3D3l2Q1fq8m
	bA7XQLfN+j8eXfdkBsXPccaABaz/dxYOolodhS/sq74JJ0ioTjHqEufcJTxQvHUZyd9W
	OB8EdIQYGLMuGj1xUaNKJjTFgfKDZBkr7Gujjuvf3bRy97JS7OA30SoVLMRQmZB9QBnj
	Bk88X8oTL2HUjSyyAq8B2O0QxCz9Hgg/j6SjqdjfRtT0wx/vxVihl9JFXUgwrlwYC+oj
	CfEA==
X-Gm-Message-State: AKS2vOz43Pbk3nYRxoQbF0NYkynZ6hera5dHCKBINAOy0cnY6iQtcOl9
	MfED+fY4PMoJYRTA
X-Received: by 10.99.174.4 with SMTP id q4mr11021840pgf.196.1498665885887;
	Wed, 28 Jun 2017 09:04:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:19 -0700
Message-Id: <b29203121810ab67d970f54fa31ad620a742258f.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] libunwind: We set -fPIE in security flags now if gcc is not configured for default PIE
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind_1.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index e598e40c6f..c6312f24fd 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -21,8 +21,4 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-# see https://sourceware.org/bugzilla/show_bug.cgi?id=19987
-SECURITY_CFLAGS_remove_aarch64 = "-fpie"
-SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.13.2


