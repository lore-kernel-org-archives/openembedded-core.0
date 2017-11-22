Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3CD786F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 00:50:03 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id k61so12990565wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 16:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yRpuH2OG3F4rhG1leqH657D6IuDylJ8lTWnhm+8Zt24=;
	b=aVARNL+/4CfecWgdpI8mZOSjC7PBTLa7Yo3KCt9PdtjgBabLTYXuGdnn6vDLjgypLO
	gVyt4MdoJiCpyHpbTtOhIB78/MyZntAYJ0unRTVQdDG1HY6L5wk7unq+C1grLYW7g0ZL
	j5EVnHANCFFbKNKq3oJbvGRQ9sUlus/NONW9TQErL0OsesI4O1MZOgkRZz6b2eeXMWLX
	VPyyn2cPkcm5cLzWkXIswYKkw42TtFNQ9yrefAv16MOkSGQC9Bp66246aTQR102koMo+
	kthiQujcoJX71ilDye825FjPXJ1wK4sSDWVoHpthNFnftbT8RKX/hgJ0jLApR75MitEs
	ggNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yRpuH2OG3F4rhG1leqH657D6IuDylJ8lTWnhm+8Zt24=;
	b=uks0T0drNLYEgtSQyTa1xS+Fz45CckUCa6pZOQ8NU3BG5yp7r+QqmEAZV1CmxhznHL
	yle265fmSDQltBKYqTUs/zmSsSU+d6MUPAlco0V5iiqXlRuvosXBpn9QSwr+QhLhX+ro
	VC+6+HM2bsKkaMcH1URz/OEGqWv8Zdc4KuD/MBdba5NTvwWZ+pw5Toeg3jazCF2471k9
	rqSXs+M5I3TZpF40SQ7LjCzp/hCz9atO25eGe51BWFJeLB8DWu28oystkTRHVXyCfntR
	EXpLWbN+jL8ebzErtGaE79H3jmK9rIdgVgbaJW8xXIWXSr1pD0s5XTW2wNvqjv4qf2xK
	HCFg==
X-Gm-Message-State: AJaThX52wOpIoWUMjXid6adzRhswEh/Gr5BziJd6hhyTF3ndyfL219k1
	Zvp5g1AEh/1OZVDguM1RtjgOaFKLvUgL0xzDDtw=
X-Google-Smtp-Source: AGs4zMYkp/jUkYpG/L6JWxaZ1M/acXs8va703GznLZQzwo8dyQr3OOuvEzFYxPUhoaXO9xUYu3HLdoNNYlI6ZOYAQBM=
X-Received: by 10.223.150.175 with SMTP id u44mr15314482wrb.115.1511311805082; 
	Tue, 21 Nov 2017 16:50:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Tue, 21 Nov 2017 16:50:04 -0800 (PST)
In-Reply-To: <CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
	<CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 21 Nov 2017 16:50:04 -0800
Message-ID: <CAJ86T=Wd0wCJbRAS+H3kDC2tg+51UsY_KwRjZKq46VEK+Y0NdA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Wed, 22 Nov 2017 00:50:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
> What glibc release is this in?  We've an upgrade patch pending that bumps it
> to 77f921dac17c5fa99bd9e926d926c327982895f7.

It's currently in the glibc master branch only (ie hasn't been
backported to the 2.26 release branch).

