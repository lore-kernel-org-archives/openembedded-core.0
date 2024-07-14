Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED797C41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:38 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.15470.1720960778400881935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zBrn4Ibj;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-376012bcc33so13846965ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960777; x=1721565577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnVRQY7Pha866IcVgYGSu0XbXsiizlwoV3eLCtrgCTU=;
        b=zBrn4IbjzdMoPdmaspxnW8JzoRHCDaBRQ4JkEVr+sCa9OWfLhPzPhr3a8wKsiq3aBE
         ivviYREGUo9w56mS2NdrtNSAVYznQ8YzqiMv1QF8Xhb/kT2a/2zSaAzRdANxqslLJmI4
         lXkjh2eGVAnB0xK0QVzl+jA2m7iy56FfJJQBNJ+zRn9cI7L47mJpkYlfU0v5ebJRGzEi
         9wEb4zIPpXex+RPqfg0495y16P/VhHXtUmkf6k/+mNp6ZUGDNHtjGDkAcDcz9WVild0X
         rEuZAmSxGcx1ODm6ULa9iiMZL3XJabFCw06DtZkKKqcVT+0Cw3L0JQSXNl8SIA4qKci0
         TW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960777; x=1721565577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnVRQY7Pha866IcVgYGSu0XbXsiizlwoV3eLCtrgCTU=;
        b=td0mA4LkfoofKOX6b5DVQbMON6L1Im0GzuFNxZ16Dl+iF+JAa9FyRpA8Mbb+vEtuyP
         25PCy4fOYjDZPWt81BqyCosWTEK8ed2+kWLjbnk4ncaLGhkeWQGxJbIrbmCNKzaEdTwE
         7HJ838ftwMK+mc7CC533IkeReoMELb9YXf5R/0g6DV5/FDVFtu2NQvzNMpiQRl+3PmPr
         rLiRndgzhSA9LaYcO5DpOHgVxx4z0lMjCBsmxY4hpKYf+2jTUkPtXGJbTzoEc6ET2wgK
         fhI6DBjEWnYI5NN7ljO8dbpxy3d5FrOK63Ny9K0LTA5KVnncZmiJ8ulROWwucT5VrxgF
         b2KA==
X-Gm-Message-State: AOJu0YwJq6zDDvS04qYQLjSdSiwSxekmlydKZpokNdqep7k9Y/XqF5au
	tjwvTYrwBLJMUhnwDhDMnIDyejRWts0ZFOYiSvD3VuU+9AnFvV1/08SaeK5wXyOWy53q8fxE5Ci
	mdIE=
X-Google-Smtp-Source: AGHT+IHJTWJpOXH7cCd7ZE9vPOr/0dU1NVydJpdVZFyVnW3vmv+Xhm8JFQRbkdRVPmwXVYAxBpLqXA==
X-Received: by 2002:a05:6e02:1c2e:b0:385:49f2:e57b with SMTP id e9e14a558f8ab-38a5a35fc8bmr178456005ab.30.1720960777423;
        Sun, 14 Jul 2024 05:39:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/27] curl: skip FTP tests in run-ptest
Date: Sun, 14 Jul 2024 05:38:46 -0700
Message-Id: <49ae51c05e470523d3b818aa5fe7b54c3274a17d.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201876

From: Ross Burton <ross.burton@arm.com>

It looks like something related to FTP in curl, be it the protocol itself
or the harness, is unstable under load.  We've been seeing random failures
in automated QA, and Debian does too.

Until this issue is resolved, disable all of the FTP tests on the hope
that this is the underlying common factor.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28035987fad5a673e35b346e043e66d04f64ef5d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
index 3d25f3d90b..579b3f4587 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -7,5 +7,7 @@ cd tests
 # Use automake-style output
 # Run four tests in parallel
 # Print log output on failure
+
 # Don't run the flaky or timing dependent tests
-./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent
+# Until https://github.com/curl/curl/issues/13350 is resolved, don't run FTP tests
+./runtests.pl -a -n -am -j4 -p !flaky !timing-dependent !FTP
-- 
2.34.1


