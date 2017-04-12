Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F2BB271BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:51:40 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9CEE468A019; Wed, 12 Apr 2017 14:51:40 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 2D9E268A019;
	Wed, 12 Apr 2017 14:51:35 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id B63BD6740580;
	Wed, 12 Apr 2017 15:51:35 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1491974111-31308-1-git-send-email-li.zhou@windriver.com>
	<CADkTA4MthaNuZHtrrUXn_0OWSCWYCMkFqBiUQswvUgz4-gH8Jg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <28ef37f7-8d85-01ae-4052-66275a6b27d1@mlbassoc.com>
Date: Wed, 12 Apr 2017 15:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MthaNuZHtrrUXn_0OWSCWYCMkFqBiUQswvUgz4-gH8Jg@mail.gmail.com>
Subject: Re: [PATCH] python3: Use _sysconfigdata.py to initialize distutils.sysconfig
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
X-List-Received-Date: Wed, 12 Apr 2017 13:51:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-04-12 14:51, Bruce Ashfield wrote:
>
>
> On Wed, Apr 12, 2017 at 1:15 AM, Li Zhou <li.zhou@windriver.com <mailto:li.zhou@windriver.com>> wrote:
>
>     Porting patch from
>     <https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
>     <https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159>>
>     to use _sysconfigdata.py to initialize distutils.sysconfig.
>
>
>
> But what does this actually do ?  I'm sure it is obvious to the python hackers, but to me,
> this short log just describes what the patch does, not what problem it solves and why this
> is a good thing.

Also, doesn't this also apply to python-2.7.x (maybe with some massaging)?  Whatever problem
this is solving surely exists on that code line as well.

>     Signed-off-by: Li Zhou <li.zhou@windriver.com <mailto:li.zhou@windriver.com>>
>     ---
>      ...-Use-_sysconfigdata.py-to-initialize-dist.patch | 66 ++++++++++++++++++++++
>      meta/recipes-devtools/python/python3_3.5.2.bb <http://python3_3.5.2.bb>      |  1 +
>      2 files changed, 67 insertions(+)
>      create mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>
>     diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>     b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>     new file mode 100644
>     index 0000000..d1c92e9
>     --- /dev/null
>     +++ b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
>     @@ -0,0 +1,66 @@
>     +From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
>     +From: Libin Dang <libin.dang@windriver.com <mailto:libin.dang@windriver.com>>
>     +Date: Tue, 11 Apr 2017 14:12:15 +0800
>     +Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
>     + distutils.sysconfig
>     +
>     +Backport upstream commit
>     +https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
>     <https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159>
>     +
>     +Upstream-Status: Backport
>     +
>     +Signed-off-by: Li Zhou <li.zhou@windriver.com <mailto:li.zhou@windriver.com>>
>     +---
>     + Lib/distutils/sysconfig.py | 35 ++++-------------------------------
>     + 1 file changed, 4 insertions(+), 31 deletions(-)
>     +
>     +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
>     +index 6d5cfd0..9925d24 100644
>     +--- a/Lib/distutils/sysconfig.py
>     ++++ b/Lib/distutils/sysconfig.py
>     +@@ -424,38 +424,11 @@ _config_vars = None
>     +
>     + def _init_posix():
>     +     """Initialize the module as appropriate for POSIX systems."""
>     +-    g = {}
>     +-    # load the installed Makefile:
>     +-    try:
>     +-        filename = get_makefile_filename()
>     +-        parse_makefile(filename, g)
>     +-    except OSError as msg:
>     +-        my_msg = "invalid Python installation: unable to open %s" % filename
>     +-        if hasattr(msg, "strerror"):
>     +-            my_msg = my_msg + " (%s)" % msg.strerror
>     +-
>     +-        raise DistutilsPlatformError(my_msg)
>     +-
>     +-    # load the installed pyconfig.h:
>     +-    try:
>     +-        filename = get_config_h_filename()
>     +-        with open(filename) as file:
>     +-            parse_config_h(file, g)
>     +-    except OSError as msg:
>     +-        my_msg = "invalid Python installation: unable to open %s" % filename
>     +-        if hasattr(msg, "strerror"):
>     +-            my_msg = my_msg + " (%s)" % msg.strerror
>     +-
>     +-        raise DistutilsPlatformError(my_msg)
>     +-
>     +-    # On AIX, there are wrong paths to the linker scripts in the Makefile
>     +-    # -- these paths are relative to the Python source, but when installed
>     +-    # the scripts are in another directory.
>     +-    if python_build:
>     +-        g['LDSHARED'] = g['BLDSHARED']
>     +-
>     ++    # _sysconfigdata is generated at build time, see the sysconfig module
>     ++    from _sysconfigdata import build_time_vars
>     +     global _config_vars
>     +-    _config_vars = g
>     ++    _config_vars = {}
>     ++    _config_vars.update(build_time_vars)
>     +
>     +
>     + def _init_nt():
>     +--
>     +1.8.3.1
>     +
>     diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb <http://python3_3.5.2.bb>
>     b/meta/recipes-devtools/python/python3_3.5.2.bb <http://python3_3.5.2.bb>
>     index ca8dfe3..a413da7 100644
>     --- a/meta/recipes-devtools/python/python3_3.5.2.bb <http://python3_3.5.2.bb>
>     +++ b/meta/recipes-devtools/python/python3_3.5.2.bb <http://python3_3.5.2.bb>
>     @@ -37,6 +37,7 @@ SRC_URI += "\
>                  file://configure.ac-fix-LIBPL.patch \
>                  file://python3-fix-CVE-2016-1000110.patch \
>                  file://upstream-random-fixes.patch \
>     +            file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
>                 "
>      SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
>      SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

