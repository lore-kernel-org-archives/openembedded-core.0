Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86683C46CA0
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:52:57 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.10158.1701211975105918246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=clOLTfAy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c2066accc5so4142942a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211974; x=1701816774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ1mXluv5sJH7Acdiwb8d46QZXH8nsjJlbmAve9YZtk=;
        b=clOLTfAy3EhYEsjxIK5Bg30EnfObfue/7I5DvNzDpX85wcMIB7y29aKhzBRRVQNA7Y
         qO63vcua0EkjsjlbNA1idxwmnPHFmFd+Lb/Bcdoxe7WeW9a9rXf9XupXv70sCWuhGUxm
         HUHL2gdUbwWCAWmaq/vMENcAMxVnvHrwdJ/7s+9Tkx+S6ChZeaLbwyE12nK9eHCVB9+X
         N66S77x6jCHFUSZvy9swd3Mf+ei5XMlWmZSNNfRo4zfGmgD6RNkBxJYB5rBVI8T+FBPx
         8pJ+zzZap9umALwp0+YWGAPcO2R1fuw/EorMlLyG0hUhMrTYP+P+BoXYOJHyE2hZX67v
         p4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211974; x=1701816774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ1mXluv5sJH7Acdiwb8d46QZXH8nsjJlbmAve9YZtk=;
        b=Pp6HsQEHTv8ZpngU/+OXfFYH+YsC47DnEBTFYoK7acDd8RjE9x2+Zk6uh8Cy3E/LCz
         zknngdbP20ozIih+pNoCLo2p9woenz/qbkYYS7Uj20huDGiIepAWP7B8tzSu23gi3TzN
         4Q1wtLV7CIJOSSpSi4+wsMMzww8975Hnuvs+2GVB0QNEF/8p3O0ZRNk6ulksbeVIVRvw
         Hpg5r6znZn2seOVs57FrBA75aYHIsx0wLVzSs5pTZhUxhUfG598QyPt0QvtKw/yg+kZT
         q22mUAA7SnFvS/+O6RThKC3Qbct6vb1UaJqq7xAVN29ey2ihn9JSNZU+C345+LsZt6cZ
         lknQ==
X-Gm-Message-State: AOJu0Yzx6P39Fyf3pvpNo7oI0LKvGNX8qWceCWh9/+UYT5lIb9R0Nm+e
	+X5Dh+qZUVWSuMuOkpLBhapd+bBqe1vE7A9N+qWn+Q==
X-Google-Smtp-Source: AGHT+IEy11mvZ2RnR2Hf/IazWcm9UUaNqXSFLqBPfdnCs1w2DomJSwbrgKdBG2IjJTh+zXhO2ZH/oA==
X-Received: by 2002:a17:90b:4a83:b0:27d:492e:137a with SMTP id lp3-20020a17090b4a8300b0027d492e137amr17152091pjb.45.1701211973618;
        Tue, 28 Nov 2023 14:52:53 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/13] python3-setuptools: fix CVE-2022-40897
Date: Tue, 28 Nov 2023 12:52:30 -1000
Message-Id: <a939696d7c70c42e404ec30a9d75e5ea4f742c78.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191398

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu setuptools_45.2.0-1ubuntu0.1 .

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python-setuptools.inc              |  2 ++
 .../python3-setuptools/CVE-2022-40897.patch   | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 29be852f66..5faf62bc3a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -8,6 +8,8 @@ PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi
 
+SRC_URI += " file://CVE-2022-40897.patch "
+
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI[md5sum] = "0c956eea142af9c2b02d72e3c042af30"
diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch
new file mode 100644
index 0000000000..9150cea07e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch
@@ -0,0 +1,29 @@
+From 43a9c9bfa6aa626ec2a22540bea28d2ca77964be Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 4 Nov 2022 13:47:53 -0400
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+Upstream-Status: Backport [
+Upstream :  https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be
+Import from Ubuntu: http://archive.ubuntu.com/ubuntu/pool/main/s/setuptools/setuptools_45.2.0-1ubuntu0.1.debian.tar.xz
+]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ setuptools/package_index.py           | 2 +-
+ setuptools/tests/test_packageindex.py | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+--- setuptools-45.2.0.orig/setuptools/package_index.py
++++ setuptools-45.2.0/setuptools/package_index.py
+@@ -215,7 +215,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
-- 
2.34.1


