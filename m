Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A478E60745;
	Tue, 29 Dec 2015 11:22:06 +0000 (UTC)
Received: from cpc92302-cmbg19-2-0-cust1434.5-4.cable.virginm.net
	([82.1.213.155] helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aDsLu-000331-2g; Tue, 29 Dec 2015 12:22:06 +0100
Message-ID: <1451388119.1472.230.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Dec 2015 11:21:59 +0000
In-Reply-To: <CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<1450910987.2002.86.camel@pbcl.net>
	<CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Tue, 29 Dec 2015 11:22:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-12-24 at 09:09 +0000, Burton, Ross wrote:
> 
> That's good to know, thanks Phil.  Does  your work not build openjade
> -native?  As I said that needed .la files to be present in my testing
> so I'm wondering what the difference is.
> 

Oh, yes, you're right.  In fact I don't build openjade-native
routinely, but a bit of git archaeology reveals that I do have the
following patch in my tree as well.

From 803f05d54a38be5495fa81e7fbc53f1b582317ee Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@brightsign.biz>
Date: Tue, 14 May 2013 11:59:37 +0100
Subject: [PATCH] openjade: Fix build if not installing the libtool-garbage

The openjade build system is slightly funky and does strange things with
library dependencies.  Fix it up so that it depends on the .so rather than
the .la (which may not exist) for libraries from the sysroot.
---
 .../recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch | 11 +++++++++++
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb       |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
new file mode 100644
index 0000000..9317512
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
@@ -0,0 +1,11 @@
+--- openjade-1.3.2/Makefile.prog.in~	2013-05-14 11:42:02.646782318 +0100
++++ openjade-1.3.2/Makefile.prog.in	2013-05-14 11:54:55.051728343 +0100
+@@ -12,7 +12,7 @@
+ 
+ ALL_LIBS = $(XLIBS) $(LIBS)
+ Makefile.lt:
+-	echo 'LT_LIBS='`echo $(ALL_LIBS)|sed 's/\.a/.la/g'` >Makefile.lt
++	echo 'LT_LIBS='`for d in $(ALL_LIBS); do case $$d in ../*) echo $$d | sed 's/\.a/.la/g' ;; *) echo $$d | sed 's/\.a/.so/g' ;; esac ; done` >Makefile.lt
+ 
+ PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
+ 
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index b37009a..845d2d7 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
            file://msggen.pl.patch \
            file://reautoconf.patch \
+	   file://no-libtool.patch \
 	   file://user-declared-default-constructor.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
-- 
2.1.4

p.



