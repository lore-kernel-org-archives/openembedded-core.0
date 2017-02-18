Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id CF5CD6069D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 04:59:58 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id z67so20919299pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 20:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RttQVKhX8Z57ss5RzqvzA/sa/MbJFITrVfc+TrY/TwQ=;
	b=mFW3zd6HOrEZVVQNmA/FprFuIAu7+OcPXMBunh1crACTH0YbF+Ug5DY298T2oyUgmL
	0xGf+rm+PcD02oRsj7bYZ49A8NG0FVVxjKErq8F3oC0d7fzo0+LBX4GHaKTbEI43NQrz
	/CRtv/vwFvEPKDXg+sKr4MSzWS4K72KT/7IBtkMbWMECZJbsBb0Zik41qDVjdLBKampe
	P3q4nHBRlfBv3TUUj/NGEQcWoZcxUr9NNsBJCdbN89UXFxpMnx/t9ox3vZp+CHW4UlXr
	kByEwbz9m+5H74ySkUzs8lFtD2a+muMaJ6fS+yMQe3YKMDSxSp+Hlj04nDjdUGXBj/nF
	/7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RttQVKhX8Z57ss5RzqvzA/sa/MbJFITrVfc+TrY/TwQ=;
	b=XSxYKSdggCQ2MtXdfMQXy4mvMOk1Ke18+WStqPAwvuRvv5Yqa7pNNFyzix0W0XFwF1
	kMFNRlZTVNfsVa6dl0RWSqK3KqewN1sibLtSAC4Y8Hx7YZtHNY9M6DV7rO4NJ9n6Ed1n
	yM4pVC3P7jyxr44fD/d6S6v2MzvKBZoD62z1ALeaeiKuhSoDLmeh7BQbzL64/mRVnZR0
	55mTow23pOu8tygj/jIm0oMIOwT9Toei+5rNqu7yXJpxtEd8UVU+r6kBqXW7ILtNYAa+
	kpmTA7FP5sHGP9P22byDzFLYmF+v17Y1RE3zQO5/nD4dY1h5T+4m9zQHKuHYNnQRcNRu
	RkHQ==
X-Gm-Message-State: AMke39lHlzqLmIn4UUCsJCaeppoyZ70iLqHym+v8/ve9ZqXekfqP7zUFKhlIzZZRFkl5XuBr
X-Received: by 10.98.103.195 with SMTP id t64mr13458311pfj.106.1487393998698; 
	Fri, 17 Feb 2017 20:59:58 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:500b:e44f:ac4d:8121:59db:d806])
	by smtp.gmail.com with ESMTPSA id
	m20sm22480506pgd.17.2017.02.17.20.59.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 20:59:57 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Feb 2017 10:29:49 +0530
Message-Id: <1487393989-6667-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3: fix failure to run python3 in a multilib env or when BASELIB != lib
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
X-List-Received-Date: Sat, 18 Feb 2017 05:00:00 -0000

Having hard coded "lib" string in lib_python path, searches for modules
under /usr/lib/python3.x directory. This would result in an error on
multilib environment, where BASELIB is other than lib.

Example: On qemux86-64 with base_libdir and libdir as /lib64 and /usr/lib64
respectively, would result in below error when python3 is executed:
-- snip --
root@qemux86-64:~# python3
Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
Fatal Python error: Py_Initialize: Unable to get the locale encoding
ImportError: No module named 'encodings'

Current thread 0x00007f65dbb53700 (most recent call first):
Aborted
root@qemux86-64:~#
-- snip --

Similar issue observed at:
https://knowledge.windriver.com/en-us/000_Products/000/010/040/040/000_LIN8-4040_%3A_python3_does_not_work_in_a_multilib_environment

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...remove-hard-coded-lib-string-for-multilib.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch

diff --git a/meta/recipes-devtools/python/python3/python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch b/meta/recipes-devtools/python/python3/python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch
new file mode 100644
index 0000000..786f086
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch
@@ -0,0 +1,37 @@
+Having hard coded "lib" string in lib_python path, searches for modules 
+under /usr/lib/python3.x directory. This would result in an error on 
+multilib environment, where BASELIB is other than lib.
+
+Example: On qemux86-64 with base_libdir and libdir as /lib64 and /usr/lib64
+respectively, would result in below error when python3 is executed:
+-- snip --
+root@qemux86-64:~# python3
+Could not find platform independent libraries <prefix>
+Could not find platform dependent libraries <exec_prefix>
+Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
+Fatal Python error: Py_Initialize: Unable to get the locale encoding
+ImportError: No module named 'encodings'
+
+Current thread 0x00007f65dbb53700 (most recent call first):
+Aborted
+root@qemux86-64:~# 
+-- snip --
+
+Note: LIB is defined with actual base_libdir used via -DLIB during
+compilation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+diff -Naurp Python-3.5.2_org/Modules/getpath.c Python-3.5.2/Modules/getpath.c
+--- Python-3.5.2_org/Modules/getpath.c	2017-02-17 00:58:28.312583182 +0530
++++ Python-3.5.2/Modules/getpath.c	2017-02-17 01:01:58.984805492 +0530
+@@ -502,7 +502,7 @@ calculate_path(void)
+     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
+     _prefix = Py_DecodeLocale(PREFIX, NULL);
+     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
+-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
++    lib_python = Py_DecodeLocale(LIB "/python" VERSION, NULL);
+ 
+     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
+         Py_FatalError(
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e..26f49f6 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://configure.ac-fix-LIBPL.patch \
             file://python3-fix-CVE-2016-1000110.patch \
             file://upstream-random-fixes.patch \
+            file://python-3.5.2-remove-hard-coded-lib-string-for-multilib.patch \
            "
 SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
 SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
-- 
2.7.4


