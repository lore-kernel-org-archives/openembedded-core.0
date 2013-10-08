Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD456CE8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:03:41 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r98D3cAt015404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Oct 2013 15:03:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1381237420;
	bh=bvLqQYYYKV/Jy3llc2EnTqooPj8QGXLp2RIvXvKy2Ac=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=HYTZnWGRZwVNihzmd18sOGawcQ8m8ksARksxYVLYAuv7F5yuryKTZTMfzCl2kzk/e
	10LJLT48e/e/twN5Ul2woNwDTqfBrxwM5zG1iqsEoIdi+xmhw2rCMVSFFaA+AHGWQn
	vs1kKD7poBjfql5rPOvjGSxjH9w/J80JjQMXTIio=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r98D3WYe013663
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Oct 2013 15:03:33 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VTWwm-0001Eu-MV
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Oct 2013 15:03:32 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
	<87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
	<1381234763.29912.39.camel@ted>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 08 Oct 2013 15:03:32 +0200
In-Reply-To: <1381234763.29912.39.camel@ted> (Richard Purdie's message of
	"Tue, 08 Oct 2013 13:19:23 +0100")
Message-ID: <lytxgrvrrv.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Tue, 08 Oct 2013 13:03:42 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

> The list of things we assume are ok is relatively small and we look at
> new issues on a case by case basis. I think sed is well enough
> established and well enough behaved to be something we can rely on. In
> general we don't rely on much. Do you have any other specific things you
> worry about? 

ccache... it causes big problems when CC='ccache real-gcc' is set and
ccache-native gets rebuilt in parallel.  A customer had problems when
building apr-utils (libtool reported missing '--tag=cc' option) which
are very likely related to a no-ccache -> ccache-available situation.

It is very difficult to recover from such things because CCACHE is in
BB_HASHBASE_WHITELIST.



Enrico

