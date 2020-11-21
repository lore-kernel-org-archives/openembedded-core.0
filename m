Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.2685.1605917670934981943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VseJyEEq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id x15so5731575pll.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PGdhKluf29ETEBZq1M50D/XfVWikykVtrX4zPSAv9Y4=;
        b=VseJyEEqkTrjiFFRsyTMMpL3Yu8CrmemkAvG55MQYMpjZrPn096KpT7SJN3w74gp37
         6jXPgrFnwCNV5NHBbvgIJnTwd3gklZghO7EhCCGtIfdMMWAzBxkE4mkChsOaq8OjnxHN
         7QRUpumkOi/BSCc5TPQruowQ3aYuumKArB7kpwLvoL+mf+PTQcgRn4eJgCEBC88HSyQZ
         J6rhHoEABmEx9i6jPELybZDndbWGaeEm4nBrRN7eOOhQSViV+mSqpHQY1/h4dXQnRvsY
         tiHix0vUgSEBZ5Oodo21upprK7BMKH9z0ceIXI2EoUJLTsClZF8nN1jjV9BIDNt1nMuB
         wKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PGdhKluf29ETEBZq1M50D/XfVWikykVtrX4zPSAv9Y4=;
        b=D2VjTPMmHiQDKBmN42HLAEOiV0a6R32QBR5KSe6JplecB0qFlte7ifIJyL7Q0I+ow5
         wLpN16frfenD2ivz/ZlaMUQai2lrgOIzbT3v/dM1u8DGIPBuQnbdTT0p2VfArFVm3UDA
         W9/DUmGUWIvSWBKc98TmUzGY8zB7sNy7izfzTZbt8Oe8FtztkcwPllefx+K5efvl/ppw
         1vyhjJ1RdxnqtVL38vSlCvH/4hDSJtQaD0FO6vsIF8txSXy7undVyeZwI8bx208mPqHy
         lM6M6ozGsG+0Ae9V47f3hYSIXrzEeYc3xTNJjedvZ7JVNK5cQQ8ESe13bxZUoIWFvLLx
         cocA==
X-Gm-Message-State: AOAM533bvjH2L6rWd7D0ATct7Wu5vWdPB0NEEsa0MZ4NXS5kylDz1Wuw
	QzlOQ5xgyQKc/S7Sma3aoYoBOb/Ll0Kd2XDC
X-Google-Smtp-Source: ABdhPJwZYJ5cyVgikaUVGr/bor3Q8Bn3fZc7BjUudxXmOzH0nWxFvywhYMBi3+BwM+0lGaB3XTzSdg==
X-Received: by 2002:a17:902:6943:b029:d8:c8aa:99db with SMTP id k3-20020a1709026943b02900d8c8aa99dbmr15735424plt.68.1605917670143;
        Fri, 20 Nov 2020 16:14:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] python3: fix CVE-2020-27619
Date: Fri, 20 Nov 2020 14:14:03 -1000
Message-Id: <001ee91818642ddac7c1b8e5236baa5c4c542b72.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605917505.git.steve@sakoman.com>
References: <cover.1605917505.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2020-27619.patch       | 70 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
new file mode 100644
index 0000000000..bafa1cb999
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
@@ -0,0 +1,70 @@
+From 6c6c256df3636ff6f6136820afaefa5a10a3ac33 Mon Sep 17 00:00:00 2001
+From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 6 Oct 2020 05:38:54 -0700
+Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
+ in the CJK codec tests (GH-22566) (GH-22577)
+
+(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/6c6c256df3636ff6f6136820afaefa5a10a3ac33]
+CVE: CVE-2020-27619
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ Lib/test/multibytecodec_support.py            | 22 +++++++------------
+ .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
+ 2 files changed, 9 insertions(+), 14 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+
+diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
+index cca8af67d6d1d..f76c0153f5ecf 100644
+--- a/Lib/test/multibytecodec_support.py
++++ b/Lib/test/multibytecodec_support.py
+@@ -305,29 +305,23 @@ def test_mapping_file(self):
+             self._test_mapping_file_plain()
+ 
+     def _test_mapping_file_plain(self):
+-        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
++        def unichrs(s):
++            return ''.join(chr(int(x, 16)) for x in s.split('+'))
++
+         urt_wa = {}
+ 
+         with self.open_mapping_file() as f:
+             for line in f:
+                 if not line:
+                     break
+-                data = line.split('#')[0].strip().split()
++                data = line.split('#')[0].split()
+                 if len(data) != 2:
+                     continue
+ 
+-                csetval = eval(data[0])
+-                if csetval <= 0x7F:
+-                    csetch = bytes([csetval & 0xff])
+-                elif csetval >= 0x1000000:
+-                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
+-                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
+-                elif csetval >= 0x10000:
+-                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
+-                                    (csetval & 0xff)])
+-                elif csetval >= 0x100:
+-                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
+-                else:
++                if data[0][:2] != '0x':
++                    self.fail(f"Invalid line: {line!r}")
++                csetch = bytes.fromhex(data[0][2:])
++                if len(csetch) == 1 and 0x80 <= csetch[0]:
+                     continue
+ 
+                 unich = unichrs(data[1])
+diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+new file mode 100644
+index 0000000000000..4f9782f1c85af
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+@@ -0,0 +1 @@
++Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 5f7901dbf2..1d0b4cdb77 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
+           file://CVE-2020-27619.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

