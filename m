Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2521f751cc6ff0682c41df568d5ac497a41dc60f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/1] apt: add apt selftest to test signed package feeds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Apr 2022 22:51:58 +0100
In-Reply-To: <YlXzyOPuwW+vOQ63@mail.local>
References: <20220411205036.8298-1-fntoth@gmail.com>
	 <20220411205036.8298-2-fntoth@gmail.com> <YlWJ1p+E/bTygFNo@mail.local>
	 <6cb8d5aa-dd1f-40ab-8f10-50449f1e8438@gmail.com>
	 <YlXzyOPuwW+vOQ63@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ferry Toth <fntoth@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Xavier Berger <xavier.berger@biologic.net>, Alexander Kanavin <alex@linutronix.de>

On Tue, 2022-04-12 at 23:48 +0200, Alexandre Belloni wrote:
> On 12/04/2022 23:32:49+0200, Ferry Toth wrote:
> > Hi
> > 
> > Op 12-04-2022 om 16:16 schreef Alexandre Belloni:
> > > Hello,
> > > 
> > > On 11/04/2022 22:50:36+0200, Ferry Toth wrote:
> > > > From: Ferry Toth <ftoth@exalondelft.nl>
> > > > 
> > > > Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
> > > > Currently when building images this requirement is worked around by using [allow-insecure=yes] and
> > > > equivalently when performing selftest.
> > > > 
> > > > Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign DEB package feeds"
> > > > enable signed DEB package feeds. This patch adds a runtime test for apt derived from the test_testimage_dnf
> > > > test. It creates a signed deb package feed, runs a qemu image to install the key and performs some package
> > > > management. To be able to install the key the gnupg package is added to the testimage.
> > > > 
> > > 
> > > This went through the autobuilders and it seems this still fails:
> > 
> > That is disappointing.
> > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3437/steps/15/logs/stdio
> > > 
> > > ERROR: package-index-1.0-r0 do_package_index: Could not get gpg version: Command '['/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/hosttools/gpg', '--agent-program=/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/hosttools/gpg-agent|--auto-expand-secmem', '--version', '--no-permission-warning']' returned non-zero exit status 2.
> > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-34525/tmp/work/core2-64-poky-linux/package-index/1.0-r0/temp/log.do_package_index.53841
> > > NOTE: recipe package-index-1.0-r0: task do_package_index: Failed
> > 
> > In fact package_index is failing, which is outside this patch code.
> > 
> > > ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/meta/package-index.bb:do_package_index) failed with exit code '1'
> > > 
> > > This was ubuntu 16.04 so maybe gpg on the distro is too old (1.4.20) but
> > > I'm not sure as I think you are using gnupg-native.
> > 
> > I would have expected gnupg-native, but the log line above shows hosttools
> > is being used. But the same would happen for signed rpm and ipk feeds right?
> > 
> > Did we get the correct one tested? I see 55173d in next and then reverted by
> > Richard. But that was v2.
> > 
> 
> This was https://git.yoctoproject.org/poky-contrib/commit/?id=5abda438ce762fc7b8e065e3e9063820c758918e
> 
> Just to be sure, I've started on ubuntu1604 both master and this branch,
> we'll see if this reproduces.

Firstly, this is occurring in the newly added test so this is being triggered by
the new code. I suspect what is happening is that gnupg-native isn't being built
before the test and this means that it is falling back to the system gpg. The
system gpg is too old on that worker so it fails.

You can probably reproduce locally by not having a gpg on your build system
(move it out the way temporarily?).

If I'm right (and I'm just guessing), the fix is to add the missing dependency
to ensure gpg is one we've built.

Cheers,

Richard



