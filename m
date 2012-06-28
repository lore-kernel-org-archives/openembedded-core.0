Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1SkNrU-0001I2-Rx
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 01:10:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5SJ9Yr5007579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 12:09:34 -0700 (PDT)
Received: from [128.224.147.230] (128.224.147.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 12:09:34 -0700
Message-ID: <4FECABED.9010401@windriver.com>
Date: Thu, 28 Jun 2012 15:09:33 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.147.230]
Cc: "Slater, Joseph" <joe.slater@windriver.com>
Subject: python-native and autotools
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
X-List-Received-Date: Thu, 28 Jun 2012 23:10:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



autoconf and automake build as part of the "core" tools that get built 
before any target packages are built whereas python-native isn't in
that set. When automake runs, it uses whatever python it finds.
This will be the python-native version if it has been built. When
doing parallel builds, it is possible to be building the python-native
while automake is running for some other package.  This can cause a
build failure with a signature such as:

   NOTE: package freetype-2.4.9-r0: task do_configure: Succeeded
   NOTE: Running task 1891 of 4319 (ID: 3642, /.../oe-core/meta/
   recipes-graphics/freetype/freetype_2.4.9.bb, do_compile)
   NOTE: Running task 1892 of 4319 (ID: 2327, /.../oe-core/meta/
   recipes-extended/zypper/zypper_git.bb, do_populate_lic)
   ERROR: Function failed: do_configure (see /.../tmp/work/
   x86_64-linux/guile-native-2.0.3-r5/temp/do_configure
   /log.do_configure.1659 for further information)
   ...
   Log data follows:
   | DEBUG: Executing python function sysroot_cleansstate
   | DEBUG: Python function sysroot_cleansstate finished
   --
   | python: error while loading shared libraries: libpython2.7.so.1.0:
   cannot open shared object file: No such file or directory
   | ERROR: Function failed: do_configure (see /.../tmp/work/
   x86_64-linux/guile-native-2.0.3-r5/temp/do_configure
   /log.do_configure.1659 for further information)
   NOTE: package guile-native-2.0.3-r5: task do_configure: Failed
   ...

Other signatures involve missing python files, such as:
   .../tmp/sysroots/x86_64-linux/usr/lib/python2.7/warnings.py",
   line 6, in <module>
     import linecache
   ImportError: No module named linecache

Changing the python install to be atomic might cover this up but
that isn't a very satisfying solution. It would be nice to make
anything that USES autotools depend on python-native, but this
causes problems because autoconf and automake inherit the autotools
class, so they would wind up depending on python, which, itself
inherits autotools.

A solution might be to have autoconf and automake and python inherit a 
version of autotools that does not add a python-native dependency, say
autotools-no-python, and then modify the "real" autotools class to
add the python dependency.

My build stats show that this problem
happens in less than 1 out of 40 builds with:
BB_NUMBER_THREADS = "20"
PARALLEL_MAKE = "-j 20"
Has anyone else seen this problem?

I'm still coming up to speed on bitbake's bootstrap process so
any suggestions would be appreciated.


-- 
# Randy MacLeod. MTS, Linux, Wind River
Direct: 613.963.1350



