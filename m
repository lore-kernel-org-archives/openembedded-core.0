Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C7EC48BEC
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.4912.1708035448005407965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LK+zL93U;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33cf6266c76so813096f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035446; x=1708640246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz+Ij36rz0RUxKYzdXcOPNd9A/cwq/xRSzZzA3m5oG8=;
        b=LK+zL93U2G0taXq5SOKQw9/WcmMrYf9dXiCC52WIEVEwnZKhlWd9TTkXC6PLl4Ibae
         auj5Yh6ppxblBJZbE/JY3b2R03VU/IAxbzmF1fo9o1Gu0i5WQvHHUT6rYq/LR8Yt9jZ/
         YiS1e7he4t+oRtcFrY09WcRHzf4ZNRzuhS71Q70ICBC7KOZ7p+ef5hP6OCvd60LHCVIf
         fhAAsUKUUupNyvpCQdoICHT6O7N9FP6s5K5/fqYyA0hhLwqiqVb2A8jPBNTqu78UGf3+
         jw3Wat6vOp8/ms9yVZnP05+Yg9op1P9zCSqAZr/z1dPRGbESf5CYdUCj53M1Cy+jaYfo
         QPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035446; x=1708640246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz+Ij36rz0RUxKYzdXcOPNd9A/cwq/xRSzZzA3m5oG8=;
        b=bbz2INbY6rl7Ku4clhy27tq9bYuCeRhhmGoKSRZIr2M+DfvcW9fNPuvNwqJ1uJprC9
         SccHGZU0okxcacy6gJHk9BIqpEqg058dlZxPfT9HnW3EprdU8JawKgZ/uznbxsI+CMxM
         /Lr8pgZ2zLrBjv5pVQpFOm+Q4yZ97PuZ2aEqIQRMecttSI4MsQvw1O4KVglvdf4a4E6d
         aIn6c/yLZg+3wU94+izXNhoyZtiF04DYZN7zjHyio6NC2yG8l9mF8plctxOkQTLsGEw6
         Yl7YkS4GTkTIHOiEF0AzB7Pb4ilORMKD2r+tVG7g+xq4NGCc/ysTrvR3Oz14eBXSGsJW
         mGMA==
X-Gm-Message-State: AOJu0Yy74i0KaYub5rBYKlX2WZp3wk8UpeANJBytlPx8GpidxecrIAt2
	thVFl6mdAHXsS7YzAur9CT88bIWeaFjmDzk75/FLKcL3Kzf5U17aos7GDmjZ0Zg=
X-Google-Smtp-Source: AGHT+IELCNwAbvWIZdYE1OtyCt5tuclVV6VWDNX3352cV0MnfJqu0X7q/+Lsmdn/m+zxWdgcSHLT2A==
X-Received: by 2002:adf:a199:0:b0:33b:353f:6b8f with SMTP id u25-20020adfa199000000b0033b353f6b8fmr2246912wru.20.1708035446330;
        Thu, 15 Feb 2024 14:17:26 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:25 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 11/12] meta/recipes: python 3.12 regex
Date: Thu, 15 Feb 2024 23:13:57 +0100
Message-ID: <20240215221711.332614-12-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195722

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: f2d80817baea298b953d6e14daad65087b3b50c9

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-kernel/perf/perf/sort-pmuevents.py | 8 ++++----
 meta/recipes-rt/rt-tests/files/rt_bmark.py      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 0362f2d8fa..0a87e553ab 100755
--- a/meta/recipes-kernel/perf/perf/sort-pmuevents.py
+++ b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
@@ -36,10 +36,10 @@ with open(infile, 'r') as file:
 preamble_regex = re.compile( '^(.*?)^(struct|const struct|static struct|static const struct)', re.MULTILINE | re.DOTALL )
 
 preamble = re.search( preamble_regex, data )
-struct_block_regex = re.compile( '^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
-field_regex =  re.compile( '{.*?},', re.MULTILINE | re.DOTALL )
-cpuid_regex = re.compile( '\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
-name_regex = re.compile( '\.name = (.*?),', re.MULTILINE | re.DOTALL )
+struct_block_regex = re.compile(r'^(struct|const struct|static struct|static const struct).*?(\w+) (.*?)\[\] = {(.*?)^};', re.MULTILINE | re.DOTALL )
+field_regex =  re.compile(r'{.*?},', re.MULTILINE | re.DOTALL )
+cpuid_regex = re.compile(r'\.cpuid = (.*?),', re.MULTILINE | re.DOTALL )
+name_regex = re.compile(r'\.name = (.*?),', re.MULTILINE | re.DOTALL )
 
 # create a dictionary structure to store all the structs, their
 # types and then their fields.
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 3b84447a0f..2a4eed412f 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -265,7 +265,7 @@ cmd = ("cyclictest",
        "-d", str(interval_delta),
        "-l", str(loop_count)
        )
-rex = re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
+rex = re.compile(r"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
 def run_cyclictest_once():
         res = subprocess.check_output(cmd)
-- 
2.43.1


