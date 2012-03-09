Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S5tqO-00041a-68
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 08:02:28 +0100
Received: by iaag37 with SMTP id g37so1704094iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2012 22:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aKMPUxQi2mpUQKDu41dX9pYJwBRJE7cqH8QoJKDDFuI=;
	b=uM+ojTnTbs1Uf6jkOkduReE2IAz+oxZhA9IXMVcxnZ/YW5/vchfqht71zjdGOoJdtD
	iRODH4gRWVs1k6BK5frcZvJO8O2VQJnWlRrPatQQu/8knOWeoWZa9zsDvvualC4/VvrS
	BOoxU8xVs5D3Mlw9rHlpaKMm+PhDD+ZOLldRlUkcFT/boy35CksLzaS1wevZn2uehdvw
	M5BXuDX2zaqUvzuDDlwbh5hqv0AF1rblBqjn/UBJFdJofmHrZ7oIuB43c7pcPTRyJrXn
	Z/0Nkm/hyAJEbiQE8Ml1pL63+TyFqKZcczANmkPoIVMTxW8TpyS5Hwnceyxb4S7DiUsU
	o6uA==
Received: by 10.50.207.72 with SMTP id lu8mr1279656igc.0.1331276028503;
	Thu, 08 Mar 2012 22:53:48 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vr4sm2300301igb.1.2012.03.08.22.53.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 22:53:47 -0800 (PST)
Date: Thu, 8 Mar 2012 22:56:02 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120309065602.GC10899@sakrah.homelinux.org>
References: <alpine.DEB.2.02.1203081704020.4991@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1203081704020.4991@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: want to confirm that include/require is a pure textual substitution
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
X-List-Received-Date: Fri, 09 Mar 2012 07:02:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/03/12 17:12), Robert P. J. Day wrote:
> 
>   currently writing a tutorial involving OE and working up to yocto
> and want to verify a couple things.  i'm reading the OE manual,
> section on include/require:
> 
> http://docs.openembedded.org/usermanual/usermanual.html#recipes_require
> 
> and want to verify that that is purely a textual inclusion, so that
> *anything* that is common across a number of .bb files can be
> centralized in a .inc file, correct?

yes but dont miss the real difference between include and require

> 
>   and on that note, a larger question about the OE manual itself.  in
> that same section, there's a reference to the cherokee package, and
> the alleged .bb file:
> 
> PR = "r7"
> 
> SRC_URI_append = "file://configure.patch \
>                   file://Makefile.in.patch \
>                   file://Makefile.cget.patch \
>                   file://util.patch"
> 
> require cherokee.inc
> 
> do_configure() {
>         gnu-configize
>         oe_runconf
>         sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/*libtool
> }
> 
>   unsurprisingly, that's out of date as the current .bb file is
> simply:
> 
> require cherokee.inc
> 
> PR = "${INC_PR}.0"
> 
> SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
> SRC_URI[sha256sum] =
> "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
> 
> but that's not my point.  since i want my tutorial to walk someone
> through various files, given the split into the oe-core and
> meta-openembedded layers, i'm thinking of using examples strictly out
> of oe-core since there's more than enough there.  but the cherokee
> example is in the meta-openembedded layer, and that distinction
> doesn't appear to be made early in the OE manual anywhere.
> 

yes manual covers what we call classic OE

>   is there a plan to revise that manual to incorporate the
> distinction?  is there a newer manual elsewhere?
> 

I think yocto's manual are more uptodate w.r.t. OE-Core
that OE manual should also be updated probably
covering layers. we need volunteers 

> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


