Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCCsM-0002NM-0f
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 18:34:34 +0200
Received: by ghbz2 with SMTP id z2so3911199ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=VdhKlQGxuX1z0gQBnWfTNzRht4VKTauoKnpTXUJ/Jqk=;
	b=Ag9O/miOVp7LUfjUoSHMYXxp/whkSjl2Bd9RhC/msTFE3dCqz7mdINFeNpn8QD+Dqd
	9NG0Pwr0AgijdvgIi7sfVmKhxfh1+g3um2UBoBn6lBZRCe12DmHay2MEzQkVXsRGaUXL
	0wYL3RCBCA77kI3q5238JtbUZm18emmrn+yT3R5IVNopkEQnbDBxJu7GjfqpOZIy7X5j
	+W0Rhvv7fLBSL5/GtIape1eWZ4Rb5qmZU32ZkHGsdQPUYgtRzUgim4FHNDr/zm3wrTH3
	YFkwGWFvUNCog9S4N2WUEpV6itiO91uJtuFVsG0WkFeyhX5fhFB7Oj7nbW4NXJJQ1FWg
	hWvQ==
Received: by 10.60.1.4 with SMTP id 4mr27581250oei.28.1332779133604;
	Mon, 26 Mar 2012 09:25:33 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id yw3sm16794108obb.7.2012.03.26.09.25.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 09:25:32 -0700 (PDT)
Date: Mon, 26 Mar 2012 09:25:31 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326162531.GD21518@bill-the-cat>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332753313.28414.91.camel@ted>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
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
X-List-Received-Date: Mon, 26 Mar 2012 16:34:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 26, 2012 at 10:15:13AM +0100, Richard Purdie wrote:
> On Fri, 2012-03-23 at 10:35 -0700, Tom Rini wrote:
> > As per
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
> > a machine conf file should use '=' to set IMAGE_FSTYPES.
> > 
> > Signed-off-by: Tom Rini <trini@ti.com>
> > ---
> >  meta/conf/machine/include/qemu.inc |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> As someone pointed out, what I mentioned in that email sadly doesn't
> work although it would be nice if they did. I suspect this is why we're
> using += since:

We aren't using += today.  We (openembedded-core) use ?=.  meta-intel
uses += and meta-ti is mixed (and I don't have meta-fsl-* handy).

> > - The machine needs to say 'I need or support the following formats'
> 
> so the machine ensures those formats exist at a minimum:
> 
> IMAGE_FSTYPES += "xxxx"
> 
> > - The distro needs to say 'I always want format X'
> 
> so the distro can do:
> 
> IMAGE_FSTYPES += " yyy"
> 
> > - The user needs to say 'I know best, give me only format X'
> 
> This one is the problem case so the user has to use overrides:
> 
> IMAGE_FSTYPES_override = "X"
> 
> (where override can be MACHINE or forcevariable)
> 
> > - The user needs to say 'I know best, give me what you support + X'
> 
> IMAGE_FSTYPES += " X"
> 
> 
> Whilst I think that is less than ideal since it forces use of overrides
> in local.conf to override, changing the += in machine conf files doesn't
> gain us much, it just breaks += in local.conf.
> 
> I'm open to other feedback though...

Well, I suggested ??= / ?= and posted some results from bitbake -e...

-- 
Tom


