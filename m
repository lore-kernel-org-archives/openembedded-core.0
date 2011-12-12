Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1Ra7wN-0004bK-AD; Mon, 12 Dec 2011 16:37:21 +0100
Received: by pbcc11 with SMTP id c11so955768pbc.6
	for <multiple recipients>; Mon, 12 Dec 2011 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=iFs4y7iNmyjGOYyrDIik0TYp1L5tiPRNufMobpH1QSE=;
	b=ApDIoLxzIlBxgDRJVu2+NzA6UQ0231i4EE2KQRNvcvRQx70IuP47rudZZmeZ2Ha9WO
	LI/ZSCrJty1A2NFUSyOcASB20kPYAFO+8tjFF/WteM9EyFSCsI3sM2ooW2C4Dq9I1PzC
	eTy65JMGfFh454PzodZUAUh50cqCZXrReLGn4=
MIME-Version: 1.0
Received: by 10.68.72.130 with SMTP id d2mr34687004pbv.115.1323703822299; Mon,
	12 Dec 2011 07:30:22 -0800 (PST)
Received: by 10.142.127.17 with HTTP; Mon, 12 Dec 2011 07:30:22 -0800 (PST)
In-Reply-To: <20111212085851.GE3783@jama.jama.net>
References: <20111212084206.608CB10332@opal>
	<20111212084731.GD3783@jama.jama.net>
	<3658FA4C-A757-40C6-B6CC-CB4A925103A4@dominion.thruhere.net>
	<20111212085851.GE3783@jama.jama.net>
Date: Mon, 12 Dec 2011 10:30:22 -0500
Message-ID: <CADkTA4PVCd_Q3sQcQ0H_ySMtvoCg3O4i3p1s7Tx7ux6BXeT7_A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel version has extra '+' when kernel is built from git
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
X-List-Received-Date: Mon, 12 Dec 2011 15:37:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 3:58 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Dec 12, 2011 at 09:53:47AM +0100, Koen Kooi wrote:
>>
>> Op 12 dec. 2011, om 09:47 heeft Martin Jansa het volgende geschreven:
>>
>> > On Mon, Dec 12, 2011 at 08:42:06AM +0000, git@git.openembedded.org wro=
te:
>> >> Module: meta-openembedded.git
>> >> Branch: master
>> >> Commit: c486dfa4013b37972c1a1e4df8616eb6f49de498
>> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=
=3Dcommit;h=3Dc486dfa4013b37972c1a1e4df8616eb6f49de498
>> >>
>> >> Author: Koen Kooi <koen@dominion.thruhere.net>
>> >> Date: =A0 Sun Dec 11 09:46:28 2011 +0100
>> >>
>> >> kernel bbclass: sync with OE-core
>> >>
>> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >
>> > If you're working on shared linux.inc in meta-oe, could you please
>> > integrate this:
>> >
>> > do_configure_prepend() {
>> > #otherwise it gets extra '+' "2.6.37+"
>> > #because:
>> > #$ scripts/setlocalversion . =3D> +
>> > #$ make kernelversion =3D> 2.6.37
>> > #$ make kernelrelease =3D> 2.6.37+
>> > =A0rm -rf ${S}/.git
>> > }
>>
>> That would break the following:
>>
>> koen@dominion:/OE/tentacle$ tail conf/local.conf -n15 | head -n4
>> ASSUME_PROVIDED +=3D "gitam-native"
>> PATCHTOOL_pn-linux-ti33x-psp =3D "gitam"
>> PATCHTOOL_pn-linux =3D "gitam"
>> PATCHTOOL_pn-u-boot =3D "gitam"
>>
>>
>> > I have to do this in every git recipe as I don't like dirs like
>> > /lib/modules/2.6.37+
>>
>>
>> > Maybe it should be fixed on kernel.bbclass level, because linux-yocto
>> > suffers the same ie /lib/modules/3.0.12-yocto-standard+
>> >
>> > Ccing oe-core for that..
>>
>>
>> I had a patch for scripts/setlocalversion that got rid of the '+', but I=
 stopped caring after a while. We could just run sed in kernel.bbclass to f=
ix the script.
>
> Even better than removing .git.

Agreed. We definitely do not want to remove git, that would break anyone do=
ing
git based patching (as Koen) pointed out.

Either carrying a patch to fix the in kernel script, or fixing it up
after the configure
phase work for me.

Cheers,

Bruce

>
> Regards,
>
>>
>> regards,
>>
>> Koen
>
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


