Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38280C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.32835.1635699527167138033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1XhmqCQW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id s24so10126650plp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R5bnXChyzvxjw7JaRBB8YvxKyUG1/Z9FKgbR4Mr/ZEA=;
        b=1XhmqCQWjeLVe+tiuO3MpNsIUASY9nytgj3k1iw0rUQSizP7eG/iKCDJVOBo3LZtUl
         I6IZw6Q2+dpYUPTTC8yvc6US3S2mn/sb1rTIB5+t/b6/fJlIBiqoVr9E6xDo27hX7uvZ
         NVHo5RkL2dQ2FZQeVvz+jaVSY1RvDpSeZrc4aFYiTFb23KgzAQzeoNrsA2EXQ/PI+KzZ
         B7xcBMMA0bs3SLga+S75rg0yiyUV64v4zaYUKBlurfIYnGiHFQ8KtB50++d+7oJ9ABIp
         HGdSXBEyJRE5qozGSvCs/jQz8G1pJS0GTj3FRHHfmdGkcLqwwwYHEJ5RllSZ3g/uoggK
         arkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R5bnXChyzvxjw7JaRBB8YvxKyUG1/Z9FKgbR4Mr/ZEA=;
        b=j13U3Ie3JPs72gf9buUpZPoMxCfTosPeYWRLIO6mUAoU5Qltp1rWgeQns3b5kXHzY7
         88mK51HdkdNAlUmppngEIYUbeKEtv2iHXOYNrNHuHYGqf/qJAh14lbIP0KL/8uAwx6gx
         uDRrB2otd3ZZauMbFnsheSSeoU2gLDRNh/ivi5BcOptPWHzw2P3XLhGzmhxbX0QdilVJ
         wsjyqCfRi0xMQ9cNiOQ0UUYhqZHVO6TG44Vpq1nldOCgxboihqCPf+wPptFNIW8S8R2y
         UtDaeSy6yGTGppMgo2NSEVJsv19D5bwNG1/MEd3kmuT8QNnd7jhgGU1DUvtce/QNrYhX
         4vYQ==
X-Gm-Message-State: AOAM530tcQHell7qhz7Wy42avpgvruYx9tEP3uOrfgKHu0iSie6lnT6M
	qB7Yg8sgVSiosXrkn9nKESDy2jc6q5W/1ob4S2M=
X-Google-Smtp-Source: 
 ABdhPJzcL1utMGz98laa3Vi3DMvfdCx5U04FW3YqIeJZQmM0nqPr0JBcNiA5e6TNwwplZxQZPrKnrQ==
X-Received: by 2002:a17:90b:4f4c:: with SMTP id
 pj12mr4095744pjb.218.1635699526113;
        Sun, 31 Oct 2021 09:58:46 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/29] git: Fix determinism issue
Date: Sun, 31 Oct 2021 06:57:41 -1000
Message-Id: 
 <c0a30230fc6dc509f3b20b150f6e152c6c772a17.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157680

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ae740939f8315c64fe7571f912404127a29dc89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git.inc           |  2 +-
 meta/recipes-devtools/git/git/fixsort.patch | 36 +++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 738a429875..2b75bed055 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -10,7 +10,7 @@ PROVIDES_append_class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
 	   file://CVE-2021-21300.patch \
-"
+           file://fixsort.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
new file mode 100644
index 0000000000..eec1f84945
--- /dev/null
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -0,0 +1,36 @@
+[PATCH] generate-cmdlist.sh: Fix determinism issue
+
+Currently git binaries are not entirely reproducible, at least partly 
+due to config-list.h differing in order depending on the system's
+locale settings. Under different locales, the entries:
+
+"sendemail.identity",
+"sendemail.<identity>.*",
+
+would differ in order for example and this leads to differences in 
+the debug symbols for the binaries.
+
+This can be fixed by specifying the C locale for the sort in the
+shell script generating the header.
+
+Note: This is a backport of Richard Purdie's original patch for a more
+recent version of git. The offending code in this older version is
+in generate-cmdlist.sh. The upstream current version has this code
+in generate-configlist.sh.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
+
+index 71158f7..c137091 100755
+--- a/generate-cmdlist.sh
++++ b/generate-cmdlist.sh
+@@ -82,7 +82,7 @@ static const char *config_name_list[] = {
+ EOF
+ 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
+-	sort |
++	LC_ALL=C sort |
+ 	while read line
+ 	do
+ 		echo "	\"$line\","
-- 
2.25.1


