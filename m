Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0C5CEACF5
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.6929.1727874787213374517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k1N7qMRT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso2564563a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874786; x=1728479586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUKWSMXfsKdXI0TrCfhyWSzbC/n8WtSsBW+04HnAtRE=;
        b=k1N7qMRTgR5/IV+pdWurnJ+k7BzzFcjFM11YgtEHMMYIrxDvnbs2IXNyBCd0PFePu1
         AzBQTgbwyBHckTzJ8unLosSRrZd1wur+bxLQas6degKBN8zh4nffHIfTj9yPGmZ0gm31
         0TMDlguhyUb3JyjmswjQIkmtgUZjVf0jP3oVn1OZT/xMHneBqApNSVUxsKD6s8iCDGX3
         KPrqRu9nIfgAtsSI2Olw4NTpHmx2oeQYkheSXIQDcjHA46zblaPIQEjbHvgWO5VeFhOd
         DKNj5vJoIslX5qw+K1teJADyfzsGhy2OlnuHnfzT5x3OOI+CTr0WM2PlwlFFIdoyLOxL
         F2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874786; x=1728479586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUKWSMXfsKdXI0TrCfhyWSzbC/n8WtSsBW+04HnAtRE=;
        b=XEbykQFFCL5FbMx9lbx3mB2WH3HpdkZKJUrd45zm1Qrbf5A8H9hKI0Vrfs25AYxeAa
         JfpdM0wAwby1Gm3J3KuJHlfCbj28K30JZxF2kr4tuq1NMMYM0PZcAO9SCV7ewdBc69uH
         7JUFMZXkkj6myM1lt6hvopIcwLnPH8VvjbSVrzwqoq1xWU3X5a5kUdjOyIBagVtArPdG
         Sg3s+5gHRLl1FzJI4/C3lHs8XHoJVrdJ/MIypFd79ME/MzDeISEq4FDxYcx8/4yp3F6I
         hlLQrKaxVigA1vz+lgabULuTcoym4Y3zi+Z1G+csaJvvmjdQK1FTV7Ug7mkLKY9Rzv5j
         qinA==
X-Gm-Message-State: AOJu0YxJjHG/53YdDyFyyDv32tu5zOD6vIKQEZWkxXCTIQx6BKzabg/Z
	OLDlzAWWPdSUIoYXSb1+WlX6ZvmxDwzjJbh0KpRg4PPUY56EgfRQDrezqOibbkXmp9bysO0rUSG
	BrVA=
X-Google-Smtp-Source: AGHT+IFtnEG1vVggX3++0OL8u897to+40XyVvCqWh/Lw7etyeDyklQ+zaPQWwc5Xpv+AM+7bNWoxWA==
X-Received: by 2002:a05:6a20:c6c1:b0:1d4:fc15:ac4e with SMTP id adf61e73a8af0-1d5db1615d3mr4837248637.5.1727874786421;
        Wed, 02 Oct 2024 06:13:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] gnupg: Document CVE-2022-3219 and mark wontfix
Date: Wed,  2 Oct 2024 06:12:42 -0700
Message-Id: <fe094c2d50ffe11627efa6c0807a289c1ee6eb74.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205186

From: Peter Marko <peter.marko@siemens.com>

(From OE-Core rev: f10f9c3a8d2c17d5a6c3f0b00749e5b34a66e090)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index da2b1c4deb..7a29a5659a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -85,3 +85,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 lcl_maybe_fortify:mipsarch = ""
 
+# upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
+CVE_CHECK_IGNORE += "CVE-2022-3219"
-- 
2.34.1


