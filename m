Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B5F897391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6F7eXXm019156; Wed, 15 Jul 2015 08:40:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0DsELdgahJqN; Wed, 15 Jul 2015 08:40:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6F7eLJX019117
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Jul 2015 08:40:33 +0100
Message-ID: <1436946021.3310.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Wed, 15 Jul 2015 08:40:21 +0100
In-Reply-To: <1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
	<1436428717.9778.33.camel@linuxfoundation.org>
	<1436429491.23019.21.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Wed, 15 Jul 2015 07:40:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 13:49 +0300, Tanu Kaskinen wrote:
> On Thu, 2015-07-09 at 11:11 +0300, Tanu Kaskinen wrote:
> > On Thu, 2015-07-09 at 08:58 +0100, Richard Purdie wrote:
> > > I included these patches on the autobuilder in master-next and saw:
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/385/steps/BuildImages_1/logs/stdio
> > > 
>
> The libspeexdsp-dev problem is more difficult, and I don't really know
> how to debug it further. The error message was:
> 
> error: Can't install pulseaudio-dev-6.0-r0@core2_32: no package provides libspeexdsp-dev
> 
> However, "bitbake speexdsp" seems to generate the libspeexdsp-dev
> package just fine (libspeexdsp-dev_1.2rc3-r0_core2-64.ipk appears in the
> deploy directory).

This one is a little crazy to debug. What you need to do is build
something i586 (like qemux86), then build something core2_32 (like
genericx86), then "bitbake core-image-lsb core-image-lsb-sdk -c rootfs"
and hope the -lsb image builds before -lsb-sdk (I hacked runqueue to
ensure that). Then you see this error.

genericx86 is seeing two copies of libspeexdsp-dev, one from the i586
feed and one from the core2_32 feed and somehow they confuse it, perhaps
due to the RCONFLICTS or something.

Obviously this isn't really a bug in the libspeexdsp recipe, its a bug
in smart combined with a second bug where genericx86 shouldn't be seeing
the i586 packages.

I'll continue to try and narrow it down and produce a test case which is
more easily replicable. I'll not block your upgrades on this though,
this needs fixing elsewhere.

Cheers,

Richard 
(going quietly insane with the number of AB 'random' failures)



