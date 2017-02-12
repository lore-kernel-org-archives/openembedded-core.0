Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69C0A7016E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 14:52:12 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v186so141431911wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yxd+xPwu+NIleyyonx2Z+MFSvH9INGEQOs6vxXbcljs=;
	b=0YJy7qUutEe7f1t6313X5sspXhQWR8F4JvrufV3wElcm5ar1rMZ3ar4nBbLSID0hnE
	QWvKYygPaIQb+5I8Pfh4H5D2xJhQcDe+UerevKPSGtGu9Uoz+/dmE4Vx/v/tASocMYdE
	IE9O6+H47wRNbzSxW/zcUmMtzjna+npy0nJW4plXwzrEopo8LfxPDDZcSlTfDH35A+vT
	OtePjzye2i1Q9z2OVwmuKxXc5CUlLkdrJ4hxIe/PfadYKEubXX58S+dTWewFQxKog5i8
	IUgWsW6BYIzDZkzuJjDSC6fYMTzp+bV6AnY7up/VMk8OtATyXaDckr7mUbfChBxPzhOs
	fgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yxd+xPwu+NIleyyonx2Z+MFSvH9INGEQOs6vxXbcljs=;
	b=koTAf4vLW2wkvPtTlE0oJeAwX7neYfC84K6XFe3+elCdY03EHceEcrt+X+j79TNi8J
	Ovm3Uy0QON/7Y8DjHBI4UBBbe21SDSsx8f8CvicGI9P7G8rOqX/Ev38KK9ZiFMowekH+
	/PxgOf/wP86kc3Cm7KRwFE/CpXoiXp7anSRC+ZHbI39KXnH19LeKe5uLh++OZJ2KP86e
	oQSjZT2oqPCq8Sl6Z2qQ7oORAYhrSGx5aPRQoWrYELOIdZp2bZ91yS+6Ywe+wBG4aUGY
	RHtkdMp9wK+dizb9ELurzg9ooaF/yvKQU/cPAd6Ei4UEYRUjesViGcAvBjy0TTeTqWbI
	sDdA==
X-Gm-Message-State: AMke39kCwoNxV0fnBVZtgYUDhIVjL+Gvn8A1c5/XlbvDfNdv0c8VaPlSbc5I3hYZ990GKIAZFNgpMbN8B17rlw==
X-Received: by 10.28.212.82 with SMTP id l79mr33475956wmg.101.1486911132925;
	Sun, 12 Feb 2017 06:52:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.52.78 with HTTP; Sun, 12 Feb 2017 06:51:52 -0800 (PST)
In-Reply-To: <20170207042405.22707-1-raj.khem@gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Sun, 12 Feb 2017 15:51:52 +0100
Message-ID: <CAD4b0_+pve4e2Cipv9x9orwqoA0HxPOwF6NNL_kLJB=XHX0tYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Sun, 12 Feb 2017 14:52:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2017 at 5:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This is converging the recipes for go from
> meta-virtualization and oe-meta-go
>
> Add recipes for go 1.7
>
> go.bbclass is added to ease out writing
> recipes for go packages

I took these for a spin with current mender tree. Mender is somewhat
interesting as we build binaries for the target (Mender client) and
some extra tools for the host (mender-artifact tool). I was able to
build the client code successfully. I ran into some problems with
mender-artifact-native.

The native build problem stems from the fact that there's a single
go-native recipe, currently supporting only Go 1.4. Ideally
mender-artifact code could be built under Go 1.7 and newer with no
problem, 1.4 not so much. We already set PREFERRED_VERSION for both go
and go-native to 1.7% so bitbake proceeds with the build and logs:
  NOTE: preferred version 1.7 of go-native not available (for item go-native)
  NOTE: versions of go-native available: 1.4.3

However, in order to build a native Go 1.7 toolchain we would still
need to build Go 1.4. The limitation comes directly from the way Go is
built. You to have the so called 'bootstrap' Go (v1.4.2) in order to
build Go >= 1.5. Thus we end up in a situation where both
go-native_1.4 and go-native_1.7 would need to be built.

I don't know how make both go-native recipes build and depend on
another. Maybe someone with more Bitbake kung-fu can step in and
propose a method. In oe-meta-go this is fixed in somewhat trivial
manner. Namely, there's a go-bootstrap recipe
https://github.com/mem/oe-meta-go/tree/master/recipes-devtools/go With
this all 'usable' Go toolchains depend on go-bootstrap-native.

-- 
Maciej Borzecki
RnDity

