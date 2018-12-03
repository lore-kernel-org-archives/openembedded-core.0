Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 527B06C548
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 11:58:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,310,1539640800"; 
   d="scan'208";a="5354022"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 03 Dec 2018 12:58:28 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Mon, 03 Dec 2018 12:58:28 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 03 Dec 2018 12:58:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1543838308; x=1575374308;
	h=message-id:subject:from:to:date:in-reply-to:references:
	mime-version:content-transfer-encoding;
	bh=8F+fC+pU7/4wwzzDDRinjzF53rBYsGsN8S6tjhenLjk=;
	b=RaFqHMerGBRJk0Sz6+gwSg6CK3nNm3AvUKo3QYAGkVbhr7BbO6fH9wAs
	pMiQsa0aQv6HvGxvY/BZc2RWa8hFgSs4NMl5xR5rcUsmbNLckgQB5LExY
	FgozbX6Ra3fDBCmWBm21Y48FOq6/Do3b7+YgDA/X3LtFeN2lCT9/xiXkn
	HgdL3NlfzAPwMFsEsbvTDZ19ho4PqCXPOr70xQFclvvCIpjrQGGAcGBsi
	K/wnbumGrYqIE9GsP+PCu584QUyjbk2I0ZAsfKAMYu74cIJOrXOj/uGB4
	JPK/HFrshPdtRC6ArEEiIh7m/Gw0qHcjlgwenGJrF00HhprWkaNXDtFS/ A==;
X-IronPort-AV: E=Sophos;i="5.56,310,1539640800"; 
   d="scan'208";a="5354021"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 03 Dec 2018 12:58:28 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A8E2B280073
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:58:28 +0100 (CET)
Message-ID: <f7b657cbf07e96d9c390a74b206414032c4687c0.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Dec 2018 12:58:26 +0100
In-Reply-To: <ccdab7b0a102c6142348f3e37aa913132f02c044.camel@ew.tq-group.com>
References: <20181106085623.19811-1-matthias.schiffer@ew.tq-group.com>
	<ccdab7b0a102c6142348f3e37aa913132f02c044.camel@ew.tq-group.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Mon, 03 Dec 2018 11:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-23 at 11:35 +0100, Matthias Schiffer wrote:
> On Tue, 2018-11-06 at 09:56 +0100, matthias.schiffer@ew.tq-group.com
> wrote:
[...]
> > ---
> > 
> > It would be great if this patch could be backported to all versions
> > back to
> > Rocko, as our current setup is still based on Rocko.
> 
> Is there any chance we can get this backported?
> 
> Thanks,
> Matthias

Thanks, I saw this is in Sumo now. Can we get it into Rocko as well?


> 
> 
> > 
> > v2: add comment, extend commit message
> > 
> > 
> >  meta/classes/base.bbclass | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index df11c8b270..9efb06de5f 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -303,7 +303,9 @@ base_do_configure() {
> >  			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile
> > -o -e makefile -o -e GNUmakefile \) ]; then
> >  				oe_runmake clean
> >  			fi
> > -			find ${B} -ignore_readdir_race -name \*.la
> > -delete
> > +			# -ignore_readdir_race does not work correctly
> > with -delete;
> > +			# use xargs to avoid spurious build failures
> > +			find ${B} -ignore_readdir_race -name \*.la
> > -type f -print0 | xargs -0 rm -f
> >  		fi
> >  	fi
> >  	if [ -n "${CONFIGURESTAMPFILE}" ]; then


