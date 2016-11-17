Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE9A71A7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 10:22:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so19830947wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=07hTXhh0kg8+yCERNIAqrMVozCodcJsSBHfpEG3yOeM=;
	b=LhG8YnoD9IyFYqMFj2b2xKPa+QBUIlnGBK93YfO/uiOA3MUsf7dSILwrLaEUULDSAW
	xydPfonsX/onCHOF7myb/Re11QL4fgF0w6ca6XrAIYESyjHpadtoILlzrrBSDOn91XmQ
	hjP0of838frvetDB9awpR5vV2kfDcdwim5A0vse8TZb8FjJvnce71AEUZgdMDxb6M3is
	yV+JeC+qA1Swvb7N/gD1ccTYrpBkcFXUv+EjgX6AkBW1nZt+P7SpV8Db1s6upRJKOwq3
	w6NoqoHNnNHNtz8venM/2rC/pyyKzwEa9CbKlLfxu47gCu2Uc/ygWffXkrtAmndmFeUy
	PI7g==
X-Gm-Message-State: AKaTC015ZPw2RlezY2Xun6roooXCccyBzd86/TYbFHT3LESBG+GVlUGhHTPIz/oinozYFQ==
X-Received: by 10.194.31.167 with SMTP id b7mr1758300wji.168.1479378139738;
	Thu, 17 Nov 2016 02:22:19 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	bj1sm2454842wjc.17.2016.11.17.02.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Nov 2016 02:22:19 -0800 (PST)
Message-ID: <1479378138.27546.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 17 Nov 2016 10:22:18 +0000
In-Reply-To: <20161116201836.GA26131@denix.org>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
	<20160818075626.15973-2-git@andred.net>
	<20161116201836.GA26131@denix.org>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] module.bbclass: use Module.symvers for dependants
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
X-List-Received-Date: Thu, 17 Nov 2016 10:22:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2016-11-16 at 15:18 -0500, Denys Dmytriyenko wrote:
> On Thu, Aug 18, 2016 at 08:56:24AM +0100, André Draszik wrote:
> >  
> > @@ -24,6 +34,11 @@ module_do_install() {
> >  	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> >  	           O=${STAGING_KERNEL_BUILDDIR} \
> >  	           ${MODULES_INSTALL_TARGET}
> > +
> > +	install -d -m0755 ${D}${includedir}/${BPN}
> > +	cp -a --no-preserve=ownership ${B}/Module.symvers
> > ${D}${includedir}/${BPN}
> 
> Hmm, why is Module.symvers expected to be in the root of ${B}? This seems
> like 
> a very artificial assumption/requirement!

[...]

> I wonder if this should have been rolled into ${MODULES_INSTALL_TARGET} 
> step...

What about adding a (lazy ?=) variable to be able to override the location
of Module.symvers within ${B}, or alternatively using find to automatically
detect it? I guess there could also be more than one in theory? Do you have
something different in mind?

A.


