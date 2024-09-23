Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCBECF9C69
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.36192.1727097266153282734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RauB2oB1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7191fb54147so3191597b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097265; x=1727702065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPjCl8W+KDlOVbGGxQXN22aUziAB2mFfuC2bdAkTiZg=;
        b=RauB2oB1tYqs4iSxl5mx28Sqln+FQNV/X/RI8d743pX3iZmambpGVETwOOPVJdQkOK
         b8sDxHB+W/hjQSoMxgzPYT6MOcf6JaBXakk+W2G7VBLurqZgQ+DXAQPxIKT+Iz+VFg2f
         yHCmcvPJ+OOHzOC7tLSnCAyAD35fGhDwbSW5tUeQ65M4UTksR0ya0kogNqU5ex8eAzBl
         cgV9EuCJ6j6+ncpDu2vJLGGeL39jAh3CN8dXlUbOtDw3UM6f9kCEWxZGNf6Pp9YQjA3k
         qVzmtnu8cyotzpyglGIRPM03UbYQ9PKNNrJPGYPgFXn+PkmMFyGZI+RW5gAo+LR+0Zdy
         lhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097265; x=1727702065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPjCl8W+KDlOVbGGxQXN22aUziAB2mFfuC2bdAkTiZg=;
        b=qMMRYGAHfWiUOhKwN1Sey1+eOjTZrNJaeadP0r0NLJHScUXWw0yMaRi8hj27O6HBqW
         bOZAJEhxRGP3J0SCoLC7EN0mydp9wY18vkG/rw9u6OGblRSuXhfYuT5qQNsii8KVjzzz
         OlWvwfCI//Ub6Zo0ChX78cdV3ebUzDAbeNb4efYZ+sI+8EKvsHfjHwJ+3C+4FgRNE7oo
         m0SfRaWbP/UNL5lbYVbV71siJkRVXbiFGjMI42y62yILVf7hKMsw0+67NhC/afjqxT+i
         1kkCQEv3BKtrAjBT/R1HZoY94P0aoNhg2MIrg3GHzKz51yZolqJeCWrFPo9e70LDt3Pn
         KXmQ==
X-Gm-Message-State: AOJu0YyCqtf7l/k4saGH9EKoYPqV23Zkp9DTgZvI8RPRExc1/dV0w5x6
	IngzswWPT3ldqH8LXnNErD/uqcSHw9m9p8VScdaXTTxIWq8jgO6ADsRbKsqDx6VNppmoXxEn/4T
	4+kw=
X-Google-Smtp-Source: AGHT+IEbrWwbbHlQ5ZwfJ21lxeZqzbVGdyKVMU80f1E477whLGlgbCZH9iu2vreZsRdtf3x+wW2piA==
X-Received: by 2002:a05:6a00:3d4c:b0:70e:9907:ef75 with SMTP id d2e1a72fcca58-7199cc457bemr20801814b3a.4.1727097265339;
        Mon, 23 Sep 2024 06:14:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] testexport: fallback for empty IMAGE_LINK_NAME
Date: Mon, 23 Sep 2024 06:13:55 -0700
Message-Id: <a821a5810ae6edba5882a43e3c60c142f2acda9d.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204820

From: Konrad Weihmann <kweihmann@outlook.com>

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testexport fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

(From OE-Core rev: 0c1d098e6dd08fa3a5aafca656457ac6badcef89)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 1b0fb44a4a..deb68ec6ce 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -50,7 +50,7 @@ def testexport_main(d):
     from oeqa.runtime.context import OERuntimeTestContextExecutor
 
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')))
 
     tdname = "%s.testdata.json" % image_name
     td = json.load(open(tdname, "r"))
-- 
2.34.1


