Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.55378.1585587149670169814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=O5x6UJk+;
 spf=neutral (domain: iki.fi, ip: 66.111.4.27, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id EEE005C02CC;
	Mon, 30 Mar 2020 12:52:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 30 Mar 2020 12:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=/3xH48W9ZJBeHRnI3jKgMcsORhbG0bguWwqJcZvRE
	wE=; b=O5x6UJk+Y3YRhdOku40h8QjyEcwzoexQGZScGGqcoZOqzuQcFI3IRfqSp
	Mr39NTAHdt6YSZQ3PtPCJlXgBJ8vHY+WY0e/8bHBqOXV0vLSU4sxX6z7aymu3A4U
	GkU7j48sxgda/wnSlPWKMPd5emXPdLczjh0+u4EHWLjm0nFyXmOFkzUOwVPPc/So
	EPiI4j+dFy21xudG4poNvIGA2aCnbdhJlKyi0dXFS7IqOTGe9ib6MaMS6gMv0TOg
	rolQhH0FHncAWJMzF10UJOzhCr0y9oE4+fuxZsoIRRzp8pKx+NPaH43H6jR3QV/R
	plRiL8EQ/8cXV3U9xi/vdPQMSIPrQ==
X-ME-Sender: <xms:zCOCXr2O8x6eYlSU3jgNF-oibEmOvcP9pkyePiaFY3wHsWOIlWHeIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
    uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepph
    grthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkphepudeliedrvdeg
    gedrudeluddrjeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:zCOCXl4cf5BnLAgmmPG85CyJeffMJusMCsoLwMRA38iMhdXZwMZg8g>
    <xmx:zCOCXhbGyUOuGWHUd9xN9ZRkCCM424Hc4FmEIhxJ8WwYiAO64macgA>
    <xmx:zCOCXjQ3JUupucEHbWcL7v-WMjybrAksT0NbBgBby5DwC4Q49t2csw>
    <xmx:zCOCXizabq3Yyg092KciK6TuFeiwtRr8zAxI0RjshebkFlXnXxs_cQ>
Received: from laptop (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8425C306CA11;
	Mon, 30 Mar 2020 12:52:27 -0400 (EDT)
Message-ID: <cc08a2a1a00316be1e8c3eb17ba6e988e5788a59.camel@iki.fi>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Stefan Ghinea <stefan.ghinea@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2020 19:52:22 +0300
In-Reply-To: <160121D94406B75D.27565@lists.openembedded.org>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
	 <160121D94406B75D.27565@lists.openembedded.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-30 at 19:29 +0300, Tanu Kaskinen wrote:
> On Thu, 2020-03-26 at 17:26 +0200, Stefan Ghinea wrote:
> > From: Catalin Enache <catalin.enache@windriver.com>
> > 
> > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > since the Thumb frame pointer in r7 clashes with pulseaudio's use of inline
> > asm to make syscalls (where r7 is used for the syscall NR).
> 
> Do you have a pointer to the asm code that does syscalls? I'm an
> upstream maintainer of PulseAudio, and to me it sounds a bit strange
> that there would be inline asm that does syscalls.
> 
> It would be great to fix this problem in upstream (either by applying
> this fix/workaround in the build system, or by modifying the asm code
> so that the problem goes away).

I forgot to check if others had already commented on this... So the
real problem is that src/pulsecore/remap_neon.c uses the r7 register in
a few places. Andre McCurdy said: "In terms of a fix, then changing the
code to use r12 instead of r7 is probably the best solution (assuming
it works), but would need careful testing." I'll try this.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

