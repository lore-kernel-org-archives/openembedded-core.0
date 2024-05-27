Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62442C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 10:19:22 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
 by mx.groups.io with SMTP id smtpd.web11.24411.1716805161459195746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 03:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=Gy3SxAUO;
 spf=pass (domain: protonmail.com, ip: 185.70.40.131, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716805159; x=1717064359;
	bh=zr0FbXwQLCB0AsbRu8PS/RNDF2gRtwCHsuGDKLuTiRE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gy3SxAUO0dO8GhezX/pNinifdqL0fZLbNxTur6K9hic/YATRdfvfRXGNpyc/flt4b
	 B07J8zHbU/tfRHoEpyX+OtbmrM7jI1G05wu5DWTnftDVv3sa6CSIHFuNO+RPSxiqBV
	 3jofHhoA37S6Ywv4IT39gbpIRNFnKgTaLN06t3GIhigJaTlbYpTs/dlCRwa9MGy/Ht
	 gsLBP7KwzYttX0Q7fjrnrzIZjX7owQbN0Z3tUz+nVUneXeLtvLA/3gkmZHgaXqkuyo
	 SjH6s250KH9mALLwITl2xX2ERxUj8+D/xAcDUa5WeN5A5Pdl3Fizja/wRxOwcEnGeI
	 JOF3aCaHQBe8g==
Date: Mon, 27 May 2024 10:19:14 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org, rasmus.villemoes@prevas.dk
Subject: Re: [OE-core] [PATCH] insane.bbclass: use HOST_ARCH to check for 32-bit symbols
Message-ID: <lfk3bgl455u2suh76hlmmmh6ltz6qn75z5x7gdmxckbvts44l5@di6jeoo34yu2>
In-Reply-To: <CANNYZj_FkqJzCW_dkFr8=Dnu86UUuzjLE74KfSnrAvoASZxUfQ@mail.gmail.com>
References: <20240523125441.45922-1-emil.kronborg@protonmail.com> <a1e40553b608081c1f251c1ac61310f2583ee015.camel@linuxfoundation.org> <7ubt3kdspc5rp6ab4k6qip2gakgh7wf77oj2llf677gkach6xe@fsqhtqt4eeed> <CANNYZj_FkqJzCW_dkFr8=Dnu86UUuzjLE74KfSnrAvoASZxUfQ@mail.gmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 3643ad5413b9da0dab990220a0ff23f278d676ef
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199899

On Fri, May 24, 2024 at 09:49 GMT, Alexander Kanavin wrote:
> I vaguely remember that at some point I ran 'bitbake -e recipe'
> against qemux86 machine to study that question, and looked through all
> related variables, and couldn't find anything better. But you're
> welcome to try that as well.

For my specific example, I still believe it is more accurate to use
HOST_ARCH and add "i686" to thirtytwo_bit_time_archs. This setup does
not generate false positives and also works for qemux86. However, it
will not necessarily work for other cases. To make it more general, I
think some of the architectures from meta/lib/oe/elf.py can be added to
thirtytwo_bit_time_archs. When comparing this with elf.py, I noticed
some inconsistency. For example, both "arm" and "armb" are defined,
while only "x86" is defined. Shouldn't the latter substituted with
"i386", "i486", "i586" and "i686"? Also, shouldn't "mipsarcho32"
correspond to the entries in elf.py? I'm unsure which ones exactly
though.

--=20
Emil Kronborg


