Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web08.1066.1631203400055863583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 09:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=X7QzcfXy;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id F30FB2E8922;
	Thu,  9 Sep 2021 11:03:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1631203397; bh=P2FJ2Ex4LJcxRwNJshBCIkpmZjc6dN6QkLaBYb/RUbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X7QzcfXyA6O3KSgMcQJwrqCySm7saYOzfd5cer3lnIL+CpzpoHOseKXaNL9pd1sO/
	 ieIrbpqPvFcZkZObLfeKWvjI1v8iilXuVol16DwtsNffmWukxi/XLUopN5E7LJZ7Dr
	 e40D9X5A91KO7Jz0zkA0rTEVOIMnlomXDsANuEl35sIEWjiJOh3RINTWUDzhmc2pVi
	 TNfooMsez/iOv1ai0MsgleBZoqbKJhN86EI/T0bzrUbckZtgPF3/MTVK9uFP+O804H
	 /+6oLKQgVm2nHwWVB+GC6eJHhZxITHN9wZo3pBg5zlEfEI4i5ldG0r2vAQNnD2XVp4
	 S8jsB+N2o4kKg==
Date: Thu, 9 Sep 2021 11:03:13 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] pseudo_client: Make msg static in pseudo_op_client
Message-ID: <20210909110313.61a47c0f@seebsdell>
In-Reply-To: <20210909153614.1225570-5-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
	<20210909153614.1225570-5-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Sep 2021 16:36:13 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> -	pseudo_msg_t msg = { .type = PSEUDO_MSG_OP };
> +	static pseudo_msg_t msg;
> +	msg = (pseudo_msg_t) { .type = PSEUDO_MSG_OP };

Looks good to me.

I'm honestly sort of stunned that the return of the local variable's
address caused a problem, even though it's theoretically undefined,
because it's only ever checked against is-null, but I'm also sort of
stunned that I got away with it for that long.

-s
