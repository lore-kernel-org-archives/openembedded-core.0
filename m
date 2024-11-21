Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3FDE64030
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.10687.1732226083055642206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U+SEpY+g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-720d5ada03cso1426236b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226082; x=1732830882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q/ifew6boFRtv/YlUG+sdLt9dG2cRxsNJy7QwA49sY=;
        b=U+SEpY+g0AwDGHtuPjd4wkF4TBBhZ5Tra46gOwEVQ8LR7n/jfryy62XhwQl0A5opxs
         T4uBxnhcAIFWj1lQD+jufhKbuRCC/RXzr+MhI2Wq4hRFrfN5VbHBTkIfq1K+83czPD2c
         A/QsAp0zrZqhFDxj0D17gSkUKEMa7/yYduexMVoriS/xkkvd7RyO5ROCDzYe/bLwfSLA
         PthT595ZkmP8Z3FdEgRmh0SASXV4aEWXwjuksHlgpUxVv2KX32TTxYLK0fEle8clWNap
         kxfXRnzL4O4aeL1L+mghreiGtKo2YOIH81iHvNDyIUMaeVuxt+ieF1Xbvv3C2a5JcVNF
         vEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226082; x=1732830882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4q/ifew6boFRtv/YlUG+sdLt9dG2cRxsNJy7QwA49sY=;
        b=tT3u7XRPaSw+tF49mXhYNr8ip19RU2bjt/yBbavMQW3+IvLSluszOGWfaOa7RilxGy
         +9RKEFQxE0FzO0cZhOp0BtBz1X9UooEI1bJoSFT+LXRUpOAZBDHGioHwqbFHoGA5yEHy
         jqiGhF4VV8kydVlkqaGM+PtYFjb96QeGfKipmTYD6P+z4nGouP5GE/+IIEiN10JM9jqV
         UvQx1B6ORU4CHMJh9xlK1AZ62lI4Y/DSNpQRahY3DQ9J+FGiV2rmugvb6xky0eS4L9N5
         djJwztqVeMo0goP33LfHHDTQ0NyLlFka2WLQgiFKlloF+XJDkGbRDZaay3sb3dtf/es2
         ZM9g==
X-Gm-Message-State: AOJu0YzC8G/xf7MBybLM3jmsJiVewJK63mUPDU1F1LODjWdtGJ/B3gl4
	BVQCl2gPZP4o6zV7Nn1YqgvRvrQ1oJatsXtg/UTD8JuG9bK/Filcf2WPC2TS6NqdFoaZzvWKhHV
	X
X-Gm-Gg: ASbGnctiWAGjdFNtrsnW56bEcIBh4LSoGtgHUqonhxUG6hO5O/E0MN4JtCZPk9v+xOa
	YGPWdQhryr/hUfDXDbGrF9nO8ddcUkI6b9p5ZIskjZSGmRO9pA1Q7djo9rZt8rFlD5/IL38lUIf
	3U7+lYILv8FCPv8wI5RiCgi2gZdMPh//6UbhbEqUBW2/Wd8bsQ2DM8OZxCRRUf7QxQRTaeLBK0d
	ZMxMsn4igJecBcNRUqflLKDSCMzlv8T7Dww71A=
X-Google-Smtp-Source: AGHT+IEZgPln74HjRJA5p0moFptlTtx9wKkmp6m7D0dj/nvEM6NjexGbv/Sslvw1dloIj9WQiKI4Ng==
X-Received: by 2002:a05:6a00:92aa:b0:71e:60fc:ad11 with SMTP id d2e1a72fcca58-724df65b9e2mr554651b3a.16.1732226082210;
        Thu, 21 Nov 2024 13:54:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/27] package_rpm: restrict rpm to 4 threads
Date: Thu, 21 Nov 2024 13:54:04 -0800
Message-Id: <e1e8f55b12b8d2596137c1aaaa294d362114c293.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207569

From: Alexander Kanavin <alex@linutronix.de>

TL;DR version:

with this, and the previous compression level changes
I am seeing drastic speedups in package_write_rpm completion times:

webkitgtk goes from 78 seconds to 37 seconds
glibc-locale goes from 399 seconds to 58 seconds (!)

The long version:

rpm uses multithreading for two purposes:

- spawning compressors (which are nowadays themselves
multi-threaded, so the feature is not as useful as it once
was)
- parallel file classification

While the former behaves well on massively parallel CPUs
(it was written and verified here :), the latter was then added
by upstream and only benchmarked on their very old, slow laptop,
apparently:
https://github.com/rpm-software-management/rpm/commit/41f0e214f2266f02d6185ba11f797716de8125d4

On anything more capable it starts showing pathologic behavior,
presumably from spawning massive amount of very short-lived threads,
and then having to synchronize them. For example classifying glibc-locale
takes
5m20s with 256 threads (default on my machine!)
1m49s with 64 threads
59s with 16 threads
48s with 8 threads

Even a more typical recipe like webkitgtk is affected:
47s with 256 threads
32s with 64 threads
27s with 16 or 8 threads

I have found that the optimal amount is actually four: this also
means that only four compressors are running at a time, but
as they're themselves using threads, and typical recipes are dominated
by just two or three large packages, this does not affect overall
completion time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9a5d04c472..6d1519a272 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -705,6 +705,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.34.1


