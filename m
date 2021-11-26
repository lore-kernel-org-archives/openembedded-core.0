Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D9EC433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.20170.1637901392653637791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=StjK6L8Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z6so7699161pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZwjJ7kd8p+FFNsUTBseGuoegUx/Iwr4thw/t4y2Mm3w=;
        b=StjK6L8YwU1oWDC/BICk9BllvTQJcYA5DIbLgqihbDA5AXXpKpX7wFxkWmehYDTEj3
         p7lXtR3CFGoEir+PKKYPiGIdcJctc7saDZwKQhzJtEJjQDd+ubYcXlWeZZNG1wq/e1K5
         fY/uLw3tRFFqyW9c0lBNAF4+teNnOb740nw1C+gdXbpmQvBVZYeGgtccUFHaFuDxJ5IP
         KQGIL+xSxn2/C4CJbr4YsoJpP9Rxl+tVcu6xkmvaP6UzJw85epMXrvfE7KCCYqiokmCr
         ldd3f0tXd1sUHUTcbauVp0nbgmVb1CChaJzsk8vYFTSi7TEeCRvt3/+QJoYgVegthhDz
         ogEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZwjJ7kd8p+FFNsUTBseGuoegUx/Iwr4thw/t4y2Mm3w=;
        b=ZU1yyVREwOIOD1fZOg5hiYGhGsrLK08sCVr1Fc1hpy5sY7b2V8sVmcOGkNS9j6bLxA
         qHOVfetn+KYAmkNxazfldCD7J5cikkPt3qLqdg7Zi7bakGOmRxkTcyVj+HPryh0t8Q1W
         3gowDxVLPK7xzWWqnbY4YHXTojFeZAMs967vUdULqChAv7xxDgc6tcGFT/NYr9G+V8NE
         SqV7NwgEM4pflGvRfjxzv2adu6NhOIS98yF5HsrYOpG6DXDFsXrnl5w4Ka/ljoZ2X3iY
         nICN9bWKciM1QCEX63fbrDIlccUmW7lt0e9IJDVzLxGkCqr9bpz+/7K/xAX+YtMckIY7
         ZS3w==
X-Gm-Message-State: AOAM53200uAHwRRCOH4x0y3qMW15/8vY1cNScmw8ipVt3+QtAX7uDcBP
	0FBWO4U1T5SZmNaJtqBdhcqvX1M5pgM=
X-Google-Smtp-Source: 
 ABdhPJw36euZHY6y1/kcqhDBeqfL4rvTR+5Zm+0YXjUCWSC9MEu8FlPDY/FYMaA4KQQ/8+zco54ipA==
X-Received: by 2002:aa7:8b14:0:b0:4a3:a714:30ed with SMTP id
 f20-20020aa78b14000000b004a3a71430edmr18408765pfd.2.1637901391803;
        Thu, 25 Nov 2021 20:36:31 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 20/26] recipetool/create_buildsys_python.py: less
 distutils
Date: Thu, 25 Nov 2021 20:35:59 -0800
Message-Id: 
 <29ca205dca70847b0ef6d4db6f70eddce2544f9a.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158816

distutils is deprecated in Python 3.10 with removal in Python 3.12
(~October 2023). Replace distutils.command.build_py with
setuptools.command.build_py.

There is still a check which decides to inherit setuptools3 vs distutils3
that will need to be refactored when we add pyproject.toml and setup.cfg
support for more modern PEP 517 packages.

Once distutils3.bbclass is dropped, any recipe inheriting distutils3
will throw a parsing error. The plan is to move distutils*.bbclasses to
meta-python. However if meta-python is not in bblayers, the parsing
error would still occur.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 0b6b042ed17..570be7e81b2 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -8,7 +8,7 @@
 import ast
 import codecs
 import collections
-import distutils.command.build_py
+import setuptools.command.build_py
 import email
 import imp
 import glob
@@ -459,7 +459,7 @@ class PythonRecipeHandler(RecipeHandler):
         else:
             package_dir = {}
 
-        class PackageDir(distutils.command.build_py.build_py):
+        class PackageDir(setuptools.command.build_py.build_py):
             def __init__(self, package_dir):
                 self.package_dir = package_dir
 
-- 
2.30.2


