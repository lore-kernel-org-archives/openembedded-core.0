Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E992DC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 23:09:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1550.1719443382406439070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 16:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MAJRVHhw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61B331BF206;
	Wed, 26 Jun 2024 23:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719443379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+vAt4hGocs2OT4MSFRWbmiRhjKI/nvklTuFZibrVqk=;
	b=MAJRVHhwH6CX9m85b/usrKOLpNocCUIv/dVV1P/QmVXifXBS3aJRpHotWTNfptRfeJuk9P
	IXVEY/QIbnNxIgD/IDQVU3POhqx9lKki6UXJxKyjPAHLILz2VjQqSZ4VMVXJTpAfekC6xD
	4ugvJV2q3LqMQDURzLDYO/1AdzETLaboiR2Hs9e/46IGCp6ls0lPkcS02Zz2pgBN/0w/oR
	4X/zBqDHIoeWhSNkdKxvS4zoXWUHcJeCe+0020eYJC51T70Y1bfwcBN28WVmSAgJAVQkb5
	YNvVzIZWqcSvbyHvJE0vpfogx61Gd44XTBWm7tfb2vfk1uN3a3w4KZGURVtJEQ==
Date: Thu, 27 Jun 2024 01:09:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com,
	=?iso-8859-1?Q?Jo=E3o?= Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] acl: Fix nfs ptest failure
Message-ID: <20240626230938fc033ae6@mail.local>
References: <20240626055637.2195328-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626055637.2195328-1-mingli.yu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201181

Hello, this fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6574/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6751/steps/12/logs/stdio

