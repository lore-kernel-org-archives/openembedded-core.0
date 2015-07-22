Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6066B738ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 07:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6M72NYa030482; Wed, 22 Jul 2015 08:02:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7Nk28lJnUfkM; Wed, 22 Jul 2015 08:02:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6M72Bmi030477
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 22 Jul 2015 08:02:22 +0100
Message-ID: <1437548530.821.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Jul 2015 08:02:10 +0100
In-Reply-To: <CAJ86T=XursrAyvaRLypQ8Ov07u7+-Om6RUtCA2MeordxM7WU7w@mail.gmail.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
	<1436428717.9778.33.camel@linuxfoundation.org>
	<1436429491.23019.21.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436946021.3310.95.camel@linuxfoundation.org>
	<CAJ86T=XursrAyvaRLypQ8Ov07u7+-Om6RUtCA2MeordxM7WU7w@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Jul 2015 07:02:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-15 at 01:25 -0700, Andre McCurdy wrote:
> On Wed, Jul 15, 2015 at 12:40 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2015-07-09 at 13:49 +0300, Tanu Kaskinen wrote:
> >> On Thu, 2015-07-09 at 11:11 +0300, Tanu Kaskinen wrote:
> >> > On Thu, 2015-07-09 at 08:58 +0100, Richard Purdie wrote:
> >> > > I included these patches on the autobuilder in master-next and saw:
> >> > >
> >> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/385/steps/BuildImages_1/logs/stdio
> >> > >
> >>
> >> The libspeexdsp-dev problem is more difficult, and I don't really know
> >> how to debug it further. The error message was:
> >>
> >> error: Can't install pulseaudio-dev-6.0-r0@core2_32: no package provides libspeexdsp-dev
> >>
> >> However, "bitbake speexdsp" seems to generate the libspeexdsp-dev
> >> package just fine (libspeexdsp-dev_1.2rc3-r0_core2-64.ipk appears in the
> >> deploy directory).
> >
> > This one is a little crazy to debug. What you need to do is build
> > something i586 (like qemux86), then build something core2_32 (like
> > genericx86), then "bitbake core-image-lsb core-image-lsb-sdk -c rootfs"
> > and hope the -lsb image builds before -lsb-sdk (I hacked runqueue to
> > ensure that). Then you see this error.
> >
> > genericx86 is seeing two copies of libspeexdsp-dev, one from the i586
> > feed and one from the core2_32 feed and somehow they confuse it, perhaps
> > due to the RCONFLICTS or something.
> >
> > Obviously this isn't really a bug in the libspeexdsp recipe, its a bug
> > in smart combined with a second bug where genericx86 shouldn't be seeing
> > the i586 packages.
> 
> Not sure if it's related, but tune-core2.inc deliberately includes
> PACKAGE_EXTRA_ARCHS_tune-i586 when defining
> PACKAGE_EXTRA_ARCHS_tune-core2-32, which seems to be correct according
> to conf/machine/include/README:
> 
>   "PACKAGE_EXTRA_ARCHS_tune-<tune> - List all of the package architectures
>   that are compatible with this specific tune.  The package arch of this
>   tune must be in the list."

As we define things today, its certainly correct. I do continue to
wonder if there shouldn't be two different fields, the list of arches to
use at build time and the complete list of compatible arches which would
be separate.

How we'd go about such an invasive change is the real issue.

Cheers,

Richard


