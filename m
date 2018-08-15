Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EBFE479206
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:42:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7FKg0uk013873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 21:42:01 +0100
Message-ID: <32bf2998f462edc3286fbd04f44ab251ef1f90ed.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 15 Aug 2018 21:42:00 +0100
In-Reply-To: <ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
References: <1534339941-1968-1-git-send-email-bruce.ashfield@windriver.com>
	<ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 15 Aug 2018 20:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-15 at 16:50 +0100, Richard Purdie wrote:
> There has been one failure so far:
> 
> https://autobuilder.yocto.io/builders/build-appliance/builds/1201/ste
> ps/BuildImages_1/logs/stdio
> 
> I suspect we need to tweak the do_populate_poky_src task in the
> build-
> appliance-image recipe given the kernel devsrc change.
> 
> Other things are still building. Will reply if anything else comes
> up.

It looks really close. There was one sanity test failure basically on
all arches/kernels:

| NOTE: ======================================================================
| NOTE: FAIL: test_stap (stap.StapTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/runtime/cases/stap.py", line 33, in test_stap
|     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
| AssertionError: 1 != 0 : cd /lib/modules/`uname -r` && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)
| ln: failed to create symbolic link 'build/kernel': File exists

If we can fix that (may need the test to be tweaked?) I'll rerun and
check there isn't anything else. Looks like its hopefully not too hard
to fix!

Cheers,

Richard

