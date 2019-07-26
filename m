Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D673E7EEEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 17:15:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t132so25061702pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Fw+OnsMSaPrmmLXTG2F1Xn9FOPtsHTuXaAnT6P0zSe4=;
	b=M0DfHy0nYCuoxH0FJiyL53X6/F7b2vz4RrQdBUj73mFqAMCoflXKgmu3RxlAaI5wQP
	vdQuG7Jl8LeFpjF79QYxpBzD2wzqL1cpqLrVA13d6hgpFZ7cW3aqdyhnobttZm3IxMLw
	EGbxElfcaXRmr2uZ52nSQ6XugoJI7rFQ767vKlm37UJrvBZZi07JvATwRR72vd6DTOBc
	GSjIrBx4FapxVh7ngObEHUcQcZ7GXs8nWEX93of443Gg0lqAvQnD7C+11H2d0/wcyhr7
	CBQqq+OUrD69BJm438KxJmaKfisRGd41oLGlfK1mibwsU06InZ0/xhyuZV8DC9Wwm4s3
	O9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Fw+OnsMSaPrmmLXTG2F1Xn9FOPtsHTuXaAnT6P0zSe4=;
	b=E2ADk151mbWBptPLUTkYNcAEZUt5CFQLqPFQJS7KmNc8lmNhXNuU+2kL9+1DwHo64T
	t7hbKITx9tvmRRKiVrR6ht3EjssPbyHCRyy9bEdZCdOJmLLJcQ+96iEM8R18fCYkbGtn
	PoSPle0a6mwky29LT7VWDF07+Rz6CT9h4AtXGyTynfZJJEyCtvOgFIHKekyy9yCPwfWa
	yiW31kV41eOLrDHalIt5jLZ7+KkS1FawyGkuOS960eqcePbZxz9RRcR4wER2zHtTXZs1
	IavdkNayKXNT21HsjpLKbTjPXmS8LXAmCs20S2g7/mhXkh3vzb/A9n1WoksPefALZB/W
	W18g==
X-Gm-Message-State: APjAAAXP09XepqUQlsvY/8RZuImrKgvEBQjzryMWKCmfDe5mk+TSzn0Z
	qZwSj0JcyWu1D72y/y2LSz6bRBQyWro=
X-Google-Smtp-Source: APXvYqw9GOQUhIY9K3QDXBQKfUefhx1kXGitsPb8nkNvQvrkfrzLwuMED+08IE+hcJhu3A6xB2e9lw==
X-Received: by 2002:a63:8f55:: with SMTP id r21mr91145884pgn.318.1564161319491;
	Fri, 26 Jul 2019 10:15:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p67sm62533159pfg.124.2019.07.26.10.15.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 10:15:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 10:15:09 -0700
Message-Id: <20190726171509.29091-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726171509.29091-1-raj.khem@gmail.com>
References: <20190726171509.29091-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-ust: Check for gettid libc API
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
X-List-Received-Date: Fri, 26 Jul 2019 17:15:18 -0000
Content-Transfer-Encoding: 8bit

Fixes build with glibc 2.30

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...config-time-check-for-new-gettid-API.patch | 57 +++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch
new file mode 100644
index 0000000000..15db1d3af7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Add-config-time-check-for-new-gettid-API.patch
@@ -0,0 +1,57 @@
+From 2bb3e259d0410f16a8b2058a05af434376a1583a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 09:57:32 -0700
+Subject: [lttng-ust][PATCH] Add config time check for new gettid API
+
+glibc 2.30 introdoced this function see [1]
+so its best to detect it
+and provide fallbacks only if its not present
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=6399
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2019-July/029131.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac            | 1 +
+ include/lttng/ust-tid.h | 7 +++++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7fa059a..b1099c1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,6 +137,7 @@ AC_CHECK_FUNCS([ \
+ 	clock_gettime \
+ 	ftruncate \
+ 	getpagesize \
++	gettid \
+ 	gettimeofday \
+ 	localeconv \
+ 	memchr \
+diff --git a/include/lttng/ust-tid.h b/include/lttng/ust-tid.h
+index e669d7e..7995c78 100644
+--- a/include/lttng/ust-tid.h
++++ b/include/lttng/ust-tid.h
+@@ -26,7 +26,10 @@
+  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+  * SOFTWARE.
+  */
+-
++#include <config.h>
++#if HAVE_GETTID
++#include <unistd.h>
++#else
+ #ifdef __linux__
+ #include <syscall.h>
+ #endif
+@@ -49,5 +52,5 @@ static inline pid_t gettid(void)
+ 	return getpid();
+ }
+ #endif
+-
++#endif /* HAVE_GETTID */
+ #endif /* _LTTNG_UST_TID_H */
+-- 
+2.22.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
index a8eebb223b..861a05e6a8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.4.bb
@@ -27,6 +27,7 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
+           file://0001-Add-config-time-check-for-new-gettid-API.patch \
           "
 
 SRC_URI[md5sum] = "19916ff0dec23c90f985586a8cbd1fd2"
-- 
2.22.0


