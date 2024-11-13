Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01825D637BD
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.21887.1731530572949583284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zFsYjOYB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbcd71012so86198075ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530572; x=1732135372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3N1JL8TzDzbDwjIgBFO5eTG3MgANmaQhhf103nZq1oo=;
        b=zFsYjOYBV265vBLwxJ4O9DFvfPjXyvr6BrSID80Y8QN6Q1hde6z3zy4n5CkxppgMIl
         AkQnmElHlb0+UOF8KWw3o9p37+H9FfObbS/YNYs3oehUa00uKe9Rysz3C9xB9QobpBs9
         Mj8Zv8tuhydGdWUuXDd6DfqbeLRJKoJbx5Yja3nNIIHyVC8Ne9n9iaKwZl80TlJBVc88
         zgH/ujXpiFEq4qHEV8rP7k4VLBLqDw35/elHtvXKgjRI2jTUbZl2EcodcVlEPoOaTeGX
         +MQN0W1J5ji0Yp3TiZSuDP2Mw7SfkByjfYGtOn4Dj+edCi2GTZxRgmSAMqcs1RvDAmtf
         TrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530572; x=1732135372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N1JL8TzDzbDwjIgBFO5eTG3MgANmaQhhf103nZq1oo=;
        b=oVqjKURfZQEQqgxTZvUpC06ptp28I/FK+bf8j4F5B0jxp9hL5RsRlDZXm2tuHMucxz
         9ufhVhg9aBM4Iq2kQfgisst6IjRgN5Z3i2U8jMD7mKXCDnZ0SEJTLdkjCScn10y3ucK6
         LjCvC7Wa2bwyP4mNZBtZiFtFesbbOMJLMF/sZbcsa3pOAO8MUBRPYhQjHmuHnmBWDtHY
         m7DBpDcqq3naJCpHi2jRmP3rBCjZXndFdzohfsGKr/xF+SOgnhp0DcZCLRB5EwhueYQ8
         auqbz/WusfDxRUE1hpzyhZxzwDZeefgDf7ssKo7jeR3UwFMlYGhA+/6qEOv0rIwt53kM
         s3sQ==
X-Gm-Message-State: AOJu0YxEoZ6iZjyBIaWdv0gHIgq51Iz6iSAO1eFPos2lsim77zUkvbtR
	tx4dVCXLIskA9+NcNcpKRnPDk/81u6ah+c+yVKrY9ZQvM8+3+Z5SWxcvu3MAPQQbtIn5HaLHVIe
	z
X-Google-Smtp-Source: AGHT+IE0yE+2Jz5sUdgjCvDX6csOGEeGsGRM0F4tVJOLmXMJb05dm14QnklNNdqq/km4blAZBch/NA==
X-Received: by 2002:a17:902:ecc2:b0:20c:aa41:997a with SMTP id d9443c01a7336-2118354d664mr301967805ad.34.1731530572172;
        Wed, 13 Nov 2024 12:42:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 9/9] libxml-parser-perl: fix do_fetch error
Date: Wed, 13 Nov 2024 12:42:24 -0800
Message-Id: <c9d5a6c480c377399a7dc998f3755e42072e19a6.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207133

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: libxml-parser-perl-native-2.47-r0 do_fetch: Failed to fetch URL https://search.cpan.org/CPAN/modules/by-module/XML/XML-Parser-2.47.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index cffc133a45..803164f713 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
 
 DEPENDS += "expat"
 
-SRC_URI = "${CPAN_MIRROR}/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
            "
 
-- 
2.34.1


