Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 24FAC79196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:02:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7FE2w9L022800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 15:03:00 +0100
Message-ID: <ce03de9160c86123efd9a4623821028728de5f14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 15:02:58 +0100
In-Reply-To: <7d5cc9be5bd515a06b51069668934b39764c9687.1534316428.git.Qi.Chen@windriver.com>
References: <cover.1534316428.git.Qi.Chen@windriver.com>
	<7d5cc9be5bd515a06b51069668934b39764c9687.1534316428.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Wed, 15 Aug 2018 14:03:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-15 at 15:00 +0800, Chen Qi wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> On other distros like ubuntu/centos, libnss-db usually provides:
> - The libraries
> - The Makefile to create database
>   (in /var/db for centos, /var/lib/misc/ for ubuntu)
> - The makedb command (it's in glibc-common for centos7)
> 
> What we had is:
> - The libraries are in glibc-extra-nss
> - The Makefile is removed
> - The makedb command is in glibc-utils (lack of dependency)
> 
> So when glibc-extra-nss is installed but glibc-utils is not,
> we see error like:
> nscd[165]: 165 checking for monitored file `/var/db/group.db': No
> such file or directory
> nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No
> such file or directory
> 
> And there is not an easy way to create these databases.
> 
> To fix the issue:
> - Re-package the libraries into libnss-db
> - Don't remove the Makefile and add it in libnss-db
> - Add RDEPENDS for libnss-db on glibc-utils and make
> 
> Notes:
> For external toolchain, an extra package 'libnss-db' need to be
> provided
> If replacing glibc from core.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

This breaks on the autobuilder in oe-selftest:

2018-08-15 13:09:15,551 - oe-selftest - INFO - ======================================================================
2018-08-15 13:09:15,551 - oe-selftest - INFO - FAIL: bbtests.BitbakeTests.test_non_gplv3 (subunit.RemotedTestCase)
2018-08-15 13:09:15,552 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-08-15 13:09:15,552 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/bbtests.py", line 246, in test_non_gplv3
    self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
  File "/usr/lib64/python3.6/unittest/case.py", line 829, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.6/unittest/case.py", line 822, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 1 != 0 : Bitbake failed, exit code 1, output Parsing recipes...done.
Parsing of 811 .bb files complete (0 cached, 811 parsed). 1277 targets, 99 skipped, 0 masked, 0 errors.
Removing 10 recipes from the core2-64 sysroot...done.
Removing 10 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'make' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/recipes-core/glibc/glibc_2.28.bb RDEPENDS on or otherwise requires it)
make was skipped: it has an incompatible license: GPLv3 & LGPLv2
NOTE: Runtime target 'make' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['make']
ERROR: Required build target 'selftest-ed' has no buildable providers.
Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/libc', 'make']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1281/steps/Running%20oe-selftest/logs/stdio

We really don't want a make dependency in glibc :(

Cheers,

Richard


