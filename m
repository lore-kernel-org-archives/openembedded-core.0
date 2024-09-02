Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB834CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 16:29:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3166.1725294565094925204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 09:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyZloGB+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c1120a32so1296951f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725294563; x=1725899363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDm1xn6MCkylgw6KAnPPmmpK19X10FxQlrFD5ivQLOE=;
        b=dyZloGB+0j5Nn0Lw1sdA9x4CXDWA4WrM4rfFiMyaqt4XF0gcAy97DpjhrW9yj8TVQj
         lVgqAoQOouLrW4qoEujRxjwcmN2d3EdQJaA1zVc01O3YEo/GBlEyYvmiaBSG3qj7752N
         3sXOMnesNxPf97HSZs7xNRaRe48D6+l+JH8FHdiy4cLy4zbTHkilfxJoD/pIhm26X8Ve
         U7MjNb8O1knRE/e2Ry/ce73NinDpASYgCo+YtKWxbNVj2W36GZiJIMoYIcerKh7XEnS1
         KONft6cpOBom1owD3iTkpEreHvKHDiNaPtQtBvHmpZT777CMcrkJYnPiY4/Aeg9tsxhX
         6aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294563; x=1725899363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDm1xn6MCkylgw6KAnPPmmpK19X10FxQlrFD5ivQLOE=;
        b=ImZeD/ET1YAO31TW0RVXGB/SmqFltARysBMeCG5QQUDZzay6NEupNwxUEluu4zykyF
         u+zvCEaFlZwoZW/KBmjfaiQyUVQ4PaVDeLnbtBzlX4edOTsyUmvoL0fSIsiYkgzRVGvc
         wgrpjaJliZ5JBhy/bu0UhEwwlQyg1WOmiLma6723aoJ31DCf0z9WaweeRBNNWqew+tSz
         9BVfnBI8nUW6eiuE9oanr3S01cm/7pmRtDrOrWXNuwVaz8OxyF5L9RpT+G4feIfc364p
         VrtCbW4GToUDHEnKVsHmIhiifh7vAr9+B/BmFbbPAwk8mgThUklv4POd4Ad+duSxiXTL
         7qzg==
X-Gm-Message-State: AOJu0Yz5iwMyL0RkxLgy2xUiUx9RgAld1wpOqOpde1qY9YUZ3ffstCsg
	/TcpGRtJC1TxnXsopTuKtJ+Wzvj0YE9+qOOz/pYWXvOjQyeZ6nCJcpkrgA==
X-Google-Smtp-Source: AGHT+IE/QY6Ed0opawwNQGoDh2ZFzvMH9MhXKMCjHUL+jRsdUWnxcyNBcqcImkA5WTNrQgk7gksGMw==
X-Received: by 2002:adf:f206:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-374bcfe5bd4mr5116523f8f.46.1725294562663;
        Mon, 02 Sep 2024 09:29:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm160440545e9.37.2024.09.02.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:29:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH] bitbake.conf: DEBUG_PREFIX_MAP: move STAGING_DIR_NATIVE before STAGING_DIR_HOST
Date: Mon,  2 Sep 2024 18:29:19 +0200
Message-ID: <20240902162919.1285067-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 16:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204110

* and add -fmacro-prefix-map as well

* the default STAGING_DIR_NATIVE starts with STAGING_DIR_HOST and the
  only difference is '-native' suffix at the end

* this can lead into replacing STAGING_DIR_NATIVE path with just -native
  if STAGING_DIR_HOST is listed in DEBUG_PREFIX_MAP before STAGING_DIR_NATIVE

* I've noticed this by accident in python3-matplotlib where buildpaths
  QA warning was triggered only for lib32-python3-matplotlib and it was
  because pybind11 path to STAGING_DIR_NATIVE was mapped to only
  '-native/<path>' in python3-matplotlib build (which doesn't trigger
  buildpaths QA and lib32-python3-matplotlib the macro path wasn't
  replaced at all, because of 'lib32-' prefix in:
  -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
  -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot= \
  -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native= \

* more details in meta-python fix for lib32-python3-matplotlib:
  https://lists.openembedded.org/g/openembedded-devel/message/112074

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
Sending as RFC, because I haven't build whole world with this
and there might be better way to do this or more buildpaths
issues triggered by this than fixed

 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d8252c5b82..ad152ffb6a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -653,9 +653,10 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
  -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
  -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+ -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-- 
2.46.0


