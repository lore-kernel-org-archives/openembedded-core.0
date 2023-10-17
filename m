Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8449CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.238785.1697568165742416996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OxeXMA8F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b709048d8eso2911964b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568165; x=1698172965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKxBJLcSPDIqiXYcS7nC6IQq+Qbe0VuPb7l1KCFaSqk=;
        b=OxeXMA8FKd8N/y8yzREOVTm5rb8syPXFb3arp31p8FDB7Jd3QFZ3shAYndBqzZDe1W
         Z7biJbkD8h7LGF2KLAyP207bGvU+YYca8+ZB3fTganfrvWpRT7M+NjRZeq8CDeZHh9Lc
         iNzXhj82Px7QjbDX0U5LLXDh6ZvdOspWgF+QqqgF6FjPcRM0aTpGS3zr/dwQt6C2+eWJ
         SeuoQa/rA9vI+aMBdWqDB8QrSHIrb7nBNdWcwS2naJazTUBXuJtlkLvALPN6BEK7t2A3
         GLhNZ9PqPY80ru7qWzgQCBlx8w+WcFE+PFbZ+jU7/k3s/vEgUaBlmMevpgs8QIBbbGCw
         BlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568165; x=1698172965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKxBJLcSPDIqiXYcS7nC6IQq+Qbe0VuPb7l1KCFaSqk=;
        b=aEvZaAdbVsgV4JLo0L4v/bYTfY8ZtHhSJJ+v6iVP3hr6hJKDizov+imG2KeJ3gBdkV
         prT0KlTiqdkOL3SZam9b9fDjlbNk0tD1Gdu859yuRauO8mlIKxjf5g1Ap7mq+kocmIIe
         NOVkFZUQdXI8+LTPhFndj5/44RuBLbfy3DZ2+7ljXtMKBhDbytVDa1d+Y660P75yL7H9
         sWP8RT8D/Y9B0F/rYqrB4gGStypQOD0QLn+BghWi+2xgjgSBAcmXJA2p8U5gtTeP8feG
         Who/zH93Mq9dKDtwk+EiknCf0uXlIE705yXrR7eSdmxMGal9LeHgMxzqWfJkd50qsV5F
         CsqA==
X-Gm-Message-State: AOJu0YwrEtErh0S4km6v59jA+vDME6cs+OVJtf/lH2zVY3bOlfV28e3v
	c9K1S00LqalMyeUSuow4yzgxY9jvhJDLaBkvdsQ=
X-Google-Smtp-Source: AGHT+IGtJTzXh4E4Zt1vlDIb+371cV+FTD1vJJG8ldubYINeYbF7BV/IWpqjHDXUSAwfjUv/w1hCEw==
X-Received: by 2002:a05:6a00:c8a:b0:693:42d2:cde0 with SMTP id a10-20020a056a000c8a00b0069342d2cde0mr3448458pfv.22.1697568164823;
        Tue, 17 Oct 2023 11:42:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/10] libwebp: Update CVE ID CVE-2023-4863
Date: Tue, 17 Oct 2023 08:42:25 -1000
Message-Id: <7dce529515baa843ba3e5c89b2ad605b9845c59b.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189355

From: Pawan <badganchipv@gmail.com>

Notice that it references different CVE id:
https://nvd.nist.gov/vuln/detail/CVE-2023-5129
which was marked as a rejected duplicate of:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
but it's the same issue. Hence update CVE ID CVE-2023-4863
to CVE-2023-5129.patch.

Signed-off-by: Pawan <badganchipv@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
index eb77e193c2..ffff068c56 100644
--- a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
@@ -12,9 +12,16 @@ codes) streams are still decodable.
 Bug: chromium:1479274
 Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
 
-CVE: CVE-2023-5129
+Notice that it references different CVE id:
+https://nvd.nist.gov/vuln/detail/CVE-2023-5129
+which was marked as a rejected duplicate of:
+https://nvd.nist.gov/vuln/detail/CVE-2023-4863
+but it's the same issue. Hence update CVE ID CVE-2023-4863
+
+CVE: CVE-2023-5129 CVE-2023-4863
 Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76]
 Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
 ---
  src/dec/vp8l_dec.c        | 46 ++++++++++---------
  src/dec/vp8li_dec.h       |  2 +-
-- 
2.34.1


