Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q27RI-0006ZQ-Hd
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 20:40:24 +0100
Received: by fxm19 with SMTP id 19so6870220fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=h4hqCq0Ozljl1EOqvkxDG+wK673K+/C6M6rZ+i1TYCU=;
	b=qbDwjAvS9jmbPjHUeZuiDMYdRwR4QM1xmVMrpEcdB0t2ft3cUwIiUi7vuzoCiXCafB
	YrVYuwyPLnSBTCcvZhJVy1L6LHr7R5eX+ZMbGZ6Qj8YM81udmHnYHEEdJXwhdsy20HSw
	u42irXxdzPjiWUyssqoKICTePWt1uQXrE5nOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=uwok5NvCJ5ijF0GDliJaqkE5fXtSSLX2bGxxN5gsO1UXqUEGW5/ARJJ20aCIRo8zN9
	mHil0WSMG6qOjPYhpOYSNUqJoO6T+bwn9/dlOQn3Xe4OXT/KRq48eXPoyPsVlUE66Q63
	mxAyOYf5M7vljt6ClB6vGgJdz3fSizwZYbHh8=
Received: by 10.223.15.141 with SMTP id k13mr2005520faa.30.1300822430202; Tue,
	22 Mar 2011 12:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Tue, 22 Mar 2011 12:33:20 -0700 (PDT)
In-Reply-To: <32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2011 12:33:20 -0700
Message-ID: <AANLkTimagXYb=jHe11QM_VNhcNS2n8qhY=kn-L1jmtZq@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: MIPS rootfs creation failure
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
X-List-Received-Date: Tue, 22 Mar 2011 19:40:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 11:54 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
>
>> On (22/03/11 19:42), Koen Kooi wrote:
>>>
>>> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
>>>
>>>> Hi
>>>>
>>>> I did an update of oe-core yesterday and now mips is failing with this
>>>> error. It was not there 2 days back.
>>>>
>>>> | Configuring sysvinit.
>>>> | Collected errors:
>>>> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following depen=
dencies
>>>> for task-base:
>>>> | =C2=A0* =C2=A0 =C2=A0kernel-misc *
>>>> | =C2=A0* opkg_install_cmd: Cannot install package task-base.
>>>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
>>>>
>>>> I have not bisected but if anyone else is seeing it I would like to kn=
ow
>>>
>>> I think thats fallout from the kernel.bbclass change:
>>>
>>> meta/classes/kernel.bbclass:FILES_kernel-misc =3D "/kernel/include/conf=
ig /kernel/scripts /kernel/drivers/crypto /kernel
>>>
>>> I don't know what purpose that package has, but try rebuilding the kern=
el and see what happens. We might need to blacklist it from being included =
in the kernel-modules meta-package.
>>>
>>
>> I have already build everything from scratch even deleted sstate cache
>
> Can you give this a try?
>
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ git di=
ff kernel.bbclass
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3eb6659..9f014d4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D "kernel-modules"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", =
d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('FILES_' + metapkg, "", d)
> - =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'ker=
nel-base', 'kernel-vmlinux', 'perf' ]
> + =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'ker=
nel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in module_deps.values():
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in l:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pkg =3D module_pattern % legitimize_package_name(re.match(module_=
regex, os.path.basename(i)).gro
>
> I think that should go in regardless, but I'm curious if it fixes your pr=
oblem. The meta-pkg should only pickup kernel-module-* and kernel-firmware-=
*, so a whitelist would be even bettter.


yesFWIW it only happens for qemumips other qemu machines are chugging
along fine.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


