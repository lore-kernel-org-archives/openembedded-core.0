Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8933C19F53
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.272.1714512285041267624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j8a3Q0AB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1eac92f7c74so50212885ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512284; x=1715117084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+sAUFp/wIyP00b4OeES4+j7CZNqX37JCfPszTHGkws=;
        b=j8a3Q0ABdhvOrTeQZviVMoD04XNeB5JY2o3dGaoYmi7DlHhLHXRESuhV6RA9bDXVdt
         LBDeAx+h/MJdxsXeEN7j8iIYUiVjma5Dy92ztCPWXX5ZFxhYQ4/Izm7Kpo+Nh03WdL04
         r+JS3cC/ZLznJUCoqDAvGcPNBkcaPyMYLrzXqHNwUx9AhOw7SKOeTeLmx7VqjC0KuydK
         bwAz2iJwTbcKjcUJec5cYVri7VP0khJfqTsDNAOPVRzWga0lhcnVsZecPqDOMd67s/HX
         e1ajDnsF1iLm7209zvdYzc5YpVDID6obtqA1OTcpLrlkNQymiOcdWBGwFOw/7tIoci2w
         7mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512284; x=1715117084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+sAUFp/wIyP00b4OeES4+j7CZNqX37JCfPszTHGkws=;
        b=qLkUrDNjR4I5mOp80vUW/LHfFVGmeXST7e6uX7qBtxA6WL8xb5GoFldgOZKlQSI2e8
         uFqtNbLRtLAw6PzXeWH85VQ53jMMwlyY8/A1C+NMgR84uGCYMw04Y264ekK0aEEPjmXZ
         pPztbdzvtwUHVy+ObsCRNhe/HZGDwRzabCJbz7HHyaMFSNgbg/c1C8U/rAl4veMO3TV1
         VRNIqX+AeR7sy3SvuVNl97xB7MKompmyp7yBF/gGbWfq7SL0jdbUT8/Av8UVqiJOCcdt
         2ut7wAXXpcqYM2qSMP9U54Do/XAdq0XTVUu7BrDU01i1hGzB3Kj265ErHzWNNHz3hENS
         Fhug==
X-Gm-Message-State: AOJu0Yw2rVhZVxP7f++x/kK/R/4YSysfTnFzFI/6lJnB9sqcI01QG4JQ
	qZUapmkefpH7PH7W5RNhZtAygl4oUiTiky7fIlwQkuTvo89U+2XGYeWuoJLUzOdFxmrbR7vD95Y
	FF20=
X-Google-Smtp-Source: AGHT+IHng7WaixxezXiTJQfp/wEkGFql9t3hmMILIIs9jqbm3cdZcRKDv0UG6wmhYSdf3irdfaL0Fg==
X-Received: by 2002:a17:902:f68e:b0:1e3:f27c:457d with SMTP id l14-20020a170902f68e00b001e3f27c457dmr575226plg.65.1714512284284;
        Tue, 30 Apr 2024 14:24:44 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/17] mpg123: upgrade 1.32.5 -> 1.32.6
Date: Tue, 30 Apr 2024 14:24:01 -0700
Message-Id: <e38a0f1a5e515651173b1aa21d38f2b3924de8b2.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198780

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- build: Detect forced 64 bit offsets on a dual-mode system that used
  to default to 32 bits and drop ambiguous suffix-less symbols in that
  case.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e76967536191ac42fdd0c016e92a273dc4908e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mpg123/{mpg123_1.32.5.bb => mpg123_1.32.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.5.bb => mpg123_1.32.6.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
index 52526471ef..f7786e8588 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "af908cdf6cdb6544b97bc706a799f79894e69468af5881bf454a0ebb9171ed63"
+SRC_URI[sha256sum] = "ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