On 26/06/2024 13:56:37+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> * The date such as "Jun 13" should take 2 columns, so the expected check
> item "test/sub2" should the column 9.
>  # ls test/sub2 -dl
>  drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> 
>   Corret the check item to fix the below failure in the test/nfsacl.test.
>   [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- failed
>   drwxr-xr-x 07:23                      != drwxr-xr-x test/sub2
>   -rw-r--r-- 07:23                      != -rw-r--r-- test/sub2/blah
> 
> * Use the abosulte path otherwise we won't find the expected file blah.
> 
> * The calls to getgrnam_r would always fail because the size of the
> buffer was smaller than the minimum (170000) specified in the test
> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match directly
> because getpwnam and getgrnam should never fail on ERANGE.
> 
> This commit fixes the following failure in the test/nfs/nfs-dir.test test:
> 
> [16] $ su bin -- failed
> su: user bin does not exist           != ~
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
>  ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
>  ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
>  meta/recipes-support/attr/acl/run-ptest       |  2 +
>  meta/recipes-support/attr/acl_2.3.2.bb        |  3 +
>  5 files changed, 169 insertions(+)
>  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
>  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
>  create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> 
> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
> new file mode 100644
> index 0000000000..c48ee9f820
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
> @@ -0,0 +1,46 @@
> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 17 Jun 2024 11:22:21 +0800
> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
> +
> +Use the abosulte path otherwise we won't find the expected file blah.
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00001.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/nfs/nfs-dir.test | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
> +index 33e5f5f..7216a6e 100644
> +--- a/test/nfs/nfs-dir.test
> ++++ b/test/nfs/nfs-dir.test
> +@@ -14,7 +14,7 @@ EXPORT_PATH => the path that is mounted at the working directory.
> + 	Make sure the file can be accessed before.
> + 
> + 	$ su bin
> +-	$ cat test/blah
> ++	$ cat %{EXPORT_PATH}/test/blah
> + 	> blah
> + 
> + 	Set up a situation that triggers the bug.
> +@@ -36,12 +36,12 @@ EXPORT_PATH => the path that is mounted at the working directory.
> + 	fail with "Stale NFS file handle" or "Input/output error".
> + 
> + 	$ su bin
> +-	$ cat test/blah
> ++	$ cat %{EXPORT_PATH}/test/blah
> + 	> blah
> + 	$ sleep 3
> +-	$ cat test/blah
> ++	$ cat %{EXPORT_PATH}/test/blah
> + 	> blah
> +-	$ cat test/blah
> ++	$ cat %{EXPORT_PATH}/test/blah
> + 	> blah
> + 
> + 	Clean up.
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
> new file mode 100644
> index 0000000000..f990ca4a31
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
> @@ -0,0 +1,51 @@
> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 17 Jun 2024 11:00:43 +0800
> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
> +
> +The date such as "Jun 13" should take 2 columns, so the expected check
> +item "test/sub2" should the column 9.
> + # ls test/sub2 -dl
> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00002.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/nfs/nfsacl.test | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
> +index 4f37322..dfcc323 100644
> +--- a/test/nfs/nfsacl.test
> ++++ b/test/nfs/nfsacl.test
> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL support.
> + 	$ echo blah > test/sub/blah
> + 
> + 	$ cp -rp test/sub test/sub2
> +-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> + 	> drwxr-xr-x test/sub2
> + 	> -rw-r--r-- test/sub2/blah
> + 
> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL support.
> + 	>
> + 
> + 	$ cp -rp test/sub test/sub2
> +-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> + 	> drwxrwxr-x+ test/sub2
> + 	> -rw-r--r-- test/sub2/blah
> + 
> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL support.
> + 
> + 	$ setfacl -m u:daemon:rw test/sub/blah
> + 	$ cp -rp test/sub test/sub2
> +-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> + 	> drwxrwxr-x+ test/sub2
> + 	> -rw-rw-r--+ test/sub2/blah
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> new file mode 100644
> index 0000000000..2fea254fec
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> @@ -0,0 +1,67 @@
> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Luk=C3=A1=C5=A1=20Zaoral?= <lzaoral@redhat.com>
> +Date: Wed, 19 Jun 2024 11:11:30 +0800
> +Subject: [PATCH] tests: fix getpwnam and getgrnam
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The calls to these functions would always fail because the size of the buffer
> +was smaller than the minimum (170000) specified in the test implementations
> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getpwnam
> +and getgrnam should never fail on ERANGE.
> +
> +This commit fixes the following failure in the test/root/restore.test test:
> +
> +[21] $ chown bin passwd -- failed
> +chown: invalid user: ‘bin’        != ~
> +
> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwnam_r
> +and getgrnam_r")
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00000.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/test_group.c  | 2 +-
> + test/test_passwd.c | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/test_group.c b/test/test_group.c
> +index 96dd612..42d6b07 100644
> +--- a/test/test_group.c
> ++++ b/test/test_group.c
> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
> + 	static struct group grp;
> + 	struct group *result;
> + 
> +-	(void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
> ++	(void) test_getgr_match(&grp, buf, sizeof buf, &result, match_name, name);
> + 	return result;
> + }
> + 
> +diff --git a/test/test_passwd.c b/test/test_passwd.c
> +index 9428bf8..97f2673 100644
> +--- a/test/test_passwd.c
> ++++ b/test/test_passwd.c
> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd, char *buf, size_t buflen,
> + 		*result = NULL;
> + 		return ERANGE;
> + 	}
> +-	last_buflen =- 1;
> ++	last_buflen = -1;
> + 
> + 	return test_getpw_match(pwd, buf, buflen, result, match_name, name);
> + }
> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
> + 	static struct passwd pwd;
> + 	struct passwd *result;
> + 
> +-	(void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
> ++	(void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_name, name);
> + 	return result;
> + }
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
> index 3af75c84fe..bc7947c3ad 100644
> --- a/meta/recipes-support/attr/acl/run-ptest
> +++ b/meta/recipes-support/attr/acl/run-ptest
> @@ -6,8 +6,10 @@
>  
>  mkdir -p /tmp/acl-ptest/test
>  cp test/test.* /tmp/acl-ptest/test
> +export EXPORT_PATH="/tmp/acl-ptest/test"
>  
>  set +e
> +rm -rf test-suite.log
>  make test-suite.log
>  exitcode=$?
>  if [ $exitcode -ne 0 -a -e test-suite.log ]; then
> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
> index 6178473873..ee86ce2cae 100644
> --- a/meta/recipes-support/attr/acl_2.3.2.bb
> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> @@ -19,6 +19,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
>             file://run-ptest \
>             file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
>             file://0001-test-patch-out-failing-bits.patch \
> +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch \
> +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch \
> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
>             "
>  
>  SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201151): https://lists.openembedded.org/g/openembedded-core/message/201151
> Mute This Topic: https://lists.openembedded.org/mt/106885245/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

