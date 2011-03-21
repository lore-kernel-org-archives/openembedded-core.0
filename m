Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jrL-0008JR-A5
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:29:43 +0100
Received: by bwz10 with SMTP id 10so5021436bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=mTLGuZZ2F/Ed5b0uioaa21pyAcOm3csLq0IIoBGnPXU=;
	b=VJlm5dzeFR/YOvx0lmpZYt/DbPliRnA7/losjN4LdXR9yJqX1DFi2m7rMRVKO8AEmF
	rNmgeToac06iRscenDbu3EDKxbXizcM54sqjaD81N1PEkd6eP0qIda35vPU8z15ZL6jn
	knLPm2FuzwDKKAKfrolclxUtAngePLPlGSREw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=a5tCCj2uXm5PrHwpi1vaST7EkiKFlXsSQ8VBn6eXlgiR8wyOLUfOgwjqVjtU1BPsiK
	MP5mPxsBJmXXW34KWxKrU9D4N7aRBxqXnsiu9ddWZyDXZAS5T6ARbc0Scx+pLH8iNbbU
	FlrNYuLjIhIPabnKEWitTIrjaCygZWSqKxgUY=
Received: by 10.204.19.66 with SMTP id z2mr312498bka.178.1300732074346; Mon,
	21 Mar 2011 11:27:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.14.197 with HTTP; Mon, 21 Mar 2011 11:27:24 -0700 (PDT)
In-Reply-To: <65b9e5677c44ce9adbcca244918cb063c55bd448.1300731432.git.raj.khem@gmail.com>
References: <cover.1300731432.git.raj.khem@gmail.com>
	<65b9e5677c44ce9adbcca244918cb063c55bd448.1300731432.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Mar 2011 11:27:24 -0700
Message-ID: <AANLkTi=ze367JjQs9gN=koD2ub4C3YACj_GJ7dSKii5w@mail.gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] scripts/poky-qemu-internal: Add call to stty
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
X-List-Received-Date: Mon, 21 Mar 2011 18:29:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2011 at 11:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> When qemu is booted into console with -nographics
> then after exiting the terminal line settings are messed
> up. This patch calls stty sane to restore the terminal
> settings to default.
>
> stty is part of coreutils which is installed on all
> host distros hence there is no need to warn about it
> being available or not
>

this has another hunk which was not intended. I will resend it

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0scripts/poky-qemu-internal | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
> index 82ef265..ea6539e 100755
> --- a/scripts/poky-qemu-internal
> +++ b/scripts/poky-qemu-internal
> @@ -187,6 +187,7 @@ cleanup() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "poky-export-rootfs stop $ROOTFS"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 poky-export-rootfs stop $ROOTFS
> =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0stty sane
> =C2=A0}
>
> =C2=A0n1=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
> @@ -377,7 +378,7 @@ if [ "$MACHINE" =3D "qemuppc" ]; then
> =C2=A0 =C2=A0 MACHINE_SUBTYPE=3Dprep
> =C2=A0 =C2=A0 CPU_SUBTYPE=3D603e
> =C2=A0 =C2=A0 BIOS=3Dpowerpc_rom.bin
> - =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS -nographic"
> + =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D"$QEMU_UI_OPTIONS"
> =C2=A0 =C2=A0 if [ "$FSTYPE" =3D "ext3" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNCMDLINE=3D"root=3D/dev/hda console=3DttyS=
0 console=3Dtty0 $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMORY"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -cpu $CPU_SU=
BTYPE -M $MACHINE_SUBTYPE -bios $BIOS -hda $ROOTFS -no-reboot $QEMU_UI_OPTI=
ONS"
> --
> 1.7.4.1
>
>


