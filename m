Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B52C3DA61
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 12:41:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.24149.1721565693464270237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 05:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpUMx9dL;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso25163345e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721565692; x=1722170492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n58kOzWL9CP2uBBo9cMjyaVwC0kWjZoJT+iWOpSpjjA=;
        b=RpUMx9dLmjKM1xyxDfuzhqx/WOPhIEwSIJZjSDVLSrGMjsarjECpR3f0DHdwTqZk0T
         iQ5lfLAO2+//jJoLG76PTa6VEDlw8sAFas8+ItGh8banVT+oAU18T9UCzqLDXvd/jrj1
         Gr7Gf/Spyz2hTrssVW2YA+KKbaGywemcjVxlBgnbOirwQ0ahOGwBOyldO9293+CifPfM
         nh1+4qq64yZCKDT0YX7nY4dHPawe4yGF80RBO6De/9LwY9vyROiJeHLsWlmK9fALxW/x
         74bNfp1o7OFYq1+F7d3/9RuQzFD3ueNVuOna7tfwIuqzA2XEjLDYcxnqbcktjSNzZqdF
         m9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721565692; x=1722170492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n58kOzWL9CP2uBBo9cMjyaVwC0kWjZoJT+iWOpSpjjA=;
        b=H3bSclui8HEQ8+q4ufv0rlVe2cMTy1uV0ZpIr3B7M+nt80Lcp3bVGTvUNCfsEHVle0
         de9oVz9CVHWkM18PIu9eRhwx6DDgdCsdvEPobu6fLFMFG/KeABOtETdwghjBBmVNIpe2
         P5KvKyjKBV6eQFD1dlcnXV0JXMTPTkQxyxs03exj1BTd2lOnGE22Op6sEzUJNiVABCl8
         xDjhrU9ZGX5Vii0epIM0tliyFTToLSuOSFOjJ8POowHfg/6tnqmYy2iEJfkuvbbZuE/c
         a/NQ9zpvrm5sp6b/amms6/NI6IwIhgQB84qr5RreMlLbcl9rgJs3ulm//SvjA0Fw6SnA
         WeBQ==
X-Gm-Message-State: AOJu0YwP8cxPrfGsBg/e3GMi5hU5bmaLP5Q2dR9zicc02P2KCh+2vNYL
	dChnIyG/o7pNOZXPJ/dThp3ckNZ7AsPazCI2wqbZC16L4mN1RD1f1UL2pA==
X-Google-Smtp-Source: AGHT+IG9Y9no3jO+VKjcsihAY2aM5Wu3zlmfXhdNilhvGsafVwWdBK3WYiGXfxplrM2EVAwTwCzSNw==
X-Received: by 2002:a05:600c:4f95:b0:426:5b21:97f9 with SMTP id 5b1f17b1804b1-427dc568a86mr29540905e9.32.1721565691453;
        Sun, 21 Jul 2024 05:41:31 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d8e68ba0sm80162875e9.21.2024.07.21.05.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 05:41:30 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] pybootchartgui.py: python 3.12+ regexes
Date: Sun, 21 Jul 2024 14:41:25 +0200
Message-ID: <20240721124125.1085400-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 12:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202296

From: Adrian Freihofer <adrian.freihofer@siemens.com>

$ ./scripts/pybootchartgui/pybootchartgui.py
./scripts/pybootchartgui/pybootchartgui/parsing.py:460: SyntaxWarning: invalid escape sequence '\d'
  disk_regex_re = re.compile ('^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
./scripts/pybootchartgui/pybootchartgui/parsing.py:597: SyntaxWarning: invalid escape sequence '\['
  timestamp_re = re.compile ("^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
./scripts/pybootchartgui/pybootchartgui/parsing.py:598: SyntaxWarning: invalid escape sequence '\S'
  split_re = re.compile ("^(\S+)\s+([\S\+_-]+) (.*)$")
./scripts/pybootchartgui/pybootchartgui/parsing.py:643: SyntaxWarning: invalid escape sequence '\@'
  p = re.match ("\@ (\d+)", rest)
./scripts/pybootchartgui/pybootchartgui/draw.py:799: SyntaxWarning: invalid escape sequence '\s'
  ('system.cpu', 'CPU', lambda s: re.sub('model name\s*:\s*', '', s, 1)),

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 63a53b6b885..144a16c723b 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -457,7 +457,7 @@ def _parse_proc_disk_stat_log(file):
     not sda1, sda2 etc. The format of relevant lines should be:
     {major minor name rio rmerge rsect ruse wio wmerge wsect wuse running use aveq}
     """
-    disk_regex_re = re.compile ('^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
+    disk_regex_re = re.compile (r'^([hsv]d.|mtdblock\d|mmcblk\d|cciss/c\d+d\d+.*)$')
 
     # this gets called an awful lot.
     def is_relevant_line(linetokens):
@@ -594,8 +594,8 @@ def _parse_pressure_logs(file, filename):
 # [    0.039993] calling  migration_init+0x0/0x6b @ 1
 # [    0.039993] initcall migration_init+0x0/0x6b returned 1 after 0 usecs
 def _parse_dmesg(writer, file):
-    timestamp_re = re.compile ("^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
-    split_re = re.compile ("^(\S+)\s+([\S\+_-]+) (.*)$")
+    timestamp_re = re.compile (r"^\[\s*(\d+\.\d+)\s*]\s+(.*)$")
+    split_re = re.compile (r"^(\S+)\s+([\S\+_-]+) (.*)$")
     processMap = {}
     idx = 0
     inc = 1.0 / 1000000
@@ -640,7 +640,7 @@ def _parse_dmesg(writer, file):
 #               print "foo: '%s' '%s' '%s'" % (type, func, rest)
         if type == "calling":
             ppid = kernel.pid
-            p = re.match ("\@ (\d+)", rest)
+            p = re.match (r"\@ (\d+)", rest)
             if p is not None:
                 ppid = float (p.group(1)) // 1000
 #                               print "match: '%s' ('%g') at '%s'" % (func, ppid, time_ms)
@@ -742,7 +742,7 @@ def get_num_cpus(headers):
     cpu_model = headers.get("system.cpu")
     if cpu_model is None:
         return 1
-    mat = re.match(".*\\((\\d+)\\)", cpu_model)
+    mat = re.match(r".*\\((\\d+)\\)", cpu_model)
     if mat is None:
         return 1
     return max (int(mat.group(1)), 1)
-- 
2.45.2


