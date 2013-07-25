Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 4C89C6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 15:59:03 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6PFx1IP020206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:59:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1374767942;
	bh=FRwrExgT/AajrBhbATRee5lj+lMn+n32Jw7vHRZhbYs=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=QKjdOP/DQ/sANQT3CuqMj5THQrwazsbNq6i4NVjQ8VoyqtR8gPJqAD8neZZmvs1rC
	Od898zMAV0m6tub3Q4jXUSbeasHQhgUAHPGxeDlnWB81x02iq+s+izdWF89JO9edJM
	OXOx5C1s4wKS4bueDl2zushU2+xUAzzCV16XI9fA=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6PFwwxh000412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:58:59 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1V2NwP-0000CW-Rd
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Jul 2013 17:58:57 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
	<lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<F61C6B48-CF28-4331-BEBF-19673E091E96@dominion.thruhere.net>
	<4F2BF532-D3A4-431E-8905-E4F33FBF80D5@dominion.thruhere.net>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 25 Jul 2013 17:58:57 +0200
In-Reply-To: <4F2BF532-D3A4-431E-8905-E4F33FBF80D5@dominion.thruhere.net>
	(Koen Kooi's message of "Thu, 25 Jul 2013 15:02:20 +0200")
Message-ID: <lyy58uljge.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.8
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Thu, 25 Jul 2013 15:59:03 -0000
Content-Type: text/plain

Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
writes:

>     The ??= operator is too weak
> ...
> -PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
> +PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                                  ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "

good to see that I am not the only one hitting this problem.  But does
there exist some explanation for this behavior?  Lots of other packages
have

| PACKAGECONFIG ??=

and it seems to work there.  It might be related to the '_class-target'
override but that's a nasty, unpredictable bug causing silent breakage.

Something like

| localconfig = ""
| localconfig_class-target = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}...
|
| PACKAGECONFIG ??= "${localconfig}"

and forbidding '??' in override-constructs might make things clearer.


Enrico

