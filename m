Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4455.1599043320365805066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 03:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Rj1131ee;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id t10so3853046wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qy+O8ZfJ2mIggzZyG/8/Is/tjrgefHK9n7xittHN0kI=;
        b=Rj1131eeERLEh89mxlMMaqcYvp4Ej0v6eNXiriFyS5Sm1A5sEIDN2t+DHevkrMWd0a
         KJ7LeS7Ouski2KnwnZ/44/+y8eho+gPSIR8VFMRWCfFTvZucpqv0vbNI+XAieHBI3b1T
         jFJ6T+XDrSiChXKuCOzDTjS42w/H4ZThVPqecqweERut4o6kTvVHyOp9l94VP0W8myAb
         euRpPad/06YAMkziENHNmh7zJka63gV2P3sOwZKF+nPkttifKeOn8C1okv+sui/7VheB
         KtrwWBho7Q+2PNeJMbdi4f0X5+94vXqvXPz8R925r1GEttG9Zux+srpYLvZe93p4DjVx
         VdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qy+O8ZfJ2mIggzZyG/8/Is/tjrgefHK9n7xittHN0kI=;
        b=BcggPqshi8jsjxCy9DJjAsRGZgm447FzFilydO64JQqWbGwj2D4Sn1E3WNtAasLi7h
         OeuWcuHhnuCfNQLmtf4RuCZBsqTziMBa4XoYt+9PQ+cprqWkr4XeKELu5l5pojMjSgdl
         0El+LpXjgZcb9u2W6KbaePp28meXnZQFZM2GtxHHvgHsffKm3AEjfV14IreLNXFyrBEH
         WXm4AscOJh1LBBHmIFSi2jwzSaROVXKjIMm4QePAVh8T6DjTqSOqrwUbae/RJuoOKVRK
         FzjI5/MundjFRwfmGnubxH4RUPO90LTsAGBAeY0GLTPBbRtjN1eJ6R6ErRBoSvmcm/+U
         gAsw==
X-Gm-Message-State: AOAM530nho+/zZbzHU5xakoCQu0cZULDwCx61mwulW8LiYHrCHOeZTX0
	K4gWxNc4rx2NLH7TCyQ5UCgeEUXm5ZYLel8Go/I=
X-Google-Smtp-Source: ABdhPJy/zlKM3JpbqCjXpkwpFSTe4ijW7ScA6m37ftr943oS6j0lzEw5g1RkAV/YDWgcdzQRfcfcmQ==
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr6913931wrr.188.1599043318601;
        Wed, 02 Sep 2020 03:41:58 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id y1sm6680499wru.87.2020.09.02.03.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 03:41:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] elfutils: silence a new QA warning
Date: Wed,  2 Sep 2020 11:41:54 +0100
Message-Id: <20200902104154.3408-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902104154.3408-1-ross.burton@arm.com>
References: <20200902104154.3408-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix to the gnu-hash-style check (oe-core 70d932f21) causes elfutils-ptest
to emit a new warning.  This binary is explicitly compiled with a curated
minimal set of compiler flags, so to avoid breaking the test simply skip the
ldflags check for elfutils-ptest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.180.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.180.bb b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
index d3ee750725..ada4ddd179 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.180.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
@@ -115,6 +115,8 @@ FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils
 
 # The package contains symlinks that trip up insane
 INSANE_SKIP_${MLPREFIX}libdw = "dev-so"
+# The nlist binary in the tests uses explicitly minimal compiler flags
+INSANE_SKIP_${PN}-ptest += "ldflags"
 
 # avoid stripping some generated binaries otherwise some of the tests such as test-nlist,
 # run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
-- 
2.25.1

