Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QEPIX-0001SV-JW
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 19:10:10 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A1E0F16602D7; Mon, 25 Apr 2011 11:07:41 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1B788166024F;
	Mon, 25 Apr 2011 11:07:40 -0600 (MDT)
Message-ID: <4DB5AA5C.70505@mlbassoc.com>
Date: Mon, 25 Apr 2011 11:07:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>
	<4DB562CF.1020100@mlbassoc.com> <4DB59811.5040109@linux.intel.com>
	<8420B834-06E0-46FA-8811-8D121880DDE4@dominion.thruhere.net>
In-Reply-To: <8420B834-06E0-46FA-8811-8D121880DDE4@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Mon, 25 Apr 2011 17:10:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04/25/2011 10:35 AM, Koen Kooi wrote:
> Is anyone still using 2.4 kernels? That's what modutils is for, module-=
init-tools is for 2.6 kernels

Good question, hence my confusion over the two recipes.

BTW, I just built a 2.4 kernel today, so yes, there are still users...

> Op 25 apr. 2011 om 17:49 heeft Saul Wold<sgw@linux.intel.com>  het volg=
ende geschreven:
>
>> On 04/25/2011 05:02 AM, Gary Thomas wrote:
>>> On 04/23/2011 12:28 AM, Saul Wold wrote:
>>>> From: =3D?UTF-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D<ynezz@true.cz>
>>>>
>>>> In the current state, udev init script is loaded as 3rd and
>>>> modutils.sh as
>>>> 20th, so udevadm called in udev init script loads all kernel modules
>>>> in some
>>>> unpredictable order, not honoring in any way specified order of
>>>> modules in
>>>> /etc/modules. This causes some troubles mainly in the first boot. So
>>>> to fix
>>>> this we now move loading of the kernel modules just before we exec
>>>> udev init
>>>> script. Example of the current state:
>>>>
>>>> Starting udev
>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>>>
>>>> root@ts72xx:~# cat /etc/modules
>>>> rtc-ep93xx
>>>> ohci-hcd
>>>> ts72xx_sbcinfo
>>>> rtc-m48t86
>>>>
>>>> As you can guess, this is really wrong behaviour, because I've rtc1 =
as
>>>> the
>>>> main time source for my system.
>>>>
>>>> root@ts72xx:~# cat /etc/default/hwclock
>>>> HWCLOCKACCESS=3Dyes
>>>> HWCLOCKDEVICE=3D/dev/rtc1
>>>>
>>>> Expected behaviour with this patch applied:
>>>>
>>>> Please wait: booting...
>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>>>> usbcore: registered new device driver usb
>>>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>>> ...
>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>> Starting udev
>>>>
>>>> Signed-off-by: Petr =C5=A0tetiar<ynezz@true.cz>
>>>>
>>>> (based on http://patches.openembedded.org/patch/1917/)
>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>> .../modutils/modutils-initscripts.bb | 4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> index 1665955..5ae34b4 100644
>>>> --- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> +++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> @@ -4,10 +4,10 @@ LICENSE =3D "PD"
>>>> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7bf87fc37976e93ec66ad84fa=
c58c098"
>>>> SRC_URI =3D "file://modutils.sh \
>>>> file://PD.patch"
>>>> -PR =3D "r4"
>>>> +PR =3D "r5"
>>>>
>>>> INITSCRIPT_NAME =3D "modutils.sh"
>>>> -INITSCRIPT_PARAMS =3D "start 20 S ."
>>>> +INITSCRIPT_PARAMS =3D "start 2 S ."
>>>>
>>>> inherit update-rc.d
>>>>
>>>
>>> Should there not be a corresponding change to modutils_2.4.27.bb? It'=
s
>>> not clear to me
>>> where there are these two separate recipes, but they should at least =
be
>>> kept in sync.
>>>
>> Gary,
>>
>> Could you please resend this as a proper patch with Signed-off-by and =
commit info.
>>
>> Thanks
>>     Sau!
>>
>>> diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>>> b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>>> index 1ebc90c..2944201 100644
>>> --- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>>> +++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>>> @@ -5,7 +5,7 @@ manageable for all users, administrators and
>>> distribution maintainers."
>>> LICENSE =3D "GPLv2"
>>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c21=
66c28b"
>>> DEPENDS =3D "bison-native"
>>> -PR =3D "r9"
>>> +PR =3D "r10"
>>>
>>> SRC_URI =3D
>>> "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.=
tar.bz2
>>> \
>>> file://lex.l.diff;patch=3D1 \
>>> @@ -51,7 +51,7 @@ if test -n "$D"; then
>>> done
>>> fi
>>> fi
>>> -update-rc.d $D modutils.sh start 20 S .
>>> +update-rc.d $D modutils.sh start 2 S .
>>> }
>>>
>>> pkg_prerm_modutils () {
>>>

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


