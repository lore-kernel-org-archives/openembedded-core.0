Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE51FCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:13 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.3133.1695249072529699666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KSct8QB8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-578a397a30dso184557a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249072; x=1695853872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2phqi6BLHC6e6BMgOvhZCwPaNPp4sEu6803wary9ARc=;
        b=KSct8QB8xW8dCbkIyPHylfwWAWLafq/VLM+MZ5tMSuaf6+EzQscJFXqOIPUE5j3Jze
         RrxtyL0I8GPWL7OhA59FdnTBKamCdX1LoZnckS3vvB3snOpCG8B3BiCjptGvknNbuG+4
         r1LmdqMSgen2Xpba6QU98fkRnGMrooiN2EnznuZUVwQM7OEen5tLEGkpmPd9Mw9GBOvg
         q10gEjShCIBHkZ0fa02kWqNumSb1SW02RDvXutKSS8CorXgnILu6NbUU5ZT2vkDcPtoD
         LR70oktbshJUouiL5X+lPjLEoYq4HcRrwHVGghZNTV7/zBmicMSDsPHnnKfDw7hHU4FL
         MHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249072; x=1695853872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2phqi6BLHC6e6BMgOvhZCwPaNPp4sEu6803wary9ARc=;
        b=itkdlS89me3hjPjnEKlLWRm6M/cDDzkiBaw1IXAOplSFOuoEPOza2x1AECpyTODhtE
         ly+heOSH6qb2aPFYONyNUHzZP4pcHS1xuD5ZXzvqPvR75Smw4EeCED/LsiBZ/8B3KvWI
         kNTyYUEuGJs50wIs35nrdy7B9Vk7JtSbZ2DSBylX/pjAvgLhiHiqzzr95KeMM9xuakeo
         Bz2CGTztjKNZZacl/fcFUU23bKkvIGiMPe/57sPnwE/rlsGHInw6eMw59RUL51Kb8Ssa
         H6LYDGe2ggBqITJaSd4xTy8I+3ixeGf6DoUC+6vvrLzdZAxVpbhSr3JjczIk+9LD9/fX
         HBsA==
X-Gm-Message-State: AOJu0YyM4lERoiqYpGYSA/A3fG8XtuuMky6sFKj4KsQ/l07GzITMro6E
	O1aN9K+vTlNBOOVrNpuAyJTYtU8dIiCRcQ/VBeI=
X-Google-Smtp-Source: AGHT+IFOtNTLUE4neQYGZRE1lDXSPB50bONnuIoBsiQRcyNCXbeLtBlTFiEPyksSynkFPwxyNJ55rA==
X-Received: by 2002:a05:6a20:13da:b0:137:db14:e88b with SMTP id ho26-20020a056a2013da00b00137db14e88bmr3737927pzc.29.1695249071642;
        Wed, 20 Sep 2023 15:31:11 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/20] glibc: stable 2.35 branch updates
Date: Wed, 20 Sep 2023 12:30:42 -1000
Message-Id: <b834674ada7329ab60130ebe7350dff592060ecf.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187952

From: Sanjana <sanjanasanju1608@gmail.com>

Below commits on glibc-2.35 stable branch are updated.

561e9dadc0 x86: Fix incorrect scope of setting `shared_per_thread`
1c3ecf5858 x86: Use `3/4*sizeof(per-thread-L3)` as low bound for NT threshold.
47c7d2eb03 x86: Fix slight bug in `shared_per_thread` cache size calculation.
d1b1da26ea x86: Increase `non_temporal_threshold` to roughly `sizeof_L3 / 4`
e19af583b4 elf: _dl_find_object may return 1 during early startup.

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 01b1abef7d..f23ceb5a25 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "cbceb903c4d770acc7e4ba5641036516830ed69b"
+SRCREV_glibc ?= "561e9dadc02f46a7ba2190c0a04259583479f6c9"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


