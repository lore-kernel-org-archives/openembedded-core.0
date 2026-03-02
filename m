Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B23EA4E1E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:13:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162684.1772464398917834385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LpOICf0v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so37615735e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772464397; x=1773069197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTFEyay4mgoLjtpF8RtKj1Nn2vah6Xz4fbwIQroJUvQ=;
        b=LpOICf0vaRam8eW+avOGEFJDgQJcQFq1jRy30lH1Waq88b0tCJd6+hW9L0QpKjwRsB
         hMC3YuM7tIXs0h8qUPs/xIBxJf8PDG1Rqe/qeT2ufCIRFYix7RNhYUyYDseOFVZKsLQ4
         RodZwb5pOsV1MJixgZ29J5Pmy3OPleg8JvEIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464397; x=1773069197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTFEyay4mgoLjtpF8RtKj1Nn2vah6Xz4fbwIQroJUvQ=;
        b=FulrUTN6lZgyeZ8KcOWRwcLgqfA5cjORcQY3fUR23Rh5TQrvQ/GTx2XFXGyLFLjddZ
         pRx3cf8PA2hCCMQNuS+xyzp63cya0YCrSVcDqp2aH+oBVlZ5ILohcRv/10lu4EJDCX41
         85Olt3uidFREUVI0ya+vE6vJAjGfHaskfXastilncgLL33RuTI/kXdosXOPaa34/9sLh
         WQ2+Nv4CPKRJuNrevJr6JUFvoNkVJPJyEdBCoyof0u32xaCGd388C+bbUor27CRMTJi1
         eXex2QfspDlbJGOb6R3m5CZoylM9sJL0QJqCk6ggXA+F2kcRKUmiR+GmWb1zKeCY7T3L
         GQWg==
X-Gm-Message-State: AOJu0YxcYfagkWAh9YN6YkwfMSdXQ4FuFttq3ar+0fhPdykCaQAjy663
	3eMTM2JRTVG1CRIDu/VrVhPK/8cXqj31CEHy74MqLmKlXRQJxdIWSQM/wV18SOf8vnuBmStsiAo
	aeez366c=
X-Gm-Gg: ATEYQzxZk9p6umMBFbujwbXSjQQha/Yx2SFXbniBEHN9ZOCkAFrKKhJEnrUWlAqQD8B
	EEWaWqn35RSlQGvCNsL/+OhL094Omxov5lnoY1WoXMWEq41U//l1dtGrlyEn0ZRtLuo0ke7ILer
	4P7p6Rj8c8thk+Emjh1J5rBUpo2UgUjqKPXi5r/sz9DPMA7fnOuA0+Ztk+6WTjn/dbd4S8t96OV
	sBgCvAbVKwMdDWm032IsbVlpi3wlbgnbGdkg2IV7jiLeIleN8hFxkTeab/1I1gwvnm276sGjXSO
	aP/Z+2+1tOJkJBHMORZtmQl7HmemymVpyxC3NOpl4M0pR0ycDriTXF+i23PvVRLwvARpRRH0rNX
	LLrBGn0PRidurEvXK2+sN1CgMBgnPdhn+9w1AR9TGKUHwmfzy3/0o3VfWYrMoOHKXHT8eNbNMYZ
	tZcVCy9pDRDFVTersjeGGZQOI3PS2kJCQP5Jjdbr1OnJeZUuxqLXE=
X-Received: by 2002:a05:600c:3512:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483c9bbc276mr216321605e9.9.1772464396820;
        Mon, 02 Mar 2026 07:13:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dd78:7aff:8be3:3eb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm308058775e9.3.2026.03.02.07.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
Subject: [PATCH] ruby: Fix reproducibility issue in docs package
Date: Mon,  2 Mar 2026 15:13:15 +0000
Message-ID: <20260302151315.1576755-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 15:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232208

From: Changqing Li <changqing.li@windriver.com>

Add a patch, submitted upstream to address a timestamp sometimes added to the
docs files.

[RP: Extracted the missing pieces of a v2 patch into a separate commit]
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...save-the-original-name-and-timestamp.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_4.0.1.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
new file mode 100644
index 00000000000..3db53285653
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -0,0 +1,33 @@
+From 6250ed93d1d7407eb84241296d604e6f98ff0a82 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 27 Feb 2026 16:59:24 +0800
+Subject: [PATCH] Don't save the original name and timestamp
+
+Explictly pass -n option to not save the original name and timestamp for
+improving reproducibility. In our test, always set mantype to man, but
+the output like erb.1.gz is not stable, sometimes, "last modified: xxx"
+is added to the file type, which make the build not reproducible.
+
+Upstream-Status: Submitted [https://github.com/ruby/ruby/pull/16265]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tool/rbinstall.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
+index 874c3ef..0bba588 100755
+--- a/tool/rbinstall.rb
++++ b/tool/rbinstall.rb
+@@ -173,7 +173,7 @@ def parse_args(argv = ARGV)
+   end
+ end
+ 
+-Compressors = {".gz"=>"gzip", ".bz2"=>"bzip2"}
++Compressors = {".gz"=>"gzip -n", ".bz2"=>"bzip2"}
+ def Compressors.for(type)
+   ext = File.extname(type)
+   if compress = fetch(ext, nil)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.1.bb b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
index 13d4a1b4ef0..e51d0d3e9cf 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
+           file://0001-Don-t-save-the-original-name-and-timestamp.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 

