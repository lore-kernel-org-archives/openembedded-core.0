Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B872C5B553
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:51 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.937.1748446430465726547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qHxPU/Lv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74264d1832eso5012142b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446430; x=1749051230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJdnOseQTfVVzlVp8qsiXhP40/ve1Kv290L6Aq3ttac=;
        b=qHxPU/LvRBK9Ho9P8nFLTQRAuwEn0vlo+g8RLijqHOUv3M09FMEi1eWW4kUnAynZlx
         GBLNmSXD/+fqRiv2eeDo3TeazqL7ZeWEVw6Q43KbGCFkEfu6GXq6oCV6EDA82f0eqLTR
         64aYwtlacKWl6m4jBSsVDKFsVtuFwmvCw4WeuMKFEKVsmNDISZMJVSz+O1Grk/oQ5sdr
         /8ub+nwc968of229J9qV6f8GISfHABFt3UoF5d+74i60JcKc0KmO3GowBHQE7sIwfBHh
         q/X8mdam3QCyIAvmv3vftTwZq4dhvHtcL/U+YXKJcp7WCIuWj5N0oGA02T+TZhnKvFLv
         TqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446430; x=1749051230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJdnOseQTfVVzlVp8qsiXhP40/ve1Kv290L6Aq3ttac=;
        b=KbOcb8T5KkoCCEBZEHT2vw1HIvStbJG4qKQhFJjRbAmhVltwwGoB91M1SUGqZ8M2u8
         07JaNObkzUwWucMYfmzQkBXN6w8EgHpFP5pXOWNpqKxCcFYYXgLB3stbEqSs166hCuKH
         AK20S+OPTD8ZB8YC7M8EG5IjoSgb8iDAc0uqKaY5MVBqf/h5WRy70nMAXwHyW70o0nEm
         h7T2C/+mh1VaRWw77QbrDHFm6e8rmKPOC+juqbVmzyAd9M1O+83onR4yVXgghB6jAzpO
         XFnotHg3PZAWie+tpeYU6sMpmP4l2Ud1pMP11i+5oDpQR2X0VW7EXeTrn92JPAPruyr6
         /TxQ==
X-Gm-Message-State: AOJu0YwN3qG39nxyVbYIHAty6mSGZ9yyotEa+mWp7toNRbKRGZn2rhvf
	lRiIDB/qmOdFIXBNlGSVa3cyvXshmh7LFnuQhLdicOkBiQHf1PRzlzyxJxKrNxOSgq/kg47BiOa
	4Ebkh
X-Gm-Gg: ASbGncuR1CJ0oVtvz3+n7EyeFSJqTYWIYDHcFELf17iXGBsS0L3tnaLczl6ngFITYwv
	Hwt2upBAUSXOpuRFYqTrEZ1QcnW+TIo6vJGbWoi1Qj43erIoQ39ErQ7CP5gufPGWaC+t2nqD3LL
	p6tu/c1FUVwbu96xk8yb7mEKeeicQ72Ws3Vlw5z4UkSGGO8p5dzT4Rwh9BKf4gPidQdmaYQetx5
	3nzVJGhF1auwtZW4KDScAoGV1xF0gvy1Zx0VYk0MY6MAs78OwdMrwT7YZDq5gOjEX7Q1Wyznj7J
	eczObPOryTo9jEK2VyXAQXkTVTxC8iuLd/pRkusz0Zo=
X-Google-Smtp-Source: AGHT+IEmtOljNJTvKHHprXrChIAi0OYWvPxuRXZ7GkOTDpC7Xu+cwzNYztHT1frGC3dGJH2IGY5QiA==
X-Received: by 2002:a05:6a00:2e84:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-745fde797f3mr26147861b3a.3.1748446429709;
        Wed, 28 May 2025 08:33:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/14] binutils: mark CVE-2025-1153 as fixed
Date: Wed, 28 May 2025 08:33:16 -0700
Message-ID: <b8ed40864e664e1cd50b2015569a406f49a0125e.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217371

From: Peter Marko <peter.marko@siemens.com>

We had this CVE patched but the patch was removed with last 2.44 branch
updates as it is now included.
Since there is no new version which could be set in NVD DB, this needs
to be explicitly handled.

(From OE-Core rev: 32f18145dee54f61203506daef339cd132908287)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 41071fada1..28100abbe9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
+
 SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
-- 
2.43.0


