Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.19241.1597251824015563329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PfoxF3wy;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n129so2692982qkd.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dG4qV6KcWKC0ZLB51UStoXHNWX2nCiNplqPcLZwMrBA=;
        b=PfoxF3wyyOE65zvTS6ULr0GRWUzuxSChNwdYhhtCHANx6momNpr/EBDn2yIrkjJU7K
         LQNBn/fgCAcLsrVCnuR03+HX6uYxLNuvIXTBFzGWiq7oISqI0wv9+11FHoPoKdqBd3gp
         eN2rHRAENwZSRCe8QKwE6h9shzH4MKHZ9YCn04gEhu6dmf1xS32ovg9rlLU2RMCMRmf9
         EmkDHX5piw+S9eTYQ7qj/OGAvXbwf2q9eIHZo5qEzQJwfYw+Y+sRvzVUQA3gVdW15vz1
         OcnI5pS6816b+7oBo6nd7j7VvDiBkN9cpHCj9BLCwHKMwIvjMhRajsBo6Q0lXq4BxvUE
         nWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dG4qV6KcWKC0ZLB51UStoXHNWX2nCiNplqPcLZwMrBA=;
        b=jMeUaz9psHTvg2H6+hQAuyJ8+bEgq+/GXwq+gPlupdlZEl+cO/+HN+lRDheBa1suW0
         BoWq7e1vr2O9nPEG8MhEA82Bpx6Iy0rWXgKohw3G8/uNUz9/9gBZXBf9CCaYtkZHQliI
         27yftAiH+g1JzNRePZxdMOvfesN/4a7rPS9IumWaR3z1cdrNDr5yWL/DgGcm2hPOWZuU
         7BwNWyOsPz7hN8WifvQOMetE0RNG1mZgO4rYs4mWzEpxLX49fr5+S68FP2SNZ7nKaqLF
         bfFTOiZJeipjaIjONLBBxIwH/jvTk+nQjuQ29BsUFa+mb8dCW2624IIy4QOeKAUBM9CB
         XhNw==
X-Gm-Message-State: AOAM533b16gsyGYWEAj4eZbpNgWtl1Vn/lvkVKwZHEpuk4sckG4i6cYD
	TkOOT0YoDHEjHOr4i1Gg3SI=
X-Google-Smtp-Source: ABdhPJyXFCOHNY64rmdQCCGIytLeFzwJ5sW5V+HetMGfyypeALqvvlBgFFac3pfSkHxO/s+Oi2NtgQ==
X-Received: by 2002:ae9:e641:: with SMTP id x1mr863753qkl.424.1597251823126;
        Wed, 12 Aug 2020 10:03:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] kernel-yocto: make # is not set matching more precise
Date: Wed, 12 Aug 2020 13:03:27 -0400
Message-Id: <85f4fcbd16822c20d2517ec9bce5929e6953a046.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

    symbol_why: tighten 'is not set' matching

    Commented lines that contained CONFIG_FOO ... were being picked up
    as option lines and reported as invalid.

    We make the regex more explicit and only match on spaces before
    CONFIG_ to declare if a 'is not set' line is invalid.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4402e14754..ea33732a3e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "8b6fa727013daba5e8d72e5fc61d80caed944c6a"
+SRCREV = "df4390b18a500a1a7d4695e1856971f8e36ce517"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

