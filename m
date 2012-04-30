Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOs38-000842-0a
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 16:58:02 +0200
Received: by lagw12 with SMTP id w12so1859322lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=gPUO5Uy4ZhPYgF/hTQPNKYkIXDix53eemVtq3Xfvxto=;
	b=IJpXdEOpByTLqUIM5JiEEHwklUmToF5pNFL8wxN0I8wSL5XFEvkjbvJBirfIuMAzMy
	mbRK0dgEbqceNedpkjFSk4/odI0wBzS44jXYTD1hBRrWhF71ED3Y3LpMq08LmENX1eY8
	vfgbY5tKogJiUhIblPpu+wWymrn607xN10+xn6Qweikom4qy8s6kQHS7YRn2HSshrV54
	g32nreu28Be5OsAWKfANIGWienTwWQqi8kfvxwrtC231I0RUVuOnaJsuqGYbSebqCK0c
	qcJWK8yWvbcWOa2jTdPaD9BGKNa29xXeRId5p+yFQdlMmKEcdHW0zQduBZf+j6oki6Uu
	XWBQ==
Received: by 10.152.133.144 with SMTP id pc16mr20364292lab.0.1335797299838;
	Mon, 30 Apr 2012 07:48:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 07:47:49 -0700 (PDT)
In-Reply-To: <1335796919.7415.20.camel@ted>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 07:47:49 -0700
Message-ID: <CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 14:58:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 30, 2012 at 7:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2012-04-29 at 10:23 -0700, Khem Raj wrote:
>> On Thu, Apr 26, 2012 at 2:06 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2012-04-26 at 20:30 +0100, Richard Purdie wrote:
>> >> On Thu, 2012-04-26 at 15:47 +0100, Richard Purdie wrote:
>> >> > On Wed, 2012-04-25 at 16:31 -0700, Khem Raj wrote:
>> >> > > Hello
>> >> > >
>> >> > > Now that release is almost out of door. I would like some eyes on the
>> >> > > gcc-4.7 work
>> >> > > and mips64 architecture support that I have done meanwhile
>> >> > >
>> >> > > I have made sure that gcc-4.6 still keeps working and I have patches
>> >> > > for gcc-4.5 too
>> >> > > for meta-oe too. I have repeatedly built core-image-sato and
>> >> > > core-image-minimal for uclibc/eglibc
>> >> > > but more coverage would be nicer.
>> >> > >
>> >> > > The patches are posted here
>> >> > >
>> >> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
>> >> > >
>> >> > > I would appreciate any feedback or testing on this
>> >> >
>> >> > I had a look through the patch series. I've posted an altered version of
>> >> > the class override patch. I've pulled the gcc 4.7 part into master-next,
>> >> > have get gcc 4.7 as the default and am running it though the
>> >> > autobuilder. That should see how we stand with our usual regression
>> >> > tests.
>> >>
>> >> The builds shows the following failures (I've kept duplication so you
>> >> can see the patterns). Not too bad considering:
>> >>
>> >> MACHINE=qemux86, failure in:
>> >> gst-ffmpeg:do_configure
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/66/steps/shell_24/logs/stdio
>> >>
>> >> MACHINE=qemuarm, failures in:
>> >> clutter-1.8:do_configure
>> >> glew:do_compile
>> >> qt4-x11-free:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_19/logs/stdio
>> >>
>> >> MACHINE=qemuppc, failures in:
>> >> clutter-1.8:do_configure
>> >> glew:do_compile
>> >> qt4-x11-free:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_19/logs/stdio
>> >>
>> >> MACHINE=mpc8315e-rdb, failure in:
>> >> mesa-dri:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_35/logs/stdio
>> >>
>> >> MACHINE=qemumips, failures in:
>> >> clutter-1.8:do_configure
>> >> glew:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_19/logs/stdio
>> >>
>> >> MACHINE=beagleboard, failure in:
>> >> mesa-dri:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_35/logs/stdio
>> >>
>> >> MACHINE=routerstationpro, failure in:
>> >> mesa-dri:do_compile
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_35/logs/stdio
>> >>
>> >>
>> >> Also, adding meta-qt3 and building lsb targets with DISTRO=poky-lsb adds
>> >> the failure:
>> >> qt-x11-free:do_compile
>> >> <plus repeats of the above>
>> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_76/logs/stdio
>> >
>> > FWIW I've posted a mesa fix which should help many of these issue. It
>> > looks like gcc 4.7 has stricter option parsing.
>> >
>> > Why mesa didn't always fail to build is something that needs looking
>> > into as a separate issue, the logs are full of errors.
>>
>> Do you some layer slapped on top of OE-Core which might be screwing
>> things up since I built using OE-Core standalone I do not remember
>> seeing these issues.
>
> These mostly turned out to be due to issues with the mesa x32 patch in
> OE-Core and would only show up on an x86_64 host. I added a fix for
> this.
>
> FWIW, gcc 4.7 and eglibc 2.15 are now the default in master.

yay

 Test builds
> were looking good until the autobuilder ran out of disk space on the
> shared drive for sstate :(.

hopefully nothing new shows up

>
> Only known unresolved failure so far is "DISTRO=poky-tiny bitbake
> eglibc" which fails due to its cut down eglibc options.
>

hmmm. Whats the error ?

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


