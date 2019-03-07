Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3BC6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:38:48 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id u205so13670515ywe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 07:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AW5Ysrsd7s/qH4pqaSFKpoOmL1M9hVCKXuKyjUlsdRI=;
	b=ZuXupx5+JBbSc8B73SMb9TuA52aR6W1Zf146VM2PDn4Q24Jc6Wtsi/5td+ltoJt/pb
	YrMlqbj/mkiAe8Z3B6wnKR4sEvWxYOTBapXGPPITbM8FxUtjQV6cZ1H/DDuNCG1cnoyd
	J/o1DOyY7T75AJYFLY+7w3BwaAdMFEr6sfJ+OP6H87irsOvVVcKu4psWMqek/5ROwgOf
	TdOFJtx30tdrspfW87gW57XLSNLltrLhphhcuqSPxTcH46fVRQHOiS5BfNomK0riaKMA
	3UaklRpUj8Gn0iCkouzDyWb13iCRIp7PCFL3iDP5W8F2yw/xC3tJRDdYK1CzdJcdJUiN
	4m8g==
X-Gm-Message-State: APjAAAWyRtRYNrdLKrP7jvzMtNadr5HV9p3US/MDx7wYQ/g18OYjYl15
	JcDrQvRf4oO8kfip1+NLAph81z3wgng=
X-Google-Smtp-Source: APXvYqzjcGMlu+YEfWqdcRe42HNXAKDLf/AuNvEZyxCyIn182XxnCbOECtiIbPJQG0KFnf2i9+oA2Q==
X-Received: by 2002:a0d:f344:: with SMTP id c65mr10317085ywf.77.1551973128743; 
	Thu, 07 Mar 2019 07:38:48 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	m67sm1760566ywe.56.2019.03.07.07.38.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 07 Mar 2019 07:38:48 -0800 (PST)
Message-ID: <2dae498718e3aea65b65efe9fded89bcbbeae4bf.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 07 Mar 2019 15:38:46 +0000
In-Reply-To: <20190307151827.GA16556@localhost>
References: <20190307142709.12076-1-bunk@stusta.de>
	<CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
	<20190307151827.GA16556@localhost>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 15:38:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-03-07 at 17:18 +0200, Adrian Bunk wrote:
> On Thu, Mar 07, 2019 at 03:56:33PM +0100, Leon Woestenberg wrote:
> > On Thu, Mar 7, 2019 at 3:27 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > From: André Draszik <andre.draszik@jci.com>
> > > 
> > > It looks like there is an implicit dependency on util-linux'
> > > umount - as otherwise when using busybox' umount we see a
> > > long delay on shutdown / reboot.
> > > 
> > > [YOCTO #13058]
> > > 
> > That bug number is wrong, seems only slighty related:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13058
> > 
> > Following the discussions, I think this had to do with older versions
> > of busybox not ignoring the '-c' option that systemd passes to umount.
> > 
> > https://github.com/systemd/systemd/issues/7786
> > 
> > So, systemd has a dependency on *either* util-linux-mount *or* a
> > minimal version of busybox. Do we support minimal version dependencies
> > in Yocto?
> 
> Then the patch to master didn't make sense,
> unfixed busybox is not a problem here.

Yeah, I did ask for my patch to be ignored, and there was further discussion
confirming that it isn't needed these days. Unfortunately my patch still
went in.

http://lists.openembedded.org/pipermail/openembedded-core/2019-February/278893.html


> If systemd needs util-linux mount/umount in master it should also
> depend on them in older releases (both master and thud had systemd 239 
> at that point).
> 
> If it does not, it should not pull in such dependencies unconditionally
> in master.

Care to post a patch reverting it on master?

Cheers,
Andre'

> 
> > Regards,
> > 
> > Leon.
> 
> cu
> Adrian
> 
> -- 
> 
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
> 


