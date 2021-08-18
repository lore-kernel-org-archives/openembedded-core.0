Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.57057.1629305436553823092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z1wNFFhx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id k29so4520818wrd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jY/gvW9KRncRFeFFgq075hIkwThX2wUZwYjtyyH1Mi0=;
        b=Z1wNFFhxF72EkMFhCYsMXwI1/fcujBAhr76SMQFQuFxgVrpkKHEboqK3oukjPmIv6p
         1AdYNXE1j4XukKXtBnHbU7fSyXxqOgG+DOzZbjiadQEDrne4IhUg0Wshct7ea7LzUNII
         cuqJPISXaB0O1R4yvVbQydtBjuAZXSj+67r+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jY/gvW9KRncRFeFFgq075hIkwThX2wUZwYjtyyH1Mi0=;
        b=Asg4OOWp6NiW2lTFJlu4bRMNP0d1Veu2LICfyPr8t9JNw6WkmGl/GxmwQh+b3YJf9x
         Q1DK8yl4YWgDojP0MeQbAtv3Pj+mTQ6dVUrzJ2v7Z2Ji7FZN29SBiofM61qzxkWjGNlG
         c4vnX7ToDL9bCiBZ+o6qCOKEYgdXIZTkhR1+m/V8k1TvAxFnFnXmmzKf/Tgnz+Hk/X0q
         H5culuXyVarAGZzYCXPg0EjQ64HQtKMPUbg6cTcGSO76/DDIE0SPIcBFGRq8EUhOt07f
         uWDsXgE97hmyUga673gZLatszRfmwHEiUt/rcSuQzlqCbEYME+XdJJucDSWzaR6/jt0i
         QpTg==
X-Gm-Message-State: AOAM531KaEBW0nEeX5vmIM1V7ktIW8H0cUdXKeeJmVQ+nUU4ZiYLzlk5
	5zAG1GnrX5ct2HS+Ue2JFYkK+BuVikvFvQ==
X-Google-Smtp-Source: ABdhPJxe8m8t2A37VtrIpcP4T2SoP/+IF0EwJLPJsfXq2zmELO4Xmz8C21dim2iu3dUW5D1AHuMB8w==
X-Received: by 2002:adf:f78b:: with SMTP id q11mr11248736wrp.376.1629305435131;
        Wed, 18 Aug 2021 09:50:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id z126sm343363wmc.11.2021.08.18.09.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:50:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 3/5] gcc: also relocate the musl loader
Date: Wed, 18 Aug 2021 17:50:31 +0100
Message-Id: <20210818165033.3935964-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Alongside GLIBC and UCLIBC, also relocate the musl loader.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 33bcbbfa246..26bfed9507b 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -120,6 +120,14 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    (r'^(#define\s*MUSL_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    (r'^(#define\s*MUSL_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir64) + r'\3'),
+                    (r'^(#define\s*MUSL_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirx32) + r'\3'),
+                    (r'^(#define\s*MUSL_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
                 ]
 
                 for (i, line) in enumerate(filelines):
-- 
2.30.2

