Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91735F88089
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7593.1776322128424879671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0W1biVx8;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfd96354aso4680498f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322126; x=1776926926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=0W1biVx81eWQefgETkJ0rgaNxQhQ5BX6yY8VlFx4r1cZIvuJKkjh51dc0lhuoLZc7T
         xCiPbpmCXiHQ/XfSFSKTqtR5elVC4/6DDL6PjQqRxN5vWlnNHEXCcSTZcFuMoSoUrHAX
         VjXM4tkPCDqxy0Lec1fmfNtZ1ebsukgAul024=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322126; x=1776926926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=dFc3h0GbIGyIOkps/YF2Xu0vrXciwg51HXvP9gJPGXaQ7pQvr9WZHm32+xZSMxutLq
         0Pwi1+Q88eFK7dfQq1KWDFnDZ9zVOSJ9yQuAsYG8NxcxRPBprEGLe49aAjeKxRJrGusX
         KwWhU9boSlohLyGryUZJL+FqSxEXBGJkMNGOcmeNsdUnOzLRw8xuj2mFKB6rx/iXnmE8
         /Z5BfkIcr1+0YfmfHKwNq3X8nYu9fZeb0PLXyBOH4thL4I7aGxbvTFpf+mSdfy8IlYtS
         NsWH22zGEm1ObV6qTCutflGRAR6Il29hUmQ83iFFgPDyZ/jwH+3HM2akKJj2SCvwBdAZ
         Ptag==
X-Gm-Message-State: AOJu0YwA6QGw1a5SICwA1nOWKifhjc6wVQztbFg9+Ld1GWRn500Uoaff
	zKqeO15XcGFTn3j7go1YBUXir4zZwJKQm6O57tXOUtYkP0nlJiJJFCg7GHRuqaGO9hkhi6LU0k0
	GI2OdSuDALRqc
X-Gm-Gg: AeBDiesen6CX5NEv4aRtJkIYba8yLbphG0fb7TL6lYURl366LPMVINISI3bQjdY88hm
	vj4f3F7C0HiO5jNnfAhM01APfqM6p/o8NRIDBFQfvSfhaTaL5K3y5EfuUmHFq03O+LX2qXChxhQ
	T4AKoe8GxTdso+WwwngAPqUvK57vxZ7AuHNDT6mSGQNKT89cvGHm8upwVEMTSdN/wZCj4rtkw+H
	n/gxZvMENyIlUa+I36mQ8qKpSBhovyZ2ihbg0bYGiADhExcC2S6FC5cIODtJvtM7x5CIADvod39
	p0kma2X0vgBdY9D5TJ5tzxySFtDCsJywbCUFM0WT3KISOBrk5kOd+QEE27i8wdBKcAmBm+x7KSr
	Dj/7UNQ4CKItHGxIUm8VR64umFDfSYIDjmdHekxVKVCti/f31Fm1PvTmBPer5vcDWvVNDN+HbFJ
	mw7tSWZA3whybuZXdFhTl67kw7CzZr+MVnv0KZ7MNh3GV5dDVjQxImnKG6WMFk88Sk5Qpe/mkQC
	XBPIcGkwOu0kuE5CN9xZDX8BbfVOQ+JsAMLaQ==
X-Received: by 2002:a05:6000:1144:b0:43d:7403:4b57 with SMTP id ffacd0b85a97d-43d74034bfbmr18402061f8f.10.1776322126388;
        Wed, 15 Apr 2026 23:48:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 42/47] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 08:47:43 +0200
Message-ID: <5d669fd8ed500b753859e8e76ac875d83252311b.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235384

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/buildtools-docs/cases/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildtools-docs/cases/build.py b/meta/lib/oeqa/buildtools-docs/cases/build.py
index 6e3ee94292b..9f963f18f8d 100644
--- a/meta/lib/oeqa/buildtools-docs/cases/build.py
+++ b/meta/lib/oeqa/buildtools-docs/cases/build.py
@@ -15,5 +15,5 @@ class BuildTests(OESDKTestCase):
     """
     def test_docs_build(self):
         with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
-            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('git clone https://git.yoctoproject.org/yocto-docs %s' % testdir)
             self._run('cd %s/documentation && make html' % testdir)

