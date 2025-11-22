Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D97CFD30E
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:14 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3770.1763849708185669983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i1PnDhdu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3438231df5fso4054378a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849707; x=1764454507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO1zrm+RRfPtxNRj/BgahNFVRxY8JE5GpXTVePvqwrQ=;
        b=i1PnDhduz6oaA60AownjlfXiaw7DZW0VaJYJYasUTCJ90v19pVFuYTB63ctQ3Zh+Mp
         gAA39p6m3JPONGxdmE4JjXzDxSxFX7GBu9Ts8gVtOG9xxyhnEu5wd1g72HCq9JUsP3Io
         sAx+W218grXRDsi4tURqwG/iAdXTjKmSSDfouZQXpshIiZj13We0OoChuCtnth9Hk0P8
         qw2JH7krftxR+lCVEq1iXg8CPhD+F5u4w9L58No3lVDq2NQjQns526mSMcGz+KRocuvb
         qyt8uzrmp8z/iQGPhGU5jhMlh6adskhaqWWRuqqZnQXU/5siBIN61yOPckKiUzTFLQgo
         eXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849707; x=1764454507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XO1zrm+RRfPtxNRj/BgahNFVRxY8JE5GpXTVePvqwrQ=;
        b=k6rAnYSSshN0A+L7PhsR6g75Ui5BtmAUjD6KGCkWsGAOK5HVnFhfeFbT7BJfucJicV
         1Ya8HJBkwLs3C4lxunFfOy45VUKnSwOyoxJQX4kf0gjQcp8/XlHQMvWvYQoe7nR3h4gd
         WPJNP4gRYzHfAjGc8LznI7NmlV+2HUvQkKvQc9ylcG1uvsVRPa2K+ne6e5+44Pwd353f
         iDuNcSuPl10W508u4AKNlP47O6n5db95mn49NDmddR5wrjrawv8iW4yYkOyYybcFuLJC
         gWPyJPPBIx21bWaN2HtmFHEb5nI33Zf/FcK32trRr3JgozUre13UYrod/gldUyTnBpDu
         TVRg==
X-Gm-Message-State: AOJu0Yyoh4L2I2/MIKWIA26LqAIkq+rYZuIFGkyDphWijlik46oXe6Br
	FsA0zYSxU3G5gO6DrtmPQPrD7e2w8wAdy33GZr7yItLHIcLQbafU7Xq7CsieqSjDHxg6piutZG1
	B1KPJ
X-Gm-Gg: ASbGncvky6JzJb8TN/n2Q2fn5qrq/TUFjJC+92InmZOgvQS7v1zNnAKh1hLaRgfFmpd
	2qX088wLD1BDI28nXz20GSmT2SSVxh9GK6kSzLLJ3Yxq8/42c5SB7rqVY7Q3bqD57p+HyLhLl08
	3V96RgPxWfcb8lnJWcL1AHkQ+9V6JlbdHgD5xT34oddQRdtg3sqdi/k0a8wrohvtxnOP8HawGjd
	GLIe2ZcohIiXQrZovxe/nHVI7c/lCQ7ynY9mEjMYehskTSvPeJnwKzun5LUO4cJPnt4uRQGVAW2
	GF0gC8KD/AAoTYIffQOH/rvgSdti2iNaoWY4jrdAnfuXbFDZTdKvZ3h+knmp0f/LQ5YFhnsScbH
	M6nOoiXbjIqIq0qsbXcn9oD/MNWG014kU1dl8SxIeUZJiXCqOlQ4O1jte+hl5bJcfRJTe/RWq5t
	q5TA==
X-Google-Smtp-Source: AGHT+IGhQyCN1xHaGIEfj4qWSfyhOsR6ya7oNTHCPsgmXHeLcBU+uSq0axNexK/SCVNsf9p5UNHMdg==
X-Received: by 2002:a17:90b:4d0f:b0:340:e103:bfdd with SMTP id 98e67ed59e1d1-34733f44278mr6339700a91.25.1763849707450;
        Sat, 22 Nov 2025 14:15:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/21] go: remove duplicate arch map in sdk test
Date: Sat, 22 Nov 2025 14:14:24 -0800
Message-ID: <21f3a6c661307eab5530b51704c3a338013c9c5c.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226716

From: Osama Abdelkader <osama.abdelkader@gmail.com>

ARCH_MAP is duplicating an existing map in meta/lib/oe/go.py
use oe.go map_arch instead.

(From OE-Core rev: c2ba36f41777d347fd5ffcd9b6862638e5f35a1b)

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index 9c15124f6a..a050df7a9f 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -12,6 +12,7 @@ from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 
 from oeqa.utils.subprocesstweak import errors_have_output
+from oe.go import map_arch
 errors_have_output()
 
 class GoCompileTest(OESDKTestCase):
@@ -55,22 +56,6 @@ class GoCompileTest(OESDKTestCase):
 class GoHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS', 'TARGET_ARCH']
 
-    # Architecture mapping from Yocto/Poky to Go
-    ARCH_MAP = {
-        'aarch64': 'arm64',
-        'cortexa57': 'arm64',  # ARM Cortex-A57 is ARM64
-        'cortexa72': 'arm64',  # ARM Cortex-A72 is ARM64
-        'cortexa53': 'arm64',  # ARM Cortex-A53 is ARM64
-        'x86_64': 'amd64',
-        'i586': '386',
-        'i686': '386',
-        'mips': 'mips',
-        'mipsel': 'mipsle',
-        'powerpc64': 'ppc64',
-        'powerpc64le': 'ppc64le',
-        'riscv64': 'riscv64',
-    }
-
     @classmethod
     def setUpClass(self):
         # Copy test.go file to SDK directory (same as GCC test uses files_dir)
@@ -94,12 +79,8 @@ class GoHostCompileTest(OESDKTestCase):
         sdksys = self.td.get("SDK_SYS")
         arch = sdksys.split('-')[0]
 
-        # Handle ARM variants
-        if arch.startswith('arm'):
-            return 'arm'
-
         # Use mapping for other architectures
-        return self.ARCH_MAP.get(arch, arch)
+        return map_arch(arch)
 
     def test_go_cross_compile(self):
         """Test Go cross-compilation for target"""
@@ -117,12 +98,10 @@ class GoHostCompileTest(OESDKTestCase):
         # Clean up files with dynamic architecture names
         files = [os.path.join(self.tc.sdk_dir, f) \
                 for f in ['test.go', 'go.mod', 'go.sum']]
-        # Add architecture-specific files using the same mapping
-        for arch in self.ARCH_MAP.values():
+        # Add common architecture-specific files that might be created
+        common_archs = ['arm64', 'arm', 'amd64', '386', 'mips', 'mipsle', 'ppc64', 'ppc64le', 'riscv64']
+        for arch in common_archs:
             files.extend([os.path.join(self.tc.sdk_dir, f) \
                          for f in ['test-%s' % arch, 'hello-go-%s' % arch]])
-        # Add 'arm' for ARM variants
-        files.extend([os.path.join(self.tc.sdk_dir, f) \
-                     for f in ['test-arm', 'hello-go-arm']])
         for f in files:
             remove_safe(f)
-- 
2.43.0


