Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CBFCDB483
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.75790.1697319925636777933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rhpCXnBG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c63588b554so2166041a34.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319924; x=1697924724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af2iQh1Giec74SifKfAE8V3fhososzB5a+GbLBsL1i8=;
        b=rhpCXnBGJjO1pAA9b3d1JgqCHzdvy/K4/+DoW03kAr4scrcTJPBoiBHCCrKG+nimV7
         AcXegQ8YNrDuRKU3DOBKBqxk9IWdC5XS4P3CECpVTrWmgOZzCgN32+nfLPTCc0357Id1
         UiJGIgF1l/a2TCmtvANyTquQ0X59lI22+3bGOK6l60QOMZTk7N1vwSsJ1o+VTy5ZFnBW
         vH6nu4RByQba0gY2TU9VarTGZnvPRYtwj8Kf1k9PX1mwTrvW5jOMDSJCX8zYTCy4D+zT
         ekj7sn8lPWXLWqlK5nq09hI0vqV+5qcTXduR9apFd32jAabb5ZPnP9+pleJmKonYftMm
         WASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319924; x=1697924724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af2iQh1Giec74SifKfAE8V3fhososzB5a+GbLBsL1i8=;
        b=gM8jnKmm1cosDSPV/ZgN7XyG64HQxU+lbI+w1ONaOs7wV6sHiHze3cKjtNGC6jxI0F
         BdAnE9dFLtTy+PJs3zZomMtA3+pZeVCxm9PAvu/YkhjyGMYWHLTenr4lFuiWFR99JBxo
         k+cE/YAGxJ5t6oAKLAMjQRUpzURDErAjKRuH3/RvGcbVQNPKbjTJSrFrbLG06Qvlo17x
         i+8AQPPE7WnJp0+WG8k6X4kzERlv3fQw0oVz0NvxtKdqc0jiu53wqZ0GWkLUZFLtXdPO
         I4LtvHJmXEphX23dhTfaVIj8VhA8XXFYag8JhqxI7pBJ/yH3PNgreS32zXj0KOWTHEtU
         BIsQ==
X-Gm-Message-State: AOJu0Yx3R9Pl1BP90zMr0cLV+rU56LPwVUYLgtCcFHB5PvJxtgYEjnWM
	jH8f33BMRDW6IhjeTM+TRLvZ+1wsc5jIy70v0iU=
X-Google-Smtp-Source: AGHT+IHL7uBbPZxTZFJ++F7fNQrXSj6Opeh6Xq1VfhTYByLIMLyJSgC2xgIhYFuJAwW+r5Ox11gT8A==
X-Received: by 2002:a05:6871:6c9b:b0:1e9:9be0:e8b0 with SMTP id zj27-20020a0568716c9b00b001e99be0e8b0mr9443434oab.29.1697319924619;
        Sat, 14 Oct 2023 14:45:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Sat, 14 Oct 2023 11:44:50 -1000
Message-Id: <6c88137d4ab36054ac97cff0457d78ef503f383e.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189129

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f55f590e6..5e06866692 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


