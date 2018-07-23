Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0107360269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:31:51 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id n84-v6so209858oib.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w06X47mvzvdZ8+AaiRaXyykC9mJhWeub2ojLfSW21N8=;
	b=mcmrCvRuh+hwaRZpvR8m03/POC3vrIEB1FJTqvZWLndHh9Lrviek4Fx04f8gcNTlhi
	XsPwlTO0vRo5aRf14oPo0x2GQKVGLtqbiWO0IbETNq4spK0dXJHnkdXddj/bQkER4NEN
	CeYIXTu6JICDFrZ+onQAPFxdHsp4DXf8lHn2i4lhjxoq0nOJ/g/fyeXjKXL4VZJa8YRs
	Bjc1AOL/StPF6YSI2SSEUSzpQ/j5h36cU0Z1BdDTS4a6fR5Sjn1f6gm/TU8J2/2d076x
	cAWCePZcaTGfjx3G7FYFVHkzeG99PN6bd5JR+ztApqXzfhrUuW9PuqPDGxC2fj/Aox6p
	3x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w06X47mvzvdZ8+AaiRaXyykC9mJhWeub2ojLfSW21N8=;
	b=kpNVib3XQOh6tMRtPijQZ7JMXlKqR+Vqp/BjW41To3DojetkBsMEyBB8oBmRc2lDEF
	l2Th1m006WPZU5k+D78BNKsNj9kFRZpb7ixRlrLhJ8MoMsJwa6n57HA0jZh+akqRO7BV
	OVftUfRYTDpBbfG/yeNkuw+ojwxvavp0IN1PFYzcOeC2kbz7uz2RS1mKmGdfd5QSiXgN
	Q4e5f/F/tp3eYzQY0iiAiVSfofvAeKJdjpT8q8vJuufx4mPGV2AlVPDQZySqyB4eCvwg
	5Wulz3cGcp3YpreWMCz4n74MQfbKK//1rbOVsfefGHwDQWPSFpIBh4coRGdjGMb+mVdR
	XskQ==
X-Gm-Message-State: AOUpUlGIKdUYUiihZRG8J9IOajz0y9Hoz75mPf4nYOg5TwBA/tKeods7
	Ko75keE2J2ZO+t/4javqGiMgB1mepCWup1ZshzBehQ==
X-Google-Smtp-Source: AAOMgpcVBwxvLR2GneAgnqVDBVRZoE3jL/znDtXDIQ3uoH0TWX7CT7v32PDLOXmtwevEoL60ATRJ+kg7U0+7eh1rI34=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr7301721oif.235.1532341912981; 
	Mon, 23 Jul 2018 03:31:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 03:31:32
	-0700 (PDT)
In-Reply-To: <20180721162715.12611-3-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2018 11:31:32 +0100
Message-ID: <CAJTo0LaofRc4ifkmj84YBk0iQZ6K=YSX1+QPSYAcwZJFh1aKxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Mon, 23 Jul 2018 10:31:52 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 July 2018 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> @@ -29,6 +30,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
>                  --enable-pthreads \
>                  --enable-sdl-dlopen \
>                  --disable-rpath \
> +                --disable-wayland-shared \

This isn't explained in the commit log.

Ross

