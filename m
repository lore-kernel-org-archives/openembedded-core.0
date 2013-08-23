Return-Path: <erik.boto@pelagicore.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 29B356AF21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:55:35 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id n10so675093oag.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 05:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=WrbFB94E/mJnqh8bRzdPCfUfxGnk7x+6fAGOM6NN1p8=;
	b=MO8ToRg0p2XuNn74N1jbUuEVlLkQO8PzXiASk7s8d1ERtBbaKTqPAEt09Mazpg1Ntv
	KSUgFytqWgninERvapfoA6us+w7kk3045YhOXAXZ4nLhQjTc61oPQG8OFlA1xBEWDVGi
	XyhGQSJdnhZSXp8RrJvT1gOYdCqSIlqMr7RJx8EqpAhWJz3/OlIM+Bcpo9fcZ7BaJMc2
	ztSWHRMyYH7udJIa/Nw8lM8hncKwJ7Vh6oN1KLoHMiPgAg6Q2Pbekg8xAwy69X0D9Ugv
	Wb3SZVzolsBKa/YXdAaVyygdmit8KkCCvN40fk19//kgroM6mE1K20V9nIo+PPMYzNmE
	vcOQ==
X-Gm-Message-State: ALoCoQkQh5+0yLZyUcjVvgbgZy53ypns02rZK6Yfjm18BRXYH0ovemYD1t2hKdPxmyGSy5GvvIRW
MIME-Version: 1.0
X-Received: by 10.60.94.39 with SMTP id cz7mr20015085oeb.17.1377262535428;
	Fri, 23 Aug 2013 05:55:35 -0700 (PDT)
Received: by 10.76.174.6 with HTTP; Fri, 23 Aug 2013 05:55:35 -0700 (PDT)
In-Reply-To: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
References: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
Date: Fri, 23 Aug 2013 14:55:35 +0200
Message-ID: <CA+AhUGweSeQzGntMe8Yu4yn5i2LVsZag9w4cHoBCXsiU3AGR3A@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Issue with pulseaudio and Qt introduced with eglibc 2.18
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
X-List-Received-Date: Fri, 23 Aug 2013 12:55:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I modified the pulse code to print the actual error instead of just
asserting that it equals 0, and the return value of
pthread_mutex_unlock() is 1 which is EPERM aka "The current thread
does not own the mutex.".

Backtrace is:

(gdb) bt
#0  0x49f46cb4 in __GI_raise (sig=3Dsig@entry=3D6) at
../nptl/sysdeps/unix/sysv/linux/raise.c:56
#1  0x49f4a7d0 in __GI_abort () at abort.c:89
#2  0x360b0030 in pa_mutex_unlock (m=3Dm@entry=3D0x104990) at
pulsecore/mutex-posix.c:113
#3  0x345b5ca4 in poll_func (ufds=3D0x3af025f8, nfds=3D2, timeout=3D0,
userdata=3D0x104990) at pulse/thread-mainloop.c:68
#4  0x345a5e6c in pa_mainloop_poll (m=3D0x36ed0bac, m@entry=3D0x1048e0) at
pulse/mainloop.c:854
#5  0x345a65cc in pa_mainloop_iterate (m=3Dm@entry=3D0x1048e0,
block=3Dblock@entry=3D1, retval=3Dretval@entry=3D0x0) at pulse/mainloop.c:9=
36
#6  0x345a66a8 in pa_mainloop_run (m=3D0x1048e0,
retval=3Dretval@entry=3D0x0) at pulse/mainloop.c:954
#7  0x345b5c70 in thread (userdata=3D0x95fb0) at pulse/thread-mainloop.c:88
#8  0x360b0ee8 in internal_thread_func (userdata=3D0x97310) at
pulsecore/thread-posix.c:83
#9  0x4a05f1a0 in start_thread (arg=3D0x36ed1450) at pthread_create.c:314
#10 0x49fe97c0 in ?? () at
../ports/sysdeps/unix/sysv/linux/arm/clone.S:97 from /lib/libc.so.6
#11 0x49fe97c0 in ?? () at
../ports/sysdeps/unix/sysv/linux/arm/clone.S:97 from /lib/libc.so.6
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb)

Cheers,
Erik

On Fri, Aug 23, 2013 at 8:14 AM, Erik Bot=F6 <erik.boto@pelagicore.com> wro=
te:
> Hi,
>
> I'm hitting a bug now when using Qt to play e.g mp3:s to a pulseaudio sin=
k.
> Using gst-launch with playbin2 and pulsesink works well on the same syste=
m.
> I have tried a few different versions of Qt (5.0.1, 5.0.2 and Qt 5.1) and
> both pulseaudio 3 and 4 with the same problem. When I added this to
> local.conf:
>
> PREFERRED_VERSION_eglibc-locale =3D "2.17"
> PREFERRED_VERSION_eglibc-mtrace =3D "2.17"
> PREFERRED_VERSION_eglibc-scripts =3D "2.17"
> PREFERRED_VERSION_eglibc-initial =3D "2.17"
> PREFERRED_VERSION_eglibc =3D "2.17"
>
> It works ok again, so it was introduced when moving to eglib 2.18 (not
> saying that the actual error is in eglibc though).
>
> The error I'm seeing is this:
> Assertion 'pthread_mutex_unlock(&m->mutex) =3D=3D 0' failed at
> pulsecore/mutex-posix.c:108, function pa_mutex_unlock(). Aborting.
>
> Google tells me that this has been an issue for OMAP4 when certain kernel
> configuration where enabled [1], which makes me believe this might be a h=
ard
> one to track down. I'll see if I can find the time to debug it a bit more=
,
> but I would really appreciate any input.
>
> It's quite easy to reproduce, just use the QtMultimedia (built to use
> gstreamer and pulseaudio) mediaplayer example and select an mp3 file. It
> works like one time out of 20 or so, so some kind of race condition is
> probably the case.
>
> My hardware setup is a nitrogen6x board with a Freescale iMX6 processor (=
so
> I'm using meta-fsl-arm*), I've tried with both Qt built with meta-qt5 and=
 an
> external Qt build against the Yocto sysroot. If anyone can reproduce this=
 on
> some other hardware that would be nice to know.
>
> This started on the meta-freescale list [2], but is probably belonging he=
re.
>
> [1]. http://lists.linaro.org/pipermail/linaro-dev/2013-April/015794.html
> [2].
> https://lists.yoctoproject.org/pipermail/meta-freescale/2013-August/00415=
2.html
>
> Cheers,
> Erik Bot=F6



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Erik Bot=F6
Senior Software Engineer
Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)76 881 72 03
E-Mail: erik.boto@pelagicore.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

