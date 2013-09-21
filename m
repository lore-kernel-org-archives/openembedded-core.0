Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68B6C008
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 09:54:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8LA8qB3015512; Sat, 21 Sep 2013 11:08:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id InnxXlXMoyce; Sat, 21 Sep 2013 11:08:51 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8LA8jwv015497
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 21 Sep 2013 11:08:47 +0100
Message-ID: <1379757244.18603.192.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Riku Voipio <riku.voipio@linaro.org>
Date: Sat, 21 Sep 2013 10:54:04 +0100
In-Reply-To: <CAAqcGH=avmRB5GS23tj+JjckQ1Y-RrTnTkQmBHTFggnwDbihRA@mail.gmail.com>
References: <CAAqcGH=avmRB5GS23tj+JjckQ1Y-RrTnTkQmBHTFggnwDbihRA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "saul.wold" <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Subject: Re: Using pigz-native from sstate-cache while zlib-native is not there yet
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
X-List-Received-Date: Sat, 21 Sep 2013 09:54:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 17:55 +0300, Riku Voipio wrote:
> I've started observing build failures with pigz-native fails due
> ttrying to use too old libz (from host), instead of the one in
> sysroot. I take most don't see this bug because they have new enough
> zlib on their host system.
> 
> | DEBUG: Executing shell function sstate_create_package
> | gzip: /lib/x86_64-linux-gnu/libz.so.1: version `ZLIB_1.2.5.1' not
> found (required by gzip)
> | tar: Child returned status 1
> | tar: Error is not recoverable: exiting now
> | WARNING: exit code 2 from a shell command.
> | DEBUG: Python function sstate_task_postfunc finished
> | ERROR: Function failed: sstate_create_package
> 
> This seems to happen, because
> 
> 1) pigz-native is extracted from sstate cache
> 2) zlib-native is outdated, and it's compilation is being started
> 3) another task trying to use gzip/pigz meanwhile
> 
> Simply setting DEPENDS_class-native = "zlib-native" in pigz.bb didn't
> seem to help. These errors started around September 3rd, and it
> unclear to me what exactly changed that exposed thise bug.
> 
> Full build log at:
> 
> https://ci.linaro.org/jenkins/job/openembedded-armv8-rootfs/label=oe_persistent_cloud,rootfs=lamp/484/consoleText
> 
> Any hints howto fix this would be appreciated,

We also just saw this on the autobuilder which reminded me of this
email. I did look at the issue at the time but didn't understand it.
Combining what I just looked at in a build and what you reported, I
think I might have spotted a pattern now though. What happens is as you
describe:

pigz-native is used from sstate.
zlib-native is getting rebuilt.

pigz-native has some special handling to ensure its not used until the
system is ready. This is through a class and installing into a subdir of
PATH which only gets added in when we believe its available. We use
pigz-native in the image generation code and its in DEPENDS.

DEPENDS are guaranteed available for do_configure. do_populate_lic can
run before do_configure so the DEPENDS isn't met and I think this is our
corner case.

I suspect ways of fixing this are to either:

a) force do_populate_lic after do_configure everywhere
b) statically link pigz-native
c) add in an explicit dependency to gzipnative.bbclass forcing
do_populate_lic after do_configure. If do_unpack handled a tar file in
an image, it would also be at risk of course.

Looking at each, a) is overkill and our dependency tree is nasty enough
already. b) sounds nice but is also risky since what happens if the gzip
binary is half copied when we run it. Our hardlink copying should deal
with that but I'm still nervous. This leaves us with c) so we could do:

do_unpack[depends] += "gzip-native:do_populate_sysroot"

which I think should address the problem?

If anyone is interested, the reproducer is:

bitbake pigz-native
bitbake zlib-native -c clean
bitbake core-image-minimal -c populate_lic --no-setscene -f

however your system needs to have an old version of zlib on it which
pigz-native can't run against. The line above fixes it.

Cheers,

Richard



