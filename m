Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnwcK-0000pg-NH
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:49:28 +0200
Received: by gxk3 with SMTP id 3so3723420gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XrUVnMPyxrYrxUhia2eAEr4civOWzNxeRdb0VXTxw6o=;
	b=qBRwp6WpwPevwGn157SOCkt0kSvdQLcX/1ZADuk53T9u3dqOeO9z/TnKp/RnBFGU4Y
	OAdn01CXOs5LP1rFUslPnEMVxldXLjPgFSuUsD0s3DiwTO+dD+CIKG3WJeK4UMfcy3Ow
	XGmWgeTj9QsY9znC0K/6eDOKG2oB5EMfGviTI=
Received: by 10.142.186.18 with SMTP id j18mr3148472wff.406.1312220706542;
	Mon, 01 Aug 2011 10:45:06 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y18sm888524wff.20.2011.08.01.10.45.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 10:45:05 -0700 (PDT)
Date: Mon, 1 Aug 2011 10:46:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110801174629.GD7798@sakrah.homelinux.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
	<1312204479.2344.442.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1312204479.2344.442.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 22/22] feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide thumb mode
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
X-List-Received-Date: Mon, 01 Aug 2011 17:49:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/08/11 14:14), Richard Purdie wrote:
> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> > 
> > This will decouple the compiling in thumb mode from having thumb
> > capable cores.
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../conf/machine/include/arm/feature-arm-thumb.inc |    6 ++++--
> >  1 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > index e7d392e..533eab9 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > @@ -4,9 +4,11 @@
> >  # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
> >  # but requires more instructions (140% for 70% smaller code) so may be
> >  # slower.
> > -TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> > -ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> > +TUNEVALID[thumb] = "Use thumb instructions instead of ARM if ARM_INSTRUCTION_SET != arm"
> > +ARM_THUMB_M_OPT = "${@['-mthumb', '-mno-thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) != 'arm']}"
> >  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> > +
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
> >  OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
> >  
> >  # Note armv7 will hit on armv7a as well

this patch was wrong anyway. The one from Martin was better which was
pushed to help arm builds going.

> 
> The original change committed into master in my absence is broken.i

This commit is what was pushed e23f9ce928353c9da2b9c4bfa9a1a125a7d160f2
how is it broken ?

> patch is just making things even worse and more broken :(
> 
> I suspect what people really wanted was:
> 
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


