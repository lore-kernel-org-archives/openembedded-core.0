Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id A1A1A6C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 16:13:29 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s14GDPC8012910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Feb 2014 17:13:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1391530408;
	bh=8dho2G4VSzTTlJ/rmnoU6vDPcQORmLpj6opg7JXI7Ws=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=YrutQAM+t7h+LpDC3NTFEEspXz26oq8t2c7dlZSRJzF3XPmZqHENfKAxHGF1fJvAH
	n3E7J1Zova1nUNdSVYje5e/r8mpm+QlYMkJql3tSyU1eQbMVKRgfgisTnvIR5OKSnz
	uW2e1yGnHzsJWgk0NgtjWc6cw91wNeOGq8zo5uUY=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s14GDLEO019253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Feb 2014 17:13:23 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1WAicj-00086o-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Feb 2014 17:13:21 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 04 Feb 2014 17:13:21 +0100
In-Reply-To: <BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	(Koen Kooi's message of "Tue, 28 Jan 2014 11:08:08 +0100")
Message-ID: <lyfvny500u.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
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
X-List-Received-Date: Tue, 04 Feb 2014 16:13:31 -0000
Content-Type: text/plain

Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
writes:

>> +# Default to setting automatically based on cpu count
>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
>
> I've noticed that after 4 threads IO becomes a big bottleneck when you
> have things like webkit, qt, asio etc in the buildqueue. Combine that
> with issues like every make -j thread taking >2GB ram with asio and
> webkit this default seems a bit high. I'd use 0.5*numcpu with a lower
> bound of 2.

limitting the load mitigates this (high i/o increases it); e.g.

PARALLEL_MAKE = "\
  ...
  -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
"

Enrico

