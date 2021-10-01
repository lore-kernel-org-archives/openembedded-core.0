Return-Path: <champagne.guillaume.c@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA3BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 18:04:42 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.1059.1633111481050080513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 11:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YFe9MAPO;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id cv2so6079982qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exG6LpYxctJ0wwhW8kvI9ZKGl6dWZBONg5QnG8iDQn8=;
        b=YFe9MAPOMAN7oyBRxcyHBYoUnQiHJn73mCwTvITJCwEt7661EiE6VCDCQoGYqOx6ox
         xZYYNtij2XHqG0xxscmV1UVEgB7lzGrqqIJVTSCcdelY4UBK7OmJ/D/8ICQeDAi5oM2g
         NGjGg0iP87drVNhFWXo70PwuSQihaTJcjfwAv0thewMefaMElvByt31LjmdKRhiHEfqp
         WWvjl/VTlOqeyOmN3+NHL37HNhQhaoyEcQyVZik+P346zPogf2Wncu3HI5+hD3mWPhKK
         5c+wgVmwT0INTcHLCbxZHSiZ92aJWWRLr29m6Iy4z3A/PSEYyfiAyR1x4NUCClihJGFz
         fsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exG6LpYxctJ0wwhW8kvI9ZKGl6dWZBONg5QnG8iDQn8=;
        b=sU1dYKJAgnhL/qSoBc9kYLSY1YQNpJM8oC0Hszfbsuk5BEFF7SnT3borGG1R2mI6ni
         ACg+72HGsB0W2ESC/PzlgZGqmaS2NnZ1EowxdKa95J2MVEjbaaeBwYeszXN2Y2DAwDo9
         QZSHLaeA/hh8Caiy4Y6dhokYFl5sjCk6ratZsW+cWwPck+JIR/XV4n9O/TKhMCrerpIE
         Cpgn+2l2FgQ5s4F3OAAYO8iWvSUiChlI6qawTt0IuU/R7M/t7brd7LaRg42aPBNf+dh6
         91Byx6uTOYjy9fY0luZJLBQJMOqe8JQxeb8QTh4gmZ1idNcelt2vKUXniNSgj0nWVrEE
         LM0g==
X-Gm-Message-State: AOAM532d7iphan+ub8RGxlidVvjTmQl73ahy3BrBoYPkZ+9S8DvxiSc5
	Ugy+OxdjtQ4WPcqdd+7oqqwmcj+lY9E=
X-Google-Smtp-Source: 
 ABdhPJxtTP2yt4I/Az6qOToZ882f1fwCqEoHZg38mTmPhLsmesGJdq6krEpMxH7yx/0xvFcs+d4o4Q==
X-Received: by 2002:ad4:5aa4:: with SMTP id u4mr10487083qvg.62.1633111480074;
        Fri, 01 Oct 2021 11:04:40 -0700 (PDT)
Received: from gchdesk.Sonatest.net
 (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
 [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id
 a22sm3337691qkh.47.2021.10.01.11.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 11:04:39 -0700 (PDT)
From: Guillaume Champagne <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH 1/1] binutils: use perlnative for pod2man
Date: Fri,  1 Oct 2021 14:04:29 -0400
Message-Id: <20211001180429.6069-2-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
References: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 18:04:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156531

binutils uses pod2man in its makefile, leading to "pod2man: command not
found" errors when unavailable. Make it available by inheriting
pernaltive.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 2f65ae5474..6140ceaf7e 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -13,7 +13,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
 
-inherit autotools gettext multilib_header pkgconfig texinfo
+inherit autotools gettext multilib_header pkgconfig texinfo perlnative
 
 FILES:${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
-- 
2.20.1


