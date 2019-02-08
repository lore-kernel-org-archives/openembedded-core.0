Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0316C154
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 12:08:14 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a2so2603050edi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 04:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6A7KntFARZCwQQt1ibaHw6Gf7NUGaKdrgibhVr+pml8=;
	b=FnDUISHVbMxbf5U9XEVyxyBbQ4hzFOTk+yBi4s213qHH1xrWzg0wibFncrxuBdfSLk
	Vz+UjJS5kxUHbKRByUMi6a9TK4GFTIsJYtFtZQrnwwYYfKMM0VMx28JkB1DcrYeo3KjO
	6uCvU7Su8rH5yGzxyYv8xBMnLWaytG+aUSrwko4U9mhktQ8F01IF9+4UCuJzEo2JFdmi
	M7oJOVl7Q2YasxH8gAD9kWIFNPfa1261XEWFc3rSGDc/wQdQUSYbvMcdWIm2snLm9zpx
	Zt45Kd4nJpcTo9cngNloFR40MJI2tAP/w/fMA//nnJBjs0ea0eR7mrq4ATEqrVNqpeui
	RuRg==
X-Gm-Message-State: AHQUAuY5KvMhVN+Kg81TO4EAWQtArBInwIsXRwyRkHZW1cRpoVG3Ws3S
	Vq9yN3S+JIAxAfS8LqSnl94=
X-Google-Smtp-Source: AHgI3IaAwwxhXJfWjIoeDQ/n+2vtU+XaCS5g+cnKB3zYwix0agIf1G3ejxrLU6zaJ++yq1Wuoqppkw==
X-Received: by 2002:a50:bc12:: with SMTP id j18mr16723123edh.50.1549627695317; 
	Fri, 08 Feb 2019 04:08:15 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id k12sm446107eja.60.2019.02.08.04.08.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 08 Feb 2019 04:08:14 -0800 (PST)
Message-ID: <57d7850a4d01cbfa950f98f2def4366f7a44695a.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2019 12:08:13 +0000
In-Reply-To: <e21a184451ce71b68f8cbfe7abf26c583189a7e6.camel@linuxfoundation.org>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
	<e21a184451ce71b68f8cbfe7abf26c583189a7e6.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/13] util-linux: one package per binary
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
X-List-Received-Date: Fri, 08 Feb 2019 12:08:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-02-05 at 18:26 +0000, Richard Purdie wrote:
> On Tue, 2019-02-05 at 02:32 +0000, André Draszik wrote:
> > v6:
> > 
> > This version now also builds nativesdk-util-linux fine for me.
> > 
> > * introduce patch 04: util-linux: fix packaging nativesdk-util-linux-
> > lib*
> >   - this is to fix nativesdk build failures triggered by later
> > patches
> > * update patch 10: util-linux: simplify meta-package RDEPENDS /
> > RRECOMMENDS
> >   - make sure to walk each bindir only once, to better
> >     support nativesdk and usrmerge builds
> > * update patch 13: util-linux: final cleanup
> >   - commit message updated
> 
> Thanks. We appear to be now onto runtime errors:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/260
> https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/260
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/257
> 
> Seems some util installed into -lsb images (and full-cmdline) causes
> some getty error?

Because util-linux RRECOMMENDS all binaries now, we end up with util-linux'
agetty in the image, which has higher priority than busybox' getty.

agetty needs extra help:

http://lists.openembedded.org/pipermail/openembedded-core/2019-February/278814.html


Other alternatives are to:
* bump ALTERNATIVE_PRIORITY_pn-busybox (I do this by default for everything)
* add BAD_RECOMMENDATIONS for util-linux-agetty

But I think supporting agetty with the patch above is not so bad...


Cheers,
Andre'

> 
> Cheers,
> 
> Richard
> 


