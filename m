Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4A90071BE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 19:26:12 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id p142-v6so23784323lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=haNabaf4k5QkzRBmUURwKZUOe9RAVsEmqyqk3EH3kOM=;
	b=lkqK/GAmIs1ctEyupnr1r+Vavkk4SipisrCnDxbexn0xkCHpq1uRT5r2GwyTo4Md3C
	U2ZI3SuPA73h87q5qcVecjYqtmuiQi36xf5YSjPML6x1uOjkDSsc6ZRr0T4npD/WbbHG
	5DciXe4gQqaRADSVRILdVJf1lPmMKF35b5iCd4pZiYdfgBoMp0PfJpHotxsQEDcoL7o7
	S37d70LU07vh+3+GOlWgykGOTrvKXjhPAn442I46J8Gsz2YVG+7X5tQK47c4wDkBGHGK
	hec7wba+CQqoWmU48OxrFTF7NnWGU+GUPraqNfcXz08EeOjYGVcc0aEjRTKP1i8PhxmM
	1Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=haNabaf4k5QkzRBmUURwKZUOe9RAVsEmqyqk3EH3kOM=;
	b=OmlhD4gzs7qrvwQHxVM3Uts3C1Hh3HoY/X5LiqAiiuqTLFuSTxVVGHm40cgnqUyUw1
	9Os6G7rk1CsrF6uSSEE/fV4H+e38X3H/7fhT9r/xddBVWxWcEdm4nmO+UI9QfXhJ7VdB
	ypWAA5etLbhBMS3S+zmjNVqDb5d+KVpLCqPf4s83J8y7+3QwcfeJJSg1vlb0wJxH3atO
	Mb3f0iAjIofIvqNSRQvo5yN2jLQHG+CuSCjhobvcuWdWxWh6xhlFhoK26FX2MQBDFYlC
	2G+pl/Gduo1xK0IXRhjQ2NbGI89Wmh8/B2IoBas4R0GfZY6lRWnaE99lIcjKW06RECmu
	xEmQ==
X-Gm-Message-State: ALQs6tDBM/JOb4yt2BVpa4VhSixJSBBz5cSJpO7oeU726C9zz8PyGtWg
	taCHglN7dWQx2uRkhrBDpSdOoA==
X-Google-Smtp-Source: AIpwx4/obL3aWE6CaXFKJJs7aBIxWVqS+W4Wa/85pEACwZ3iZiXU1YXIL71HW2VsdtID+r0+4U/SIQ==
X-Received: by 10.46.62.12 with SMTP id l12mr9942538lja.66.1523906773277;
	Mon, 16 Apr 2018 12:26:13 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	j74-v6sm2976728lfg.92.2018.04.16.12.26.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Apr 2018 12:26:12 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 21:26:05 +0200
Message-Id: <1523906765-12497-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Mon, 16 Apr 2018 19:26:13 -0000

From: Ming Liu <liu.ming50@gmail.com>

It defaults to be '0', but it allows the developers to choose not add
file-checksums to do_compile for the entire source tree, by setting to
'1'.

We need this because we have a huge project with 100G bytes source
files, and we do not want them to be added to file-checksums variable
flag.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/externalsrc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c9f5cf7..16c6862 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -26,6 +26,7 @@
 
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
+INHIBIT_SRCTREE_FILE_CHECKSUMES ?= "0"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
@@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-    else:
+    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMES'):
         ret = s_dir + '/*:True'
     return ret
 
-- 
2.7.4


