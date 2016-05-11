Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5845676F8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so5033423pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=obeQuMdvWRlHjDvvElxWE/wgAjIaJIPYXlsaQE0yBzU=;
	b=QUzpX3mfLyy014jbZQXh1SCpg5ka9uoqecETyuG52eFFL+reqY/1+j1mPsI2epaV0J
	9Vah5SnI9o/LtOa+MJZjA15kH2Ke4GY4+ZQPJqgS6Jjq+p6X0VdVvjY1r3+CnSnIt6oU
	PudF89tAuXAnniH2CJOZs2++NzBJEm0ixxeWAREnRwd2mytk7uHp/xR39Ze74EXgmVkd
	cqeJv8QoBg13qPzdCN8a3pwFB14TDxfI4lSLhq+8Qf2mcvkf6jj4+75VmG5JejH2fgBd
	XZf6KrG2zQ/lkdCA210ivd3v38VHtvr7wlOBHrlFKgE5xHnTIzmhlQYBv/a9FtVuUw5L
	RI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=obeQuMdvWRlHjDvvElxWE/wgAjIaJIPYXlsaQE0yBzU=;
	b=KeOOEEiM6CYaFaQxP9ivDlszIgIP4iNQz+HdyAAUOmgg/ebJSJGONIGVdU2DdMjTMU
	EzDchm+G7wajZWxz1ni//6vnMQ24wxffGohtyYWtvxtKgmnKcG2/E53NC24o/Jgj3HuC
	Cc7Pgl6ob9QGC6StQblHfAqg7AvICkiyur0C8aLCIrgsziEynu1I4e1zxmJIN3O4AW1I
	yVzBGvyKk/dIZW8taOg3SKOXJivYVbnquusYwTLvtCGg9Pef2BfzBdud3LY5gxPNU/SX
	NKVVG13O1FUzViPtlZ7mhKnWmNQvnLlgTZkn0lbYnUb1NhxA7vCHhWv5Jajvku+7vDRA
	sbow==
X-Gm-Message-State: AOPr4FVbLlNDSxwFVf0Mfv3ezeOEu+E+SU1jbe9LogNqID6EMDpYFoQmCah4R7lpOlY0hA==
X-Received: by 10.98.0.203 with SMTP id 194mr6781023pfa.126.1462988177404;
	Wed, 11 May 2016 10:36:17 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:28 -0700
Message-Id: <db0ae65cd1a5dec1a2946c30e8282e4e8003e1d0.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 25/42] bitbake.conf: Empty out BUILDSDK_CPPFLAGS
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
X-List-Received-Date: Wed, 11 May 2016 17:36:16 -0000

The nativesdk sysroot is already being passed in
via --sysroot option, adding -isystem is redundant
and more so it causes build failures with gcc-6
since it messed with internal search order for system
includedirs

see
https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/Q5SWCUUMWQ4EMS7CU2CBOZHV3WZYOOTT/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07d171d..9c865d7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -495,10 +495,9 @@ PATCHRESOLVE = "noop"
 ##################################################################
 
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
-BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
+BUILDSDK_CPPFLAGS = ""
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 export TARGET_CPPFLAGS = ""
-#export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
-- 
2.8.2


