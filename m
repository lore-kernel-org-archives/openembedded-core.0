Return-Path: <clemens.lang@bmw-carit.de>
X-Greylist: delayed 313 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Oct 2015 10:03:00 UTC
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA1C60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 10:03:00 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:62351
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1ZjlTj-0006C3-2t; Wed, 07 Oct 2015 11:57:43 +0200
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Wed, 7 Oct 2015 11:57:43 +0200
X-CTCH-RefID: str=0001.0A0C0204.5614EC97.02F8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
Date: Wed, 7 Oct 2015 11:57:43 +0200
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20151007095743.GD5122@ulm-bmuc496424.bmw-carit.de>
References: <CAJTo0LZ4u-Q2nc+_phmq4NxR9o7Xyyij=tGmE-KxgsODhQdN5A@mail.gmail.com>
	<1439800667-31696-1-git-send-email-clemens.lang@bmw-carit.de>
MIME-Version: 1.0
In-Reply-To: <1439800667-31696-1-git-send-email-clemens.lang@bmw-carit.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [172.20.20.163]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Run deploy_archives in $WORKDIR
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
X-List-Received-Date: Wed, 07 Oct 2015 10:03:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hey,

On Mon, Aug 17, 2015 at 10:37:47AM +0200, Clemens Lang wrote:
> In recipes that are exempt from source code archiving due to
> COPYLEFT_LICENSE_EXCLUDE, do_deploy_archives does not have a transitive
> dependency on do_unpack. Given enough parallelism, this means
> do_deploy_archives can run at the same time or before do_unpack.
> 
> Because do_deploy_archives did not specify a working directory, its
> working directory was ${B}, which defaults to ${S}, which may be set by
> a recipe to a directory that is created by do_unpack.
> 
> In this case, do_deploy_archives can fail because do_unpack deletes and
> re-creates the directory and do_deploy_archives cannot change into the
> non-existent directory. Avoid this problem by explicitly specifying
> a working directory for do_deploy_archives (and for
> do_deploy_all_archives as well for good measure).
> 
> Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>

So you merged this change in
 - OE Core e22685ff11af6d54c939aa8f327a0aaa1557fbbc
 - poky 76d7e8e9c9881afefafed3acfd1a72d97b025d75
but it turns out that even with this fix, we occasionally see the same
problem:

  00:06:02.343 NOTE: recipe nativesdk-mgu-can-1.0+gitAUTOINC+ed9c00caae-r0: task do_unpack: Started
  00:06:02.344 ERROR: Build of do_deploy_archives failed
  00:06:02.344 ERROR: Traceback (most recent call last):
  00:06:02.344   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 497, in exec_task
  00:06:02.345     return _exec_task(fn, task, d, quieterr)
  00:06:02.345   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 440, in _exec_task
  00:06:02.346     exec_func(func, localdata)
  00:06:02.346   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 212, in exec_func
  00:06:02.346     exec_func_python(func, d, runfile, cwd=adir)
  00:06:02.347   File "/home/builder/src/base/poky/bitbake/lib/bb/build.py", line 237, in exec_func_python
  00:06:02.347     os.chdir(cwd)
  00:06:02.347 OSError: [Errno 2] No such file or directory: '/home/builder/src/base/build_xs-baytrail-hmgua1/tmp/work/i686-nativesdk-linux/nativesdk-mgu-can/1.0+gitAUTOINC+ed9c00caae-r0/git'

Again, the license of the recipe that fails is "CLOSED". You can see
that it tries to cd into ${S}, which is set to ${WORKDIR}/git by the
recipe, even though do_deploy_archives[dirs] is set to ${WORKDIR} in
archiver.bbclass. Any ideas why the working directory might still be
${S}? Is there a way to see all flags of a task similar to bitbake -e
(that output doesn't seem to contain it)?

My initially proposed fix that adds the dependency works correctly,
though. I think we should just acknowledge that do_unpack should be run
before attempting any other tasks related to source code and merge the
initial version of my patch instead to fix this problem.


Let me know what you think,
Clemens Lang
-- 
Clemens Lang • Development Specialist
BMW Car IT GmbH • Lise-Meitner-Str. 14 • 89081 Ulm • http://bmw-carit.com
-------------------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Reinhard Stolle
Sitz und Registergericht: München HRB 134810
-------------------------------------------------------------------------

