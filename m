Return-Path: <dev@codyps.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9CCF26FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 16:07:26 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id v27so15864923qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bvtrJXGEHAlJPpK/DInNOgcG8gBuY46yJH4y2avZLcY=;
	b=H0HLgXvxqZ9xMtHYtm5xpuzGaAftSK62UWCjxE+l7RBTa5UL9ff31zsAhgXCBeIH0z
	N6I7GqFgByO6OfRxBG5cQLHcHNCWgZFGeGTkuSHaDqmhrnGiG0HntnYbYNxNKDZyoasB
	ph88GQDJF3pvO9yo1T6RYBZ+6dAR/k6pZ4vl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bvtrJXGEHAlJPpK/DInNOgcG8gBuY46yJH4y2avZLcY=;
	b=C8Q4JotCvjux+VWIlsbVyR3W3srRiK3vBKJp5wfEfwrF0JfYFaOh+IvldifZaV2NT1
	KEB2s49C3Y4WmXX7PL89jJJLhrIu81XrxrNzDvR8LngMiuFDXM4uq5psggmWtB78feCm
	hU+yWdlgZSo1YsKkhOxYIFKnHQ82OpSNy/rJTPu+3gl62SA5sCvnz22vN6hrcraE3/SB
	HFEKnMEXXCLeGW60oHFHfIUDhcCLzqEd5qWS/Ip6cd8OFNQNCkspNuue7gEcTfII5ihb
	5IdhNewIm0n63UEXBAoPlQPh5eZCIQtVG7IzQZRO8d8P9/d5EKhurdl0/hYAJSm4Ozgk
	16zQ==
X-Gm-Message-State: AODbwcDYeXf0B/NuDxpzNICEgZy999+R6HRJq+zssDJW22PKnlB/xZ7b
	MhTV2olvVXTkOP3T9UB7sSWLvAfIZu53f24=
X-Received: by 10.200.41.135 with SMTP id 7mr29601561qts.85.1496246848011;
	Wed, 31 May 2017 09:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.168 with HTTP; Wed, 31 May 2017 09:07:27 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
Date: Wed, 31 May 2017 12:07:27 -0400
Message-ID: <CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 May 2017 16:07:29 -0000
Content-Type: text/plain; charset="UTF-8"

> There's a patch that we've had for years to allow alternate RPC ports
> to work with userspace NFS and co-exist with existing NFS servers.

Ah, I see (I should have checked that sooner). "NFS: allow nfs root
mount to use alternate rpc ports". I can likely just pull that into my
kernel and have things work fine without changes to
runqemu-export-rootfs.

> This would have an impact on that functionality, so if we do need to
> change those ports, the existing ones should be maintained with some
> sort of option to change the nfsroot line.

Yep, that makes sense.

That said: it isn't completely clear to me that a seperate rpc program
number (aka RPC port) is needed to avoid conflicts between 2 nfs
instances in this case:

 - we don't have unfsd register with rpcbind (-p option), so the rpc
program numbers won't conflict there.
 - using nfsroot implicitly adds the 'nolock' option, so there isn't a
conflict there
 - I did my tests with the nfs kernel server running. There wasn't an
immdiate issue observed with mounting and accessing both a kernel
provided export & a unfsd provided export (using
runqemu-export-rootfs) at the same time.

Still, I'm not too familiar with all of the ins and outs of nfs. Is
there somewhere I've overlooked where the program numbers could
conflict?

