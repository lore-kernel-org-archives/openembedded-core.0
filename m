Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC7477194
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:38 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id z24-v6so3769969pfe.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=TOM3YVlGmCnoKLKf+YX5/39nlEYndj8Xq/hYxs4hDk8=;
	b=ihmhH8MCHUJZExyiDU9zh6z51uv196LPgCHrLKTRtMJfAhRErG2ymfDhbIqQb09Ut/
	BbfKNKA3kEiCqClsJcae3i2Eo9VMeiQ+G5ACYY6KRSfOGbe8F7h9DlysWyHWYlCYaaSS
	BdgtmatP2I3HKWD3aT9rMWwHg9jlc3ghRJ3TQz34R7GxVhvnArGwhiKrZzhNU78BfFpF
	HtVxS0oX35TR7lunVH7Maal8gW+8t/o7e3QBAgCpRQn0aJFwIdJqpuhAX4UBr5xRMpg6
	dIaIcdbxtBEyRWigNsXNzj3thdnPdg1FryDLRw54lWmDB6eOosIhUiqWYer30PxQFCAn
	aLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=TOM3YVlGmCnoKLKf+YX5/39nlEYndj8Xq/hYxs4hDk8=;
	b=BABZur5bzKmzA6dT6E6IGRY76J3nLsS7Yv+Jy3D8XE8O/w74/inzxgOR+R0Bb0LBmt
	79u+CGWx3jqGd+0a0Suq3/mgwDryGl1RWjIoqOkvQX+T6cmkAd3DQKVnfq7ICWOuoOD6
	ud3Ag1e2XDLZ7Q0lfAbZV26VlqPfmpS/pD6ka09NT+Dxpq2j+Qcy5zQGZPIoVQ2/rnXa
	7p2oL6yfDPQVIuAquN/OnBwni7nv69Fj8vheeAjM01trSsbZpCDxy33yJX3QYWhav08g
	r+ACTHi+0PM/enjcPRM1qm7yGgjAgOLS0BBpKHqfKBqMlQBkGIeB3P2DpS+oE5HDqw+/
	ChSw==
X-Gm-Message-State: APt69E159LeF5a3LDuQM76DGmvqJCjdbMyh/x0yNBMASFwc0o5NpKIDX
	6cCCBbfizUFEOM3NpZnasGCZhA==
X-Google-Smtp-Source: ADUXVKKSV1JrBcQCplMv5tulquPGRnv77b+fpDUOVJuMSc5SKD+x/8Zb3lGZn8OxOMoMtLBXYIf5sQ==
X-Received: by 2002:a62:c8a:: with SMTP id 10-v6mr3997469pfm.27.1528321059106; 
	Wed, 06 Jun 2018 14:37:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:28 -0700
Message-Id: <9c383be2c15b851e9f795c1037fa798ce1ce175a.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 12/12] linux-yocto: Fix GCC 8 -Wrestrict error
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pager.c: do not alias select() params

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...jtool-perf-Fix-GCC-8-Wrestrict-error.patch | 51 +++++++++++++++++++
 ...d-pager.c-do-not-alias-select-params.patch | 43 ++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch

