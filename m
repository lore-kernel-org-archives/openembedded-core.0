Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web09.3210.1627400971350732047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 08:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=TMBzMsAM;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id BF2C72E8939
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:49:30 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627400971; bh=YUVERyw3n7sIfQU+es++QpbupNfWYP+C5OGxY7iaf6U=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=TMBzMsAMIrybEnfsOZrMDc6WCjxs7c36ON3kuxSi/eU2cEVP9UuHx6CI52jwx7fHC
	 Z5274klvtTgaHECmXtvLhHmrTiSOGMNBanA1K/uZvtjNnG7UinT/4KxJuNoXmZfxTX
	 VgnJ/ZP1Gt3Gh6rgyrYYvk0zkBrHpTPDRzg7QO9sNuI9JYb/owwHH5yCERGnp+E+Y2
	 Tg9/f9OGLxgeOFhYUHLJ8d4Kn/1yLRzRv+MGPLTExyEXF+6pDfES+F7/QsCvehAJP7
	 VxeGiMXwFd0pYkEaDM+bARJ89le0V3rAAtGGdtfCHXQqfE//1TiGrJ9IxJA8Z5jKKw
	 a1C0LSk+Iff8A==
Date: Tue, 27 Jul 2021 10:49:27 -0500
From: "Seebs" <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH pseudo 1/4] Remove -fno-strict-aliasing and -Wno-deprecated-declarations
Message-ID: <20210727104927.18f26c21@seebsdell>
In-Reply-To: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jul 2021 13:49:03 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

> -# no-strict-aliasing is needed for the function pointer trickery.
>  pseudo_wrappers.o: $(GUTS) pseudo_wrappers.c pseudo_wrapfuncs.c
> pseudo_wrapfuncs.h pseudo_tables.h
> -	$(CC) -fno-strict-aliasing $(CFLAGS) $(CFLAGS_PSEUDO)
> -D_GNU_SOURCE -c -o pseudo_wrappers.o pseudo_wrappers.c

I would be really uncomfortable relying on that not being needed, even
if it happened to work in specific cases. The function pointer trickery
is black magic and very much undefined behavior, and warning the
compiler away from it seems reasonably likely to be advantageous.

-s
