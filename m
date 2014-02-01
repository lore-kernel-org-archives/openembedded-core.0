Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 301386E9B4
	for <Openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:22:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s119MNbw021338; Sat, 1 Feb 2014 09:22:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LE1UPryqWMxc; Sat,  1 Feb 2014 09:22:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s119MINF021323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 1 Feb 2014 09:22:21 GMT
Message-ID: <1391246532.28575.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Sat, 01 Feb 2014 09:22:12 +0000
In-Reply-To: <1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
	<1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "saul.wold" <saul.wold@intel.com>, Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Sat, 01 Feb 2014 09:22:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jason,

We're seeing a parallel make race on the autobuilder and it seems its
from this patch:

On Thu, 2014-01-23 at 08:32 -0600, Jason Wessel wrote:
> diff --git a/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> new file mode 100644
> index 0000000..c7fe3d7
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/unfs3_parallel_build.patch
> @@ -0,0 +1,36 @@
> +Fix parallel build dependency issue
> +
> +If building with make -j2 the lib.a will not get built in time.
> +
> +Jason Wessel <jason.wessel@windriver.com>
> +
> +Upstream-Status: Pending
> +
> +---
> + Config/Makefile.in |    2 ++
> + Makefile.in        |    3 ++-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -29,7 +29,8 @@ DESTDIR =
> + 
> + VPATH = $(srcdir)
> + 
> +-all: subdirs unfsd$(EXEEXT)
> ++all: subdirs
> ++	$(MAKE) unfsd$(EXEEXT)
> + 
> + unfsd$(EXEEXT): $(OBJS) $(CONFOBJ) $(EXTRAOBJ)
> + 	$(CC) -o $@ $(OBJS) $(CONFOBJ) $(EXTRAOBJ) $(LDFLAGS)
> +--- a/Config/Makefile.in
> ++++ b/Config/Makefile.in
> +@@ -16,6 +16,8 @@ lib.a: $(OBJS)
> + 	$(AR) crs lib.a $(OBJS)
> + 
> + y.tab.h y.tab.c: $(srcdir)/exports.y
> ++
> ++y.tab.c: $(srcdir)/exports.y
> + 	$(YACC) -d $(srcdir)/exports.y
> + 
> + y.tab.o: y.tab.c $(srcdir)/exports.h $(top_srcdir)/nfs.h $(top_srcdir)/mount.h $(top_srcdir)/daemon.h

If you "cd Config; make lex.yy.o" you'll find it errors with y.tab.h not
being found. The reason is the line added above, the y.tab.h dependency
on running YACC is needed.

We're seeing this about once an autobuilder run, e.g.:

http://autobuilder.yoctoproject.org/main/builders/nightly-oecore/builds/7/steps/Building%20Toolchain%20Images_1/logs/stdio

Can we drop this second part of the change?

Cheers,

Richard



