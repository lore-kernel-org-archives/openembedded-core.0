Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SHN5H-0003Y6-Ff
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 00:29:15 +0200
Received: by lagw12 with SMTP id w12so3564568lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Fi1utiH6yJKAAQDV6GrnbCH/mzI39SRcZar64WG9LoU=;
	b=pjZzPCRuiQUmRt1e+MKIPvLi+nyoChpQ5nFh6h6B0nnZyYT86buYyLaX7R61Vz9IIY
	K9aYglYdYajLW/SwIhkf27wHBy2qudw8+hUlxcA2kWU0O9+g0aKm9Os85erRwK7ELVhF
	hZAa2L+a2mmp5nbwBb8gav9CDXaD4lQsqNKMnN1CnMg9oC8vvMPiURuNTPKdoHxtpUax
	HaMyXV7i3v6cLe7/dX8z6tgSz4nzqPV8RezlseJz6bdE9tbnHTelciv29VOCAYICO5hC
	QGq7GS7eDfo/XBR8e8gtcJCyamWW1kcozZaAFKbZQQ7iDEnSM3oG/06dd0rVGxj+QLBk
	/UuQ==
Received: by 10.112.103.8 with SMTP id fs8mr390696lbb.29.1334009998430; Mon,
	09 Apr 2012 15:19:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 9 Apr 2012 15:19:28 -0700 (PDT)
In-Reply-To: <4F8345BD.6090500@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com> <4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com> <4F83413F.7010608@opendreambox.org>
	<4F8345BD.6090500@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Apr 2012 15:19:28 -0700
Message-ID: <CAMKF1sq0y=HEGDoFFK4+BcM9XHoAEZv+Cnd2tg2Vg7Fvxq1WTw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 22:29:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 9, 2012 at 1:25 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
>
> In order to reconcile the above, the three primary options are see are:
>
> *) Define only mips or mips32 tune, but not both -- producing "mips" as t=
he
> package arch. =C2=A0(But then what do we do in the future about mips1, mi=
ps2,
> mips3, mips4, mips32r2?)
>
> *) Revert the behavior and have two tunes that produce the identical
> filename package with different contents and deal with this in the future=
.
>
> *) Keep it as it is now and produce mips and mips32 packages based on the
> specific tunings defined by the user

I think situation is not something I like but

I would think that 1st option is better. Any machine that has been using
mips32 tuning accidently could now use mips tune files and get same PKG_ARC=
H
and we move mips32 tune into mips tune and hereon say that mips 32bit in OE
defaults to -march=3Dmips32

we could also change compiler defaults to use -march=3Dmips32 to match
the baseconfig and since qemumips has been using mips32 anyway that sort
of is base mips arch.

>
> We have a bug, I believe we need to fix it.. first or third options "fix"
> the bug.. the second option retains the bug to be fixed in the future.
>
> If you have an alternative to the above, I'm interested -- I just really
> don't like the "leave the bug" option.
>
> And just to be extra clear, I consider it a defect if we can produce a
> package with the same name for two different tune settings.. (the excepti=
on
> being the hell that is ARM and thumb namings.)


