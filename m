Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B61AC5519F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.8034.1650463732859879728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ePiWc9xR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id q19so1717896pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IP/S6mL63fUBf/b00Ow00T2opc6uvwgGUBJF+Dq9pL0=;
        b=ePiWc9xR1TcoT8xxDhnpDBwfoE0gj+SJg5D0f7AWbi7GXt5PvOTSHOEMN8ZHPIZ9Mb
         2qPpenf3SrOsSYVle/wu54yK48gLV4k/syj64Z7lZGZq3I106OZWMuDEgTahFDOu6HJo
         EzonZ2kaROZf7/Mnxm+XFSxXWIBqCXjzHNzfpYZhWrplDSg3Q7eJjcYRO2xeKo4KNSu0
         sG6raX+kYPuXT21+JCqVwHHY5tr43kKbVa9HpULSSyfRFv4euTuHdod4Taf7eIJCE7FX
         QEy1RX8/rWVu//bDNNLJ9ObVa1+8FGTBaOFIFOXQcKNo/8BjwgzU9AC7AHD9MV8Ss9hG
         dudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IP/S6mL63fUBf/b00Ow00T2opc6uvwgGUBJF+Dq9pL0=;
        b=gibfqiTzIhCFOOdgQjXG3rYghADcsyQm2u6Wc0iWCG/8SiuHeMsj9TM4Nkq89h0X4S
         W491HbvtpnffaYOZt7Mrg2TlhRtDh0wsqfVlrxQFn7YXSn/vhPw7UaQuSIO6CZWSAzf3
         IbRiuQXtGb9NsefPEQ/QpeY0/psgQjcVeXnU2jzR3zBpMnsnxgNl5SecVT0sG6ADVALQ
         S4I6xZSjuZCVsImwvGdX0nu6Z0pRwFwN+LaAfZl3Mo6RsHIBwUyU1COykqjX9mR4IJDi
         IJamNRChTicqFcRuyrsq0bG6iQcrb7cJBbG+SmQ/SwhEe8CLTm6G5FG1HKv+ezeoY0L9
         zbXw==
X-Gm-Message-State: AOAM532x6dF77NBsb1TbsHBAcpfJ+Rm/oeGX7jzeSZq2Gmt3fwGvOx2d
	6JlABPjTdvdVL3ZTH1YiGhd/MFlvoi8pfz3Hbm0=
X-Google-Smtp-Source: 
 ABdhPJwzubQoG4FHcnYCF6iE3DhCAfvLyudYBZsJg4DGDFZze3TjpJUl2NyIyA4Kyfq2RzO/lDjW3g==
X-Received: by 2002:a65:4c4e:0:b0:39d:21c4:2381 with SMTP id
 l14-20020a654c4e000000b0039d21c42381mr19584031pgr.566.1650463731631;
        Wed, 20 Apr 2022 07:08:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/27] systemtap: Fix build with gcc-12
Date: Wed, 20 Apr 2022 04:07:55 -1000
Message-Id: 
 <943f1054e98c39357a223abe56bd93eb34c23d3f.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164675

From: Khem Raj <raj.khem@gmail.com>

Backport a patch to fix
| ../git/util.cxx:1766:56: error: 'std::pointer_to_unary_function<_Arg, _Result> std::ptr_fun(_Result (*)(_Arg)) [with _Arg = int; _Result = int]' is deprecated: use 'std::function' instea
d [-Werror=deprecated-declarations]
|  1766 |                        std::not1(std::ptr_fun<int, int>(std::isspace))));
|       |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b360d12203aafd8bf96433d11221a6ed910a11f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ility-re-tweak-for-rhel6-use-functio.patch | 49 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
new file mode 100644
index 0000000000..f885c44460
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
@@ -0,0 +1,49 @@
+From f199d1982ef8a6c6d5c06c082d057b8793bcc6aa Mon Sep 17 00:00:00 2001
+From: Serhei Makarov <serhei@serhei.io>
+Date: Fri, 21 Jan 2022 18:21:46 -0500
+Subject: [PATCH] gcc12 c++ compatibility re-tweak for rhel6: use function
+ pointer instead of lambdas instead of ptr_fun<>
+
+Saving 2 lines in ltrim/rtrim is probably not a good reason to drop
+compatibility with the RHEL6 system compiler.  Actually declaring a
+named function and passing the function pointer is compatible with
+everything.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=f199d1982ef8a6c6d5c06c082d057b8793bcc6aa]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util.cxx | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+--- a/util.cxx
++++ b/util.cxx
+@@ -1757,21 +1757,24 @@ flush_to_stream (const string &fname, os
+   return 1; // Failure
+ }
+ 
++int
++not_isspace(unsigned char c)
++{
++  return !std::isspace(c);
++}
++
+ // trim from start (in place)
+ void
+ ltrim(std::string &s)
+ {
+-  s.erase(s.begin(),
+-	  std::find_if(s.begin(), s.end(),
+-		       std::not1(std::ptr_fun<int, int>(std::isspace))));
++  s.erase(s.begin(), std::find_if(s.begin(), s.end(), not_isspace));
+ }
+ 
+ // trim from end (in place)
+ void
+ rtrim(std::string &s)
+ {
+-  s.erase(std::find_if(s.rbegin(), s.rend(),
+-	  std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
++  s.erase(std::find_if(s.rbegin(), s.rend(), not_isspace).base(), s.end());
+ }
+ 
+ // trim from both ends (in place)
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 04f7e03ab5..ce86d5274d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -7,7 +7,8 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 require systemtap_git.inc
 
 SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
-           file://0001-staprun-address-ncurses-6.3-failures.patch \
+            file://0001-staprun-address-ncurses-6.3-failures.patch \
+            file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.25.1


