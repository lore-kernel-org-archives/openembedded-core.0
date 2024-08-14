Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2732C531DF
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.96184.1723636942838481289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tV7pDHba;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-710cad5778fso5276382b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636942; x=1724241742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7X5+twBMDBYsKvHS+pd9Hq1EKh1ZhSmMyeGc7bBt7c=;
        b=tV7pDHbaPtkrk0VqZ1HhuZiqfVjPfmI6W1EuKdLB4InCj4m1xpi6Z87AlN6uxzeNRI
         G4yDpHJELPcUq0szNVEykA9McoDgPOaDeahWI8Q7OuMeWeGK6HKY6yniBEik938PNl9J
         Ehzsk4Kj4irPg5S75o+Ym8MjVi5BuHeXqm8WMLLc5kuL8SScBxbRt70HfeF20jVx7Pu7
         jnNAfLruejOf48YaeUq+r1b5zDTHk7wMS+BMn3S11hld2wEeeAtxJ2X2dhLjw3wap0Nz
         j/JSQtvt7tY+UvfgWSsIeKpVwD8Ksx64sz7SESKw/MGFf++dRqtpjqi3EZ/XY6v3R+7a
         bSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636942; x=1724241742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7X5+twBMDBYsKvHS+pd9Hq1EKh1ZhSmMyeGc7bBt7c=;
        b=ZuHZ5KriqhepTVDcGQhRSV3ikZtTgtuxk4fMieIlwiY8kGQ3W1nMn1n4KkL8zKnJ9M
         tMZ6jYQkBqPxBu9OKL84OEnW7Pb6ss/Bs0WiqloNcjJtefD5iH66qc9UrQTmNHQKW9LW
         UT++hJqN9ooATOSHIOeadITWDq1qO2EttzhlMTE+gaNLeaps49bzvyCbMXoATujEBo0t
         +h7OqPcRgr8ayH29bW3LsgLKA0Kfh5gmJmRLAC2EYa7ZbKFBJ0jFy7+WqYTq/6fnf9i3
         Q+nVLlG+1O+W5TkH/377Lg42t84n34lRud2OSVYNcrL3eAalEJuybppYJoBnCEloubp6
         TxHw==
X-Gm-Message-State: AOJu0Yxn2cJr9jnGQQLvaA6l3sJwak4GtZk8HgoC0Wa7j0WrUiBSSEpX
	G/4QIlbUcZWWKW+Mzei1ph0j3VINep3PbO+JzpleeJrwK5R6eWWl6+MqFKWVHbH9BDr1oPB37uA
	GSrY=
X-Google-Smtp-Source: AGHT+IEYf9otxgtsYPJpOCBcjNhDTwFSGIBIib2htmbkTXOS/mZgXcCZCDUPKzYaTvrnwh+E5+3q1g==
X-Received: by 2002:a05:6a21:b85:b0:1c4:aedd:7b97 with SMTP id adf61e73a8af0-1c8eae97e74mr3206161637.32.1723636941657;
        Wed, 14 Aug 2024 05:02:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/9] libyaml: ignore CVE-2024-35326
Date: Wed, 14 Aug 2024 05:02:02 -0700
Message-Id: <63445474e797967578f5e9dc9eff3642ebe44712.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203313

From: Peter Marko <peter.marko@siemens.com>

This is the same problem as already ignored CVE-2024-35328.
See laso this comment in addition:
https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 1c6a5fcb45..334d9113d2 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


