Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9374C48BC0
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.13259.1707571064414052640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/2/eQNZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51165a488baso2411117e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571062; x=1708175862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oEVpXRvt6Rc5UK+ZMYfcRJ5rmTXM0d0YCUFpGkI/50=;
        b=I/2/eQNZDg5hw/n/hyxHV6Bo8duLygPPo4Fm5Xwg/h5G7UzGV5Vtp9qBiviKMi5Q9E
         FwhiUAgHktFzfQZlo+EdVa9BjPBcsTW/EN5bZwHdOgNCdxf6Awp4KyF6zc9jo9P49+uW
         GgyrptNSmSRErquWtRaszrrvjugUbepRSv4yh4nuxfVi6fWAwJxpTLuKDdQhwTJtD3mU
         8FeEeaFWzT2HSEAEJ6cC9/vP24Ysg+1+e/71hglC6fEMPOG8vHmhxlTd5wAY6jKCICB0
         op5+pfBfno3Rdw4VNeyrw1YdNO21eKekP2YKVwTwKNnZGoatHNQoNMSan1BBs6DNOqFp
         iMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571062; x=1708175862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oEVpXRvt6Rc5UK+ZMYfcRJ5rmTXM0d0YCUFpGkI/50=;
        b=OEKJ2/pwKCvELn6Y8pwXIUozG4jtI4I5S8HvGg2CkKFTNHiwAmoj5lNt2QbP3k1lbA
         JMEFWN3JpVV1LN2eq9UAauZ80jejVKNPEL2dbgJ2M4PlNhVRN9KtZf46eJ8SU9/9VmEE
         R8THjyP//nuBoLi/cNA1o+UHvqt8bts9pY0jT1NGSLsu51S7zfBszdn4HbGHXjEM1pZC
         c0Lus9kTjLOKocatIAt7NwMhpFpu6XE2tfl8L6dp+D0Pj0wuMSg4iS0QNPn7UKDbvcUZ
         ck3wiQW8YrSC9ywsNFQqj1sSuWXhMmzE44HgmKnTaom9qmv5765EHEYUGx4pDBFwE5WG
         Ihzg==
X-Gm-Message-State: AOJu0Yx3llC09IBg2Vw/aGmXyOhGoqPa9z31eb0c3r2JZTdpBBoum1Ow
	F9HzHFeutRfAuz09xZbBGnEpj+tuWauvF72hP0vp35ZhD24plkjCkyAGpURa
X-Google-Smtp-Source: AGHT+IFK5tt4sp31Dmn/Gkjh1/5DTDHsNfnyAtT73mE37hGqs7NlyF2vm0NK9d95Km6JcHs7udgefQ==
X-Received: by 2002:a19:6501:0:b0:511:636f:ac29 with SMTP id z1-20020a196501000000b00511636fac29mr943753lfb.64.1707571062208;
        Sat, 10 Feb 2024 05:17:42 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 7/7] meta/recipes: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:59 +0100
Message-ID: <20240210131727.342583-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195271

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-kernel/perf/perf/sort-pmuevents.py | 8 ++++----
 meta/recipes-rt/rt-tests/files/rt_bmark.py      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf/sort-pmuevents.py b/meta/recipes-kernel/perf/perf/sort-pmuevents.py
index 0362f2d8fab..0a87e553ab8 100755
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
index 3b84447a0fd..2a4eed412f0 100755
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
2.43.0


