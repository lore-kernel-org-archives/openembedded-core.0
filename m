Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2209260124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:00:17 +0000 (UTC)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net [111.250.192.53])
	by msfrf2622.sfr.fr (SMTP Server) with ESMTP id 73A851C009C5E;
	Wed,  8 Jun 2016 18:00:17 +0200 (CEST)
Received: from nbhjo (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2622.sfr.fr (SMTP Server) with ESMTPSA;
	Wed,  8 Jun 2016 18:00:15 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: "'Klauer, Daniel'" <Daniel.Klauer@gin.de>,
	openembedded-core@lists.openembedded.org
References: <1465381435600.39214@gin.de>,
	<02b101d1c184$93336d80$b99a4880$@neuf.fr>
	<1465400599707.30401@gin.de>
In-Reply-To: <1465400599707.30401@gin.de>
Date: Wed, 8 Jun 2016 18:00:11 +0200
Message-ID: <02bc01d1c19e$d9885880$8c990980$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGwqRfmsvXsIwCgIjSUu3Vnj28JdAH2qNH0AkN0yxqgABggsA==
X-sfr-mailing: LEGIT
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 16:00:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi Daniel,

OK, I'll send what I've done to fix this for me tomorrow - it's basically
what we have discussed here, modification of 2 lines.

Regarding the possibility that the whole scheme might fail because of
"package already installed" during a retry, I won't try anything yet,
because I'd like to understand why it was done this way to begin with -
there may be some good reasons that I just can't find, so I'd rather be on
the safe side.
This said, the way things are done would work if all packages would fail
installation, because then none would become "already installed". But since
I'm not sure what exact kind of use cases / tests are supposed to be working
or not here, I'd rather postpone "fixing" that part.

If anyone on the list knows the history on that part, though, I'd be
interested to learn the background on the design, and the rationale of the
implementation.

Herve

-----Original Message-----
From: Klauer, Daniel [mailto:Daniel.Klauer@gin.de] 
Sent: mercredi 8 juin 2016 17:43
To: Herve Jourdain <herve.jourdain@neuf.fr>;
openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] smartpm: Don't ignore error if RPM
transaction fails without problems

Hello,

> You also need to add another check just before raising the error, or 
> you would end up getting an "unknown error" raised there.
> I basically replaced:
> -        if (probs is not None) and (not retry):
> +       if (probs is not None) and ((len(probs) != 0) or not
> sysconf.has("attempt-install", soft=True)) and (not retry):

Hmm, it sounds like the attempt mode wants to ignore installation failures
(empty problems list) like before the patch, which makes sense to me.
Afterall, attempt mode wants to try installation and ignore failures. So it
seems good to fix this regression too.

However, I wonder why it never ignored a non-empty problems list, which
would also trigger an error. Maybe that case just never happens in practice,
because it's always just file conflicts. Those trigger a retry, which
prevents the error from being raised.

> BUT reflecting on the whole scheme, I'm wondering how it will work in 
> case of file found conflict, since the problem package gets removed 
> from the list, but the list is committed again, with most packages 
> already installed...
> I therefore wonder that there could be the same error that I got in 
> the end, i.e failing with package already installed - which should not 
> fail for attempt only.

Indeed, I'm curious about that too...

If you could put together the patch, that would be great and fine with me.

Thanks,
Daniel
=


