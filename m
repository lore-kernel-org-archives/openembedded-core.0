Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id DD39261C0A
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:09 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 2so8514952pfg.12
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=w7k1HGd9hBJX8mrf80fvsGku+qwTfThKwb63iI8aHGI=;
	b=AQOHHWdsRCm4Ssd8g0Fpwt1cNZmNoD1pR6Kfhk5UbRn6qXBDzB62edi5lVA2ydX/f2
	B6LprjMu0GnFPYgLBhrt2NT/8QgDYB9sCu3nn0I+zzEjf8rtXRPwdoSNhBzF+vALYKzE
	1Z8gs75W352g4IvdfGsPgjBH+I0zChJdBrjht/9OqUL+7LhZ5aP2YlF3uIySLuiDDcDX
	z1q7Nm9mUFsceudb9q/zh21UQt/oOMED5mjs+G7HuLUqa3SDx3jj7196lrrvlPu9unXU
	OX7oGVWlmi9ZDFEijCUxFdZVrEopQmP98qIR3/wHaC3xFieKh02Y+O+c9UJL6Qpwe6uE
	DuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=w7k1HGd9hBJX8mrf80fvsGku+qwTfThKwb63iI8aHGI=;
	b=r1i5Etxt9zPH0Gj+4AjbN4mEqF0EhLt5CtvQY6cSa9cT+9XXDYY5JvtT0mTlyI5Zb3
	JUh78pV6+1SZ9yIxchSVoTPfHRjrzsY29h3Dx0QxIRn0UI0pt/sDt8jZ5P1YPIa70P0r
	mNrypFNolRQo6WREa2HJh+JV4fbx9EFNXbkDRtLvDLjprIrL/oJooVVhCcLQSdn6j3o9
	edhFWENFdnDHSLDFRk4U2ri6zKf/8yLMo6cgw6urEdnZJMgAGxnUx3YJW3wqxrw602/w
	eTAjvNKoNcnCxwi6rK20Y7mKXblozFIFUJ3jyJ+yyDfKIGzfBv9ejlZX3K/vnZ5IbGmb
	fcYQ==
X-Gm-Message-State: ANhLgQ1fHsQhJlQE4DtauRniIyLmVqRxfvtXSkEJ5jp1yUREnptXgnp0
	k4Taje7czqTgb+n8aZHSh6J0MRtE
X-Google-Smtp-Source: ADFU+vvmSt2yTUcU/JY8ZCsM/RZCCdfOvkPs4SIl40GHa759/BNzWfUxQz3XKEptQp52CvsX/KadSQ==
X-Received: by 2002:a63:5709:: with SMTP id l9mr21998310pgb.1.1584295929908;
	Sun, 15 Mar 2020 11:12:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:51 -0700
Message-Id: <2f4428d8a7af49b7f251e863b7d4f21301ed1c43.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 09/16] gcc-target.inc: Prevent sysroot from leaking into configargs.h
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:10 -0000

From: Nathan Rossi <nathan@nathanrossi.com>

Prevent the full recipe-sysroot path from leaking into configargs.h. The
configargs.h header is intended to be static and unchanged as the
content is used as a means of determining that a gcc plugin is built for
the same gcc. This also effects the output of 'gcc -v'. Due to per
recipe sysroots and staging, the sysroot path would be replaced with the
sysroot local to the recipe thus changing the content of configargs.h.
This change also improves gcc binary reproducibility. The sysroot path
is replaced with the base target root "/".

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8d6e2ab68ee5e341fe970b191bfd334e6d2c40b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bdc6ff658f..987e88d32c 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -137,6 +137,14 @@ FILES_${PN}-doc = "\
 "
 
 do_compile () {
+	# Prevent full target sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins. Additionally the path is embeddeded into the output
+	# binary, this prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
+
 	oe_runmake all-host
 }
 
-- 
2.17.1


