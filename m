Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB8F6093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 13:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id F17EE363D7;
	Thu, 27 Oct 2016 15:26:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Adwv49eU6ATu; Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id D1C29363D1;
	Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79DA71A0B0;
	Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D78D1A0AE;
	Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 619D32C9;
	Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 4E9D69C09F; Thu, 27 Oct 2016 15:26:20 +0200 (CEST)
Date: Thu, 27 Oct 2016 15:26:20 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <20161027132619.GJ20437@axis.com>
References: <alpine.LFD.2.20.1610270533590.12908@localhost.localdomain>
	<alpine.LFD.2.20.1610270833260.15014@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1610270833260.15014@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
Subject: Re: how to add new perl modules to stock OE build?
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
X-List-Received-Date: Thu, 27 Oct 2016 13:26:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-10-27 08:46 -0400, Robert P. J. Day wrote:
> 
>   ack ... never mind, i see my fundamental misunderstanding. i thought
> all of the recipes being processed via the "perl-modules" package were
> being (if necessary) downloaded from CPAN, or something like that,
> then turned into installable rpms. i didn't look closely enough into
> the perl source to see that all the modules listed in
> "perl-rdepends_5.22.1.inc" are already in the perl source tree.
> 
>   so i'm back to my original question -- what is the proper way to add
> arbitrary perl modules to an image? if someone has a simple example of
> how it's done, that'd be great. as proof-of-concept, i'd like to add
> the Text::Template module to my "qemuppc" target.
> 
>   thoughts? sorry for all the earlier noise, i thought i had it
> figured out but ... no.

Hi,

Take a look at meta-perl in the meta-openembedded repository. It
contains a lot of recipes for Perl modules (Text::Template isn't
one of them though).

The cpan class in oe-core knows how to build Makefile.PL
(ExtUtils::MakeMaker) based perl modules (like Text::Template),
and cpan_build knows how to handle Build.PL (Module::Build) based
perl modules.

Note also the naming convention of perl-module-foo is used by
core modules (those shipped with perl itself); the convention
used for third party cpan modules is "libfoo-perl", e.g.
libtext-template-perl.

Hope this helps,
-- 
olofjn

