Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB4FC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 19:06:47 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5487.1751396798457952869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 12:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COCbggPp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2363616a1a6so31165415ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751396798; x=1752001598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hTQjamZ/9esRxWHzdn7oZsBHFHZ7ySE99WwNtjy2Oo=;
        b=COCbggPpxnmwUyr16NSLsdyLr40CGfqGGYlf3MAjJIcduaacx+yFLdjxXBN5YTjVq6
         7MvTU+WOQGi6jG7GPI0Vx41KWIQu5grGKpC2A4+BZLDrhzaRgvy9xOrGhyZ6BR8WI0El
         Cy7+xrljSsmaFSPWNlU6GRWx92UjtAIbhkJSsn++lqYDG4wycX+nRPCctveKf7WOmdM5
         9TcR+c4P6fuqYtcn/BGt3URXKWRJoZEwlCVJzEorKd446N+92GteVA78NT/zUa5Z9lvG
         Gj59+Au7UYVr+RzQNequsLhT8Zc52YHSkc4DFlRFriSg/ZPrrE3PUYdPfOwhFllCwY5Y
         E2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396798; x=1752001598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hTQjamZ/9esRxWHzdn7oZsBHFHZ7ySE99WwNtjy2Oo=;
        b=tD6M+QjWxzjtF3QyYlvZtpU74iEzfIpWaX3SUv5VhwdnFFkcsTXARGj9nuFOm0Xk2A
         OcsG3iqwbgDvgbX6dVTjiAeVvynE5T8HJIRhyiaZUGOFuexfYF9nmOYXtsSnDuthGWe3
         JrjjZneli5c8dfiUa16KDwQv7tJjETmYzVlql2vM/qWmfZvLEIHMROPg9VzLaaHH+G4l
         4EXYSf06s0Lb+mQZvfBlzrdQlF8ceFfbtQe2RRL9PQRWCifOZnUdHJMF5/xJfCmBDfY0
         uLwd/n1ra0AYsTVw3zJrgBHxefEiUbeY2ddZJrMo8xMzgpSWQNw7W3FQzBI7qDIV1y5Y
         OWlQ==
X-Gm-Message-State: AOJu0YxOPLR0lWkueC9cIavvPJ7jWwKhfiTris84pRSwJv+wJrlZ8eQ/
	0KzBJ+vqf/X9XeUQ9kCR9W3Ns5qRNPvUgLpUK90GpujZRap9s0M/AgB0qVaRFAMw
X-Gm-Gg: ASbGnctD8mT/7a9VDoIe7+FJTkiBonU3Xr9hloDiNwFvQi096pjodesGdiS5ayxJw5X
	7fiBk0fCoJfkd4bV1B8Ps7a8dVCYidDeJGhdmoFaiyNlzBURkcwk5OgjpDHMxWfRzt7X0ScxLBG
	Mxnegu1kLYfqeaH5siNSEYIfr2W8h/2x5DRBMdbJANz16bAO36oFJ5OClEiu7/ge6Q58v+lSmkB
	lUiC10QZFW8njliutIJzkTHVpSbx2FHZNBYTS+doQQgYuJ/ZNwFOmpl2P2o04s7Ce7q7hnltgH7
	jvVP4IPwFSCSu9++i5e25jEMVcvDqHZrxD8dhdQP+jdttwXgUEZeAg==
X-Google-Smtp-Source: AGHT+IExnUfrZZB9utoZHIs7wOkdk84VDIlUw7s0e81nvfmuE11ei8em4fCiSIQ006Dt+GXiu8Ch9w==
X-Received: by 2002:a17:902:fc44:b0:234:8c52:1f9b with SMTP id d9443c01a7336-23ac4686520mr317899225ad.43.1751396797495;
        Tue, 01 Jul 2025 12:06:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b97dsm119286665ad.121.2025.07.01.12.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 12:06:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] base.bbclass: Deferred inherit native toolchain class
Date: Tue,  1 Jul 2025 12:06:33 -0700
Message-ID: <20250701190633.2324784-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701190633.2324784-1-raj.khem@gmail.com>
References: <20250701190633.2324784-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 19:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219716

This helps build native recipe with clang as native compiler.
when PREFERRED_TOOLCHAIN_NATIVE = "clang", otherwise it will
inherit gcc-native, this is a bit redundant when gcc native
is used, ideally we should defer_inherit it always but there
is some code in classes assuming gcc as native compiler e.g.

oe.utils.host_gcc_version function expects BUILD_CC early during
parsing.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..1fa09b6a16b 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -32,6 +32,7 @@ PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
 
 inherit toolchain/gcc-native
+inherit_defer toolchain/${PREFERRED_TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

