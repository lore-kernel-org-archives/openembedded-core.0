Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F25CF536E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7914.1729686905879931981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dk72cBvA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208cf673b8dso65503475ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686905; x=1730291705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mt+bcng0QX2tfNk3yA4jgPXKm46KOuemdRJZyXzcnuA=;
        b=Dk72cBvAAEBJjip59dG1VtQV5JUIdmaUyt2mS/H5W3M18NrYOer1srxFhUeTwT7gRf
         SfDBIHb7G8an+J194NUaj7yasX/zsUtUXRJLpiEKEUUfCMW7TB/+CxD1/al5L+XTt5KX
         em2oQY2QnXxbwlzdJZUKhkT99GxHIZz1dAwyiEYxqIEW6TvJmyVqdyLaC0qfrrHzQ0fn
         7OzQoa2cWJr5OYyR5qMqZE1izntwXvsCZ9us8LLU5IGiRe2WV3yfC1XiH9NL2U7lE8uD
         hWkKw7EQ6HRDzGGJPUR7Gv0FENkSCz1chKSyCR5wR9mAuCyKOIrvJFO28IJtXAtOyfTD
         Qv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686905; x=1730291705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mt+bcng0QX2tfNk3yA4jgPXKm46KOuemdRJZyXzcnuA=;
        b=oqAnMF1HAC3ami0NClCVjX0srHkmMyEsB+OEegdAOW2nq0G8Jt8Elg8/gRAcY/00R0
         PbCZEKdtA3R/4i9yIPb44r5aWcjrspBlwFO8VdhAWufeJQLMrzTUjAZjdsn6+Apfey48
         F0ZnpBXM99N2ot1j5T7cYJZymBrMTclcOz/QBd4N/vBXBGbRkaZPCqvRWyeypTzQFfZl
         kEtwo0rW0xRjPVj+ZXANqnxKLmwX3G97mmxTqy8LzZrgS8NOrtjfFiGfcRudHfGyOwGN
         4i+mjFXK6Sj/mTEvJdxmlD4JGx0+U2F/IArVCBS5P1xEPIgd+x7VpgciTuM+AkYy1/Yr
         FSpw==
X-Gm-Message-State: AOJu0YxrafVtJ8Z8QIcpjFUbqPuO8Zo2qA3vp+sH8oU867Hspm5Esegk
	OhEkd7xpIkKSOBuD1em6GuUIj5+kJnbr3wR4uVRnxRWo+dgN/VXvVggMdU3WYppJORCArKfDNXH
	o
X-Google-Smtp-Source: AGHT+IFgoe3ce2WWdsKhDIOewrUTfB91YDVe64HgHedLa3+Ntb8cTv03EoBS3AY9U7cQEVwoldm2UQ==
X-Received: by 2002:a17:902:e5c9:b0:20c:be0e:d47e with SMTP id d9443c01a7336-20fab2e2b06mr27838855ad.56.1729686905141;
        Wed, 23 Oct 2024 05:35:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 13/27] libevdev: upgrade 1.13.2 -> 1.13.3
Date: Wed, 23 Oct 2024 05:34:21 -0700
Message-Id: <1a364569ca82adf39d2b5c44e8666e64d281d51a.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206224

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 include: sync event codes with kernel 6.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c0167807a9c681b24f3025e6e762df1b3c97157)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.2.bb b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.3.bb
index fd2bfdad9b..b920b349cf 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3eca86a6ce55b81d5bce910637fc451c8bbe373b1f9698f375c7f1ad0de3ac48"
+SRC_URI[sha256sum] = "abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


