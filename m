Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7956BC4828A
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8485.1706323063263942056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HNv8u0oZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d75c97ea6aso7165755ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323062; x=1706927862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY9Ru4GH1g//SouIz6stYhXk3a+moxZfZR/lYzCmCPM=;
        b=HNv8u0oZWUDYjfzvRjd4VYqonRS5YNI1SzuYtI0qOfwpTKAdCjz5iDIrErHzSvqzYI
         Gi0qlIL/hdPK29IvczvzxaIRiBkva3Sio+nS+IRB3sc8qhDxAw+JStnvLjmMxTAJavXW
         6iAO9nwyznAVO0ze4X0th+EbVPF0vRh+hCLcK+7nx8r8/2IBvoMdRhBvg61TLZK4oYwu
         YVD7LUkV1fKV1wby1d/SDkw4Dh09vHDj5lMN2Kc2yUAOESzsLSPScsO5oDGvIzbNdkP6
         d8if0P/rmRreRdHXqwv/eDBFQ5tw8uxvJ+S3bh3ZSSjeE+rfAYLWciJ4Wtn1gDqgPBG8
         I42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323062; x=1706927862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wY9Ru4GH1g//SouIz6stYhXk3a+moxZfZR/lYzCmCPM=;
        b=AxmGyM/7olYW9GEILCsqjXprOQjyf1OnVZHSi4D8egMRFJK/qC4DjiPod16HmfglK8
         f4y0SwxNH+9s5zRbPqjnyjPUXqX0N+NaA/NYxVUyJ2Pv7OVwej0JnyWFhEBbXri29tlN
         a7LohxgmKqpEJKQNOst4omOJRlQs9UQfVBdg2hVrlSjqGsAuo1ytP6TtXRDp6t+KURJj
         3oblxiiRHteuIaX5KSBhH1vRWWE9ZZikhY2VXUAu6Z8wsMebsS4otNNMeNc+eclDg/5j
         QULzg2smbBPMZYox63VGlaeP+dmRyzd3nkxSTIQ6pZfRMje6ZQOk04Tm/N1a8kZlhEq+
         y8Cg==
X-Gm-Message-State: AOJu0YyV9D0TCOfBaA9jdyIamLE2Jdt+N1CdY6HAWvf3GaTX70c11826
	Tigvpot4NI+iWInzFO1udB65MyW62n4o/YD1OQfdFG7wvAUhg4EqvVVTe4HQ7lxuYR7M0qVlfJS
	cXsS5zA==
X-Google-Smtp-Source: AGHT+IEgg2O/IanW2RKNKfnX60ikKAbiBj8rY6Y3IJ3AJirL3W8Xq87nsdVYSBXawxRiYGMzEFEh6w==
X-Received: by 2002:a17:902:c112:b0:1d7:e9b:c3c with SMTP id 18-20020a170902c11200b001d70e9b0c3cmr1985164pli.2.1706323061863;
        Fri, 26 Jan 2024 18:37:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/23] libva-utils: upgrade 2.20.0 -> 2.20.1
Date: Fri, 26 Jan 2024 16:37:10 -1000
Message-Id: <3ff4aee01896dc301250d38acf0a67629d317db8.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix some coverity issues exposed in encode
-Fixed VPP coverity issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bd1443d047ba56196b2eaa7d59b3c39c9c0f49b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb} (95%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
similarity index 95%
rename from meta/recipes-graphics/libva/libva-utils_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.20.1.bb
index 2e1fd09406..3bce9a1e32 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
@@ -15,7 +15,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.20-branch;protocol=https"
-SRCREV = "0c8373e62af3e4d9a3831334c5402ad255797e67"
+SRCREV = "2ad888bb463dc9bfb3deb512ec9faf78f1d3bfa8"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.34.1


