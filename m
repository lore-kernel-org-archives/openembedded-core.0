Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tc1BV-0004uU-0D; Fri, 23 Nov 2012 22:53:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLd7Yp026421;
	Fri, 23 Nov 2012 21:39:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04388-10; Fri, 23 Nov 2012 21:39:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLcx3W026397
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 21:39:01 GMT
Message-ID: <1353706738.7657.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Nov 2012 21:38:58 +0000
In-Reply-To: <20121120192605.GB12637@jama.jama.net>
References: <20121120152957.729DC1034D@opal>
	<20121120192605.GB12637@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf/sanity: Separate versions and PN stamp components into separate directories for WORKDIR and STAMP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 21:53:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-20 at 20:26 +0100, Martin Jansa wrote:
> On Tue, Nov 20, 2012 at 03:29:56PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 05075cf3138d1c61f5cf4fe0e1a4587acc00c692
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=05075cf3138d1c61f5cf4fe0e1a4587acc00c692
> > 
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Fri Nov 16 15:35:53 2012 +0000
> > 
> > bitbake.conf/sanity: Separate versions and PN stamp components into separate directories for WORKDIR and STAMP
> > 
> > This means some of the hacks we have to tell where the package name ends and
> > the version starts in the directory layout becomes obsolete, simplifying the
> > work of some of the cleanup scripts. It also makes the layout slightly more
> > intuitive to the user.
> > 
> > It does force a rebuild onto the user but it will reuse sstate successfully.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > ---
> > 
> >  meta/classes/sanity.bbclass |    2 ++
> >  meta/conf/abi_version.conf  |    2 +-
> >  meta/conf/bitbake.conf      |    6 +++---
> >  3 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 3806bc5..5b4f070 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -605,6 +605,8 @@ def check_sanity(sanity_data):
> >              f.write(current_abi)
> >          elif abi == "7" and current_abi == "8":
> >              messages = messages + "Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n"
> > +        elif (abi != current_abi and current_abi == "9"):
> > +            messages = messages + "The layout of the TMPDIR STAMPS directory has changed. Please clean out TMPDIR and rebuild (sstate will be still be valid and reused)\n"
> 
> The part about valid and reused sstate doesn't seem to be true, if I compare 
> sstate checksums with and without this patch (current master and master with 
> this patch reverted), they are different:

They are indeed, sorry about that :/.

> > -STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-${EXTENDPE}${PV}-${PR}"
> > -STAMPCLEAN = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-[0-9]*-*"
> > -WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
> > +STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> > +STAMPCLEAN = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
> > +WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> 
> This breaks paths in all PN-dbg, as reported on previous patch doing this with
> WORKDIR:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/030031.html

I pushed a fix for this earlier in the week, thanks for reminding me
about that problem, I had forgotten about it :(.

Cheers,

Richard



