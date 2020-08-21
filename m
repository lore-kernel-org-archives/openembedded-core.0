Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.126938.1597984903387315125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 21:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/GlLnwJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id d188so471518pfd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 21:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r34u2P1h+FV0iD7taBxa21Br15OGDbeLbKER/R59A7Y=;
        b=l/GlLnwJB7Q3BKDKMBj8XgFygk/sZr4IikmlEC+cAOpQb2fqmsfP+0EclarHWPmJXD
         sBvxS1f2oQPtVhyI5CzgjX1GyO29oyEMiJqUHJDGfayt5PG0XUnMcFYr9z/dRWrcl+nw
         pd3zVi/i/OPs7Smpq6P/9VsWO1lj8Vj0ccEmlqP0s/ll3tndm+kvLZBnysRc6NnJqKi6
         16wiN6CpmGbi0dPRkoVnDWNkyVAMtfe0nvwMGG6Sz4VXKEAsNVZLFE8eUf6TD/3Y7zlA
         ZFQIfLRofQAVaFFpihofWXlXxdSru1LuIFwP445boRh3OqoDYommMkd7F/fFLyCqjHWF
         vEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r34u2P1h+FV0iD7taBxa21Br15OGDbeLbKER/R59A7Y=;
        b=YuhH9NSX9TvPgvE1OP5RttxQT9gsN19pLYrbI7G1LxkBbrjL/2CodABxXSLDoAvCLg
         7Z/kWoB9kKZaaQYTvVTVvxJckvobBxc2Mz4PhiWVTWGBlk24Pi4HvqgO3nnvO+Tkm8pg
         aTq7poSH76KUkQt4ZJGPFyGH+LPP7uzhr/gg8TvwqI0AmbCx8O6IT5nsSifwzDI/ITzp
         qQQaTF/eQi55SrRD1Vlcs3I3QcbDrBz/Uka3me14Bq96Ot7mOue1RF3xoXrewH2/uRer
         qjnmipp9rnoRi7qVhtVOp3EgXOKmTOivLwTONg3fljCvpwvbqZxbsHWNVEnyMgmYZjsz
         CUjw==
X-Gm-Message-State: AOAM531IgQnrdEdEy7KHUkLd33RKVP3u19bKLw1YT19LtiZRrPG71Pzu
	pRBPCLX5LJ4U75ew0WeuIHVOleqXyoCypg==
X-Google-Smtp-Source: ABdhPJyLCFsRxEm6xiKuNoYAlOcGgkZRAKY4lWaWZ89k5qHhGEJA9uk5d347/29qSzcoH1rt9m42OQ==
X-Received: by 2002:a63:6dcd:: with SMTP id i196mr1109568pgc.70.1597984902483;
        Thu, 20 Aug 2020 21:41:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id e3sm621767pgu.40.2020.08.20.21.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 21:41:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] multilib: Add musl multilib support
Date: Thu, 20 Aug 2020 21:41:36 -0700
Message-Id: <20200821044136.3703818-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since musl ldso can now co-exist in multilib therefore add support to
build multilibbed headers and adjust the wrapper header to support musl,
it needs __WORDSIZE which is defined in bits/reg.h for musl

[YOCTO #13122]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib_header.bbclass | 7 -------
 scripts/multilib_header_wrapper.h    | 4 ++++
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..48f231eed0 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,13 +6,6 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-
-	case ${HOST_OS} in
-	*-musl*)
-		return
-		;;
-	*)
-	esac
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 88f3193812..a4d6612edb 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,7 +5,11 @@
  * 
  */
 
+#ifdef __GLIBC__
 #include <bits/wordsize.h>
+#else
+#include <bits/reg.h>
+#endif
 
 #if __WORDSIZE == 32
 
-- 
2.28.0

