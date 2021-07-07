Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web09.20733.1625663124333370099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 06:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=WhL4n5Ya;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 17EvmZOnHHBkX17Ewmn6x2; Wed, 07 Jul 2021 14:05:23 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=e_q4qTt1xDgA:10 a=Q4-j1AaZAAAA:8 a=aY8ugOY17NPYGRnWrbcA:9
 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description;
	bh=YwppvVPTfhKKKK4OPUlusjanjna3haMc69drb7235cY=; b=WhL4n5YaxtoIkLvXTpY9M4OEg3
	b8D2Se7Ta9QSNcKwtVTgblBBa2WQNahD1XQ1LI5xeKE5DtrHN4rK9ZJeMVxdWLslRDg/e9WFFlibS
	W5n4sd0t6GHBCN3Y44Gj7P12YUdn69z/mXW5fvRw/ymWGpvXVoPGm97wQF+Nm2VM8MyVnGHlHpACf
	j526ubULHoF7l8D8SDcuQw+O2B2/IFD1JrIiyi1x3xTBOksLBpsZgXlGEGHfsvDnBFR2/bWpk4wAa
	NQWV7JTJeyP+RuXMDzthvyxwOMdSfVBim2IrHCTpyqzw/6doP7XP6IISoU2QALtc5RQqm48rVjouO
	NK4XY0GA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m17Ev-0003XW-3B; Wed, 07 Jul 2021 14:05:21 +0100
Date: Wed, 7 Jul 2021 14:05:21 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
Message-ID: <20210707130521.GA4032@mcrowe.com>
References: <20210707115334.GA498@mcrowe.com>
 <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfLdAQWEFWSgPJN55ZHsOdeYTxOVakB0CHB3H67Z2DgDtlJdJEYm4bKa00oKZ44tJIbEG7I4Te8agbp2iED3xJ7l1uZP8yb/6gs9Lu4xqfvgohXEvLzxc
 MhmfkzF7HpF9DtFYBgUfOH8lz0dmyoVHhfRRlmvrkEhAIJjnKSTm4dL+EKES4XfU4XRuJjHhTEzoVQ==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wednesday 07 July 2021 at 13:25:17 +0100, Richard Purdie wrote:
> On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> > We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> > relying on the automatically generated recommends to cause them to be
> > installed in the image. This works well for most packages, but fails for
> > packages where we only install package created using PACKAGES_DYNAMIC.
> > 
> > For example, liborc is being installed in our image but that package lacks
> > a recommends for orc-lic, so the licences that apply to it are not being
> > installed. This is because license.bbclass:add_package_and_files iterates
> > only over the packages listed in PACKAGES.
> > 
> > Steps to reproduce on current master:
> > 
> > $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> > $ bitbake orc
> > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> >  Recommends: orc-lic
> > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > $
> > 
> > (I would have expected the last command to produce the same output as the
> > penultimate one.)
> > 
> > Even if I could fathom out how to fix orc and any other recipes so that they
> > did add the ${PN}-lic dependency, I'd be worried about not noticing that
> > the problem affected other recipes in the future.
> > 
> > Is there a way to teach license.bbclass:add_package_and_files to add the
> > ${PN}-lic recommends for dynamic packages, or would it be necessary to
> > teach package.bbclass to do so?
> 
> That all sounds rather horrible :/.
> 
> Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?

That seems to have worked well.

I wonder whether this means that it would be better to stop adding the
recommends automatically and tell users that need this to use
IMAGE_INSTALL_COMPLEMENTARY instead (either directly, or by teaching
license_image.bbclass to modify it based on another variable.)

Losing the recommends would also meaan I wouldn't need to add
--no-recommends to the image recipes that don't need the licence files.

Thanks for the speedy response!

Mike.
