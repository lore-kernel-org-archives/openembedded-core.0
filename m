Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80BDD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 06:28:42 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4913.1765831522774783881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 12:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnKCSV8b;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: lukakrstic031@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6492e78ce07so5171191a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765831521; x=1766436321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2vrSY0yeKimgzC8I/EYQYr3/xw9McrT+SzK1g48foQ=;
        b=fnKCSV8bFBpi/K5cqvh2uYhRO0WY2DeFQaiQyyPzhffSRmIgHoZQ66HY50KP8o0DRB
         VhlMGXbNkjaYirY9PTOji6reWKJdI8a5vCo9od355UOB0L78ghGK3QYjYuRy4Rbq6mBi
         38gucyUfhNjkD1CLOTOe9PlsnlMsY7VNtUrNKpTnuw+dFa24wiCkyUBQZC1vu5x2hjZ3
         Nuziz1n7VhnH2E0ax9vLFVdeqRYepC8omqpeEBF511rxkn2fdHBHHl1vSF6qZploskRo
         wNrk+Bt/U2g4iOgaBT7A72RlQ3osLWv/WmOM4EfHeI3P6vrtRDPFZtvVSRqiay2jRbF6
         IYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831521; x=1766436321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2vrSY0yeKimgzC8I/EYQYr3/xw9McrT+SzK1g48foQ=;
        b=FH+i1JVtxL8y+f2hNk8LoD4sL1aEQrqVEOwM5q49/3krhWidJ9fMrB0K0+uxBH+O8o
         c+9UyAKktRU4l4W8GqZJbku1w2R10M+b5dwQ4wf1Jbcbcyymo36+CRtSZIZD358r7Q6E
         a4v2YttQcI6RL/IbrsJiXYlOj/7zn1EsZTksAKroAfyzTXg+UATnGsu76l2SnkBPiVxG
         bZ+7GP51/jPFpUdqkHv98VOB4wG17BcDTCx61uMpqWtTPnikFS878Sa5wheIXyE4Mb8o
         fnL6uqNZ3F7YQKxhDtdPlIAwmPGQ41lb/wGSpBP8cPYkzVKbE+biokBJ7sb8yT9F2gZQ
         euhg==
X-Gm-Message-State: AOJu0YyOL8X68HFQIY0NL/k114+YrXkAB8SURgj8zKEW2mV6FqbdxRl/
	LLKmYzZFl0Hnu3vbTYoezjLA4vIdT3hNWeGnaWwKElYhu4r4V1ksJshM7ualQw==
X-Gm-Gg: AY/fxX6Qz7SqmvmyLDHJndKa+uW8lW8gD3oFFtoXNBMvwonvfCP6IQOIPYhKn5UuFYq
	bnPvmPqDKaah4tA9cs04/4n3bdrz2QSeVgPZprff8IfEtJZpKB03Br1ScqYaVZdi6XhHUb+TTI4
	3NLrZ8KQEiGqHh2X3/cdssFSv3ZfbOkjE0M5J6Q0JRMN0LhjrhnLdLikKo1FyBYh+pket5jI9Sl
	2yILjbvPF4O738+LfNkGZ186fNcvgUJ3IY/cspF6uZk3oEhFTBe4ENGIdmoyyNJMz1SCeaRQ/ek
	hVyFFV/TUwkW0EHBOjpsc7QgqlnG/ZRl2LWZlEToj+40dzNeMTgRVhvqpze7AHSO0q4YHV+ro/p
	ym2Mac4SSbLdhh7MkL/KGK+Mu2vz2QNMUEM2G+FoZYF7auc9TBz70ghlah4gMCmu9HHV2Th9T+M
	WtCoJABlq/7MQdBat4epXgGIFc0gT0+NIZzXZFKoq5COP3D1xKP9sT32lJwB+Jh2ONyBfuXk+GB
	ItukthI7dgcghGr+ak=
X-Google-Smtp-Source: AGHT+IF1dDGxzM2woIUTbnfaNLCwMpbOBp8BOji/CkS/6ETC/ZyRFx8SDVUsz7TzkHqRLyKu0BKO6A==
X-Received: by 2002:a17:906:794e:b0:b7a:2ba7:197e with SMTP id a640c23a62f3a-b7d23a1bc9bmr1227554566b.29.1765831520713;
        Mon, 15 Dec 2025 12:45:20 -0800 (PST)
