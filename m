Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id C8F5E7284B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 14:13:06 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so1310139ykt.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=26DKpFoeL/9+yKXiORVQhyEZVszQDxVZgJXncD9kigg=;
	b=VHbqYJhPDEHIR7ABFNyQ4JljdMhr5CrCQRszqhUnV5qROc7IP29YobgRi1xiMJpPxl
	tYhsQUQN/znFaqMT0XawYcX5IXmPMMbx5WhQyxfcHj1L95bo9fQz+U9yBQroJ/msozXQ
	KLfYZH1btME1Urjh5iUp/pmrvpYGeu+Nkmp/1nfu0szn1Jd69mGm7b4lRKPTQx9Mo7kZ
	dO4+RW1xz7hA/iQOISc1EURfpWSPgl4niVTbsa2DqmEL4SPJcJskoArUvqjE4LtFaf3H
	dCMsf5Ht65AaLdS4vEaxYVrp1XaznUwU51KCGuxn9OPPR9e39vb/9ECP4t/WXqxulTy7
	Nd/A==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr6380556yha.105.1420726386989;
	Thu, 08 Jan 2015 06:13:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 8 Jan 2015 06:13:06 -0800 (PST)
In-Reply-To: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Thu, 8 Jan 2015 12:13:06 -0200
X-Google-Sender-Auth: Uhs3fxDhLyJt1Lll3dZnzNTDW28
Message-ID: <CAP9ODKpUV8+ZvnLba83djVXeFw8cR0cBTYobf5DG9A38jMG--Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
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
X-List-Received-Date: Thu, 08 Jan 2015 14:13:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 6:43 AM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> There is a problem in systemd-networkd version used in OE-core (216 as
> of now) that prevents a successful communication in a configuration
> that uses a static or IPv4 LL address alongside a dynamically obtained
> one. The setup is rather not uncommon as is makes sense to always have
> a static well known address that a technician or a support engineer
> can access while in the field.
>
> The current code in systed-networkd uses a clever trick to add a

typo: systemd-networkd

> static route to the gateway, to workaround a misconfigured DHCP server
> that would assign an address from network pool that the gateway is not
> a part of. The trick was missing a source IP address specification in
> the static route, thus normally the first assigned IP address would be
> used for outgoing IP packets. In this particular case the address
> would the static one, hence the packet would most probably be dropped
> by the router. Also, it is quite common in smaller networks that the
> DHCP server, gateway router and even a DNS server are colocated. In

collocated?

> these setups the current code will effectively render any
> communication to or past the router impossible.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

