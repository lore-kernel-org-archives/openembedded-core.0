Return-Path: <clemens.lang@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 673477673C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 06:27:20 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:29395
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1ZQ8SS-0003gP-3B; Fri, 14 Aug 2015 08:27:17 +0200
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Fri, 14 Aug 2015 08:27:15 +0200
X-CTCH-RefID: str=0001.0A0C0205.55CD8A45.001E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
Date: Fri, 14 Aug 2015 08:27:16 +0200
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150814062716.GA4893@ulm-bmuc496424.bmw-carit.de>
References: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
	<CAJTo0Lb+y8v4SKhgUrdonNivPeT77Lyxd5MFDDoS4T087Zwp8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb+y8v4SKhgUrdonNivPeT77Lyxd5MFDDoS4T087Zwp8w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [172.20.20.163]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Avoid race condition between do_unpack and do_deploy_archives in archiver.bbclass
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
X-List-Received-Date: Fri, 14 Aug 2015 06:27:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 13, 2015 at 12:09:07PM +0100, Burton, Ross wrote:
> I'm not sure I follow this.  Functions are executed using exec_func()
> will create and cd to the default directory, so if that is ${B} then
> exec_func will create ${B} before executing the function.

I see this in the code, but my error messages speak a very different
language. Maybe it's a race condition with do_unpack, which actually
deletes and re-creates these directories again? In any case, there is a
race condition that causes the directory to be missing when it should be
there.

For reference, here's one that fails to chdir in Python code:

> 00:07:32.460 NOTE: Running task 2381 of 6712 (ID: 1986, /home/builder/src/base/meta-mgu-swint-testing/recipes-test-components/bci-test-component/bci-test-component.bb, do_deploy_archives)
> [...]
> 00:07:32.461 NOTE: Running task 2382 of 6712 (ID: 1972, /home/builder/src/base/meta-mgu-swint-testing/recipes-test-components/bci-test-component/bci-test-component.bb, do_unpack)
> [...]
> 00:07:32.464 NOTE: recipe bci-test-component-0.0.2-r0: task do_deploy_archives: Started
> 00:07:32.465 NOTE: recipe bci-test-component-0.0.2-r0: task do_unpack: Started
> 00:07:32.465 ERROR: Build of do_deploy_archives failed
> 00:07:32.465 ERROR: Traceback (most recent call last):
> 00:07:32.466   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 497, in exec_task
> 00:07:32.466     return _exec_task(fn, task, d, quieterr)
> 00:07:32.467   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 440, in _exec_task
> 00:07:32.467     exec_func(func, localdata)
> 00:07:32.467   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 212, in exec_func
> 00:07:32.468     exec_func_python(func, d, runfile, cwd=adir)
> 00:07:32.468   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 237, in exec_func_python
> 00:07:32.469     os.chdir(cwd)
> 00:07:32.469 OSError: [Errno 2] No such file or directory: '/home/builder/src/base/build_vmwx86/tmp/work/core2-32-linux/bci-test-component/0.0.2-r0/git'
> 00:07:32.469 
> 00:07:32.470 NOTE: recipe bci-test-component-0.0.2-r0: task do_deploy_archives: Failed

And here's another one that shows the same problem for a Shell function:

> 00:09:40.943 NOTE: Running task 3484 of 7306 (ID: 2653, /home/builder/src/base/meta-mgu-swint-sdk/recipes-extended/dlt-daemon/dlt-daemon-sdktests_2.10.0.bb, do_deploy_archives)
> 00:09:40.944 NOTE: recipe dlt-daemon-sdktests-2.10.0-r0: task do_fetch: Succeeded
> [...]
> 00:09:40.946 NOTE: Running task 3485 of 7306 (ID: 2640, /home/builder/src/base/meta-mgu-swint-sdk/recipes-extended/dlt-daemon/dlt-daemon-sdktests_2.10.0.bb, do_unpack)
> [...]
> 00:09:40.953 NOTE: recipe dlt-daemon-sdktests-2.10.0-r0: task do_deploy_archives: Started
> 00:09:41.930 NOTE: recipe dlt-daemon-sdktests-2.10.0-r0: task do_unpack: Started
> [...]
> 00:09:41.931 ERROR: Function failed: do_deploy_archives (log file is located at /home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/all-linux/dlt-daemon-sdktests/2.10.0-r0/temp/log.do_deploy_archives.25418)
> 00:09:41.932 ERROR: Logfile of failure stored in: /home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/all-linux/dlt-daemon-sdktests/2.10.0-r0/temp/log.do_deploy_archives.25418
> 00:09:41.933 Log data follows:
> 00:09:41.934 | DEBUG: Executing python function sstate_task_prefunc
> 00:09:41.934 | DEBUG: Python function sstate_task_prefunc finished
> 00:09:41.934 | DEBUG: Executing shell function do_deploy_archives
> 00:09:41.935 | /home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/all-linux/dlt-daemon-sdktests/2.10.0-r0/temp/run.do_deploy_archives.25418: 102: cd: can't cd to /home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/all-linux/dlt-daemon-sdktests/2.10.0-r0/git
> 00:09:41.936 | WARNING: exit code 2 from a shell command.
> 00:09:41.936 | ERROR: Function failed: do_deploy_archives (log file is located at /home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/all-linux/dlt-daemon-sdktests/2.10.0-r0/temp/log.do_deploy_archives.25418)
> 00:09:41.937 NOTE: recipe dlt-daemon-sdktests-2.10.0-r0: task do_deploy_archives: Failed

I do not see any of these issues with my patch applied.

-- 
Clemens Lang • Development Specialist
BMW Car IT GmbH • Lise-Meitner-Str. 14 • 89081 Ulm • http://bmw-carit.com
-------------------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Reinhard Stolle
Sitz und Registergericht: München HRB 134810
-------------------------------------------------------------------------

