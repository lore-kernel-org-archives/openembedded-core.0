Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C581EEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.26482.1688656047303019279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rUQTCt/a;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b89cfb4571so4937905ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656046; x=1691248046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEKxPU/w3F/Wibz22B9RmWDTWFnJQWyN8IO76f/Jns0=;
        b=rUQTCt/aG5KPaAZkKW5m5FnwxqPzAsUACEXohUhbtJDrRYmqp5jQH0i5HLyMYOH9cL
         PDvFaALny3qlStHwPIYqikfM7nHRtt10f+EawfMNN/5qTZGJ3UZX41cD9/YqhlQ/xWzM
         lNhEsOyLmTtecF32M/UnDmCZnQsMIOhGoHduUtZdDlkh6dixM10gBDLa85m0FlvodevU
         16Z5/fY19+ngjpC6VxHmvYBtOXtOLoQs2WxL/cDe8Qn4q8iNS+UZHy3l504eLgYRPHBq
         +ukrD2Be4VlW7VHX5QHwUV8a/FMoub1cf030IjcDNzZxMyNTmptRWS9EjBcuotLiEDBy
         OTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656046; x=1691248046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEKxPU/w3F/Wibz22B9RmWDTWFnJQWyN8IO76f/Jns0=;
        b=P2fTk1chIXv5Dd5NRH0V/b18SiRN2eCQue0qKCAcfYWLE+D8Ge5ADlYzhjMA4ti01P
         ASV8NAq6yeOlzY9g9XB0gaOfiGG4yMh4Qw/g2D69dl/Mi/TUZeuIquLjRsParuOd38/3
         BCUWO1UC/0HXNWUDvCdBSngCKAKlI1co+0scFLg7XzCzgYq57s4R4rJ/aqOPdQgv49fD
         oNauFwZsctGkHSEAqBMZbr/EF7m3RAfsX+XkndeUTw56R/yNX9iwKZWJCCfWIjwCURzP
         fECnCuQZ5wMK8ZNYhnAtc1aGQoHeAjPdNKxUrqUTlx+b9H3+4OkD7BMgVmkYmUtowVIM
         QuBg==
X-Gm-Message-State: ABy/qLaT4K4lgZieWKkfII3eDeI7heTRqKfTxTqTv7LZk5i7RyGNl3T0
	8NEW1epEJbvTnGIa+Xom16jvxErmcrN/NsMKmbY=
X-Google-Smtp-Source: APBJJlHrLVu3lW3HI/IoDnrMUCNiZ1dVkyt9vSFZzu7N5+r6uYMDV7Kw8Ocy2kHtGeX9VdeeVcDAOg==
X-Received: by 2002:a17:902:ec87:b0:1ac:8717:d436 with SMTP id x7-20020a170902ec8700b001ac8717d436mr2448948plg.60.1688656046338;
        Thu, 06 Jul 2023 08:07:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/28] useradd-staticids.bbclass: improve error message
Date: Thu,  6 Jul 2023 05:06:26 -1000
Message-Id: <572c507736b2fcc31f7f13cb3da0d5be361838f5.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183976

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Current error message is difficult to read:

ERROR: Nothing PROVIDES 'image'
trs-image was skipped: image - image: normal username test does not have a static ID defined. Add test to one of these files

It's not clear that first "image" is recipe name, second "image" is
binary package name and that "test" is the user account which does not
have a static ID defined. Improve the error message so that these are
more explicit. Now the error message looks like:

image was skipped: Recipe image, package image: normal username "test" does not have a static ID defined.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 07898218f3908a83e07178b6530dfa48d55d4ec2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 3acf59cd46..e5527f0529 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -41,7 +41,7 @@ def update_useradd_static_config(d):
     def handle_missing_id(id, type, pkg, files, var, value):
         # For backwards compatibility we accept "1" in addition to "error"
         error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
-        msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        msg = 'Recipe %s, package %s: %sname "%s" does not have a static ID defined.' % (d.getVar('PN'), pkg, type, id)
         if files:
             msg += " Add %s to one of these files: %s" % (id, files)
         else:
-- 
2.34.1


