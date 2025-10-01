Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7334CCCA471
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:18:47 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4552.1759342723994658184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 11:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KzZvyaGe;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-269639879c3so705205ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 11:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759342723; x=1759947523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HABqCBuu+9385Oae9sLSqrKGw8YwA+h33m2MJLYpS/c=;
        b=KzZvyaGeMmGKB1232/iYozM06tqkzE+MvI0Fcyszg7L2Q/pYCj8FWv5P2k/uSDLWMp
         arTk/Ho6sAhOhKbsD8HZ1D0a/4zLJ0l8baZzzTGtyRr5JnaFSuEUPGBo7dG07c5mdXT7
         6aFCOf6eQSSknFKNqqAtxEs/97iQ0KK65juQIOYOdZ/M9Goh5EY30AotWo+PiV+Rb6H6
         BdamOyM5wBM8qKXlpyvd2C5z9rZSHqTt5iUrIpHkDfT0kodE2Dip8ogka09OkrMZM9q0
         W6BwXqbk96J4JUCScQLhBGN2eqhAC4IZfTQsukjMtX66k5yjjE+gnqrbv1vSI6tOfbv1
         r6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342723; x=1759947523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HABqCBuu+9385Oae9sLSqrKGw8YwA+h33m2MJLYpS/c=;
        b=GSPcUmXlGi2az2CeQGyFcmh7R2mtW8m542O4yKHVsVEouNHx+qUSZcAJads4237r0A
         LAA4BQkL12pJGfXh9JEz84kCEvUQuCSX+fD5gi2O/l1uPjhrA02QyRoBga1qc6/n8HKI
         E3EkFKAvmerRsVVPb7RzFSrWqSJmq5yeie7HR8Wl90ra9SntlWh4K2t0GcoCfYpYL69V
         F+QxSH9RO7DfDmhJ8jYjvEr5h6gvo4ceBWkBCy/yg/ZL4n91bcu7MDABNbk4GkJfNNuB
         bzzlV50Tr8g8tOmSAx2adqrpI7C2dAUKaCPH52P3wzbZ5OWCzEmFT97dFIc5CmGiIaQs
         +DeA==
X-Gm-Message-State: AOJu0Yx6Nm6LUgfsVqXFsPpQQaMObE94Psueh34VZJstHoduduum8YsE
	TryrC9ESWVky131KRvisHQBF55HU5Kh7QfKTrrWNxVVdK8x/A6a9m+0knvAr9Epf
X-Gm-Gg: ASbGncvGO3GVPvFvkad8hxP7898XHvTtp0mqJ9PLeFZZxf7UNAzxl/sDyNNHbm7Ycq8
	PRa1Y466A594uzenMUe8Q81WxVVnXvK+wn9PNGAFi1sHXe0+Br7lw88/njJfZv/ZFddjWcfD1+a
	7Aqscke1XR9p6FjcZ0WWNv+RfmstqCSC4ci0cAXJ6+5zjxHLF/+auFmC6qmOGu49SdLa6YwrgwT
	+ICiiIrlZF60WOBkiHvWisz6OmUzwfIbeVohBEmwIO3bcHT72EtUGTe76lF0Yml37dhY1tCHaMu
	mZuAUY68x70o8sgrKDSYTEsi1xC/lBk23olAKQZaLu7SonMvKe6hHOM0VmafMLGsBY5FxAqdNNr
	MD1yhqenUX/jmWKEu/KGixxXLJhvF+6kqQyYTJSVodctAMWWm96eWyDwz/ErVzk8+xI2Uo/6x7O
	ZGBQHMbcI0ObMjG59NqOpuZ0lSBYG7cR2bjjTAN21qK6InxCD+xNOU8qamiGKyIrVVzQYTSvmaV
	R8=
X-Google-Smtp-Source: AGHT+IHnCw/z/1yr0eM3Jr53mrwlfcJv2tO6cxwnEB2pMWYXp+NxtJV5tP3CovdGmpbJJUvmDbO28w==
X-Received: by 2002:a17:902:ebc2:b0:262:9c4:5470 with SMTP id d9443c01a7336-28e7f2ef23cmr53497155ad.28.1759342723096;
        Wed, 01 Oct 2025 11:18:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d851])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d135d71sm2683895ad.58.2025.10.01.11.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:18:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3-lxml: upgrade 6.0.1 -> 6.0.2
Date: Wed,  1 Oct 2025 11:18:39 -0700
Message-ID: <20251001181839.1618366-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001181839.1618366-1-raj.khem@gmail.com>
References: <20251001181839.1618366-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 18:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224320

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-lxml_6.0.1.bb => python3-lxml_6.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.1.bb => python3-lxml_6.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.1.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.2.bb
index 5d76641675c..876fda93b63 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690"
+SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

