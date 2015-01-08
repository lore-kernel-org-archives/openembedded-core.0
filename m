Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id CD3C2609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 19:44:40 +0000 (UTC)
Received: from localhost (unknown [78.9.129.181])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 45FA34434A3;
	Thu,  8 Jan 2015 20:44:35 +0100 (CET)
Date: Thu, 8 Jan 2015 20:44:30 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150108194430.GA3617@localhost.localdomain>
References: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAP9ODKpUV8+ZvnLba83djVXeFw8cR0cBTYobf5DG9A38jMG--Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpUV8+ZvnLba83djVXeFw8cR0cBTYobf5DG9A38jMG--Q@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-networkd: cherry picking route handling patch
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
X-List-Received-Date: Thu, 08 Jan 2015 19:44:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 01/08 12:13, Otavio Salvador wrote:
> On Thu, Jan 8, 2015 at 6:43 AM, Maciej Borzecki
> <maciej.borzecki@open-rnd.pl> wrote:
> > There is a problem in systemd-networkd version used in OE-core (216 as
> > of now) that prevents a successful communication in a configuration
> > that uses a static or IPv4 LL address alongside a dynamically obtained
> > one. The setup is rather not uncommon as is makes sense to always have
> > a static well known address that a technician or a support engineer
> > can access while in the field.
> >
> > The current code in systed-networkd uses a clever trick to add a
>
> typo: systemd-networkd
>
> > static route to the gateway, to workaround a misconfigured DHCP server
> > that would assign an address from network pool that the gateway is not
> > a part of. The trick was missing a source IP address specification in
> > the static route, thus normally the first assigned IP address would be
> > used for outgoing IP packets. In this particular case the address
> > would the static one, hence the packet would most probably be dropped
> > by the router. Also, it is quite common in smaller networks that the
> > DHCP server, gateway router and even a DNS server are colocated. In
>
> collocated?

Yes, obviously collocated. I'm not sure why, but somehow I missed
[PATCH 0/1] for this cover letter when sending a 1-patch series. If
that's ok, I won't resend the cover letter with typos fixed. It was to
give some background as the backported patch, as it's not that intuitive.

>
> > these setups the current code will effectively render any
> > communication to or past the router impossible.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079


Niniejsza wiadomość wraz z załącznikami może
zawierać chronione prawem lub poufne informacje i została
wysłana wyłącznie do wiadomości i użytku osób, do których
została zaadresowana. Jeśli wiadomość została otrzymana
przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o
zaistniałej sytuacji za pomocą wiadomości zwrotnej.
Dziękujemy.

This message, including any attachments hereto,
may contain privileged or confidential information and is sent
solely for the attention and use of the intended addressee(s).
If you are not an intended addressee, you may neither use this
message nor copy or deliver it to anyone. In such case, you
should immediately destroy this message and kindly notify the
sender by reply email. Thank you.

