Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqTdK-0002Lc-RJ
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 19:28:58 +0200
Received: by ywe9 with SMTP id 9so2819159ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=3f1mgzy2mJzNb32SALbBCLfdL/xOkPlYt36NZIlysJw=;
	b=m+QL4r3CQneJng4ag0W8y38iJwUwylptiDbPtwac5QP4n3UdjaVIe9txgs1uahdjTv
	Mt63LeRvPvwy+ujZjTON6smFIYtWQt0QmB6Cd5QnVsbneaIhz7sT8Z+PAuJr/4XnkcJQ
	MuWRdUBMzQ5IAdXJ77mt8XZKUoFAFJXJr2bQ4=
Received: by 10.142.121.31 with SMTP id t31mr5396209wfc.176.1312824268172;
	Mon, 08 Aug 2011 10:24:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.137 with HTTP; Mon, 8 Aug 2011 10:23:57 -0700 (PDT)
In-Reply-To: <CAGiJk9cWvhbcb=c=gj=vg0PKmR8qcVNNgN16_FLwkFOqYYmUig@mail.gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
	<4E3ABA58.9040408@gmail.com>
	<CAGiJk9eZgic_cL23CEJYq+++OW3233cdhpehwhsJkwo4=1yr9Q@mail.gmail.com>
	<4E3C295C.6060700@gmail.com>
	<CAGiJk9cWvhbcb=c=gj=vg0PKmR8qcVNNgN16_FLwkFOqYYmUig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2011 10:23:57 -0700
Message-ID: <CAMKF1sriewchbtZa1xWuDSuwAGJV_E8Z9RLDyAZs5G3Mwej=Gg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Mon, 08 Aug 2011 17:28:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2011 at 2:27 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2011/8/5 Khem Raj <raj.khem@gmail.com>:
>> It means QEMUOPTIONS is empty in your case because you are sing ext2
>> image. It supports ext3 and btrfs
>>
>> but it should be easy to add ext2 to mix. Can you try something like bel=
ow
>>
>> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>> index c15632d..64635df 100755
>> - --- a/scripts/runqemu-internal
>> +++ b/scripts/runqemu-internal
>> @@ -277,7 +277,7 @@ if [ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D
>> "qemuarmv6" -o "$MACHINE" =3D "qemuarm
>> =C2=A0 =C2=A0 MACHINE_SUBTYPE=3Dversatilepb
>> =C2=A0 =C2=A0 QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS"
>> =C2=A0 =C2=A0 # QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -force-pointer"
>> - - =C2=A0 =C2=A0if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; t=
hen
>> + =C2=A0 =C2=A0if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" -o "$F=
STYPE" =3D
>> "ext2" ]; then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D"root=3D/dev/sda rw console=3D=
ttyAMA0,115200
>> console=3Dtty $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY hi
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M versatil=
epb -hda $ROOTFS
>> - -no-reboot $QEMU_UI_OPTIONS"
>> =C2=A0 =C2=A0 fi
>>
> This patch didn't work for me, git and patch asserted that it's malformed=
:

ofcouse it was meant to be a hint not cooked patch

> -
> samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-c=
ore$
> git apply /home/samuel/Downloads/runqemu-initial.diff
> fatal: patch with only garbage at line 3
> samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-c=
ore$
> patch -p0 < /home/samuel/Downloads/runqemu-initial.diff
> patching file scripts/runqemu-internal
> patch: **** malformed patch at line 6: "qemuarmv6" -o "$MACHINE" =3D "qem=
uarm
> -
>
> After I got this done, executing runqemu shows this error:
> -
> samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-c=
ore$
> runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
> Set MACHINE to [qemuarm] based on kernel
> [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
>
> Continuing with the following parameters:
> KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin=
]
> ROOTFS: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemu=
arm.ext2]
> FSTYPE: [ext2]
> Setting up tap interface under sudo
> [sudo] password for samuel:
> Acquiring lockfile for tap0...
> /var/oe-core/setup-scripts/sources/openembedded-core/scripts/runqemu-inte=
rnal:
> Line 280: [: Too many arguments.
> Error: Unable to support this combination of options
> Set 'tap0' nonpersistent
> Releasing lockfile of preconfigured tap device 'tap0'
> -
>
> Ext3 works with the script (reverted the patch), but it seems that i
> can't connect my machine (host) to the internet as long as QEMU runs.

Doesn't happen here where latest snapshot. I can access internet from both
guest and host equally well.

> Can't try if the guest can access the internet or communicate with the
> host since it looks like systemd patches broke some init related
> stuff.
>
>
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


