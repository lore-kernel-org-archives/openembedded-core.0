Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkahU-0005eS-2n for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:53:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCgWEO002118;
	Fri, 29 Jun 2012 13:42:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00996-05; Fri, 29 Jun 2012 13:42:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCgOZi002112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jun 2012 13:42:25 +0100
Message-ID: <1340973748.23146.157.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 13:42:28 +0100
In-Reply-To: <4FECABED.9010401@windriver.com>
References: <4FECABED.9010401@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Slater, Joseph" <joe.slater@windriver.com>
Subject: Re: python-native and autotools
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
X-List-Received-Date: Fri, 29 Jun 2012 12:53:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-28 at 15:09 -0400, Randy MacLeod wrote:
> 
> autoconf and automake build as part of the "core" tools that get built 
> before any target packages are built whereas python-native isn't in
> that set. When automake runs, it uses whatever python it finds.
> This will be the python-native version if it has been built. When
> doing parallel builds, it is possible to be building the python-native
> while automake is running for some other package.  This can cause a
> build failure with a signature such as:
> 
>    NOTE: package freetype-2.4.9-r0: task do_configure: Succeeded
>    NOTE: Running task 1891 of 4319 (ID: 3642, /.../oe-core/meta/
>    recipes-graphics/freetype/freetype_2.4.9.bb, do_compile)
>    NOTE: Running task 1892 of 4319 (ID: 2327, /.../oe-core/meta/
>    recipes-extended/zypper/zypper_git.bb, do_populate_lic)
>    ERROR: Function failed: do_configure (see /.../tmp/work/
>    x86_64-linux/guile-native-2.0.3-r5/temp/do_configure
>    /log.do_configure.1659 for further information)
>    ...
>    Log data follows:
>    | DEBUG: Executing python function sysroot_cleansstate
>    | DEBUG: Python function sysroot_cleansstate finished
>    --
>    | python: error while loading shared libraries: libpython2.7.so.1.0:
>    cannot open shared object file: No such file or directory
>    | ERROR: Function failed: do_configure (see /.../tmp/work/
>    x86_64-linux/guile-native-2.0.3-r5/temp/do_configure
>    /log.do_configure.1659 for further information)
>    NOTE: package guile-native-2.0.3-r5: task do_configure: Failed
>    ...
> 
> Other signatures involve missing python files, such as:
>    .../tmp/sysroots/x86_64-linux/usr/lib/python2.7/warnings.py",
>    line 6, in <module>
>      import linecache
>    ImportError: No module named linecache
> 
> Changing the python install to be atomic might cover this up but
> that isn't a very satisfying solution. It would be nice to make
> anything that USES autotools depend on python-native, but this
> causes problems because autoconf and automake inherit the autotools
> class, so they would wind up depending on python, which, itself
> inherits autotools.
> 
> A solution might be to have autoconf and automake and python inherit a 
> version of autotools that does not add a python-native dependency, say
> autotools-no-python, and then modify the "real" autotools class to
> add the python dependency.
> 
> My build stats show that this problem
> happens in less than 1 out of 40 builds with:
> BB_NUMBER_THREADS = "20"
> PARALLEL_MAKE = "-j 20"
> Has anyone else seen this problem?
> 
> I'm still coming up to speed on bitbake's bootstrap process so
> any suggestions would be appreciated.

We need python installed on the system in order to run bitbake. There
are some things like python itself that have a requirement on
python-native specifically.

The way we solved this same problem with perl was to install it into a
specific directory which we only add to PATH when we really want the
native version. See perlnative.bbclass for an example.

It sounds like we might have to consider something similar for python.

Cheers,

Richard





