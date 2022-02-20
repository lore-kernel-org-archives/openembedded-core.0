Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258C6C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 08:47:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.19666.1645346870963333216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 00:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPlMiYnw;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id qk11so25441142ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 00:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=633vC7Dbzj3y1L8zvUl/b3TFw60wrkHfsJnGznpc3T0=;
        b=hPlMiYnwVbptYe8iGGtXFC9/h3SfyBrLk5m+1it4NLHhPqk/p2G8UFTbHwk5Apb+WC
         WpQ/Uim9vCRVp+r+Ub0hHZ18Wu4Ha0q8euhOi9VvsOeun7j1hu1pV7dWq09uwBKMJEiK
         pjZvxWLVlqkjf4wEmvTW0gtcG++4gf6IFUjyYqKWyPzbHxa+RUHa5cD85kXTLyt7CHpd
         OBRQ5zv+/4T9EwWBNmq3KpCMFP1UKugca4W05Mk5HSjYtgRZe82KSSkP0Gky4qqsEuyc
         I+NVq+zKTVpF9Cq3TkeAK1c/D1/l7e2duF7SRbXLLuP840dlfHd7ij1tDVvRA77OKSoO
         YWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=633vC7Dbzj3y1L8zvUl/b3TFw60wrkHfsJnGznpc3T0=;
        b=gypT2weYXoTODwCxU+gQ+zm3B8i47tepyByv2j+QPGXs8kbfu4uqv/ArTZFM6Si/vS
         9Bz7C/12N1aCFkIpiz+XqyP8PheIB+qJdqrDIefAYMFsXTiUZ6gyjkl2hSJxsAf213In
         6tuTvKO/NeCQBag+s8g/QcnpT8JAbUtcH7oOyr0/TdD37bNCMCawvPVkjvFUA3tWx5Q0
         IkQ0QquUHfhg1x5DR7roJ2zByxiA1h0m41TJ41OrKW3H8COTlzb0647EXdOiRZxen9v6
         9IkntGoiXrwL0w8yPmpbF0Yx7rD5KuA3P78v0C/xZeIGg2vHJkobw8mVBF1Kc+wVGxSP
         gJXQ==
X-Gm-Message-State: AOAM531HlPmnaycfpqwCcpme8p/zwDDldWdPZhbvfANX7yBwrT3ctmub
	oQ+EGMj3glBZGofKGWP775DOtPsHv2eYdQ==
X-Google-Smtp-Source: 
 ABdhPJxWkgrXgQ8Yw8Nuzwf7vd8cd7lPt146SQhL2KgdHVU49wgEAgXqULnGnfqDVfzT1Sq/VCPTSA==
X-Received: by 2002:a17:906:7e52:b0:6b8:e7db:f725 with SMTP id
 z18-20020a1709067e5200b006b8e7dbf725mr11780683ejr.225.1645346869353;
        Sun, 20 Feb 2022 00:47:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 a26sm3872576ejs.143.2022.02.20.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 00:47:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] systemd: fix DeprecationWarning about regexps
Date: Sun, 20 Feb 2022 09:47:43 +0100
Message-Id: <20220220084743.166080-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 08:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161980

* fixes:
  oe-core/meta/classes/package.bbclass:1342: DeprecationWarning: invalid escape sequence \.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_250.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core/systemd/systemd_250.3.bb
index 0fe5fb7976..9121333f56 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -352,7 +352,7 @@ do_install() {
 
 python populate_packages:prepend (){
     systemdlibdir = d.getVar("rootlibdir")
-    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
-- 
2.35.1


