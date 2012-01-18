Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Rnbll-0006Z5-IM
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 21:06:05 +0100
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id B7E912198C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 14:58:28 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 18 Jan 2012 14:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:date:in-reply-to
	:references:content-type:content-transfer-encoding:message-id
	:mime-version; s=smtpout; bh=HWnBDg4WdnfkKi/itxeA3+rv2B0=; b=NSF
	u83rhklGgwOL1Gi0Nxtec4aUbtXV2U4WPI0HvXjknKZnVkvngGy380e8evGqvOsf
	eApWughyUj+//HUyIvSaCYn/qO3fgScUdt9+TheeUeQ/6fwajpOEI3cnYto5AqDQ
	hVJaaeOUHLKCxWw5rs7uPytElhrNYIeUUgM77SXI=
X-Sasl-enc: XLsT4708QOj7L5ltN9eHluapIIWXzNyAX0zEm3X4stke 1326916708
Received: from [192.168.1.6] (c-65-96-60-117.hsd1.ct.comcast.net
	[65.96.60.117])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7F7B88E0172;
	Wed, 18 Jan 2012 14:58:28 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 18 Jan 2012 14:58:07 -0500
In-Reply-To: <4F15CDFD.8050204@linux.intel.com>
References: <1326651241.9066.0.camel@lenny>
	<4F13A366.1010807@linux.intel.com> <1326812944.3467.46.camel@lenny>
	<4F15CDFD.8050204@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1326916687.24335.4.camel@lenny>
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
X-List-Received-Date: Wed, 18 Jan 2012 20:06:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 11:37 -0800, Saul Wold wrote:

> > https://github.com/cgwalters/poky/commit/0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf
> >
> Yes, this will work better in the future, let me know the github branch 
> that contains your patch against oe-core or poky master (which ever you 
> prefer).

I've uploaded all of my current patches to the "edison" branch here:
https://github.com/cgwalters/poky

There's a new one there for bash:

https://github.com/cgwalters/poky/commit/84549cb9435fe1bec38a18e1fe6daf350351cd5a

From 84549cb9435fe1bec38a18e1fe6daf350351cd5a Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Wed, 18 Jan 2012 14:45:21 -0500
Subject: [PATCH] bash: Ensure we use glibc getcwd(), not builtin copy

My build system runs in a chroot, and then creates bind mounts
that point outside of the chroot.  The bash implementation of getcwd()
breaks badly on this.

glibc has a perfectly working version which on modern Linux simply
invokes the getcwd() system call.  However, when cross compiling,
bash's configure script gives up, and so defers to its built in
version.

I'm not sure whether dietlibc/uclibc will malloc as bash wants, so
this patch may not be applicable everywhere.  Probably a better fix
would be for bash to detect glibc's get_current_dir_name() and use it.
---
 meta/recipes-extended/bash/bash.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc
b/meta/recipes-extended/bash/bash.inc
index 876be1e..f5a480a 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -14,7 +14,11 @@ PARALLEL_MAKE = ""
 bindir = "/bin"
 sbindir = "/sbin"
 
-EXTRA_OECONF = "--enable-job-control"
+# Override getcwd_malloc because the copy of getcwd()
+# in bash blows up when run inside a chroot and a bind
+# mount pointing outside.  This assumes we're using eglibc.
+EXTRA_OECONF = "--enable-job-control bash_cv_getcwd_malloc=yes "
+
 export CC_FOR_BUILD = "${BUILD_CC}"
 
 ALTERNATIVE_NAME = "sh"
-- 
1.7.6.5





