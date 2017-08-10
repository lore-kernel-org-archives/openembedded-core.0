Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F62F780BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 10:02:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7AA0dE9008934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 10 Aug 2017 11:00:41 +0100
Message-ID: <1502359239.18633.274.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark D Horn <mark.d.horn@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2017 11:00:39 +0100
In-Reply-To: <1501715385-17089-1-git-send-email-mark.d.horn@intel.com>
References: <1501715385-17089-1-git-send-email-mark.d.horn@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 10 Aug 2017 11:00:41 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] recipetool: create: allow handers to set license
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
X-List-Received-Date: Thu, 10 Aug 2017 10:02:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-02 at 16:09 -0700, Mark D Horn wrote:
> Recipetool plugins set through register_recipe_handlers were not able
> to impact the license type via setting extravalues['LICENSE']. This
> is
> due to caching the license variables in create_recipe before the
> handlers
> have been executed.
> 
> This change moves the call to handle_license_vars well after the
> registered plugins (and extravalue functions) have been called.
> 
> Signed-off-by: Mark D Horn <mark.d.horn@intel.com>
> ---
>  scripts/lib/recipetool/create.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'm afraid this leads to oe-selftest regressions and issues in devtool:

$ oe-selftest -r devtool.DevtoolTests.test_devtool_add
[...]
2017-08-10 10:58:01,398 - oe-selftest - INFO - ======================================================================
2017-08-10 10:58:01,399 - oe-selftest - INFO - FAIL [6.404s]: test_devtool_add (devtool.DevtoolTests)
2017-08-10 10:58:01,399 - oe-selftest - INFO - ----------------------------------------------------------------------
2017-08-10 10:58:01,399 - oe-selftest - INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/devtool.py", line 206, in test_devtool_add
    result = runCmd('devtool add pv %s' % srcdir)
  File "/media/build1/poky/meta/lib/oeqa/utils/commands.py", line 191, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'devtool add pv /tmp/devtoolqaznmpqyo4/pv-1.5.3' returned non-zero exit status 1:
NOTE: Starting bitbake server...
NOTE: Creating workspace layer in /media/build1/poky/build/workspace
NOTE: Enabling workspace layer in bblayers.conf
NOTE: Starting bitbake server...
NOTE: Starting bitbake server...
ERROR: Traceback (most recent call last):
  File "/media/build1/poky/bitbake/lib/bb/command.py", line 83, in runCommand
    result = command_method(self, commandline)
  File "/media/build1/poky/bitbake/lib/bb/command.py", line 566, in parseRecipeFile
    envdata = parser.loadDataFull(fn, appendfiles)
  File "/media/build1/poky/bitbake/lib/bb/cache.py", line 339, in loadDataFull
    bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
  File "/media/build1/poky/bitbake/lib/bb/cache.py", line 352, in load_bbfile
    datastores = parse_recipe(bb_data, bbfile, appends, mc)
  File "/media/build1/poky/bitbake/lib/bb/cache.py", line 315, in parse_recipe
    bb_data = bb.parse.handle(bbfile, bb_data)
  File "/media/build1/poky/bitbake/lib/bb/parse/__init__.py", line 113, in handle
    return h['handle'](fn, data, include)
  File "/media/build1/poky/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 157, in handle
    return ast.multi_finalize(fn, d)
  File "/media/build1/poky/bitbake/lib/bb/parse/ast.py", line 395, in multi_finalize
    finalize(fn, d)
  File "/media/build1/poky/bitbake/lib/bb/parse/ast.py", line 355, in finalize
    bb.utils.better_exec("\n".join(code), {"d": d})
  File "/media/build1/poky/bitbake/lib/bb/utils.py", line 399, in better_exec
    exec(code, get_context(), context)
  File "<code>", line 3, in <module>
  File "/media/build1/poky/meta/classes/base.bbclass", line 468, in __anon_686__media_build1_poky_meta_classes_base_bbclass
  File "/media/build1/poky/bitbake/lib/bb/__init__.py", line 104, in fatal
    raise BBHandledException()
bb.BBHandledException

ERROR: Parsing newly created recipe failed, moving recipe to /media/build1/poky/build/workspace/recipes/pv/pv_1.5.3.bb.parsefailed for reference. If this looks to be caused by the recipe itself, please report this error.
----------------------------------------------------------------------
2017-08-10 10:58:01,399 - oe-selftest - INFO - Ran 1 test in 7.684s
2017-08-10 10:58:01,399 - oe-selftest - INFO - FAILED
2017-08-10 10:58:01,399 - oe-selftest - INFO -  (failures=1)
2017-08-10 10:58:01,404 - oe-selftest - INFO - RESULTS:
2017-08-10 10:58:01,405 - oe-selftest - INFO - RESULTS - devtool.DevtoolTests.test_devtool_add - Testcase 1159: FAILED
2017-08-10 10:58:01,405 - oe-selftest - INFO - SUMMARY:
2017-08-10 10:58:01,405 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 7.690s
2017-08-10 10:58:01,405 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed


There were other failures but this one seem to illustrate the issue.

Cheers,

Richard

