Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AAF537F7D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:23:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n1so3060574wra.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ObaPDrup1Uw+F73exB3ZJOik8T3/0eLZppAdFavopls=;
	b=NW/i126Un6o5I+pnjFerAA2zu1FSpBDurnhU4uPJmf8qmnV2Zi0HL8b6ed0jI6FUTh
	6LbAbUIjki2zdA1k91yPU43ylUouGlNdZlmvtRtMXjfulvRw90j7NMDNynMphnWEKUPH
	Cr4F+6ZrJwTs8U15J74Sgom2tisJe1Bwr01Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ObaPDrup1Uw+F73exB3ZJOik8T3/0eLZppAdFavopls=;
	b=l/1D8YqkhbXNqHrsL6DnC640aHjSui5EazhGgDljkmB+Urw/u6RBHClq6u+TDNRkTC
	Ysoyz/RUJ5FnSg98mkzKQUfJnPBjK+AUqiVvuJ8DAzN+fhl3+xXrJuDeZlNdu9hWp9qR
	BdEKlv7BIVwdAXYgcDTAlbFhWNUUmlGJN7+MRAgnzTrpyita4VCcyguYcO3CDoUrfOaq
	2GKtoBWXg0Ru970bRHs/QS0dbquCQu3xI+vXWNxhEM2KYcsSfxtuzkLBc3ZtlORXL535
	Os4oQg9v49jWQccTN3MSpN0gXrE5R2rb7/z4ZRub5YAGa0bhkGsYHZHAaPt3e9Z/OlPT
	IH7A==
X-Gm-Message-State: APjAAAWGQ27IdB3C9QbH+rI6szeFPk7X9VbEyeNK3oBrsXjcqsgs5LFl
	KT+IsqK35YPSvLHqRIPILdEy5g==
X-Google-Smtp-Source: APXvYqzFnGPt+j+ui4DEJD2/tTTnvD852LsH2ziXErcbH8MAdNlMhT9F24Jz7bFgMSejro/QStGjRg==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr3515886wrm.4.1573662229384;
	Wed, 13 Nov 2019 08:23:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 189sm3228690wmc.7.2019.11.13.08.23.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 08:23:48 -0800 (PST)
Message-ID: <202eb2c6008a6eef16ed1a644e304607eb576999.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 16:23:47 +0000
In-Reply-To: <f53835dc2b5b9b2188d5e946ac1198c969821322.camel@linuxfoundation.org>
References: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
	<f53835dc2b5b9b2188d5e946ac1198c969821322.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: fetcher uses wrong SRCREV for class-native
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
X-List-Received-Date: Wed, 13 Nov 2019 16:23:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-13 at 16:21 +0000, Richard Purdie wrote:
> On Wed, 2019-11-13 at 06:00 -0800, Andre McCurdy wrote:
> > With the following test recipe, foo.bb:
> > 
> >   LICENSE = "CLOSED"
> >   PV .= "+git${SRCPV}"
> >   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> >   SRCREV_class-native = "fc3e8f717779cabcbe583cac304308eaad5f1648"
> >   SRC_URI = "git://github.com/file/file.git;protocol=https"
> >   S = "${WORKDIR}/git"
> >   BBCLASSEXTEND = "native"
> > 
> > when building foo-native, although SRCREV is set to "fc3..." via
> > the
> > class-native over-ride, the version of code actually fetched is
> > "015..":
> > 
> >   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
> >   PV="1.0+gitAUTOINC+015b0cdce1"
> >   SRCREV="fc3e8f717779cabcbe583cac304308eaad5f1648"
> > 
> > A similar problem happens in reverse if SRCREV is set using a
> > machine
> > specific over-ride, e.g.
> > 
> >   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> >   SRCREV_mymachine = "fc3e8f717779cabcbe583cac304308eaad5f1648"
> > 
> > Now foo-native fetches the target specific version "fc3..." even
> > though the machine specific over-ride shouldn't effect -native
> > variants:
> > 
> >   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
> >   PV="1.0+gitAUTOINC+fc3e8f7177"
> >   SRCREV="015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> > 
> > Commenting out the line which appends "+git${SRCPV}" to PV seems to
> > be
> > a workaround which results in the expected version of code being
> > fetched.
> 
> I tried this with master and didn't see it reproduce. Do you have:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d427f58977a46f2bda4b7f30cf83793373e401d3
> 
> applied when your build sees this?

I just reverted that and retested. I started seeing a lot of basehash
errors which tends to confirm my suspicion that the above patch is the
same issue and fixes this. It does raise the idea we may be able to
make a testcase out of this though...

Cheers,

Richard


