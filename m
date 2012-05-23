Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXAvp-0000pX-0Q
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 14:44:49 +0200
Received: by werg55 with SMTP id g55so4982654wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=I0vskrI0thYSGe0s01TOpBm9TXcS2LJcPacCX0tVdls=;
	b=uQq2ocuQszzcWblV8fhx2o5CSWswDgCuNXJ0Olil7Zigt5voarIqWOaR+NL89AbMPd
	xbhh3oF09Rgu8rEcehr23XpzsKS0oqmYKaBaeYeKACoXJGDeJWaT2Z1wueIbknfLprOM
	zeOm+EogoKfeykvh5VTEy0OJ/5SP/IKh8L0shIU0XO9/4qI8F0Elje3ZNWV7jSBaZ1Z2
	me50RBrvfURHkG5DAFjLJsMKwG6WfMDHHMsMck3QQL7hT9exR7Cq74QkMXd7aLCS2d4+
	jn4vo0PlydiahgOav+5UVadDPd7/zRvAt9878WsGED7jRy5wf5GF/8zK8P6Fg52BhPpC
	T+CA==
MIME-Version: 1.0
Received: by 10.180.74.193 with SMTP id w1mr45791982wiv.4.1337776479013; Wed,
	23 May 2012 05:34:39 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 23 May 2012 05:34:38 -0700 (PDT)
In-Reply-To: <20120523122526.GC3995@jama.jama.net>
References: <1337775586-32611-1-git-send-email-s.stirtzel@googlemail.com>
	<CAGiJk9eMgQFSbrzL8a+ZevxQy2Bpqo75Jx4H8rQ9ff-H7J338A@mail.gmail.com>
	<20120523122526.GC3995@jama.jama.net>
Date: Wed, 23 May 2012 14:34:38 +0200
Message-ID: <CAGiJk9fHc+COFtj8jHPa9ydeHZXZD4RCQf2xN7eMB8TsVSNJ6w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: Enable valgrind for omap3
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
X-List-Received-Date: Wed, 23 May 2012 12:44:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/23 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, May 23, 2012 at 02:23:19PM +0200, Samuel Stirtzel wrote:
>> 2012/5/23 Samuel Stirtzel <s.stirtzel@googlemail.com>:
>> > Valgrind supports the armv7 architecture, this patch allows users of t=
he omap3 soc family to build and use valgrind
>> >
>> > This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
>> > * The test consisted of running valgrinds memcheck (memory leakage det=
ection),
>> > * and callgrind (profiling) on a Qt 4 application
>> >
>> > Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> > ---
>> > =C2=A0meta/recipes-devtools/valgrind/valgrind_3.7.0.bb | =C2=A0 =C2=A0=
5 ++++-
>> > =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/r=
ecipes-devtools/valgrind/valgrind_3.7.0.bb
>> > index d7c7b24..0311d75 100644
>> > --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>> > @@ -22,14 +22,17 @@ SRC_URI =3D "http://www.valgrind.org/downloads/val=
grind-${PV}.tar.bz2 \
>> > =C2=A0SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d1775"
>> > =C2=A0SRC_URI[sha256sum] =3D "5d62c0330f1481fe2c593249192fa68ff454c19c=
34343978cc9ce91aa324cbf6"
>> >
>> > -COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
>> > +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
>>
>> Oops forgot to change this line back, v2 coming soon.
>>
>> > +COMPATIBLE_HOST_omap3 =3D 'arm.*-linux'
>> >
>> > =C2=A0inherit autotools
>> >
>> > =C2=A0EXTRA_OECONF =3D "--enable-tls"
>> > +EXTRA_OECONF_omap3 =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi=
"
>
> Why not for all armv7 machines?

I've thought about that too, ok I will send the next patch with armv7.
But please keep in mind I only tested it on an omap3 device.


--=20
Regards
Samuel


