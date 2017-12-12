Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C122F783BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:55:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g130so16504546wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Aalpw3y6+bCce6Zvr6jyAb7NLKp0qXow4+zbeam5zt0=;
	b=hGHly9e6TtsRNzEdJmFeOzZM9B/PVonGPiNQU4sFd8887F40J3A4iO+00R1KtaBPzc
	Zb0Jf15FIqUhuOJhEBbN2/2fPBNWI5knX49BcHbubTclgY4nYRyRjSH/LLKj36ZOZBYY
	NoJYfI/ERJUsA62xi8aow6shCHYsbYfTXaCAPkXVz4rmFghY5Jl7Oz77MaUZVBLKKyy+
	3JfHVf/6dDo2hUsEUG8jxYVKCVSRXk5NbLH0r/gk8tnTGaRyOberXzBk3o+Lm12HWpTB
	mQa4r1RVbO2/mv8LrkSlWCzsHh3Cx/3tjqQsiaSSdL3Pw49AV0+mA2ctN789iB7isMUA
	VxIg==
X-Gm-Message-State: AKGB3mK26WnzXK64mvpnyu3URnrDR1yljod+y84aZep+eWZSkVP5sm8x
	vPzYlmCWAT8r/R8RD2mnokJWewcN
X-Google-Smtp-Source: ACJfBosF9nt6wjd7Au3ccPwqHudXxiOn385y1He8fT0pHdB+imcy1GqTey5lqGT3goMzftcZYQfnZQ==
X-Received: by 10.80.133.193 with SMTP id q1mr1853191edh.50.1513068911177;
	Tue, 12 Dec 2017 00:55:11 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p47sm8109034edc.30.2017.12.12.00.55.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Dec 2017 00:55:09 -0800 (PST)
Message-ID: <1513068908.30397.2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 08:55:08 +0000
In-Reply-To: <20171212024917.14550-1-allenwild93@gmail.com>
References: <20171212024917.14550-1-allenwild93@gmail.com>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Tue, 12 Dec 2017 08:55:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-12-11 at 21:49 -0500, Allen Wild wrote:
> Syslinux compiles successfully with Gold, but at runtime Isolinux fails
> to boot, getting stuck at the version screen without loading the menu.
> Forcing the BFD linker fixes this.
> 
> To future-proof, use an inline python replace rather than duplicating
> the definition of LD in bitbake.conf

Hm, other recipes that have this need typically simply do:

LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"

Would a similar approach work here, too? Instead of this big change.

Cheers,
Andre'
> 

