Return-Path: <tom.rini@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8205E6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 14:16:46 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id 63so4356842qgz.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=9Mclmw/8SacSBgwTpXON/lt+X21sEHDUYjljUvNdsu4=;
	b=CKbcZuFwTAQlm7qU4LhH7NdzSB2nn+iraCYkk6hA57oajn5h7VI5Q3wkJBb4Lo6yd/
	wH1yXCTyq7GWvXFinGa3Ytor39kcJ5Ir32zzNdHRILdbKcQF4tfMTy3ngRbH8ODzXxN0
	az8DIdQOha2DxXuscOp9e+ARrFdJIsS/7NQn8uwXh64SXW7FZYvTOg0h/ZQfTQZ7QFSg
	LRlBKRH01xUBlY07tIGtRorvwzmqieD7w+m/vAaHPdwJiPmIp5MvSbzvNPprqEVf1TIC
	amjst/RfinlvK7a5CU1VT0BMWymgnNaflYB8GG2ImvNncg/5gT2wHSzUZHphbLxY3K7p
	1Cxg==
X-Received: by 10.140.81.240 with SMTP id f103mr32763831qgd.47.1403878607671; 
	Fri, 27 Jun 2014 07:16:47 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id x1sm16630471qaj.19.2014.06.27.07.16.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 27 Jun 2014 07:16:46 -0700 (PDT)
Date: Fri, 27 Jun 2014 10:16:49 -0400
From: Tom Rini <tom.rini@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140627141649.GT9006@bill-the-cat>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
	<1403876444.28648.9.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1403876444.28648.9.camel@ted>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Fri, 27 Jun 2014 14:16:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2014 at 02:40:44PM +0100, Richard Purdie wrote:
> On Thu, 2014-06-26 at 08:27 -0400, Tom Rini wrote:
> > Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
> > that we evaluate it fully before performing the live and vmdk logic
> > checks.
> > 
> > Signed-off-by: Tom Rini <tom.rini@gmail.com>
> > ---
> >  meta/classes/image.bbclass | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 79de5a2..ccfa1b1 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -78,10 +78,11 @@ do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
> >  
> >  do_build[depends] += "virtual/kernel:do_deploy"
> >  
> > +EVALED_IMAGE_FSTYPES := "${IMAGE_FSTYPES}"
> >  def build_live(d):
> > -    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
> > -        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
> > -        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
> > +    if base_contains("EVALED_IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
> > +        d.setVar('NOISO', base_contains('EVALED_IMAGE_FSTYPES', "iso", "0", "1", d))
> > +        d.setVar('NOHDD', base_contains('EVALED_IMAGE_FSTYPES', "hddimg", "0", "1", d))
> >          if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
> >              return "image-live"
> >          return ""
> 
> The trouble is this doesn't add up. 
> 
> EVALED_IMAGE_FSTYPES := "${IMAGE_FSTYPES}"
> 
> basically sets EVALED_... to the expanded value of IMAGE_FSTYPES
> 
> base_contains() also expands the variable its passed.
> 
> I'm a little concerned as to why those two expansions of the same thing
> should result in something different.

Well, they're happening at different parts in the parse.  The vmdk
example is clearer I think since it's not another "big" python function.

> From your later explaination, it would appear the use of the override is
> causing problems but I don't understand how immediate expansion would
> work around that :/.
> 
> So before this merges, more investigation is needed as there is
> something not adding up...

Well, I think the high level answer is that no, we aren't applying
OVERRIDES at the point when we're parsing classes still rather than a
specific task.  Adding an immediate eval at this level does force things
and then we see what we're supposed to.  My gut feeling here is that if
we poke deeply enough at base_contains we'll see that we aren't passing
along the expand flag when we thought we were.

-- 
Tom

