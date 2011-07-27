Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm8KH-0006Oy-5q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 19:55:43 +0200
Received: by pzk1 with SMTP id 1so3092158pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TR22lI+4OK0pfbbXWBJQlzi66d32cleMOiZ7sDAt1Zs=;
	b=Gff7TBNo/D+/7LkJ+3msbUjlnIqAKApNsgGvP9LxwG8W3CH9Dw8QlESFB19g/JCJYn
	jKlNp1AX1q1van1lxNalqx7rkSoqubXs3q4nwEkrEE3QYICOUfozj1vlbQR0Fd5jCsoM
	zFBUkCXsmCgFSAykzuInqZ6/9Y/e7igCT0G/c=
Received: by 10.68.48.2 with SMTP id h2mr152897pbn.148.1311788905875;
	Wed, 27 Jul 2011 10:48:25 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i9sm90665pbk.52.2011.07.27.10.48.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 10:48:22 -0700 (PDT)
Date: Wed, 27 Jul 2011 10:49:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110727174912.GA14766@sakrah.homelinux.org>
References: <cover.1311191810.git.tom_rini@mentor.com>
	<7add784e793424e835ea062df57713257e42481b.1311191810.git.tom_rini@mentor.com>
	<lyfwluk7hs.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyfwluk7hs.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <tom_rini-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/1] siteinfo.bbclass: Port over oe.dev logic for site files
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
X-List-Received-Date: Wed, 27 Jul 2011 17:55:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/07/11 11:57), Enrico Scholz wrote:
> Tom Rini <tom_rini-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:
> 
> > +python () {
> > +    sitedata = set(siteinfo_data(d))
> > +    if "endian-little" in sitedata:
> > +        d.setVar("SITEINFO_ENDIANESS", "le")
> > +    elif "endian-big" in sitedata:
> > +        d.setVar("SITEINFO_ENDIANESS", "be")
> 
> Assigning SITEINFO_ENDIANESS in this way seems to break build of cross
> packages (binutils, gcc).  E.g. for xscale (--> armv5te), these packages
> will be build for armv5teb. This happens because tune-xscale.inc uses an
> (unsafe)
> 
> | BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> 
> statement. As there seems that something wents wrong when setting
> SITEINFO_ENDIANESS in an anonymous python function, 'armv5teb' will be
> assumed.

since siteinfo determines endianness based on HOST_OS this will always
be wrong for cross packages to use endianness information since it will
give back the endianness of the host system but we want the endianness
of the target system. This particularly is a problem for builds where
host != target since we are trying to use this information to construct
PACKAGE_ARCH for the cross recipes which is target dependent.

So either we need to break this link in cross.bbclass and set
BASE_PACKAGE_ARCH and PACKAGE_ARCH appropriately there.

I hope the ongoing tune file overhaul addresses this issue.

> 
> Using a more safe construct like
> 
> | BASE_PACKAGE_ARCH = "${@{'le' : 'armv5te', 'be' : 'armv5teb'}[ \
> |                        bb.data.getVar('SITEINFO_ENDIANESS', d, 1)]}"
> 
> reveals that SITEINFO_ENDIANESS is undefined when expression is evaluated.
> 
> I am using bitbake master (5c8eeefc79455f058dda8f04cf4c12dc5418e00f).
> 
> 
> 
> Enrico
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


