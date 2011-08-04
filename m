Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QomtY-0001FY-7P
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 03:38:44 +0200
Received: by gwb11 with SMTP id 11so859515gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=G8IS1X8ssDqHTwWWwyEzHY/P/golXlQdSQra0xoPQ+M=;
	b=d7iB6q2fhKHMRHTsmLW41m7O8OGL5h8oWN84OjzgE8+XdKb7Yj3ZdC0FPJwmZsN8Az
	0FEAjuc9fn1tX7Dz9upEH+wuAcP1lRORnwvlZv+A5P4lGJhNKJ+uvYjdV4k7VNX+C7xK
	GMROKggC3mtX8WCJZCHK9fZ98P9DNBeXJYdXU=
Received: by 10.143.66.11 with SMTP id t11mr203404wfk.91.1312421660174;
	Wed, 03 Aug 2011 18:34:20 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d3sm1613844pbg.28.2011.08.03.18.34.18
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 18:34:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 18:34:17 -0700
Message-ID: <1808891.sPgEKESHSy@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <201108040011.52049.schnitzeltony@gmx.de>
References: <201108040011.52049.schnitzeltony@gmx.de>
MIME-Version: 1.0
Subject: Re: Howto pin u-boot to a version supplied by oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 01:38:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 04, 2011 12:11:51 AM Andreas Mueller wrote:
> Hi,
> 
> for gumstix overo I am in the lucky situation that vanilla u-boot v2011.03 (
> and maybe later version too ) meets my needs.
> 
> My current approach (in angstrom environment) was quick but poor: I simply
> copied here and there without reusing anything [1].
> 
> To improve I checked u-boot_2011.03 shipped by oe-core and think that one
> exactly builds what I need - without bbappend.
> 
> So I tried in overo.conf to pin by "PREFERRED_VERSION_u-boot=":
> 
> 1. "2011.03"
> 2. "v2011.03"
> 3. "v2011.03+git19b54a701811220221fc4d5089a2bb18892018ca"
> 4. "v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca"
> 
> got messages like
> NOTE: preferred version 2011.03 of u-boot not available (for item u-boot)
> NOTE: versions of u-boot available: git
> v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca
> v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version 2011.03 of u-boot not available (for item u-boot)
> NOTE: versions of u-boot available: git
> v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca
> v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a
> NOTE: preferred version 2011.03 of u-boot not available (for item
> u-boot-dev) NOTE: versions of u-boot available: git
> v2011.03+git7+19b54a701811220221fc4d5089a2bb18892018ca
> v2011.06+git7+b1af6f532e0d348b153d5c148369229d24af361a
> 
> and builds of
> meta-texasinstruments/recipes-bsp/u-boot/u-boot_git.bb
> 
> 
> How can I get the desired oe-core u-boot recipe pinned to reduce code
> redundancies?

there is one u-boot recipe u-boot_2011.06.bb which is in both meta-ti
and oe-core layers but otherwise they have different versions

in anycase what you need to lock is PV and the recipes in oe-core has 

u-boot_2011.03.bb:PV = "v2011.03+git${SRCPV}"
u-boot_2011.06.bb:PV = "v2011.06+git${SRCPV}"

So what you need is 

PREFERRED_VERSION_pn-u-boot = "v2011.03+git%"

-Khem



