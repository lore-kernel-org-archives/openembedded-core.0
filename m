Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B904C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:41 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.2013.1709071051206413934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eBbPsNYN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e55bb75c9eso242953b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071050; x=1709675850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Uvj4fvUOyJ5qd6Y8zr1jD6ISCOpmrX4bNoXrZ6TmRU=;
        b=eBbPsNYN4RMDr6P3FYU4lR4X747ROUsQRYl4Z18ojb20oURCs/c4wvO8ImUJarM2Da
         yjS1nugb8kighhrjo/o2yugs8djMB5MW7W6Xsqu+KA5Mwwl8DGVyUN2tA/OqKN55f7B6
         UWfERGCQEEOZUb3HZDaCjBDs+sdQAj8M/45PlQM6Vwkm3rnN9M1sKGmOUT9VSJlKuAxM
         Ife3EQ9c5gpSEKHJJU123cx5ZgewwvSAd8XG0lJ0burfgl6weRYvCBwhTL1JBE2QH+Al
         WKWC8n5Mvxb/srb77dEmgxMxyuz+/mVRkiF9C+7wEu7/JDVkMlb241HMyTtdl36/B+Ye
         sHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071050; x=1709675850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Uvj4fvUOyJ5qd6Y8zr1jD6ISCOpmrX4bNoXrZ6TmRU=;
        b=o/lvdI6Ix/OHawo7pxvpIHLsvWSfR6qa1ca7xuBKVYB/nEEly036LFsl+xqLg3MEnh
         k753tVDHusqqk3nDF1/nEvcRM0YmmHxKpvLUMuqziNQb26lgbLaIbqa+2teQqQPuuZCA
         igZo+Wlm+jWxw7A/7S05lYa0+bo0aPwoKHf3WnNMWg1PccT75mWT2lvg+QtyqcF4OxN+
         C/6Cg2IvBGhPLPuGfBN249Muok44lfz29sRoVoAPKpsZuI0ldsf+7bSfcW1exBi+TcKh
         DCUL4SzcowpjjHSfPoPdY2NJJuWqQqxj3Haa+kruLd6YSl3rEr3LoB5wIFeaQmYyFaHd
         BosQ==
X-Gm-Message-State: AOJu0YyCnWeAXaQzyzgdLnEL2MUUMtcSdR/dqXzicmo0EJ5t5EStAq1J
	DutFnzHiPiguJD3S52cHUL8YNvkG66BDU8a7liqlvbDdlIoN/S5n8EmVfsESfgAE+/ib2MWkoQ+
	ZeIU=
X-Google-Smtp-Source: AGHT+IFAYCIlUGVGGSOc8jUsrK3+P5lHRQA0g1sNWkB5vd0BTqM4HJFdz7bI+4ZcD2NDLVdj6IPg8w==
X-Received: by 2002:a05:6a00:87:b0:6e4:e7c3:f148 with SMTP id c7-20020a056a00008700b006e4e7c3f148mr10418060pfj.4.1709071050469;
        Tue, 27 Feb 2024 13:57:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] meta/recipes: python 3.12 regex
Date: Tue, 27 Feb 2024 11:56:59 -1000
Message-Id: <d4e11eebdfe50acc124a87341721a12bc1c15024.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196311

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: f2d80817baea298b953d6e14daad65087b3b50c9

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


