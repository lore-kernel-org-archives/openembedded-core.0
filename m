Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE0C77B6C
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 21:41:15 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2427.1681335669302903778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 14:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aaBxT4pc;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5138d57e20aso908219a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 14:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681335668; x=1683927668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olVqWyjMdfryLJdTZN6Pph17VhDqMSFiYh0iUvXKvMQ=;
        b=aaBxT4pc8bDb++dpjVXiJGHOq3PgtwL3ttOXkGIrd8U2Y0H6JqfNVgJTmsiMJP8g2r
         Mq1aGBThOxqTE2TJ/5TuGEcbYQKm7fkYsZ5LmW9tFJbUK6o6ORe3ccSQuMcWB/0rzzPX
         +SwU5tMqiJwQXYUXyST+tJStqKJdm++UcIazlwrhrnosrrlGFLoVKUgMGwi0uzOq5wwR
         dfasqZhuAH5LK3hfropFLx8dkcmuU5jY5eGC3UZUuMFxxG7A8rXTaVgSmFhsPs6Ts6HK
         E5Fp7lx7ZbHVNr3u5XVW5HKY0I6zlZyGQSeNZxTvcnRJbWDSpJN/efq5Bl+XmkDZfx1e
         WdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681335668; x=1683927668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olVqWyjMdfryLJdTZN6Pph17VhDqMSFiYh0iUvXKvMQ=;
        b=KObY9rkeU1Te91RLF+9P8uboK7xj4wWJ/7LDE7Kzoa+WtpVNkVHywhYS+vwvFQERqL
         0z7VzOVPbH9SJlDkrWabz+ZdNu+MOHO9xHP29MOiFy1wgt415r666t9vvodGIfeJeB/c
         dG9iEuynhLoBmFVeWQq7R1noGRJYjVwZImtUYNAmTj3zJup4rKnV4EYGIF78wtU9+37r
         s0PmCoQOpUmRD/7M3izEuE9o7cMVnrzd6vCzSjTusnSP57YMRZk5JYTkFku6j3EWwND1
         8ZP8Pz16KDXhvbtizdIdXWhQI9BV+gUQZvoPo0QmLUAXD0FcNNB79rZWdXKSEPeUH7eh
         LoHQ==
X-Gm-Message-State: AAQBX9ddcOj+UYYyYH70ViBAqoUxBAG7+kl+waR3elDptXqO3yjhGsCd
	B2asqu9cGo1kBeRyF4J8x7UlhMfraUE=
X-Google-Smtp-Source: AKy350Z1IrcRVMdzcSthMsEbCdkOCEBr8SDHlzpqOiuF5kODvmf8F1paMfvrR4FEb8+kadpsl6neBg==
X-Received: by 2002:a05:6a00:1acd:b0:635:a4fb:35e2 with SMTP id f13-20020a056a001acd00b00635a4fb35e2mr540071pfv.3.1681335667952;
        Wed, 12 Apr 2023 14:41:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::8193])
        by smtp.gmail.com with ESMTPSA id l8-20020a62be08000000b0062d945e416esm12095322pff.160.2023.04.12.14.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:41:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH 3/3] Revert "site: merged common-glibc from OE"
Date: Wed, 12 Apr 2023 14:41:02 -0700
Message-Id: <20230412214102.551761-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412214102.551761-1-raj.khem@gmail.com>
References: <20230412214102.551761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 21:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179954

This reverts commit a2f942c22e31fe15fef1b44a0e5cc548a60d43a6.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-glibc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 7ba91e03c0..958699b143 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -12,7 +12,6 @@ ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
-- 
2.40.0


