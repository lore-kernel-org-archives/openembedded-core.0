Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web10.4473.1601028406904515909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 03:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 39E93607FC;
	Fri, 25 Sep 2020 10:06:44 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Ross Burton <ross@burtonini.com>,
 Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List
 <openembedded-core@lists.openembedded.org>,
 Otavio Salvador <otavio@ossystems.com.br>
References: <20200924195800.4164634-1-otavio@ossystems.com.br>
 <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <dab01611-1e79-0942-69bd-93f742168625@embed.me.uk>
Date: Fri, 25 Sep 2020 11:06:39 +0100
MIME-Version: 1.0
In-Reply-To: <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

On 25/09/2020 10:58, Ross Burton wrote:
> On Thu, 24 Sep 2020 at 20:58, Otavio Salvador <otavio.salvador@gmail.com> wrote:
>> We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
>> wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
>> enabling it by default so there is no behavior change.
> 
> Is this fundamentally because many targets now have hardware RNGs that
> the kernel is using, and so rng-tools serves no purpose?
> 
> This was originally added with data from iMX6 (oe-core
> 9b01375236e19e3366c58877c4154d7c71632984) and I'm curious if this
> followup is related to other improvements that have been made to iMX6
> since. Is there a better user space tool, or is the kernel using the
> hardware RNG out of the box?
> 

While I haven't had the time to explore the issue fully on my boards,
the issue I have specifically is that when the board is powered for a
short amount of time, systemd gets stuck on shutting down as rngd is
blocking for (I assume) a certain amount of entropy for it to enter the
ready state. Whether this is down to the specific hardware rng support
on my board, or possibly the lack of it being enabled I haven't dug into
yet.

> I ask because I'm strongly tempted to argue that we should be assuming
> that a RNG is available and let BSPs turn this on if required.
> 
> Ross
> 
> 
> 
> 
> 
