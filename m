Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web10.12106.1628096760451297987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=iKUk/e9J;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id BKLTm7krT7QW9BKLUm5fnH; Wed, 04 Aug 2021 18:06:21 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=H+BAP9Qi c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=Q4-j1AaZAAAA:8 a=PYnjg3YJAAAA:8
 a=Xozt7Z9gXfVz3BerkAAA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=96-UuAdfYG6OSYlHWuPe:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=a2dmg5BVMPuL5rvCd4HUmvW/WynGKeIvlyfkNlF3FaI=; b=iKUk/
	e9JX7iYJTr1mqOsvEWljZS22s2GNXgITsC6O3PEBBy/atnMfYaVFXE4S6Z1a1YrSW1dWNoOi7mP1p
	Kt3lXiTWsE/p8Ploa1SiAa/1g4HAS2inGehSYIbD32ru1o1yA1Hx9zfcIr3nVkct21wKKfDJ8Ban9
	r7e872lAE4YTJ7JNClEzRIpeP0VErX1fb0qrbep+wSTnL9tXGSneXPyZn9EbVgktusY+cROMkDDax
	69e7DWUeoq4DHhEwgAr+Shjqy7gR4mhjPAF0+GnXBEUsZPoM4Fa6XOAxsPiPecyBCziopssyEyHQV
	+bUKWDjO8gWd8N42Zuh4JUi8Cu/uw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mBKLT-000726-Ec; Wed, 04 Aug 2021 18:06:19 +0100
Date: Wed, 4 Aug 2021 18:06:19 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] curl: Fix CVE-2021-22924 and CVE-2021-22925
Message-ID: <20210804170619.GA23238@mcrowe.com>
References: <20210804081051.795458-1-mac@mcrowe.com>
 <CAOSpxdbF=wwtijC+q8M8Bn=-=03gQ9DABr3Gk56M51jaRK4qbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbF=wwtijC+q8M8Bn=-=03gQ9DABr3Gk56M51jaRK4qbA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfDFK0vg76N6+NMuIPF1nCK+ocPeCoa79n1qD04qiRRtNuLRUUOGdTdj5YsZGkwjOond+YbOfmsJuuyZrboUZWgV0btRlHMPv/NnjJzoUaKeK07W7+NI6
 Soms8kPGbHWClWG9iX6fv3icAQIhQmsJoxrfgz0+V3YtXU82T6axkAvIdvOEsGMbGK2VmWJiYcDFAg==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 04 August 2021 at 06:44:51 -1000, Steve Sakoman wrote:
> On Tue, Aug 3, 2021 at 10:11 PM Mike Crowe via lists.openembedded.org
> <yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> >
> > curl v7.78 contained fixes for five CVEs:
> >
> > CVE-2021-22922 and CVE-2021-22923 are only present when support for
> > metalink is enabled. EXTRA_OECONF contains "--without-libmetalink" so
> > these fixes are unnecessary.
> >
> > CVE-2021-22926 only affects builds for MacOS.
> >
> > CVE-2021-22924 and CVE-2021-22925 are both applicable. Take the patches
> > from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close enough
> > that the patch for CVE-2021-22924 applies without conflicts. The
> > CVE-2021-22925 patch required only a small tweak to apply.
> 
> Being curious why none of these are showing up in the reports I
> checked the CPE database and it seems none of them are present!  So
> that explains why.
> 
> Do you know why they are missing?  Perhaps a status of RESERVED?  See:
> 
> https://nvd.nist.gov/vuln/detail/CVE-2021-22923

I'm afraid that I have no idea. :( I just watch curl release announcements
to assess the security impact on our products and spotted these.

> Since they seem to be real issues though I can take the patch once you
> send a V2 with the issue below fixed.

> [ Need to have a CVE tag and your signed-off-by in both patch files. ]

v2 should have arrived. I must have sneaked my previous CVE fixes through
without them somehow. :)

> It might make sense to whitelist the CVE's that don't apply to us so
> that once the entries hit the database we will already have dealt with
> them.

Hopefully done.

Thanks.

Mike.
