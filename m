Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2QFN-0005G7-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:45:21 +0100
Received: by wyb40 with SMTP id 40so7633709wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:43:30 -0700 (PDT)
Received: by 10.216.141.225 with SMTP id g75mr6480654wej.10.1300895010381;
	Wed, 23 Mar 2011 08:43:30 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm3403500wer.37.2011.03.23.08.43.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 08:43:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1300894880.3018.8.camel@rex>
Date: Wed, 23 Mar 2011 16:43:29 +0100
Message-Id: <21BA7A9E-9AB1-493C-96BE-4B600FBFB125@dominion.thruhere.net>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
	<20110322221814.GA13076@sakrah.homelinux.org>
	<B073FF3E-7CE1-4FAF-99B4-3ED5832954CD@dominion.thruhere.net>
	<AANLkTimhEBgbMP8OrgVavchhHgjKrtpS2CKzFzC8wuUW@mail.gmail.com>
	<1300894880.3018.8.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Mar 2011 15:45:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt 2011, om 16:41 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-03-23 at 08:17 -0700, Khem Raj wrote:
>> On Wed, Mar 23, 2011 at 12:16 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>=20
>>> Op 22 mrt 2011, om 23:18 heeft Khem Raj het volgende geschreven:
>>>=20
>>>> On (22/03/11 19:54), Koen Kooi wrote:
>>>>>=20
>>>>> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
>>>>>=20
>>>>>> On (22/03/11 19:42), Koen Kooi wrote:
>>>>>>>=20
>>>>>>> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
>>>>>>>=20
>>>>>>>> Hi
>>>>>>>>=20
>>>>>>>> I did an update of oe-core yesterday and now mips is failing =
with this
>>>>>>>> error. It was not there 2 days back.
>>>>>>>>=20
>>>>>>>> | Configuring sysvinit.
>>>>>>>> | Collected errors:
>>>>>>>> |  * satisfy_dependencies_for: Cannot satisfy the following =
dependencies
>>>>>>>> for task-base:
>>>>>>>> |  *    kernel-misc *
>>>>>>>> |  * opkg_install_cmd: Cannot install package task-base.
>>>>>>>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
>>>>>>>>=20
>>>>>>>> I have not bisected but if anyone else is seeing it I would =
like to know
>>>>>>>=20
>>>>>>> I think thats fallout from the kernel.bbclass change:
>>>>>>>=20
>>>>>>> meta/classes/kernel.bbclass:FILES_kernel-misc =3D =
"/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel
>>>>>>>=20
>>>>>>> I don't know what purpose that package has, but try rebuilding =
the kernel and see what happens. We might need to blacklist it from =
being included in the kernel-modules meta-package.
>>>>>>>=20
>>>>>>=20
>>>>>> I have already build everything from scratch even deleted sstate =
cache
>>>>>=20
>>>>> Can you give this a try?
>>>>>=20
>>>>> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ =
git diff kernel.bbclass
>>>>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>>>>> index 3eb6659..9f014d4 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
>>>>>       metapkg =3D "kernel-modules"
>>>>>       bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
>>>>>       bb.data.setVar('FILES_' + metapkg, "", d)
>>>>> -       blacklist =3D [ 'kernel-dev', 'kernel-image', =
'kernel-base', 'kernel-vmlinux', 'perf' ]
>>>>> +       blacklist =3D [ 'kernel-dev', 'kernel-image', =
'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
>>>>>       for l in module_deps.values():
>>>>>               for i in l:
>>>>>                       pkg =3D module_pattern % =
legitimize_package_name(re.match(module_regex, os.path.basename(i)).gro
>>>>>=20
>>>>> I think that should go in regardless, but I'm curious if it fixes =
your problem. The meta-pkg should only pickup kernel-module-* and =
kernel-firmware-*, so a whitelist would be even bettter.
>>>>>=20
>>>>=20
>>>> It did not fix the problem. I tried bitbake -c cleanall =
virtual/kernel
>>>> bitbake console-image
>>>=20
>>> To which class did you appy it? There's a copy of kernel.bbclass in =
meta-oe with some change we need to merge into oe-core (initramfs =
handling, better uImage handling, etc).
>>=20
>> thanks I was thinking I applied it to meta-oe but when I revisited I
>> applied it to oe-core
>> :)
>=20
> If that fixes it can someone share a proper patch please (for
> oe-core) :)

I'll send a patch after Khem confirms the fix.=


