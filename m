Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CAEC5AD55
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 21:10:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13790.1786223402883586549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 14:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d9mR1Oe/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f84023916so530934f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786223401; x=1786828201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7RHUpMcrKACCdSyWbgWLSbArvSexK9xYvzCLT1rpFKo=;
        b=d9mR1Oe/QiwrmabH+pZJXjeHDzjhuCz89nhlayVIkmEKixpwFCL2iMBWPovJc2ZI8j
         74PElGQsv6AaYwWQuTAboz0VHJiL8cJE8Cu1ZRVJoeQW3W1CU/cDgjc6OxP+9qhJJkay
         AObHz/tYLMLKe+e4Y16yhQkaTjpb4EX58a+bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786223401; x=1786828201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7RHUpMcrKACCdSyWbgWLSbArvSexK9xYvzCLT1rpFKo=;
        b=rFk6fYzOm3TtPqQXYQsrsvvZOdnb3E/tqczEDiA1xRwpD6OiXeLDDLpabvMLqF0Y/O
         C+vgvaxHebWDqh0O0IPnYc7uTsNWoJIF1+s3RseBwBRZq8gU5oCJSy81F7Fl8c9AonXO
         pBQKtJ2qA60+o43/KtDt7+iGa1kBZv2rWlFSgiuIOqXWvHpPhXr4TrbTbo3UbS/oX3MY
         vJM8x+bOTFsVG+BKe1Wv6DsIE5tGrh7+DVCMEsKUSW+RfuJte5V41fWbYT36pClbsWjr
         Qs/huzpEalaQrTSit5iAyA/a4Buu+zw6PQu21d+NKWI2pRGdCEx5qC2WAclCaw8UGZch
         iHHw==
X-Gm-Message-State: AOJu0Yz7NrqSA4DY1d3j0xLkDyvh4+c5xTp0eeFhVtdiG3qa/btBxrGp
	hs66hEri6c8jJzRo2h7WLBoORFZQG4RW2PCDS12K8fLNRS43J84K70IurCvmQID2z1rPuCOlLNY
	mYdN1Zsw=
X-Gm-Gg: AR+sD116TqdKj3lUMQ4pYha6eSDsGZFAjuO94E43xwkUfGNZlvvZULe3VX3VFYo7Hov
	rWN6sHVgo9PE3xx5mbFqatPCbmbl2ouo+VmzqN5Z7ILdDrNklBOjwnOZyvEY1yf/4O1BLsWdGwO
	8EhluSmfOMDbCEmmOt1F1sfrnRzHNywAQpJQQqrlMSPwK/iartezaQFyLSfKvvaM7MraUwlJilc
	nVRkPc+nk+dBstMCAipU56ubGUrqy16QYqEkZ8rxvQFTYliRw0hS63BQiBx4pxZ/ELbLUVObw34
	oGV0ff8Mr70iKrRuILsMDYLyZCxuv2EUpzemidE1668sed1sz1aGuVSSrxI/AnCePC1L7gs1MnR
	WrjAYxMgAeigcGnW7BuM6OBX/k8vNPiH0CYAq4QXGjFwJJeJW4U2JcIzy1Q6oANkoZBNN/d8lLZ
	OoelrU1xT42SIUk60K71ke4j9AwI3G5SX9VfoLMs4ksDXpMAwCDie2EoAlWG9QHA3CWWglAP7qN
	GV+huNG3/6ReLVeYg==
X-Received: by 2002:a5d:5f94:0:b0:47f:8ff9:c9bc with SMTP id ffacd0b85a97d-47fec51a037mr50957143f8f.14.1786223401066;
        Sat, 08 Aug 2026 14:10:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a306:3637:68aa:bc01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145679sm17050471f8f.3.2026.08.08.14.10.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 14:10:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-vcs-versioning: upgrade 2.2.3 -> 2.2.4
Date: Sat,  8 Aug 2026 22:09:54 +0100
Message-ID: <20260808210954.994064-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808210954.994064-1-richard.purdie@linuxfoundation.org>
References: <20260808210954.994064-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 21:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243054

- Speed up jujutsu version inference in large repositories.

  The jj backend filtered whole-ancestry revsets with `empty()`, which makes
  jj diff every commit in the history and took minutes on large repos.  The
  scan for the newest real commit is now bounded to the most recent
  generations, distances are counted without the filter, and the working copy
  is snapshotted only once per run (later queries pass
  `--ignore-working-copy`).

  As a side effect distances now match `git describe --long`: merge commits
  count even though jj considers them empty. ([#1477](https://github.com/pypa/setuptools-scm/issues/1477))
- Improve reproducibility of scm_file_list.json ([#1488](https://github.com/pypa/setuptools-scm/issues/1488))
- Route the hg-git tag mismatch warning through the module logger instead of the root logger. ([#1489](https://github.com/pypa/setuptools-scm/issues/1489))

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.2.3.bb => python3-vcs-versioning_2.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.3.bb => python3-vcs-versioning_2.2.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
index eb81e4d4d35..c8665d90c9c 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "c21e284aa98c8269996791a19d6173baf953cf9996ef42ec3ebcbdc151e18b9b"
+SRC_URI[sha256sum] = "ed718fdee42170e128a8add6f23f53aa64dc7d9ab2de87d3083a691df881a809"
 
 SRC_URI += "\
     file://run-ptest \