diff --git a/meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch b/meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch
new file mode 100644
index 0000000000..6389da478c
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch
@@ -0,0 +1,51 @@
+From 233aa0194c7ca773866f3ec871f5d12d64ad44e1 Mon Sep 17 00:00:00 2001
+From: Josh Poimboeuf <jpoimboe@redhat.com>
+Date: Thu, 15 Mar 2018 22:11:54 -0500
+Subject: [PATCH] objtool, perf: Fix GCC 8 -Wrestrict error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 854e55ad289ef8888e7991f0ada85d5846f5afb9 upstream.
+
+Starting with recent GCC 8 builds, objtool and perf fail to build with
+the following error:
+
+  ../str_error_r.c: In function ‘str_error_r’:
+  ../str_error_r.c:25:3: error: passing argument 1 to restrict-qualified parameter aliases with argument 5 [-Werror=restrict]
+     snprintf(buf, buflen, "INTERNAL ERROR: strerror_r(%d, %p, %zd)=%d", errnum, buf, buflen, err);
+
+The code seems harmless, but there's probably no benefit in printing the
+'buf' pointer in this situation anyway, so just remove it to make GCC
+happy.
+
+Reported-by: Laura Abbott <labbott@redhat.com>
+Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
+Tested-by: Laura Abbott <labbott@redhat.com>
+Cc: Adrian Hunter <adrian.hunter@intel.com>
+Cc: Jiri Olsa <jolsa@kernel.org>
+Cc: Namhyung Kim <namhyung@kernel.org>
+Cc: Wang Nan <wangnan0@huawei.com>
+Link: http://lkml.kernel.org/r/20180316031154.juk2uncs7baffctp@treble
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Cc: Fredrik Schön <fredrikschon@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/lib/str_error_r.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lib/str_error_r.c b/tools/lib/str_error_r.c
+index d6d65537b0d9..6aad8308a0ac 100644
+--- a/tools/lib/str_error_r.c
++++ b/tools/lib/str_error_r.c
+@@ -22,6 +22,6 @@ char *str_error_r(int errnum, char *buf, size_t buflen)
+ {
+ 	int err = strerror_r(errnum, buf, buflen);
+ 	if (err)
+-		snprintf(buf, buflen, "INTERNAL ERROR: strerror_r(%d, %p, %zd)=%d", errnum, buf, buflen, err);
++		snprintf(buf, buflen, "INTERNAL ERROR: strerror_r(%d, [buf], %zd)=%d", errnum, buflen, err);
+ 	return buf;
+ }
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch b/meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch
new file mode 100644
index 0000000000..285b13966d
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch
@@ -0,0 +1,43 @@
+From ad343a98e74e85aa91d844310e797f96fee6983b Mon Sep 17 00:00:00 2001
+From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
+Date: Tue, 6 Feb 2018 15:37:52 -0800
+Subject: [PATCH] tools/lib/subcmd/pager.c: do not alias select() params
+
+Use a separate fd set for select()-s exception fds param to fix the
+following gcc warning:
+
+  pager.c:36:12: error: passing argument 2 to restrict-qualified parameter aliases with argument 4 [-Werror=restrict]
+    select(1, &in, NULL, &in, NULL);
+              ^~~        ~~~
+
+Link: http://lkml.kernel.org/r/20180101105626.7168-1-sergey.senozhatsky@gmail.com
+Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
+Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ tools/lib/subcmd/pager.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/lib/subcmd/pager.c b/tools/lib/subcmd/pager.c
+index 5ba754d17952..9997a8805a82 100644
+--- a/tools/lib/subcmd/pager.c
++++ b/tools/lib/subcmd/pager.c
+@@ -30,10 +30,13 @@ static void pager_preexec(void)
+ 	 * have real input
+ 	 */
+ 	fd_set in;
++	fd_set exception;
+ 
+ 	FD_ZERO(&in);
++	FD_ZERO(&exception);
+ 	FD_SET(0, &in);
+-	select(1, &in, NULL, &in, NULL);
++	FD_SET(0, &exception);
++	select(1, &in, NULL, &exception, NULL);
+ 
+ 	setenv("LESS", "FRSX", 0);
+ }
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 32e63a57d6..c05e042f37 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch
             file://0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch \
             file://0001-mips-Disable-attribute-alias-warnings.patch \
             file://0001-mips64-Disable-attribute-alias-warning.patch \
+            file://0001-objtool-perf-Fix-GCC-8-Wrestrict-error.patch \
+            file://0001-tools-lib-subcmd-pager.c-do-not-alias-select-params.patch \
 "
 
 LINUX_VERSION ?= "4.15.13"
-- 
2.17.1


