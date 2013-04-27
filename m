Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UW1a5-0003V9-5o
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 11:38:09 +0200
Received: by mail-ee0-f46.google.com with SMTP id c13so1977024eek.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 02:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=U/zkssqiY9aFY0Eij9I7Pgsaq9gNjI3fCLU3CJA851g=;
	b=folc61L9y4BDNNLHIPUKVRtw3OSLg2qHhOpFSzXNhRICfvk5sLnwYTSxBJShEjNxEK
	2VhkhpeBhglq9nVSQiFoD2ZneY13FwjkE6HrBcWaA1i72N+IUkTXyz01q/ytHRerRQd0
	O/whJLBzB2fafdPVRS65hXrYRMvenmf0xw6aEisI9R2qvJFzQB5lGLRMl6iE3l3zIPZn
	8oMwQpc89BCdiqC8E8+h5IDsJlfSxPWiIkfO8k2aFWflbq5bDY5O5mWySI1KNaWR226H
	Y4aMZlEfWvO6aaPuCGfjpoENfX8I8LuFQd92G34/kY/6pRq66Qt6WyxxoDgt+hGnnRnO
	fCeA==
X-Received: by 10.14.115.131 with SMTP id e3mr23157310eeh.43.1367054423055;
	Sat, 27 Apr 2013 02:20:23 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id bj2sm20770937eeb.1.2013.04.27.02.20.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 02:20:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1367053734.29677.91.camel@ted>
Date: Sat, 27 Apr 2013 11:20:21 +0200
Message-Id: <67420BF5-4F80-4573-83F3-CDEFDF2CB4BB@dominion.thruhere.net>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios> <1367053734.29677.91.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQluHDIQBseNrKIlziXWuYgnphDytqeU0Ws5ViONK9/d25dGfK+TtBE+VkKmNyMoNHicZAqB
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 09:38:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2013, om 11:08 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sat, 2013-04-27 at 09:34 +0100, Paul Eggleton wrote:
>> On Friday 26 April 2013 12:30:38 Phil Blundell wrote:
>>> There doesn't appear to be any compelling reason for these tasks to =
be
>>> nostamp and having them re-run on every build can be irritating (for
>>> example, when the image is an initramfs which your kernel image =
depends
>>> on).
>>>=20
>>> Signed-off-by: Phil Blundell <philb@gnu.org>
>>> ---
>>> meta/classes/image.bbclass |    2 --
>>> 1 file changed, 2 deletions(-)
>>>=20
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index ffb372a..667d03d 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -168,11 +168,9 @@ LINGUAS_INSTALL ?=3D "${@" ".join(map(lambda s:
>>> "locale-base-%s" % s, d.getVar('IM
>>>=20
>>> PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
>>>=20
>>> -do_rootfs[nostamp] =3D "1"
>>> do_rootfs[dirs] =3D "${TOPDIR} ${WORKDIR}/intercept_scripts"
>>> do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
>>> do_rootfs[cleandirs] +=3D "${S} ${WORKDIR}/intercept_scripts"
>>> -do_build[nostamp] =3D "1"
>>>=20
>>> # Must call real_do_rootfs() from inside here, rather than as a =
separate
>>> # task, so that we have a single fakeroot context for the whole =
process.
>>=20
>> I have to say I'm not in favour of this. AFAIK these tasks have =
always been=20
>> nostamp, and I'm not sure making do_build is going to help for the =
case you=20
>> cite because the dependency on INITRD_IMAGE is on do_rootfs.
>>=20
>> If you're concerned about your initramfs image rebuilding when =
building the=20
>> main image, what happens if you specify do_rootfs[nostamp] =3D "0" ?
>=20
> I think this deserves some further thought. It is a pretty major =
change
> however it is something I've wondered about for a while independently =
of
> Phil, I've just never proposed a patch.
>=20
> It might help to think about this in an alternative way. Before we has
> the sstate checksums, it was near impossible to know when the inputs =
to
> an image had changed and when they had not. Now with the sstate
> checksums, we can know when any given input has changed and if it has
> changed, the sstate checksum changes and the task re-runs.
>=20
> You can therefore make the case that these "nostamp" tasks are a =
legacy
> of the former world and that now, there is no compelling reason to =
have
> them as nostamp. If you particularly want to force them to run, we do
> have the -f option and its tainting works here just as well as it does
> anywhere else.
>=20
> If the rootfs nostamp is removed, there is no reason to have build as =
a
> nostamp either, they were there as a pair.
>=20
> Further thoughts?

You summed up my thoughts on this quite nicely :)

regards,

Koen=


