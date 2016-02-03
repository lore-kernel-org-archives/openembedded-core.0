Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id F34C577367
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:07 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id u30so9309157qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zmwhEgA2V0lQ3pK552yUPtU1jhQNXzJonhU9U9lTmgE=;
	b=b+FqKIuINu+YhlpXs4iCFqycn2IZubI0VpETvsJjPisrzBQT74vHTZ+NObsW+ygwvE
	6c7ZX6XdbCL8WOg13bBpq7ChR/w0L+9aEq2ZphhZsZ4n/c8U8DPEeYxEkDb/1wLiZtMJ
	/UtCvarJ01cvXD/pL61WggsmAxNwdeh3JMSbDbPZDwNFIw7jKyXMrC7gTT46zekXfq6S
	rcoKGakoDYBMLS5lcgcQzc9B2BoE3tdeBSIxnalHQzRXOJlKr3rgOVS3WXwGb9Jfa0B0
	GoGTK70ry+xxEF42JQRaeuS3hwCpkhlEMWLe1U6ae6SVXxAoJ8nquMCo5/5x8s46o9Pa
	k5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zmwhEgA2V0lQ3pK552yUPtU1jhQNXzJonhU9U9lTmgE=;
	b=kmrk/F7uukghcWBmgj0jOxWhrvX/ij/A53U7feE1gP0K11Ifxuv2MAtBv4rE2ihLEq
	Ketv0yDAfHWE6gOWUGZTJH7504JCSOrgn0hX2Q86L8z+FaYsSjCKzmwjqv9Oc26l/JSt
	pHAk8WolydIXaWmTLc/fnCtpXqwfpT2JWy2abFTPM3ktdcQbVvl7hbkVefKo64lqvMgl
	ggPQ9VfcHSnilzGejz/Mogrx8zf/Z+0KCuoK4hbyQAO2lhZ+xzZ6KLmtP7hBQOxwA9ZA
	51HDjFyB621ZHOzTRJCgg1sb56AUV/SHbi076s7sFZWSKyKAfrgDSnEtMyye9nIG7K8K
	yPdA==
X-Gm-Message-State: AG10YOTUAnY35BZpvQkXjOOqiY5cGEqHdbwD5VndHPNk51RMNmmbUXeCq4ALnggswKIMrA==
X-Received: by 10.140.144.144 with SMTP id 138mr40304967qhq.102.1454480888368; 
	Tue, 02 Feb 2016 22:28:08 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:58 +0000
Message-Id: <3dfe2b3d59ae8b6c04b1615e204f1eb08ef2260c.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
References: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] gcc: Assume libssp and dl_iterate_phdr on musl
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:09 -0000

gcc configure fails to set these settings correctly
on musl based builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index e12bfad..83e061f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -123,6 +123,7 @@ EXTRA_OECONF_INITIAL = "\
 "
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
+EXTRA_OECONF_append_libc-musl = " gcc_cv_libc_provides_ssp=yes gcc_cv_target_dl_iterate_phdr=yes "
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
-- 
2.7.0


