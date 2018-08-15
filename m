Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 875C179190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 13:40:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7FDecqW021479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 14:40:40 +0100
Message-ID: <6c97d0ea5b361c29093e869d2389f448f49d89e2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 14:40:38 +0100
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Wed, 15 Aug 2018 13:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Currently, a dependency on any -native recipe will pull in
> all dependencies of that -native recipe in the recipe
> sysroot. This behaviour might not always be wanted, e.g.
> when that -native recipe depends on build-tools that are
> not relevant for the current recipe.
> 
> This change adds a SSTATE_EXCLUDEDEPS_SYSROOT variable,
> which will be evaluated for such recursive dependencies to
> be excluded. The idea is similar to
>    http://lists.openembedded.org/pipermail/openembedded-core/2018-Jan
> uary/146324.html
> except that the list is not hard-coded anymore.
> 
> SSTATE_EXCLUDEDEPS_SYSROOT is evaluated as two regular
> expressions of recipe and dependency to ignore, e.g. in
> the above flex-native / bison-native use-case, one would
> specify
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT = ".*->(flex|bison)-native"
> 
> in layer.conf.
> 
> The existing special handling of "-initial" as well as
> "base-passwd" and "shadow-sysroot" could also be
> streamlined:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         .*->.*-initial.* \
>         .*(base-passwd|shadow-sysroot)->.* \
>     "
> 
> Another anticipated user is meta-java, where certain newer
> JDKs can only be bootstrapped (built) using older JDKs,
> but it doesn't make much sense to copy all those older
> JDKs and their own build tools (ant, etc.) into the
> sysroot of recipes wanting to be built using the newer JDK
> (only), e.g.:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         openjdk-8-native->(ant-native|attr-native|coreutils-
> native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> native|unzip-native) \
>     "
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>

I ended up doing a bit more digging on the potential performance of
this patch. In a build it only really has impact when the setscene
functions are being considered by runqueue. If your build has already
built, it won't show up on performance charts.

I ended up separating out a standalone test which I've included below.
It tests some data I took from a build (bitbake bash so a simple one)
against three possible options:

a) the code as it stands (re)
b) re.compile() optimised re
c) fnmatch

The results of running it on my machine were:

0.7498898960002407
0.1507232149997435
1.2697166610014392

So clearly fnmatch (i.e. glob) is a worse idea and re is not internally
caching. The code isn't being executed as much as I thought it would be
which is good although in a larger build, this could still become more
significant.

One option may be to use re but to compile SSTATE_EXCLUDEDEPS_SYSROOT
into another variable once, then use the other variable and the
precompiled regexps...

Cheers,

Richard

#!/usr/bin/env python3
import timeit
import re
import fnmatch

regexp = ".*->bison-native .*->.*-initial.* .*(base-passwd|shadow-sysroot)->.* "
regexp2 = []

for excl in regexp.split():
    regexp2.append( (re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))

data = [
    ('bash', 'glibc-locale'),
    ('dpkg-native', 'perl-native'),
    ('glibc-locale', 'cross-localedef-native'),
    ('bash', 'gettext-native'),
    ('dpkg-native', 'gettext-native'),
    ('bash', 'ncurses'),
    ('bash', 'libtool-cross'),
    ('ncurses', 'libtool-cross'),
    ('bash', 'opkg-utils'),
    ('ncurses', 'gcc-runtime'),
    ('gcc-runtime', 'libgcc'),
    ('gcc-runtime', 'gcc-cross-i586'),
    ('libgcc', 'gcc-cross-i586'),
    ('bash', 'gcc-cross-i586'),
    ('opkg-utils', 'gcc-cross-i586'),
    ('ncurses', 'gcc-cross-i586'),
    ('ncurses', 'glibc'),
    ('rpm-native', 'python3-native'),
    ('rpm-native', 'libarchive-native'),
    ('rpm-native', 'nss-native'),
    ('rpm-native', 'dbus-native'),
    ('rpm-native', 'file-native'),
    ('rpm-native', 'db-native'),
    ('rpm-native', 'elfutils-native'),
    ('rpm-native', 'popt-native'),
    ('libarchive-native', 'e2fsprogs-native'),
    ('dbus-native', 'autoconf-archive-native'),
    ('dbus-native', 'expat-native'),
    ('glibc', 'gperf-native'),
    ('glibc', 'glibc-initial'),
    ('glibc', 'make-native'),
    ('glibc', 'libgcc-initial'),
    ('glibc', 'gcc-cross-initial-i586'),
    ('glibc', 'linux-libc-headers'),
    ('linux-libc-headers', 'binutils-cross-i586'),
    ('gcc-runtime', 'binutils-cross-i586'),
    ('glibc', 'binutils-cross-i586'),
    ('libgcc', 'binutils-cross-i586'),
    ('glibc-locale', 'binutils-cross-i586'),
    ('bash', 'binutils-cross-i586'),
    ('opkg-utils', 'binutils-cross-i586'),
    ('ncurses', 'binutils-cross-i586'),
    ('bash', 'bison-native'),
    ('glibc', 'bison-native'),
    ('linux-libc-headers', 'unifdef-native'),
    ('nss-native', 'nspr-native'),
    ('e2fsprogs-native', 'util-linux-native'),
    ('e2fsprogs-native', 'attr-native'),
    ('nss-native', 'sqlite3-native'),
    ('rpm-native', 'bzip2-native'),
    ('python3-native', 'gdbm-native'),
    ('python3-native', 'openssl-native'),
    ('python3-native', 'readline-native'),
    ('file-native', 'zlib-native'),
    ('util-linux-native', 'ncurses-native'),
    ('libarchive-native', 'lzo-native'),
    ('dbus-native', 'pkgconfig-native'),
    ('rpm-native', 'gettext-minimal-native'),
    ('dbus-native', 'libtool-native'),
    ('dbus-native', 'automake-native'),
    ('automake-native', 'autoconf-native'),
    ('autoconf-native', 'm4-native'),
    ('dbus-native', 'gnu-config-native'),
    ('automake-native', 'texinfo-dummy-native'),
    ('opkg-utils-native', 'quilt-native')
    ]

def test():
    for task, task1 in data:
        for excl in regexp.split():
            re.match(excl.split('->', 1)[0], task)
            re.match(excl.split('->', 1)[1], task1)

def test1():
    for task, task1 in data:
        for excl in regexp2:
            excl[0].match(task)
            excl[1].match(task1)

def test2():
    regexp = "*->bison-native *->*-initial* *base-passwd->* shadow-sysroot->*"
    for task, task1 in data:
        for excl in regexp.split():
            fnmatch.fnmatch(excl, task)
            fnmatch.fnmatch(excl, task1)

print(timeit.timeit("test()", setup="from __main__ import test",number=1000, globals=globals()))
print(timeit.timeit("test1()", setup="from __main__ import test",number=1000, globals=globals()))
print(timeit.timeit("test2()", setup="from __main__ import test",number=1000, globals=globals()))





