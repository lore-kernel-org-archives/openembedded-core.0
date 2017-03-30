Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09EEF6093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:44:37 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id w43so39293762wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7GEUDUHPRxeKbfcDJC3tqMRpGfVPFgTyVtPUPObb5Gs=;
	b=nSV5Bqk5EWyit7xrrGrnfUdIIjBgDHQEKQNxPGQq79tTiePiglQ0TdHT3WmRC/gIag
	xlMCK6Rbr8tfmkna0Ix49liyjB8Kra+keDUS+NJ3qAIKpscHZCoF7cLNwwLoKfa1Dq7j
	Tt0FzPV32BAlobhD6l/d2STSm27K05T1AOwumHBxVV3ZsZH758NXHT/PbhOCWthBTieC
	Z9fX0/mRWakAZvKPkslEV/GZYNiEGJjbdkt8+R5tMZKmgvPFGWSXcgSICBb0wkR9ivV5
	kHd6bIACsezyha2Wu1/U/kEvHnbz6dFSwmJFyBsG5alOgwpVfZAziFi6YiEiY5xVhrOg
	CSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7GEUDUHPRxeKbfcDJC3tqMRpGfVPFgTyVtPUPObb5Gs=;
	b=aG9dPH5HpLswBJdtHTgOeb6p+dY3QK4xptiuKMpB3DjPeFn32YVKL5nUKPO/I+zmsc
	pnJ5a1JFTHIEH5ySBVxcZfpDMfCbHvluCRYMrAg3bN4xvZrRHBkpDAE3kybajX+Mw77F
	4Cyx93NqAvMu9LDdjhScqvTmrMD5fyg1CvPHJwL3ohhltO88/+wlKLuptYlgURDkcvos
	xUjsTAx3g0avYv+PY7D19G73ZVtsqKFO1/WG0FqF1XV5lOBMIAVTHa3CHvksqmfVSMh7
	giTMj8EZqq1GRofEZm3WDZcTIEAGs5Y6E6Xc0BIgOmxarMmbaUk3kWr6GVImAUS8M7mo
	KQPQ==
X-Gm-Message-State: AFeK/H19BxSL8c9Z3IjkxucFbe2uyC5w8H0GKupEW9laSvjcnR84Bu7Shjifxz3Nl8wVwfORXdG0kKfmfwCXiQ==
X-Received: by 10.28.47.205 with SMTP id v196mr1049857wmv.20.1490838278531;
	Wed, 29 Mar 2017 18:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Wed, 29 Mar 2017 18:44:38 -0700 (PDT)
In-Reply-To: <1490789493.18519.18.camel@codethink.co.uk>
References: <1490789493.18519.18.camel@codethink.co.uk>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 Mar 2017 18:44:38 -0700
Message-ID: <CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
To: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Thu, 30 Mar 2017 01:44:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 29, 2017 at 5:11 AM, Tristan Van Berkom
<tristan.vanberkom@codethink.co.uk> wrote:
> This is already filed in the appropriate bugzilla:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=11240
>
> Just notifying the list as the custom goes...
>
> libjpeg-turbo in recipes-graphics has an unconditional dependency on
> nasm-native, which is intel specific and wont be provided on non intel
> arches.
>
> Attaching a patch which fixes this by only requiring nasm-native when
> targeting intel architectures.

Even with this patch, trying to build for an x86 target on an aarch64
host will still fail, right?

> Cheers,
>     -Tristan
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

