Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEF6C47DAC
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.52014.1705270484458795038
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T136c0jF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso11145795e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270483; x=1705875283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R52fLyrsmSD3iAQqdDTFrY+4XPuWr/xbBfQ6SmMMg+o=;
        b=T136c0jF1Qhn3IdUCSYKdU570AkkLxR1iRtr259gDcIKLSmNLiLPAFOvUzQumjNQuA
         dotCHP36KNfVzKPtxqRg5rzg64CCmlYUf8Vr6DEu6SVtMJLVMQ1Sy2jIy06dl/wo/fXz
         F+IsotPNMgWG+szn5DRHd/2bQTcm2m+brQxNBssdAvIhq8K3y4JgcSEHA2+s27wvb23H
         licpgdrEDlUgYWzDQ5zsTopRG5S1pn9ZCjdwd0u8TZFCZpp+QcfJ6A8pJITOUzK2qPqI
         lmFbzv9cOjLNOjtwRSqodvKEdyXXrWOxn9ZmvSpOZX6zd3UeUxcwdZdOxI47mDaHJzTL
         bSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270483; x=1705875283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R52fLyrsmSD3iAQqdDTFrY+4XPuWr/xbBfQ6SmMMg+o=;
        b=MSa5wgIFWb3OixW83kAbBAKSRGpgB8Q4Udmp2Q0q6RIBsO4tWlYTwh65L8qLevAu6V
         0nyWkb8ktdcduRMJJ2TGTBT3u5IDUcO69U++ST0gxN0GzoM+f8n4XgXUlgH0uCZORdPB
         7cvERLpUYGHOjD+jV9vlp0XEmrjsNGwkTOpKdhuTjOFbXqK9f0BCCTRG+e28o+wrcP8j
         nlf2n3ow6O7VYDwVqLdH8cuymmnM8e62JaVb+EdWThA4dL63BTxm4d0TjvcfKYQJbG3f
         /0qnQ7kAxf9NekX7PQt7N6/+e15YcDLOyjmD1RkizIhACaH1LlKbRVOLYKEDOrO7kLAG
         qsWA==
X-Gm-Message-State: AOJu0YwYKIpy2u56RJM9AFEralTZzy3ydGHO8+48fv0GkFfJPYoUVMBJ
	3WcnJqHehY2404J5wENlx/4Ggxhgvn0=
X-Google-Smtp-Source: AGHT+IHdNt3gcuqU3aQ/EAiD9j5Hb8da7KQYjiLjnyb+E4zprRAMNln+ZM78xeShRsqoEifW40/ndg==
X-Received: by 2002:a05:600c:a06:b0:40e:4181:a549 with SMTP id z6-20020a05600c0a0600b0040e4181a549mr1596241wmp.163.1705270482737;
        Sun, 14 Jan 2024 14:14:42 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 2/9] devtool: support plugins with plugins
Date: Sun, 14 Jan 2024 23:14:14 +0100
Message-ID: <20240114221437.1255866-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193620

Pass the plugins search path to plugins via context. This allows plugins
to search for their own plugins at the same paths.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/devtool | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 3aae7b93b4b..60ea3e82985 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -299,8 +299,9 @@ def main():
             return 2
 
     # Search BBPATH first to allow layers to override plugins in scripts_path
-    for path in global_args.bbpath.split(':') + [scripts_path]:
-        pluginpath = os.path.join(path, 'lib', 'devtool')
+    pluginpaths = [os.path.join(path, 'lib', 'devtool') for path in global_args.bbpath.split(':') + [scripts_path]]
+    context.pluginpaths = pluginpaths
+    for pluginpath in pluginpaths:
         scriptutils.load_plugins(logger, plugins, pluginpath)
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
-- 
2.43.0


