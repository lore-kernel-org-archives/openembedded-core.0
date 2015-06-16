Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7750573FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:06:36 +0000 (UTC)
Received: by igbos3 with SMTP id os3so37938651igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 01:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=TANr5cR+Nph/ZGG0NIECaCt8YJE01+9Oa0+n1uVm5YQ=;
	b=avewXjPgWz83Ujitzx3s7SCGy/X4CBE06dCQeZMyoljdFKA+eNeKboVNibpZR7M1/r
	YLG1CbIlgs25wolN2CF5z9m0pu2KKLsKBlJUVhdZaQx1F7Mx+PwpmqTy0xqy7+zmTKnV
	xGWU16qa9ThBXT2Orsn1kZ4cl9GZjEgHg83po4JvoOysD54PzXBEWB7czIACYOug3u38
	7Y53VIJU6kX/HM+Mt48ZEtvaX50C8FRS02Y7MBltYZEiDFkO2Vt5oyHbJOmRL3mHbirC
	B+Y9FLiCD75G5hnnhtTvv3IkzPqXBq869jzVn2SZxJDMl1JToJ0sY0Bv/QhLeK7v1O5n
	nW/w==
X-Gm-Message-State: ALoCoQnBZE/d+UeYjR6l5vW+9NyxsyD4D8rg87/aJSMoNsHsFBmh3Q0bdE3vsIX627vgDtBFi+z+
X-Received: by 10.107.156.140 with SMTP id f134mr32497393ioe.34.1434441997754; 
	Tue, 16 Jun 2015 01:06:37 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D43E.dip0.t-ipconnect.de. [93.232.212.62])
	by mx.google.com with ESMTPSA id 191sm137046iof.18.2015.06.16.01.06.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 01:06:36 -0700 (PDT)
Message-ID: <1434441993.9085.152.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 16 Jun 2015 10:06:33 +0200
In-Reply-To: <557F2BF1.5000605@windriver.com>
References: <1434370643.9085.98.camel@intel.com>
	<557F2BF1.5000605@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: KCONF_AUDIT_LEVEL + kernel_configcheck
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
X-List-Received-Date: Tue, 16 Jun 2015 08:06:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-15 at 15:48 -0400, Bruce Ashfield wrote:
> On 2015-06-15 8:17 AM, Patrick Ohly wrote:
> > Hello!
> >
> > In Fido and master, the following patch changed the default value of
> > KCONF_AUDIT_LEVEL:
> >
> > $ git annotate origin/fido -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
> > ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	308)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
> > $ git annotate origin/master -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
> > ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	309)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
> >
> > At least if I read it right, that wasn't the intention. The commit
> > explicitly says that the default should be 1:
> >
> >      The visibility of auditing is controlled by KCONF_AUDIT_LEVEL:
> >
> >         0: no reporting
> >         1: report options that are specified, but not in the final config
> >         2: report options that are not hardware related, but set by a BSP
> >
> >      The default level is 1, with level 2 and above being for BSP development
> >      only.
> 
> The line is correct, since we don't want it warning for non linux-yocto
> meta-data enabled kernels. The default is indeed 1, since I set it in
> the common include file. That was the default I was referring to in that
> change.

Ah, I missed that other part of the patch. You are right of course.

> > foobar.cfg is used (the CONFIG_SECURITY_SMACK part is used) but the
> > CONFIG_FOOBAR part of course is not. Shouldn't this trigger the
> > "specified values did not make it into the kernel's final
> > configuration"?
> 
> To keep the noise down, I'm only emitting partial audit information and
> the warnings only apply to options that are tagged as "hardware", since
> that is also a synonym to 'required' in the configuration scheme.
> 
> .. and no. That isn't common knowledge, since I've been slowly changing
> and making the audit information more visible, but don't want to flood
> too many warnings, or create an ABI that limits how we can change things.

That explains it then. I don't remember how I learned about this kernel
configuration check (might have seen the error message at some point)
and came away with the impression that it applies to all configuration
options.

I cannot say how much noise it would create in practice, but at least I
had one specific case where I was using a non-hardware configuration not
supported by the kernel and would have appreciated a warning about
that ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




