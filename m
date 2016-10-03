Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 93F3860191
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:16:36 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p138so153936317wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T8TrA0kZ5uEg/eUIDKP8bSg89rSlWgy/MFF2jQjjAEg=;
	b=DtzVpan+HFt3j4G8DqS47ptsRzcIuR2Mwt0WRN5aNm3udnhQkIW+DU8i6smBkei+WB
	zazF3l1Sn6solkvi7xIa1tgIj6cIpgmoLpBhCXuMn1pW6c2JOHD9g4CzomxxnuABFFKi
	ozrXQYKdLWtfipl03JI82SWp1lXZPoSbD2bE/dSSTlXOlS91Fuiwxz/y8/HCnqAdlqpg
	EHo46jls7nA89jLDKmGnWbPfgtC6j093w1WbQ5I8UtOJZMrzPhnsLK7UF8x3Czop3vzn
	6/PLcPKmTMVt6aNEcgXZXLPGeu03XsU3Z7zSK1lb9DpfyIatjKQyJnqQdNNDwk94jAN5
	9k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T8TrA0kZ5uEg/eUIDKP8bSg89rSlWgy/MFF2jQjjAEg=;
	b=lh1zJhrlRnTPI7UnG6viLWwtiI1gqKYPC3fKRosx+Mim8mhFsJtsv22CSuduu7c1eT
	GQE8J6XXL5zHXD6HrrQStTw1QjHLflLlhOwZ+d8HAtuVTCbdaMct1envGvoBlTBlFV59
	+QVOPhLTteNtgoG0LdpUcD1MttCl+F0ND4iQYMkqRGBDRcPL2kC8ASIUXw0nJYo5Z0j2
	naQSUkGFsjp3l+/J5XSjmiJGB6tDytilYsz3tscEGBtwd0bb1dZ//NSgGbSMuHOYGndh
	l2jf+TDt4bNzwzynNVnVMx7bPXvQWWf4Qzzz/2kVjyEizk/G1RV3ABXEr08VWKDeOvKV
	UHJQ==
X-Gm-Message-State: AA6/9RlS34bnJb78I4eVzZ3Gjb9yCa/cb26Xz2lGfcepH2soxjyAFHBSZ6dShyW/be8Gjz/3
X-Received: by 10.28.230.203 with SMTP id e72mr10693366wmi.13.1475504196158;
	Mon, 03 Oct 2016 07:16:36 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yt4sm34606312wjc.48.2016.10.03.07.16.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 07:16:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 15:16:30 +0100
Message-Id: <1475504192-17738-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
References: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] classes/native: set lt_cv_sys_lib_dlsearch_path_spec
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
X-List-Received-Date: Mon, 03 Oct 2016 14:16:37 -0000

This variable is used by libtool to know what paths are on the default loader
search path.  As we have modified loader paths, native.bbclass can tell libtool
that both the sysroot libdir and the host library paths are searched, so no
RPATHs for those will be generated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/native.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index f67ef00..143f8a9 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -87,8 +87,7 @@ datadir = "${STAGING_DATADIR_NATIVE}"
 
 baselib = "lib"
 
-# Libtool's default paths are correct for the native machine
-lt_cv_sys_lib_dlsearch_path_spec[unexport] = "1"
+export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
 
 NATIVE_PACKAGE_PATH_SUFFIX ?= ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
-- 
2.8.1