Received: from localhost.localdomain (109-93-108-144.dynamic.isp.telekom.rs. [109.93.108.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1467836566b.53.2025.12.15.12.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:45:20 -0800 (PST)
From: lukakrstic031@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: l-krstic <lukakrstic031@gmail.com>
Subject: [PATCH] patchtest: reject Upstream-Status after scissors
Date: Mon, 15 Dec 2025 21:45:07 +0100
Message-ID: <20251215204507.1675-1-lukakrstic031@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227757

From: l-krstic <lukakrstic031@gmail.com>

Upstream-Status must be placed in the patch header before the
scissors line. patchtest currently accepts tags that appear
only after the scissors, which means the tag is lost when the
patch is refreshed by git or devtool.

Update test_upstream_status_presence_format() to distinguish
between tags in the header and tags after the scissors, and
reject the latter.

Fixes: [YOCTO #15940]
Signed-off-by: Luka Krstic <lukakrstic031@gmail.com>
---
 meta/lib/patchtest/tests/test_patch.py | 109 +++++++++++++++++++------
 1 file changed, 86 insertions(+), 23 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d7187a0cb1..08992fbfd1 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -50,31 +50,94 @@ class TestPatch(base.Base):
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
-            if not self.upstream_status_regex.search_string(payload):
-                self.fail('Added patch file is missing Upstream-Status: <Valid status> in the commit message',
-                          data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
-            for line in payload.splitlines():
+            lines = payload.splitlines()
+
+            scissors_index = None
+            for idx, line in enumerate(lines):
+                if line.lstrip('+') == '---':
+                    scissors_index = idx
+                    break
+
+            header_has_upstream = False
+            body_has_upstream = False
+
+            for idx, line in enumerate(lines):
+                if not self.upstream_status_regex.search_string(line):
+                    continue
+                if scissors_index is not None and idx > scissors_index:
+                    body_has_upstream = True
+                else:
+                    header_has_upstream = True
+
+            if not header_has_upstream:
+                if body_has_upstream:
+                    self.fail(
+                        'Upstream-Status is present only after the patch scissors ("---"). '
+                        'It must be placed in the patch header before the scissors line.',
+                        data=[
+                            ('Standard format', self.standard_format),
+                            ('Valid status', self.valid_status),
+                        ],
+                    )
+                else:
+                    self.fail(
+                        'Added patch file is missing Upstream-Status: <Valid status> in the commit message',
+                        data=[
+                            ('Standard format', self.standard_format),
+                            ('Valid status', self.valid_status),
+                        ],
+                    )
+
+            for idx, line in enumerate(lines):
                 if self.patchmetadata_regex.match(line):
                     continue
-                if self.upstream_status_regex.search_string(line):
-                        if parse_upstream_status.inappropriate_status_mark.searchString(line):
-                            try:
-                                parse_upstream_status.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Inappropriate, but no reason was provided',
-                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Inappropriate [reason]')])
-                        elif parse_upstream_status.submitted_status_mark.searchString(line):
-                            try:
-                                parse_upstream_status.upstream_status_submitted_info.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is Submitted, but it is not mentioned where',
-                                          data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Submitted [where]')])
-                        else:
-                            try:
-                                parse_upstream_status.upstream_status.parseString(line.lstrip('+'))
-                            except pyparsing.ParseException as pe:
-                                self.fail('Upstream-Status is in incorrect format',
-                                          data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
+                if not self.upstream_status_regex.search_string(line):
+                    continue
+                if scissors_index is not None and idx > scissors_index:
+                    self.fail(
+                        'Upstream-Status must be placed in the patch header before the scissors line ("---"), '
+                        'but was found afterwards.',
+                        data=[
+                            ('Current', line.lstrip('+')),
+                            ('Standard format', self.standard_format),
+                            ('Valid status', self.valid_status),
+                        ],
+                    )
+
+                if parse_upstream_status.inappropriate_status_mark.searchString(line):
+                    try:
+                        parse_upstream_status.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            'Upstream-Status is Inappropriate, but no reason was provided',
+                            data=[
+                                ('Current', pe.pstr),
+                                ('Standard format', 'Upstream-Status: Inappropriate [reason]'),
+                            ],
+                        )
+                elif parse_upstream_status.submitted_status_mark.searchString(line):
+                    try:
+                        parse_upstream_status.upstream_status_submitted_info.parseString(line.lstrip('+'))
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            'Upstream-Status is Submitted, but it is not mentioned where',
+                            data=[
+                                ('Current', pe.pstr),
+                                ('Standard format', 'Upstream-Status: Submitted [where]'),
+                            ],
+                        )
+                else:
+                    try:
+                        parse_upstream_status.upstream_status.parseString(line.lstrip('+'))
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            'Upstream-Status is in incorrect format',
+                            data=[
+                                ('Current', pe.pstr),
+                                ('Standard format', self.standard_format),
+                                ('Valid status', self.valid_status),
+                            ],
+                        )
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
-- 
2.43.0


