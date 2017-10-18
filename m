Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 255C67833C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 07:02:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so7858448wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 00:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0lyFwUzrLXTnSlXpvI2uYOsphmX9mtCmndvZ/6qkIbk=;
	b=rMARIxaOC3Q0ZZ2+S4ZwJDoVWDxTLO3CeUkf94ZjssEuPkS6gClsjOfuBalXuhMz8K
	GpgC3/Ad4/ahWUVikmmJFibQhy1Ru3SOX9R8pkj/rcjmweByD8ToTq0IgGFkGPus1qG/
	b/a6Z4XBr+m/S7iEWS3Cz3Yqo7cKWzWzoSZD22Dolvr/V6lwEE98r3bNMsZFm8C+lLdb
	bAsd/XqQGbmPWojm0n+USatGOihcUvJRUD3Uc5T7+ExphMUgJy0w+JTieJ/rXaeINbJq
	IyUMw3bMl61xryjoRev575JOKje/8By6fXciC5BeBxg8Ai1NcLsB+ecVl1eJcs2ZN8x5
	vrDw==
X-Gm-Message-State: AMCzsaUJbPCRKeMbVs4Yr1/NZy6QGdobBUu+X3+TCYdTHIOQZpA+T1yx
	6VNlULPWY0vmjPSLEkcwDPVD7fWA
X-Google-Smtp-Source: AOwi7QCSrERaT6cfcDOODV6/ku+y2B3rHsulYoERGrKZaiAOkR+zfLwsLo+XeWGNA0DbFbeaZ+sy6A==
X-Received: by 10.80.163.101 with SMTP id 92mr19948429edn.100.1508310161626;
	Wed, 18 Oct 2017 00:02:41 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w49sm9301447edb.13.2017.10.18.00.02.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 00:02:41 -0700 (PDT)
Message-ID: <1508310160.20275.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 08:02:40 +0100
In-Reply-To: <20171017165424.22887-1-thomas.perrot@tupi.fr>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 18 Oct 2017 07:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-10-17 at 18:54 +0200, Thomas Perrot wrote:
> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its
> - Ignore fitImage type during the packaging of the initramfs
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass | 6 +++++-
>  meta/classes/kernel.bbclass          | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 2630b47316..abbc309b09 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,8 +7,11 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>  
> -        if d.getVar("UBOOT_ARCH") == "x86":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"

I can't see this in master - it should go there first.

Cheers,
Andre'


