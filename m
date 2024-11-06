Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A08DD44D5C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:57 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.45909.1730900990928201472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u8hsyABo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso4887968a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900990; x=1731505790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foTnNWMVrnGNUv6SqQfxugV2exD6QF/KL3RutRwZviA=;
        b=u8hsyABooHEmCudMYfqUuOj4/sIyuqxpQy8eLtlm/966DQ21bAlLMRdwdnlIFhWFbW
         ltJrv+JQEC6Y8XXM4VvPesrr/KQ/DZ5QTILsFneU89CgZfulwdphuWaQXb5rphnVXKeW
         a2kspR9YiTLMwu5+eqtbrUD5tPWik/cGav1Z0vCUJLaeCZT5DP8Uhh5jYBxuccL42WcP
         Y4LySi5c/o2HthBPfIcOoPafZJCx675TW0jOQhu5bUj/N1tWdCNIJJFusIL447bJzwMC
         IqECBLvyYyYNIzbY/HRjURaMHOQbGILxSzWy9glN6ScfHEG4T2twoSFu9mzqHwG1EWqf
         fTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900990; x=1731505790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foTnNWMVrnGNUv6SqQfxugV2exD6QF/KL3RutRwZviA=;
        b=mbfN836qVIRXSgL7mrCZ52ez5SUWVmsaGPTEaG1RcSUIV1kw8O8nC20CzBiJ9X0HwN
         FLWOujFrqE77upVC6looprRRMGtzRogUIK7NL/UFUMvwGvMomlNX0z98mFR47oGQjxQF
         Kjq8/eaX9KiBgKzKNvwQym4+ic7taNhCi+GV3WiiGklsOXHbrcZGHVZkRNc4RCzkJV2b
         kjXOpKVT7Greg67muokTbZgVw3sqjbet49QzTGBCkAYh4Z0WjUbV+ICkLD0yK8xTKBOI
         GYnyuBVTq9UsHwbQboqllJe26plpgbqqLTmn6qZuNFp6rX0mB3ezz8fifSR1efMje0z9
         4F2Q==
X-Gm-Message-State: AOJu0Yx4gmlKQ6lenhYl3Y1kX7ONdnJDb8LVxkZUGoC4whcx+B8q0o92
	pDTXYfkGyTjcuv77UpBTK76Aylm8+m9QO9d/DCiZ6dXkHiVfD/Zc094I56AN2Ooz/7cSfPyBnzX
	A
X-Google-Smtp-Source: AGHT+IH1d5DbEPPGRQuNwwtX5nShAj02fjf3P0kRhpUUL/gVKfn1xo8TKRj+wtbhQF96c6y67+lkpw==
X-Received: by 2002:a17:90b:1e4f:b0:2e9:5f95:54c1 with SMTP id 98e67ed59e1d1-2e95f9557c0mr14869318a91.17.1730900990183;
        Wed, 06 Nov 2024 05:49:50 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/7] ffmpeg: no need for textrel INSANE_SKIP
Date: Wed,  6 Nov 2024 05:49:34 -0800
Message-Id: <6eebf4c2a9b5d30cf5145df61f1713ec1a6ce91a.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206777

From: Ross Burton <ross.burton@arm.com>

It appears in testing that modern ffmpeg no longer needs to disable PIC,
so there's no need to ignore textrel warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98d577fef75d54a59eeacaabb4a45e44b2f6832e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index b16bd51dbd..af66104ebf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -181,13 +181,3 @@ FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${PN}/examples"
-
-# ffmpeg disables PIC on some platforms (e.g. x86-32)
-INSANE_SKIP:${MLPREFIX}libavcodec = "textrel"
-INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
-INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
-INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
-INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
-INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
-INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
-INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
-- 
2.34.1


