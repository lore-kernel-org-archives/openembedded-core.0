Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.411.1617140836573064976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D7A3540C16;
	Tue, 30 Mar 2021 21:47:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK2FN6LBC4c4; Tue, 30 Mar 2021 21:47:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 93D4C407DA;
	Tue, 30 Mar 2021 21:47:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4FAA0174568; Tue, 30 Mar 2021 17:47:11 -0400 (EDT)
Date: Tue, 30 Mar 2021 17:47:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-commits] [openembedded-core] 05/11: license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
Message-ID: <20210330214711.GC23013@denix.org>
References: <158021229287.2205.655529513378933058@git.openembedded.org>
 <20200128115135.923C8232CB0@git.openembedded.org>
 <CA+chaQeLKzCdXyhPOoZJVxjWS7HG0kOwg3nt90xsJLz8Ov2VxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQeLKzCdXyhPOoZJVxjWS7HG0kOwg3nt90xsJLz8Ov2VxA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 10:46:19PM +0200, Martin Jansa wrote:
> On Tue, Jan 28, 2020 at 12:52 PM <git@git.openembedded.org> wrote:
> 
> > This is an automated email from the git hooks/post-receive script.
> >
> > rpurdie pushed a commit to branch zeus
> > in repository openembedded-core.
> >
> > commit 5ed714139f91eb03871e01b68a4370784071234d
> > Author: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > AuthorDate: Wed Dec 11 17:48:13 2019 +0100
> >
> >     license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
> >
> >     Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
> >     variable that contained a static list of licenses. It was used by
> >     expand_wildcard_licenses() to expand any wildcards used in, e.g.,
> >     INCOMPATIBLE_LICENSE. However, since this static list of licenses has
> >     not been kept up-to-date, many licenses were missing, with the result
> >     that if one tried to use any of those licenses with a wildcard, no
> >     licenses would be found, effectively ignoring that they should be
> >     marked as incompatible.
> >
> >     This introduces a new (documented) variable, AVAILABLE_LICENSES, that
> >     is automatically updated to contain all licenses found in any
> >     directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
> >     and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
> >     wildcards.
> >
> >     Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >     (cherry picked from commit 8c9ef587fe499c612a878a1ab42092eb79b334ef)
> >     Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  meta/classes/license.bbclass                     | 27
> > ++++++++++++++++++++----
> >  meta/conf/documentation.conf                     |  1 +
> >  meta/lib/oeqa/selftest/cases/incompatible_lic.py |  6 +++---
> >  3 files changed, 27 insertions(+), 7 deletions(-)
> >
> ...
> 
> > +def available_licenses(d):
> > +    """
> > +    Return the available licenses by searching the directories specified
> > by
> > +    COMMON_LICENSE_DIR and LICENSE_PATH.
> > +    """
> > +    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
> > +                (d.getVar('LICENSE_PATH') or '')).split()
> > +
> > +    licenses = []
> > +    for lic_dir in lic_dirs:
> > +        licenses += os.listdir(lic_dir)
> > +
> > +    licenses = sorted(licenses)
> > +    return licenses
> > +
> > +# Only determine the list of all available licenses once. This assumes
> > that any
> > +# additions to LICENSE_PATH have been done before this file is parsed.
> > +AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
> > +
> >
> 
> FWIW this part no longer seems to work correctly, now running:
> yocto-check-layer --dependency /OE/meta-openembedded/meta-oe/

Was it ever fixed?
https://lists.openembedded.org/g/openembedded-core/topic/72389694#141680

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
