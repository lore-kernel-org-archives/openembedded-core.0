Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780C7FD530A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:39:54 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104794.1772221187309177382
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 11:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vu2a8UTf;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358fb86de36so2105900a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772221186; x=1772825986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmlylQLqJnS9A37tn8lIGBaOn7q/mCRKmbhXQvFGBV0=;
        b=Vu2a8UTfkeS6onQNd7w90OpF3QQ21rKBgSqhNZ4hLgC/urFfMPp9x94JH39Mm9CnMe
         SuMCoS5Z7KMda00Gelg4Kb6Hzq9BSMRymM6tRehVAqVsIqWjCYwz/zJ4S7sSNxGhk+hT
         1lxTR/wXiYCKR8WhZ9is6fjnBDCiQwfBsnWJHFxUTEm67fAsJCNN6zDj0snkX98O4mjm
         vsgSjQjFjjhZAjoW1tl0g0HzK/rLG4wK8p7NlgjCnIXaf+VtRM9YSoZ/pZOPtTkgNh/M
         AXqawdqRDgSmOi83Pv3L7b1C5Z6EJW4/rpCxtaUHooWlQMiNIu47Gm3CYTzSbS12LrY/
         04Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221186; x=1772825986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmlylQLqJnS9A37tn8lIGBaOn7q/mCRKmbhXQvFGBV0=;
        b=OMs7dnWWK5utZrWWpgCuoBdbYHsNAkRVmjaC3MBf3PjvGe37RJxTdmU2ycuvu4DhsK
         sMY3qhv0z+T9Zzy0MZEmab1BGvKs2A1OZWapML9bwBv6vJKffo+XLdOv6DWxwOvV9+3I
         meFxSvizpcC8kmA+8uGL3lf0iDcF86H90t6cv1B0rH0lon81QOOlxXekHsQ1jXoRXl+D
         A18xKqiYGma9Pw8KW7hT2Nk6d6kNIYOGKdBWZDrPRk07jEf0GizVw+FuJ4GMLaePIKRk
         gyvy61Bgri9atnMxU86DlbTu5UlIF2faChh6k9op7HROLUH/YCC7Kh8ChO2KQZ/TcuMn
         PylA==
X-Gm-Message-State: AOJu0Yxcd9hSkRP2bGMHZls3w6sahoZbbZZnxIFAobbYKkx6B/jffbIM
	FVdfVi+Xk8J9e1qqGFZyHNwfy/XlMEIBTq3Far3/9SQ7GxJQcrIPxRi2dWh50A==
X-Gm-Gg: ATEYQzziR5LwslY7DjQz5Q81660zn2Jp3LHqnoPzYefPPgfmjijIQ9EjTgRUzRtVDNf
	aMzHqUWiz7KcrbRXF9A6FBJhXT8s1GJ0UH0sLj5mqdneeFxwFF7ntKp/+SxQ2Z7uYw6YRJBF+4s
	AI9I5M+lk8w88oe/7BT+L8kxvuR2ZFgwkoxKbyU2zAWRiHIbSFIZZhNemMnElqvdqB95IhKqo5r
	fz7mfIe2H9eyiPOSv1i/BTrnoT/Uf0TJtmxw3zlwgBTFhzlbCC4lKViy7EyPPkOjnLWwD6imBso
	4xzvaRFWaBeDsEK0nZhu1StbO8tXZI9LKYQhZZXIvAVJuVuvlXd+xc8/kxqupZIuM9kGRfV4Pmo
	ufyZB2ZklRKwEcmaBYhfATWL+FUEVLJyHtFgH5j9usg0Mxnm68R6TQJ2ZTaTqdwXsx6DUHo0iEn
	lvfvPeqyrOOIEGhkgNFlrGhLOHwl/w+23XYEusRGAMy3a3T6VF0MhYqvVfACp5MvdXc6o3pntZv
	7rlk0LF8qD+rtV3XbN/Hg==
X-Received: by 2002:a17:90b:560e:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35965c4966bmr3540912a91.8.1772221185795;
        Fri, 27 Feb 2026 11:39:45 -0800 (PST)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5866738a91.8.2026.02.27.11.39.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 11:39:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] testimage.bbclass: enable PTEST_RUNNER_TIMEOUT variable
Date: Fri, 27 Feb 2026 11:39:30 -0800
Message-ID: <592c889bc58a0d2b99ce4669d927fc59886b760a.1772220652.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1772220652.git.tim.orling@konsulko.com>
References: <cover.1772220652.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 19:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232114

QB_MEM works in recipe scope because testimage.bbclass reads it from the
current recipe datastore (d) at test time via the qemuboot.conf mechanism.
PTEST_RUNNER_TIMEOUT was only available through testdata.json (written
during image build via export2json). The testimage task reads td from the
potentially stale testdata.json, and PTEST_RUNNER_TIMEOUT was never
refreshed from the live recipe context.

[YOCTO #16163]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 7a48ed6bfe3..9902b8a5682 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -112,7 +112,9 @@ TESTIMAGELOCK:qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
-TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME IMAGE_NAME"
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME IMAGE_NAME PTEST_RUNNER_TIMEOUT"
+
+PTEST_RUNNER_TIMEOUT ?= "450"
 
 testimage_dump_monitor () {
     query-status
-- 
2.50.1 (Apple Git-155)


