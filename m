Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1RnAmT-0000cB-H1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:17:01 +0100
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 34AD920F22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 10:09:26 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 17 Jan 2012 10:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=M6n0kg/lvl72qu32xBN/tBmMJi8=; b=t9+
	xuEAeSFGPyBWCAeWjlvF/+n7ZjBsQ0cb3hGRiUiCQxeNvB5ETW691T2XM2n/c2/f
	geMRVqBFixq4ajjQg5P8H0ZvJert+9+4XhhTZ9Yq1FFPjFDwwldl2wg7KCg3dwoH
	f2VhL302vo5gRDAqMWvTX42Q8lt8WR03TLyHR8BU=
X-Sasl-enc: q1E0h8T2ltRSKF0vv1dx2Ya2Lr/fenevJ7E9g1Abwnsa 1326812965
Received: from [10.16.189.124] (nat-pool-rdu.redhat.com [66.187.233.202])
	by mail.messagingengine.com (Postfix) with ESMTPA id 955488E0091;
	Tue, 17 Jan 2012 10:09:25 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 17 Jan 2012 10:09:03 -0500
In-Reply-To: <4F13A366.1010807@linux.intel.com>
References: <1326651241.9066.0.camel@lenny> <4F13A366.1010807@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1326812944.3467.46.camel@lenny>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
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
X-List-Received-Date: Tue, 17 Jan 2012 15:17:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-01-15 at 20:11 -0800, Saul Wold wrote:
> On 01/15/2012 10:13 AM, Colin Walters wrote:
> > See attached.
> >
> >
> The current version is 2.4.2 and this requires a PR bump.

Hm, do you want a new patch that bumps the PR?  What are the rules for
when a PR should be incremented?

> Also, can you use "git send-email" directly instead of sending the patch 
> as an attachment, when sent that way, it requires extra steps to edit 
> the file before applying.

Ah...the problem is that I'd have to teach git-send-email how to
authenticate to my mail server which isn't trivial.  Would a workflow
where I paste the patch inline (thus creating whitespace damage), but
also link to my github mirror work?  Let's try it with a new patch:

https://github.com/cgwalters/poky/commit/0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf

From 0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Tue, 17 Jan 2012 09:06:28 -0500
Subject: [PATCH] zlib: Build and install zlib.pc

Poky has a fork of the zlib build system which presently installs
headers and the shared library, but neglects the zlib.pc file.
Several components (e.g. glib, WebKitGtk) look for this, so let's
provide it.
---
 meta/recipes-core/zlib/files/Makefile.am  |    3 +++
 meta/recipes-core/zlib/files/configure.ac |    3 ++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/zlib/files/Makefile.am
b/meta/recipes-core/zlib/files/Makefile.am
index b66d299..0458892 100644
--- a/meta/recipes-core/zlib/files/Makefile.am
+++ b/meta/recipes-core/zlib/files/Makefile.am
@@ -7,3 +7,6 @@ libz_la_SOURCES = adler32.c compress.c crc32.c gzlib.c
gzclose.c gzread.c \
 libz_la_LDFLAGS = -version-number 1:2:5 --version-script zlib.map
 
 include_HEADERS = zconf.h zlib.h zlibdefs.h
+
+pkgconfigdir = ${libdir}/pkgconfig
+pkgconfig_DATA = zlib.pc
diff --git a/meta/recipes-core/zlib/files/configure.ac
b/meta/recipes-core/zlib/files/configure.ac
index 4761b7e..5698175 100644
--- a/meta/recipes-core/zlib/files/configure.ac
+++ b/meta/recipes-core/zlib/files/configure.ac
@@ -43,6 +43,7 @@ cat > zlibdefs.h << EOF
 #endif
 EOF
 
-AC_CONFIG_FILES([Makefile])
+AC_CONFIG_FILES([Makefile
+	         zlib.pc])
 
 AC_OUTPUT
-- 
1.7.6.5





