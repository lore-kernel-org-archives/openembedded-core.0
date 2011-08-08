Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QqMC5-0008DI-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 11:32:21 +0200
Received: by wyf19 with SMTP id 19so1563394wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GGcFb+a6Y3K3RtmQooLFhilI13A6wVqIJh9gp/MX2gk=;
	b=elMNKHAC6K3Wn3Q+uWavbd6jyGcjduX2Yk6icdKWoyhucjiUnMwhVFJps7QUcCerNS
	J1QRVTPHjJ7P5mov9iG2dJILijHTJrRP04uMKHyhB8E+5EEisuTak33uUfGTGRyySTkl
	Aje60eL3fGTJ15gr7xPmIuCDAgjfQRZ+lcYOs=
MIME-Version: 1.0
Received: by 10.227.201.79 with SMTP id ez15mr4345983wbb.76.1312795673061;
	Mon, 08 Aug 2011 02:27:53 -0700 (PDT)
Received: by 10.227.2.74 with HTTP; Mon, 8 Aug 2011 02:27:53 -0700 (PDT)
In-Reply-To: <4E3C295C.6060700@gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
	<CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
	<4E3ABA58.9040408@gmail.com>
	<CAGiJk9eZgic_cL23CEJYq+++OW3233cdhpehwhsJkwo4=1yr9Q@mail.gmail.com>
	<4E3C295C.6060700@gmail.com>
Date: Mon, 8 Aug 2011 11:27:53 +0200
Message-ID: <CAGiJk9cWvhbcb=c=gj=vg0PKmR8qcVNNgN16_FLwkFOqYYmUig@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Mon, 08 Aug 2011 09:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/8/5 Khem Raj <raj.khem@gmail.com>:
> It means QEMUOPTIONS is empty in your case because you are sing ext2
> image. It supports ext3 and btrfs
>
> but it should be easy to add ext2 to mix. Can you try something like belo=
w
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index c15632d..64635df 100755
> - --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -277,7 +277,7 @@ if [ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D
> "qemuarmv6" -o "$MACHINE" =3D "qemuarm
> =A0 =A0 MACHINE_SUBTYPE=3Dversatilepb
> =A0 =A0 QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS"
> =A0 =A0 # QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -force-pointer"
> - - =A0 =A0if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" ]; then
> + =A0 =A0if [ "$FSTYPE" =3D "ext3" -o "$FSTYPE" =3D "btrfs" -o "$FSTYPE" =
=3D
> "ext2" ]; then
> =A0 =A0 =A0 =A0 KERNCMDLINE=3D"root=3D/dev/sda rw console=3DttyAMA0,11520=
0
> console=3Dtty $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY hi
> =A0 =A0 =A0 =A0 QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M versatilepb -hda $ROO=
TFS
> - -no-reboot $QEMU_UI_OPTIONS"
> =A0 =A0 fi
>
This patch didn't work for me, git and patch asserted that it's malformed:
-
samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-cor=
e$
git apply /home/samuel/Downloads/runqemu-initial.diff
fatal: patch with only garbage at line 3
samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-cor=
e$
patch -p0 < /home/samuel/Downloads/runqemu-initial.diff
patching file scripts/runqemu-internal
patch: **** malformed patch at line 6: "qemuarmv6" -o "$MACHINE" =3D "qemua=
rm
-

After I got this done, executing runqemu shows this error:
-
samuel@S-Stirtzel-Linux:/var/oe-core/setup-scripts/sources/openembedded-cor=
e$
runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
Set MACHINE to [qemuarm] based on kernel
[/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]

Continuing with the following parameters:
KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
ROOTFS: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuar=
m.ext2]
FSTYPE: [ext2]
Setting up tap interface under sudo
[sudo] password for samuel:
Acquiring lockfile for tap0...
/var/oe-core/setup-scripts/sources/openembedded-core/scripts/runqemu-intern=
al:
Line 280: [: Too many arguments.
Error: Unable to support this combination of options
Set 'tap0' nonpersistent
Releasing lockfile of preconfigured tap device 'tap0'
-

Ext3 works with the script (reverted the patch), but it seems that i
can't connect my machine (host) to the internet as long as QEMU runs.
Can't try if the guest can access the internet or communicate with the
host since it looks like systemd patches broke some init related
stuff.


Regards
Samuel


