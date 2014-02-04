Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 435966C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 18:00:30 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s14I0TD5026067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Feb 2014 19:00:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1391536830;
	bh=9ZeeuW2pXbGu2h7fTOLSbtrG/pxYGh3V+dcsf+KQKaU=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=U2VZfUsyv+CILzFNcsXAfg3HaFdxgYSOhkGR3/lU9BaOQF9dzi0Qjez9mzYrNDQ4f
	EqD4bVZg6DX6t+xr6IW9cIBgbT4uzKc/tetNDaWppxwk02pyPCjyMslMGCpA13uLUO
	rLIx7l8IkseTlF7TG7/C7fawf/54qToWJOM9qnw0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s14I0OGv032473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Feb 2014 19:00:25 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1WAkIK-0004UE-CM
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Feb 2014 19:00:24 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<lyfvny500u.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<52F11C55.10108@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 04 Feb 2014 19:00:24 +0100
In-Reply-To: <52F11C55.10108@windriver.com> (Mark Hatle's message of "Tue, 4
	Feb 2014 10:59:01 -0600")
Message-ID: <lybnym4v2f.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.81
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Tue, 04 Feb 2014 18:00:30 -0000
Content-Type: text/plain

Mark Hatle <mark.hatle-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

>>> I've noticed that after 4 threads IO becomes a big bottleneck when
>>> you have things like webkit, qt, asio etc in the buildqueue. Combine
>>> that with issues like every make -j thread taking >2GB ram with asio
>>> and webkit this default seems a bit high. I'd use 0.5*numcpu with a
>>> lower bound of 2.
>>
>> limitting the load mitigates this (high i/o increases it); e.g.
>>
>> PARALLEL_MAKE = "\
>>    ...
>>    -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
>> "
>
> FYI, I think this points out the variability in system performance,
> between CPU, RAM and I/o.
>
> As it stands the patch gives my machine the best performance.  So I
> like it as it is.

Point of my posting was not the exact scale (I just copied a piece of
my ~/.bitbake.conf), but using '-l' in addition to '-j'.  Doing heavy
i/o or being low on RAM (which causes swapping) increases the load and
'make' will throttle then.


> No setting is going to make everyone happy but something has to be
> better then defaulting to '1'.

That's true; but not due to performance gain but because it will help to
detect races in the build process.


Enrico

