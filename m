Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2SbG-0005H5-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 19:16:06 +0100
Received: by fxm19 with SMTP id 19so7797975fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=34yjaoTr9G4+imkPGufMr5HqCU/HzV3hADwFxKjUprU=;
	b=dXVilvr+jzU8LQmAe3Vpl46T9TjZIsTgUEDkph2259IlVRj20kl+AmynV91lM9eHt/
	2ZQiQZq3nYzyZ5T59K8RuAgRQTHZSoiT7Sy77TXaCr+fTFL9hdvGscX8sJ+MeevhC+Bc
	y9wxuPn9PWzRvVSVG5R/yfBjrDBPTIvoFNjKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Z15fIiIyAGlBS6Hgp4of/r0kw8kxgRTA+9JV96yCWg6DBt340r9GVIgUEsoBomwmsF
	eIWUdCZykRN5V3s6U7rSVuf8qTqmjLA/eaqaaCbcSP7HEDAWSZ68HUe5yHeA50+gLnSt
	WgR2P/avT0uTIne+rkS0xgu9J0aneNe6PrkJs=
Received: by 10.223.56.220 with SMTP id z28mr82526fag.11.1300904028548; Wed,
	23 Mar 2011 11:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 11:13:16 -0700 (PDT)
In-Reply-To: <1300899232.3018.31.camel@rex>
References: <cover.1300732395.git.raj.khem@gmail.com>
	<2a46643e032d11e07f6dfec471cadea8e9dba827.1300732395.git.raj.khem@gmail.com>
	<1300899232.3018.31.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 11:13:16 -0700
Message-ID: <AANLkTik_K3kuEfaSoSfNqVxyKpmbvYWXh80gfc8DySNX@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] scripts/poky-qemu-internal: Add call to stty
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
X-List-Received-Date: Wed, 23 Mar 2011 18:16:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 9:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-03-21 at 11:34 -0700, Khem Raj wrote:
>> When qemu is booted into console with -nographics
>> then after exiting the terminal line settings are messed
>> up. This patch calls stty sane to restore the terminal
>> settings to default.
>>
>> stty is part of coreutils which is installed on all
>> host distros hence there is no need to warn about it
>> being available or not
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0scripts/poky-qemu-internal | =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
>> index 8fd1834..556ce69 100755
>> --- a/scripts/poky-qemu-internal
>> +++ b/scripts/poky-qemu-internal
>> @@ -189,6 +189,7 @@ cleanup() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "poky-export-rootfs stop $ROOTFS"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0poky-export-rootfs stop $ROOTFS
>> =C2=A0 =C2=A0 =C2=A0fi
>> + =C2=A0 =C2=A0stty sane
>> =C2=A0}
>>
>> =C2=A0n1=3D$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
>
> With the recent change to the script to run:
>
> $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU=
_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT" || s=
tty sane
>
> is the above change still needed?

this will only execute if the command fails I guess. But the problem
happens even if qemu ran well.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


