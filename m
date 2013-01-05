Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrHRU-0000UB-G7
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:17:24 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so9465728pbc.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=sgQexMXnrfDb274yFG8olVqdyXHTKeMXViB4JtCtdUI=;
	b=hxFY69yjlNPY0nIWSwolcpxw11bJeBFbgWWWRrgsRwctUX0jqycloQjG7TwtP3I4PI
	KPD3cpn0nddm6bn2b18DOQVUsODyRIx+otDaZoG8OWbue0MfrdVWkFd49RnTUhplWFbo
	BT5q2o/WSjtXsAr1W9pKRY1uAAABfvS974zc0tHGLt1HaOgzp+zSOfRxPzvpHRjlhKlx
	WB4l3/BcOsPzE1C+2uy9WUQuGpRYM35RrnixvHRvw3ypBL3lfb8wLvs1ovWiwSjwmxnB
	K2w5MNN1w/L0q/d3WpC8WMO/7O1WWHdALHjsES9E3lalTXWHIqUFqCQrKpD4Ne0r6QLk
	mHrw==
X-Received: by 10.66.90.1 with SMTP id bs1mr158635417pab.19.1357344106134;
	Fri, 04 Jan 2013 16:01:46 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nf9sm33017692pbc.17.2013.01.04.16.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 16:01:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 16:00:57 -0800
Message-Id: <449d181c104843ef74cbc1f81a5a58f18051fc14.1357343832.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
References: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] eglibc_2.17: Fix Tibetian locale generation error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000

This is fallout of BZ #13950 fix to glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb            |    1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch b/meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
new file mode 100644
index 0000000..25c43a9
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
@@ -0,0 +1,38 @@
+cross localedef fails to compile these locales because name_fmt field is empty
+It is not acceptable for cross localedef and it errors out
+
+LC_NAME: field `name_fmt' not defined
+
+We therefore give a dummy string to the format, the real fix needs some native
+tibetian person to define proper name_fmt
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libc/localedata/locales/bo_CN
+===================================================================
+--- libc.orig/localedata/locales/bo_CN	2012-11-17 09:50:14.000000000 -0800
++++ libc/localedata/locales/bo_CN	2013-01-04 08:55:15.593612288 -0800
+@@ -145,7 +145,7 @@
+ LC_NAME
+ % FIXME
+ 
+-name_fmt  ""
++name_fmt  "FIXME"
+ % name_gen	"FIXME"
+ % name_miss	"FIXME"
+ % name_mr	"FIXME"
+Index: libc/localedata/locales/bo_IN
+===================================================================
+--- libc.orig/localedata/locales/bo_IN	2012-11-17 09:50:14.000000000 -0800
++++ libc/localedata/locales/bo_IN	2013-01-04 08:54:12.345609028 -0800
+@@ -70,7 +70,7 @@
+ 
+ LC_NAME
+ % FIXME
+-name_fmt	""
++name_fmt	"FIXME"
+ % name_gen	"FIXME"
+ % name_miss	"FIXME"
+ % name_mr	"FIXME"
diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
index 1a9c288..b71af1a 100644
--- a/meta/recipes-core/eglibc/eglibc_2.17.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://sakrah.dontexist.org/files/eglibc/eglibc-${PV}-svnr22064.tar.b
            file://tzselect-sh.patch \
            file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
+           file://fix-tibetian-locales.patch \
           "
 SRC_URI[md5sum] = "1464af54779c2c7d1078df9ce2e41791"
 SRC_URI[sha256sum] = "97c3991a3772f513cf704841d20c275ac48895fad2e27802dda557c0196cba6b"
-- 
1.7.9.5



