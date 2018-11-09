Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7886B6B90D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 23:00:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wA9N0b1J008704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 9 Nov 2018 23:00:39 GMT
Message-ID: <68cae201a429fdf9616a5ff616f6a41f74908c6a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Nov 2018 23:00:37 +0000
In-Reply-To: <5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Fri, 09 Nov 2018 23:00:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-09 at 22:50 +0000, richard.purdie@linuxfoundation.org
wrote:
> On Fri, 2018-11-09 at 17:12 +0800, Hongxu Jia wrote:
> > -PACKAGECONFIG = "libgcrypt"
> > +PACKAGECONFIG ??= "libgcrypt libjitterentropy"
> >  PACKAGECONFIG_libc-musl = "libargp"
> >  PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-
> > standalone,"
> >  PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-
> > libgcrypt,libgcrypt,"
> > +PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,
> > --disable-jitterntropy,libjitterentropy"
> > +
> > +# Refer autogen.sh in rng-tools
> > +do_configure_prepend() {
> > +    cp ${S}/README.md ${S}/README
> > +}
> >  
> >  do_install_append() {
> >      # Only install the init script when 'sysvinit' is in
> > DISTRO_FEATURES.
> 
> This fails on musl, likely as the libc-musl override wasn't tweaked.
> It
> also means that the no libjitterentropy case wasn't tested as there
> is
> a typo likely causing this:
> 
> 
https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/190/steps/7/logs/step1b

The above is definitely from the typo and musl misconfiguration in this
patch.

> There are also other weird hangs being observed on the autobuilder
> after these changes. I can't prove its this patchset but I am
> suspicious and its something in master-next as things were working
> just
> fine until we started poking around all this again :(
> 
> 
https://autobuilder.yoctoproject.org/typhoon/#/builders/34/builds/182/steps/7/logs/stdio
> 
https://autobuilder.yoctoproject.org/typhoon/#/builders/2/builds/188/steps/7/logs/stdio

Looking further into the above shows:

NOTE:
======================================================================
NOTE: ERROR: tearDownClass (opkg.OpkgRepoTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/nightly-x32/build/meta/lib/oeqa/core/case.py", line 36, in _oeTearDownClass
    clss.tearDownClassMethod()
  File "/home/pokybuild/yocto-worker/nightly-x32/build/meta/lib/oeqa/runtime/cases/opkg.py", line 29, in tearDownClass
    cls.repo_server.stop()
  File "/home/pokybuild/yocto-worker/nightly-x32/build/meta/lib/oeqa/utils/httpserver.py", line 36, in stop
    self.process.join()
  File "/usr/lib/python3.6/multiprocessing/process.py", line 124, in join
    res = self._popen.wait(timeout)
  File "/usr/lib/python3.6/multiprocessing/popen_fork.py", line 50, in wait
    return self.poll(os.WNOHANG if timeout == 0.0 else 0)
  File "/usr/lib/python3.6/multiprocessing/popen_fork.py", line 28, in poll
    pid, sts = os.waitpid(self.pid, flag)
  File "/home/pokybuild/yocto-worker/nightly-x32/build/meta/classes/testimage.bbclass", line 166, in sigterm_exception
    raise RuntimeError
RuntimeError

which is probably other patches in -next but raises some questions
about why an error like this would just hang.

Cheers,

Richard


