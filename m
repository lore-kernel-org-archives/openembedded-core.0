Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SgxmH-0006Og-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 14:43:25 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 21B26D2380; Tue, 19 Jun 2012 14:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 31615D232A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 14:32:14 +0200 (CEST)
Message-ID: <4FE0714A.1060603@linaro.org>
Date: Tue, 19 Jun 2012 14:32:10 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120611 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE0684D.2000906@linaro.org>
In-Reply-To: <4FE0684D.2000906@linaro.org>
Subject: Re: Is target toolchain supposed to be working?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2012 12:43:25 -0000
X-Groupsio-MsgNum: 23755
Content-Type: multipart/mixed; boundary="------------060803090508030402090507"

--------------060803090508030402090507
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 19.06.2012 13:53, Marcin Juszkiewicz pisze:
> ignoring nonexistent directory "usr/include/c++/"
> ignoring nonexistent directory "usr/include/c++//i586-oe-linux"
> ignoring nonexistent directory "usr/include/c++//backward"
> ignoring nonexistent directory "/usr/local/include"
> ignoring nonexistent directory
> "/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
> #include "..." search starts here:
>  .
> #include <...> search starts here:
>  ..
>  ../lib
>  /usr/lib/gcc/i586-oe-linux/4.7.1/include
>  /usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
>  /usr/include
>  ../lib/compat
> End of search list.

Attached patch fixed problem for me.

--------------060803090508030402090507
Content-Type: text/x-patch;
 name="0001-gcc-make-sure-that-c-includes-will-be-found.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gcc-make-sure-that-c-includes-will-be-found.patch"

From 56382cac2c337f9e620d538f8697737b2ca777cf Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 19 Jun 2012 14:30:06 +0200
Subject: [PATCH] gcc: make sure that c++ includes will be found

Without this patch g++ was not able to find headers:

ignoring nonexistent directory "usr/include/c++/"
ignoring nonexistent directory "usr/include/c++//i586-oe-linux"
ignoring nonexistent directory "usr/include/c++//backward"
ignoring nonexistent directory "/usr/local/include"
ignoring nonexistent directory
"/usr/lib/gcc/i586-oe-linux/4.7.1/../../../../i586-oe-linux/include"
 .
 ..
 ../lib
 /usr/lib/gcc/i586-oe-linux/4.7.1/include
 /usr/lib/gcc/i586-oe-linux/4.7.1/include-fixed
 /usr/include
 ../lib/compat
End of search list.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 34a73b1..077419c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r2"
+PR = "r3"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
index b2f91b7..25fceb5 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
@@ -3,4 +3,4 @@ require gcc-configure-common.inc
 EXTRA_OECONF_PATHS = " \
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
-    --with-gxx-include-dir=${includedir}/c++/"
+    --with-gxx-include-dir=/${includedir}/c++/"
-- 
1.7.10.4


--------------060803090508030402090507--
