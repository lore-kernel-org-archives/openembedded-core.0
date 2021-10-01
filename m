Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD31C43217
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.8177.1633096245775635926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UlzOSC+S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o19so7305570wms.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xiLhumF1/0mERgYIjds2r3u6oQrz7zLMY4F9905mYsU=;
        b=UlzOSC+SDBk1K79U9frnUqU1B8TugGFsbc74n0Uv1RrQ1+s5VUX0iWmwbfAYa3oGvN
         UAvlqgBxy3iOVpXATHl9TIH4KefuPL04+6E14xNaj9TR6MVPwiAsf1yMy+ohUfkM3mzF
         NxzyvQBdCJKYBnfhSR/9vIk7i2cGyHudV06N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xiLhumF1/0mERgYIjds2r3u6oQrz7zLMY4F9905mYsU=;
        b=wD1PdUVBal+ogJJl1DqVqj1AXNWgRO4W000AqHnAoCyTZcn7eYV+PDthor2Uk5HdJ8
         GaE91y2JPqYrwYm0uPTRas6648WE3hBjUPIzhGUl2YJ6ygYh2zGS5jiti5Ke0bQh/dI0
         +9Z/edvtBcAh+rNXbdO50eUyTy2DjEOrhTYhSP0WPuEG4o59k/z3W3gJc8yNE4az7Xfz
         lX4qeFmllGAKE/Xa+sL6jYtV9sRuQJ7u9w5VkGFdLa3GDgCQnaoerfbx2TKfBxsX51NQ
         G6vfNFgVIJ0GP284IxlVHzzvmToWMIuzJMDH4k97bkBqom4qJaBiMhrhsV4WGJWn7WNU
         KJrw==
X-Gm-Message-State: AOAM531Zw9AAM/qxn63gQ378/Dzp2x3pix+KLHFvs+SiBF7VNhKlrMK8
	Sbo2TD1wpw0c1uBcC/098ovp+M5UbyVyrcr/
X-Google-Smtp-Source: 
 ABdhPJx0whjdIld+ecBQpfdOsvkNJQvEU0//HiFSIo+KI15XLIUr+nl9QKmV+Hent7WRuUhqdcN9pg==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr4598762wmq.95.1633096244186;
        Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] libtool: Allow libtool-cross to reproduce
Date: Fri,  1 Oct 2021 14:50:37 +0100
Message-Id: <20211001135040.2251283-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156522

The hostname removal from the script is useful to make libtool-cross
reproduce. Apply the patch everywhere as it doesn't cause any issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc | 1 +
 meta/recipes-devtools/libtool/libtool_2.4.6.bb  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 6748d7468e7..7104c98c203 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
            file://lto-prefix.patch \
+           file://debian-no_hostname.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index 95bbc875f09..fb40ce7317a 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-SRC_URI += "file://multilib.patch file://debian-no_hostname.patch"
+SRC_URI += "file://multilib.patch"
 
 RDEPENDS:${PN} += "bash"
 
-- 
2.32.0


