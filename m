Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8AE74C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id 20-v6so8369949wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4OUIi0+qMu25QvvbFspK98dZo9nryi0DDEfowv+94Z0=;
	b=BIHKm3OGzT9Qzq0lRnPjyTur0i8T9QKzVlcTOida1YUmPfbzR5EVu+ln6fTQvCZ2Hx
	QwA/vnPAEq5VUsCSXc/CdL1wbe9HEr3J3UNnc2IB2fupyKGrO1qOZJN0dfqAwTznq0iP
	gucuMFbuKNidI3rjaNCf6tYFSp3SL1V1Fz4Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4OUIi0+qMu25QvvbFspK98dZo9nryi0DDEfowv+94Z0=;
	b=X41VeIaVRIu3Z5aFGuqR4FS6PUDrPS/klzwdNbtYLjMJt72KvxuFxCQfgI6Qs7iNqI
	2fnhWx0+xCEpP1hQTrzm3bZ33xfbauIy65fGgOCx0CylVFtD/tK4mPvbcZtbROmOxbmp
	ewqJ9UuFBwn+1zJhGkdAyENhps0nq8drXD1eK+F/yqwe7W5MdD3p2IREIrwW3cyguvqU
	2f7TPsVX1nFFylJI7K8bomYHx65mphk4PmRz2Sy6So317hx3I3yN8peSzdEhShR/SjV9
	6J4dYDISlBIsDHlD7WGJ2JOpbn5hbm/SwgTPTFhg+3lErnYpvGzwKdanvjmZVMhhRBky
	fKww==
X-Gm-Message-State: APzg51A6ZamRs0zqhJ2ADTa3UOJ6CzYYpUMt9/gX3+kRGSqRiiYWvq3v
	E9V4q6rbxG8n4dQbRD0/n8+ymdVy4v4=
X-Google-Smtp-Source: ANB0Vdazq1n6uyK5cx9nF/og6deZ2gTgDh11hQKb2R3rf5ewW/IOVMDysUTehcbYNgDUqlNvKj/e+g==
X-Received: by 2002:adf:e910:: with SMTP id
	f16-v6mr27405848wrm.126.1536166355566; 
	Wed, 05 Sep 2018 09:52:35 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:24 +0100
Message-Id: <20180905165227.29435-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/8] populate_base_sdk: Stop running gcc --version all the time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 16:52:35 -0000

Running 'gcc --version' for every image recipe is slow and increases parsing
time/resource usage for no good reason. Only compute the value in when we're
really running the task/function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/lib/oe/utils.py                   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c456c52866a..bbf1ff1cd29 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -259,7 +259,7 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d)}#g' \
+		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d, taskcontextonly=True)}#g' \
 		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index f22a6ab596d..fbda7035f1e 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -342,9 +342,12 @@ def format_pkg_list(pkg_dict, ret_format=None):
 
     return '\n'.join(output)
 
-def host_gcc_version(d):
+def host_gcc_version(d, taskcontextonly=False):
     import re, subprocess
 
+    if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
+        return
+
     compiler = d.getVar("BUILD_CC")
     try:
         env = os.environ.copy()
-- 
2.17.1


