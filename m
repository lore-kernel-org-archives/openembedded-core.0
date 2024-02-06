Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8F9C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.24448.1707234437475561671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h2fiTGTe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso5012908a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234436; x=1707839236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgK12y/LHrEcfDcCtv13J9IIszHk4RiL4OadiwLKqf0=;
        b=h2fiTGTeUQJAWif8BBM/yZ5cTy6dIrBweZe3oXaDOHuZTEXJwKAupyOqFA5B/hWbwc
         2YjE7Paezw3Ocqm3iPZZceoyUcNOEQn7B1ASslNz/FW47HFUi6vLUUd3B2N9HBE9wRom
         5exDmZL6YB4B7GcGmt5lLEnKSaCtPBR1jppwwDAUzMhY8csvm8w04HNDTdGvt3Cpm3xO
         3ej1XzRryjRSu2LUln/Ef28QpYgFGbdUKssUvcxftElylDjpIqzVEZUsdHvjraRmt3aE
         MBItaBYymu5pFcfjKNoTk9Fw1YFzpVJu5qGE8TQFYdSWY27y92tjL7dI2yaV3X4zc3os
         /qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234436; x=1707839236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgK12y/LHrEcfDcCtv13J9IIszHk4RiL4OadiwLKqf0=;
        b=n69r9hTCdQRVladrqxkLiiNYF/OnyvErL3Qz4BjtdXylI1lOiPoFmCWs44ISF+atYu
         xQZdOJARs9rAhxALRLhb3PliacRuU4UGteCZ361W9huRgyq/w6TOKHnr+5HiFZpDe+K1
         7dp7YFo8V3x3lULj5yJbWZnFCCsnAWtCFeBckxqzXaK29cj578iGvfjzcTDxwYV4ATZY
         1d/kTixAXKnqvUTWqN/fgEqzac2VTa782p+iv5uA3aKV+6OmyJoItkMnxDq28FFGeK4I
         xTdH1NoIaJVqsSItXq9ckTZ7eGeY2rOtAnZHiPFT1lF+oAUVO6p9/cvESDFfhgq5XlZD
         MN1Q==
X-Gm-Message-State: AOJu0YwQyAMkGeimSGukO54D/R51YCRq9Eq8TnQua0IwTHkPblmW+wLR
	eMw65/oz39Irjq1XjPTfsfcODy/QgmOyVHiIWr3ec6BbsQINniWLvlXe2MzuLlJk71R3nO7a0XQ
	NbDA=
X-Google-Smtp-Source: AGHT+IFlC+XyxNU1a85lfJAli/1TzgnJoyKQSxeL85XBHsIhBXurempHQuyXz0GbfWK5OjAThOW67A==
X-Received: by 2002:a05:6a20:552a:b0:19e:31dd:3ac2 with SMTP id ko42-20020a056a20552a00b0019e31dd3ac2mr1967614pzb.10.1707234436560;
        Tue, 06 Feb 2024 07:47:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] curl: ignore CVE-2023-42915
Date: Tue,  6 Feb 2024 05:45:19 -1000
Message-Id: <2771a1248a251650f6e2e64731f56ed928c29ce5.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195000

From: Peter Marko <peter.marko@siemens.com>

This CVE reports that apple had to upgrade curl because of other
already reported CVEs:
* CVE-2023-38039: not affected, introduced in 7.84.0
* CVE-2023-38545: patch already backported
* CVE-2023-38546: patch already backported
* CVE-2023-42915: reference to itself

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 9e9ff00bf7..965f05bc98 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -60,6 +60,9 @@ SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce5
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 
+# This CVE reports that apple had to upgrade curl because of other already reported CVEs
+CVE_CHECK_IGNORE += "CVE-2023-42915"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 # Entropy source for random PACKAGECONFIG option
-- 
2.34.1


