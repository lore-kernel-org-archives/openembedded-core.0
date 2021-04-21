Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3874.1619041537025837685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 14:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C21540C2A;
	Wed, 21 Apr 2021 21:45:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9M-hY-NNun7b; Wed, 21 Apr 2021 21:45:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 373C540B66;
	Wed, 21 Apr 2021 21:45:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 887931745C6; Wed, 21 Apr 2021 17:45:34 -0400 (EDT)
Date: Wed, 21 Apr 2021 17:45:34 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] standard for names for local source mirror tarballs for git-based recipes?
Message-ID: <20210421214534.GT15937@denix.org>
References: <373df555-e7c2-f0b4-11c5-575d209391ea@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <373df555-e7c2-f0b4-11c5-575d209391ea@crashcourse.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 21, 2021 at 07:44:45AM -0400, Robert P. J. Day wrote:
> 
>   based on my recommendation, colleague created a local source mirror
> to start collecting tarballs so as to minimize amount of downloading
> for various builds. names of tarballs that correspond to fixed
> (versioned) tarballs was fairly obvious, but he got stuck trying to
> local source mirror a tarball for googletest (from meta-oe), which
> contains (among other things):
> 
>   googletest_git.bb
>   ...
>   PV = "1.10.0"
>   S = "${WORKDIR}/git"
>   SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
>   SRC_URI = "git://github.com/google/googletest.git"
> 
> he wasn't sure what name the tarball should have in order to be
> recognized in the local source mirror. i didn't have the answer off
> the top of my head, but since for years i've enhanced all my builds
> with a site.conf file containing:
> 
>   SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
>   INHERIT += "own-mirrors"
>   BB_GENERATE_MIRROR_TARBALLS = "1"
> 
> i just added googletest to a random build to see what i'd get, and
> got:
> 
>   git2_github.com.google.googletest.git.tar.gz
> 
> i guess i'd never paid close attention to the name generation for such
> things, but i'm *assuming* that the name generation by the appropriate
> fetcher code simply encodes everything there is to know about the
> source so that the appropriate tarball is recognized as the local
> source mirror version for that recipe. is that about right?
> 
>   second question: clearly, the simple name of that tarball doesn't
> encode the PV or SRCREV values, so what happens if the base recipe
> suddenly bumps PV up to 1.11.0? i'm sure the answer is obvious, i've
> just never thought about it.

The tarball with the previous clonedir will be unpacked and bitbake will check 
if required SRCREV exists in there. If not, it will try to update the clonedir 
from upstream.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
