Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A34C54E49
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.507.1708544452019752930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FbB5UX19;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4127855308bso6106425e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544450; x=1709149250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz+Ij36rz0RUxKYzdXcOPNd9A/cwq/xRSzZzA3m5oG8=;
        b=FbB5UX19Nc7+SRlALcK6EtUVXBsXZXnwNm1XXdE/6O+OIy7+zS7+gyg2v4mQpsR2O0
         xacG/57p1bxOYoJsJzvK9j6Oa8wJONyW/yT93z2v+MLJ6dnaMxz2ZPhUlrVNsGoEJvgt
         pobc7h6GZc7vkS2yzWorJ8CFNeK2RsZZLqMwfqHRMTIvumX9Ed2qbS9NwpRAAnCDcsdS
         Z3A31IiiXH+fxyKgyapLyRb1iFyA51N4C2zv2wAH+CBs6ZCzBSxP5zF6PDXZqx9HZcHw
         efyqDVnUk0IGk0S3U/2MNgt7Y++opD4Fm5FYFtDq5jcfpZvLmM39TI7BgSty9+h9LCzA
         lGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544450; x=1709149250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz+Ij36rz0RUxKYzdXcOPNd9A/cwq/xRSzZzA3m5oG8=;
        b=jfoZRyPKDQKLS/q5OZoWT/9oFd8LN7si+RAbAxSpakvTN2BneRmuIIQgkpI21FWRq3
         Nq66T8HjU6JcyJc6K5RDa/ps6d3O9IqhrYGGMH6RKhZLZcoR8rzH3VBi51oKMLqQqEP0
         EVzLQ1wLZZH8jUdA+FNvWuqt225e4etatIxxMbYue3VpU7mls8IjaVn7/kO7aMczXDFn
         mw40QJOISY9m+BaahVlkBZ+CTXp6b7VZvp6Pbm8gjAc9ufws4NnGXq+Re7Rq5CrZMKLe
         hedv7SuV7YIuVn2aHR+9lbTA2CYooySHIdbQHTv0suW2X3CmUVhTKeFAkBiVzDvHESbK
         dOCg==
X-Gm-Message-State: AOJu0Yx4f82wOid+fkdcMWXJbzXv3kZC4nPGCToTlh5ChohLLUSZ5hJ6
	g1QCZ49OuDwrQIPNcHR/kbyCLYjZLPrU5jzfc3G3w03IE+HKNuokjbOg2oRd
X-Google-Smtp-Source: AGHT+IGFzhUbR/+2D74EKQrs0z/hcPyDyPZXJ+0B0KgattR3GgMiv/coJzwS6ojZyvGTLyZt6uP7FQ==
X-Received: by 2002:a05:6000:184f:b0:33d:31dc:c109 with SMTP id c15-20020a056000184f00b0033d31dcc109mr10201931wri.50.1708544450258;
        Wed, 21 Feb 2024 11:40:50 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 12/13] meta/recipes: python 3.12 regex
Date: Wed, 21 Feb 2024 20:37:04 +0100
Message-ID: <20240221194036.1804463-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195996

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


