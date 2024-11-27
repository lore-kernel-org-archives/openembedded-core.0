Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E11D3B9BD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:17 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.64671.1732680729365442173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cFAT9QMk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fc41dab8e3so1326204a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680729; x=1733285529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWkhdiQThyDxsp/gq0cnwgI9PXMr5ybdNQFBiMZTqVs=;
        b=cFAT9QMkMVYY8iSxyE+PU8adAqpZoB1VCuiUTwi8cJREe0Hy+77fqUsHEgbUFNxqts
         RmQDiwsXBzI0cothSllYz3R2pkt8Tpabfvk6J8nbzayWd1UVCFyu0jaOkdyI/Siyl4+q
         z2IJbhobJzwM+jc1spzsxnycKgnTQGSJ4Kk3uILXeYB/S548EB+sxjwQ4DxU5eRKwQ9J
         IEdif3gLnJZrMB3wSZhwso0z8BtMr82kFlPZCT3pb/jZGPm0vEznVK3IbkQlgex7dXnV
         adyrtZNHWtvUpGfu2mgRrNHw7KP4PEHhTEuupLr0ne/J1SvrcNcDhEF6HP3hbIZitFUb
         E1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680729; x=1733285529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWkhdiQThyDxsp/gq0cnwgI9PXMr5ybdNQFBiMZTqVs=;
        b=rD3og9POABgKBqB6JPyInCxUGGMfFtBZei85nZ5/U7cTVCVvIqX+p3Hj1GDl4mJKRJ
         pZYQBxwh5Ro2aLp7t5KNPRLkKEc4roGZZ/RYD8yufbW4RAb3AFOTDMUnjWdmvfnCA5K2
         Z8JOniNHKxcNPBKiGb8Qo0CnTHshg39VBbBdJAYU1Dl5d/q8+pe8ml7rn7QN0CzIXDiM
         zLAyUk89wmXXTIIfIen8beyxUoyKyusQgGPWlQVT3eC601kTsex0JNumd2wIAH1NnGAw
         b9ZXK5rDcIu2/Py+nYJlHc4jpy4Dpos/Lyh6fg0bvOsopkvt9UzelKmB67D4gzkXOr21
         G2jw==
X-Gm-Message-State: AOJu0Yyofk7H1pbwMM0oP3eu/3nubf0gy0y6lTIn7WW0dZGiRmyVV1+t
	6QIBL8+HmmZs6+7Yhm9AHWQYxbFlA7AGGNyEzCT6ZOMn+eu/5MlaFtZZtuHd0wls1B8n3OivfzG
	N
X-Gm-Gg: ASbGncuMt9D6u/030nfrxy5srDIdi32fFFo5SSVuj8NQ8nI5jV0SSilZ4ldvXEGqpVx
	lKxEjrch/sCsK5lEoViH0wk5wZkamgD7IsSGipspXkRTM54ahWFxesHtb5VzPXvnfPgKiEgRjmL
	Ej58zp2X+h7++9NU0rWRJwrPjutbjlCIRJXLuNUv6vAzaHYOBrnfYGDLXnuJkxryOTmk7Zz4C/5
	y+WPxzriI2icJgz33dcJ1dF2O3010eVYes7J1o=
X-Google-Smtp-Source: AGHT+IEW68RVvRMzgwbFRwJbU/reIXxSZ8eQjLdYF29eOgR/9d++L+SSMjh7tLqreU49kUCH6YVVog==
X-Received: by 2002:a05:6a21:2d87:b0:1e0:c954:ea7c with SMTP id adf61e73a8af0-1e0e0b16a5emr2903750637.27.1732680728655;
        Tue, 26 Nov 2024 20:12:08 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/18] ffmpeg: fix packaging examples
Date: Tue, 26 Nov 2024 20:11:31 -0800
Message-Id: <24bf3ad245fa2dba14a59477279c6db3c8bcd088.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207905

From: Martin Jansa <martin.jansa@gmail.com>

* I've noticed that ffmpeg package isn't created in my builds, due
  to --disable-programs in EXTRA_OECONF added by our .bbappend, but
  was surprised that lib32-ffmpeg is created.

* lib32-ffmpeg was created only because it contained the examples
  which are installed in /usr/share/ffmpeg even when PN is lib32-ffmpeg
  as we pass --datadir=${datadir}/ffmpeg in EXTRA_OECONF here

* --disable-programs controls ${bindir}/ffprobe ${bindir}/ffmpeg and
  ${datadir}/ffmpeg/ffprobe.xsd ${datadir}/ffmpeg/libvpx-*.ffpreset

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7bf828b6431a254201675e41047f53da47912f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index bb6b71735c..db0aa60826 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -182,6 +182,6 @@ FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
 FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
-FILES:${PN}-examples = "${datadir}/${PN}/examples"
+FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.34.1


