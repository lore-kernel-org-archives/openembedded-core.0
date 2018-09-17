Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE1B662133;
	Mon, 17 Sep 2018 10:54:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8HAs6B6032339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Sep 2018 11:54:08 +0100
Message-ID: <317b23b90efd4f643f7e2833a6b33e4c9d02219a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>,
	openembedded-core-bounces@lists.openembedded.org
Date: Mon, 17 Sep 2018 11:54:07 +0100
In-Reply-To: <CAJTo0LYV8kB5SL1h+mkHSUzkV+tkBzLPgsmTg8gjpt4omB42nA@mail.gmail.com>
References: <20180913131544.20812-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LYV8kB5SL1h+mkHSUzkV+tkBzLPgsmTg8gjpt4omB42nA@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/runtime_test: Ensure we build/use gnupg-native
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
X-List-Received-Date: Mon, 17 Sep 2018 10:54:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-09-16 at 10:20 +0100, Burton, Ross wrote:
> Doesn't quite work:
> 
> 2018-09-14 23:53:16,527 - oe-selftest - INFO - 7: 13/14 281/332
> (10.67s) (runtime_test.TestImage.test_testimage_dnf)
> 2018-09-14 23:53:16,527 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent
> call last):
> File "/home/pokybuild/yocto-worker/nightly-oe-
> selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> return func(*args, **kwargs)
> File "/home/pokybuild/yocto-worker/nightly-oe-
> selftest/build/meta/lib/oeqa/selftest/cases/runtime_test.py",
> line 157, in test_testimage_dnf
> runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home,
> os.path.join(signing_key_dir, 'key.secret')),
> native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
> File "/home/pokybuild/yocto-worker/nightly-oe-
> selftest/build/meta/lib/oeqa/utils/commands.py",
> line 191, in runCmd
> raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'gpg --batch --homedir
> /tmp/oeqa-feed-sign-gqt86zv_ --import
> /home/pokybuild/yocto-worker/nightly-oe-selftest/build/build-st-
> 50002/meta-selftest/files/signing/key.secret'
> returned non-zero exit status 2:
> gpg: keybox '/tmp/oeqa-feed-sign-gqt86zv_/pubring.kbx' created
> gpg: /tmp/oeqa-feed-sign-gqt86zv_/trustdb.gpg: trustdb created
> gpg: key 7B31316B5D64AD52: public key "testuser (nocomment)
> <testuser@testemail.com>" imported
> gpg: failed to start agent
> '/home/pokybuild/yocto-worker/nightly-oe-selftest/build/build-st-
> 104600/tmp/work/x86_64-linux/gnupg-native/2.2.9-r0/recipe-sysroot-
> native/usr/bin/gpg-agent':
> No such file or directory
> gpg: can't connect to the agent: No such file or directory
> gpg: error getting the KEK: No agent running
> gpg: Total number processed: 1
> gpg: imported: 1
> gpg: secret keys read: 1

A quick poke at this on a plane confirmed its an sstate relocation
issue. gnupg-native does not relocate safely. common/homedir.c has
gnupg_bindir() which isn't configurable and hardcodes the binary
locations. There are other functions in there which probably have the
same issue. Options:

a) Revert my selftest fix and require gpg on the machine running the
selftests (opens us up to gpg version issues). Clearly not all YP
autobuilder workers have it.
b) Patch gnupg to relocate properly

Cheers,

Richard

