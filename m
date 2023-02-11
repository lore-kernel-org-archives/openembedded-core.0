Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58972C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:37 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.19577.1676150672043703265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v47KsNft;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso11108063pju.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCGjYlfdcFM2+KIV8Bvgx4MeBFfEz42Ovq+MpEtxLIw=;
        b=v47KsNftPWaREsFRQWW4sP4+omEi8RSDPhXJ8NlucyiQZKHTS96bfKh8TBrHsZ11+R
         36L5NXB2NmpWDzYQMjZ8Gl5gNs1FjttL6nC2EDLvUc18nH6bh8qaOvZuO09JHnnQSdzH
         kv/qvRxi0YNXHe93jUWNrBzS4/yIx1OKnrN1KXg6cdXaYj6j0kRGm21QlpAq54CW8wi6
         WZ8hsaSb/1LFF6SyCFIzHMdCtysOmyvrYKUFIc5j9IMGXA9xYemuC28Qdv8AW4TF7v/0
         vsQ6QkasqrrMU6X7DDMCIeCf95hKSo2767MhVJ5SZ5bq+syYdJ7IT1neGINGmxHrCdm8
         wQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCGjYlfdcFM2+KIV8Bvgx4MeBFfEz42Ovq+MpEtxLIw=;
        b=5en+KJKmVpzJQNysF1id01QRpUvObozib2hM/bG0FbH2JmigJBWqK7VGl9nkW9HJ++
         PO84r9tZjh/WOcW4IUQgc4ctkDiSikfOT5xX6xicM8ntsrR6OwOnNrdCKP+rG9t6QSVm
         cYvH4+4iL58oBVrRUEBGm1hpEJBBqLrUE8j5AJEBhIs3qP86e/3OiFXJd9bKpOonJ30J
         Owbbn8+9RENqoBau7PkLoXlFLkkKfD/5ZBAweogUeqW8i4wrC3ff5c/yfrtugDSffDtF
         Te+YpCkdxM+N7vyo8w3sdp3+P+i2CFrIFpbpQAKuGzb/bCPAjVJssqkHF3CP1ryhL2LD
         2ukQ==
X-Gm-Message-State: AO0yUKUzqSlDi3gpmw5xhOOMC7sBimSGe0xygwyisbUKOSpCy5/QGCOk
	M1zIq8vZJ+BIkAIV1pIwBsslZy7evF5ndk5ZyXM=
X-Google-Smtp-Source: AK7set+BYIdtBXAx6pj9rPj+Pu9+4EY65tOFYgdd/3f9WkGpjR7SRPhvmztAN+v+d1eas4Yd9y+w3Q==
X-Received: by 2002:a05:6a20:4403:b0:b8:9f05:5216 with SMTP id ce3-20020a056a20440300b000b89f055216mr27612627pzb.57.1676150671035;
        Sat, 11 Feb 2023 13:24:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/28] apt: fix do_package_qa failure
Date: Sat, 11 Feb 2023 11:23:42 -1000
Message-Id: <92f001f231a905e0a5c035c9de0e1ca502ba5a8c.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177029

From: Changqing Li <changqing.li@windriver.com>

bitbake nativesdk-apt failed with error:
ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

an empty dir apt is installed under /var/log/, fix the failure
by removing the empty dir apt as what we have done for target.
apt will create it when it does not exist.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b035a59d7915da784f1e6678ee130f30d7ceb8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 4b9f804039..ccdbd3d652 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -126,6 +126,7 @@ do_install:append:class-native() {
 
 do_install:append:class-nativesdk() {
 	customize_apt_conf_sample
+        rm -rf ${D}${localstatedir}/log
 }
 
 do_install:append:class-target() {
-- 
2.34.1


