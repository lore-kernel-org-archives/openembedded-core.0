Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.24270.1613344830294892418
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 15:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ke/lUg0+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id g20so2737773plo.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 15:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuTZGPTRJrNTZNjBvXcdQ0zehVR2IkVqxoeBYZgUbbY=;
        b=ke/lUg0+O3upKSsAbSYBkGFtxJxSsFlfdt174E+CJxFr6bXq30hNToMLJLqocuxdDa
         ul9NH/T6bFqfov7tJun9wQeqN1YUClDWbq/A3TGNrzQDLpRhYGEr6Y4wgaL9XrO31ZmW
         pIzWmdY1QRjRRAv5Ph+lt1hTBuOY5WrHAqCXQLLLTG+mALT11YWAOowhMyWDX2XCJlKU
         5NgeJ78GA2w6u4YBm902DuI+kxlHLU3kuaCHwAX94XMW8dixxXj9e22C6RAVjh2rAVYt
         3ZjCImTQHhudAusNoggt8zOUolvmKm8ON0IExIxuXcvbNM4pE1gTFV1aQNR/qWZdupOy
         9tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuTZGPTRJrNTZNjBvXcdQ0zehVR2IkVqxoeBYZgUbbY=;
        b=lmX/QFTfiHpwKK/co3xO/+VONwKsCVPlZPJ0XYPeKAuNW/uQVRPe2t3XwqU0STUZly
         7LJkxg0bY7fVezpb/f4WSdJJZDjb6buJZc/tOQm87YQxoQCOYusCR2KSe+hgI6hOknjD
         DmR/YfoYpQ2xE34r9126yNF4K8GeVrsFTvf84VUfzPqtkO8dqJnAld6XufTknp3dI73b
         Olf5KZOY3As5H9WkId2OFovTC1B5v8BdxOITMm6ORW8Tw0VjQIyYGBgJJgyZ8u8NtVYA
         gP6Fk56FyKaGphij4d4reIuNh+qjEuPrIvsf1K4Ljb1JwltFfiuGRFA8zAqugSChbZ6w
         4oaQ==
X-Gm-Message-State: AOAM530zmybgl9kX1MCAsoP1pj91+QT1pTFHqdwDsMQd1xvDteAbegBS
	4Mx1ribvHniX3ytYB3gBGcu9ZcdyHh8=
X-Google-Smtp-Source: ABdhPJxHlcMSnKSKwDB/GIlgCV14OIcTrr9QlPjAO1WQaA0opw58qAPGp1hzZfnWI9IRicsbFVV69A==
X-Received: by 2002:a17:902:e844:b029:de:5abb:7df1 with SMTP id t4-20020a170902e844b02900de5abb7df1mr12702013plg.55.1613344829458;
        Sun, 14 Feb 2021 15:20:29 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id x8sm1425213pjf.55.2021.02.14.15.20.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 15:20:28 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [[PATCH] cve-check.bbclass: allow skiping non pbn
Date: Sun, 14 Feb 2021 23:20:27 +0000
Message-Id: <20210214232027.2354161-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I don't see the point in logging native, nativesdk etc.
The bottom line is the BPN has the issue.

Allow folks to filter out those other package name variations via
CVE_CHECK_MANIFEST_FILTER

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d3..0d33d5a530c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -59,6 +59,7 @@ CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 # Layers to be included 
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
+CVE_CHECK_MANIFEST_FILTER ??="0"
 
 # set to "alphabetical" for version using single alphabetical character as increament release
 CVE_VERSION_SUFFIX ??= ""
@@ -96,6 +97,13 @@ python do_cve_check () {
     """
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+        if d.getVar("CVE_CHECK_MANIFEST_FILTER") == "1":
+            # drop native, nativesdk, cross, etc
+            bpn = d.getVar("BPN")
+            pn = d.getVar("PN")
+            if bpn != pn:
+               return
+
         try:
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
@@ -164,6 +172,7 @@ def get_patches_cves(d):
     import re
 
     pn = d.getVar("PN")
+
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
 
     # Matches last CVE-1234-211432 in the file name, also if written
-- 
2.25.1

