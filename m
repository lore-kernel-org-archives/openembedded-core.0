Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3E8C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 08:37:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3619.1744187866363810008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 01:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FaVuBGj/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso69270915e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744187864; x=1744792664; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l6FLUKkNsMWbmgc5qVjWVY4bPjyN800+JnRT+P1cII4=;
        b=FaVuBGj/ywDo30sj4MKMKHsVqNO1brwUPUHM+kLND8Tid1OmImRrp5wdoWw82dcRlY
         RFY0vBPXsr1k8jReapv+TRysLrTsWLNTX4HdPq+i3iFibKAp/kalwtivLqzzImziu+14
         5yglL7VUTKxHQacdcPJWwI+kaM8EBqsBmBCvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187864; x=1744792664;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6FLUKkNsMWbmgc5qVjWVY4bPjyN800+JnRT+P1cII4=;
        b=uFdFrzj6nz823nP15FJc3pg5Kak/SYwcDb9AHJrdvoU5zPyfkowOG0JSALsFEfW+xl
         plKuyCpkIJ1u3mDoB1GInwm6UOpibGY9y+NkgnjR8pfXghBSfnv5LyJjWU9EYZ3RlPpT
         o3bHvahuqP8pnOcIN/9OAJF1P4QGJDKGxwkOeAXhq9e7EJJC++Vm1YbXe1XqVJJJ+cOG
         Vyprf1zVT90QwCVBU+C2EBLoTqJVuJ970fgPn/UKudMxRbcDOblLg4PMVpQFc1JbpkRk
         WabDoAvy9yJsUIaje/XtuBCPxqVgDtxahq5yrAtgKgcNpBzdUs8kKJHhF1VSaEsfTkbb
         ZQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXPIAE67RAC0XrVmwi5IXo6rEsbTIcVYpb2mJ66bSsuARYT6W/V9baKa44UvIIVD84K/+4bhNtRMfX4001fQ3vpEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yynb6HyCEqbrKB355MS0XiKNeh9etGiyabflmabaws2dGIIiORy
	aY9I5XHAjc8RiB6AI9B9IsvQVAVzA2HNAfFpmA7G+B/eDFoQlzhfi9/wBCPN3nk=
X-Gm-Gg: ASbGncv4nInPHEzTzcK+fim7+lih0aLzOhBqg8Y3MweY3X/ebTNu9FEw32o2+ivP8T4
	dNcyCImV5476gpH5HvRXI9ca1lIGf7SSTqCJHyYietsttzI8p7iv04TKShG1gYaVZlwA3GhJlev
	gQnsFs5t8AEkSsfAsSJyhELhQDlYLmulhBrUeawXoGj0he9glPdkjimEc9Z4X9vzRiwOkP+R5yt
	5/DJnRCkanYMjHz9YkZxE4j2yUeGA7bphW0goA1yeDAverAq4cOPBn609Ydh3EzDHOfa7ftXEbi
	MPZwjDFzlho7cM8v+suySkHTHlEn9e1PSqGtIs8+2E+or+Lcgtj2lwk5EL5pM4A0DK/5t2Vtyz5
	PaMdwBPVLlbh1hgRBVQGjAXHrVCEUzA==
X-Google-Smtp-Source: AGHT+IGi7JhBQ5VcB7CNo6nHpMlcxYYhbc56lmiKRz72k6z0PrBCIbtQPx5NsbYqQf51BxFTmKGMig==
X-Received: by 2002:a05:600c:19cf:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43f1ed70e01mr15825075e9.29.1744187864575;
        Wed, 09 Apr 2025 01:37:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19? ([2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207aeaccsm12272065e9.33.2025.04.09.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:37:43 -0700 (PDT)
Message-ID: <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug
 devices
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jeroen@myspectrum.nl, openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Date: Wed, 09 Apr 2025 09:37:42 +0100
In-Reply-To: <20250407174904.1191173-1-jeroen@myspectrum.nl>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 08:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214577

On Mon, 2025-04-07 at 19:49 +0200, Jeroen Hofstee via lists.openembedded.or=
g wrote:
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>=20
> Commit 160f713917 (udev-extraconf: fix network.sh script did not
> configure hotplugged interfaces, 2024-10-18) fixed ifupdown for
> hotplug devices, but also calls it for non hotplug devices. That
> can cause issue, since they might not expect the ifupdown from
> udev, since it wasn't called before mentioned patch got merged.
>=20
> For util-linux this can simply be fixed by adding --allow=3Dhotplug.
> Unfortunately busybox doesn't have that option, so a function is
> added to check if the device is marked as allow-hotplug.
>=20
> Since wilcards are supported adding 'allow-hotplug *' allows to
> restore behaviour of mentioned patch, while this restores the
> original behaviour.
>=20
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> ---
> =C2=A0.../udev/udev-extraconf/network.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
> =C2=A01 file changed, 28 insertions(+)
>=20
> diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/reci=
pes-core/udev/udev-extraconf/network.sh
> index 500e60ae61..da79f00d5a 100644
> --- a/meta/recipes-core/udev/udev-extraconf/network.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/network.sh
> @@ -6,6 +6,34 @@ echo "$INTERFACE" | grep -q wifi && exit 0
> =C2=A0# udevd does clearenv(). Export shell PATH to children.
> =C2=A0export PATH
> =C2=A0
> +# udev should only trigger ifupdown for interfaces marked as allow-hotpl=
ug
> +# and with util-linux that is as simple as adding --allow=3Dhotplug.
> +# Busybox unfortunately doesn't have this option.
> +# allow-hotplug is a pattern like eth0 /eth* /eth*/1 /eth*=3Deth.
> +# This function checks if INTERFACE matches an allow-hotplug pattern.
> +
> +allow_hotplug() {
> +=C2=A0=C2=A0=C2=A0 allow_hotplug=3D"$(sed -n -e 's/^allow-hotplug \+\([^=
=3D ]*\).*/\1/p' /etc/network/interfaces)"
> +=C2=A0=C2=A0=C2=A0 for pattern in $allow_hotplug; do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 options=3D"$(echo $pattern | =
sed -n -e 's,^/\?[^ /]\+/\(.*\),\1,p')"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value=3D"$(echo $pattern | se=
d -n -e 's,^/\?\([^ /]\+\).*,\1,p')"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interfaces=3D"$(ls -d /sys/cl=
ass/net/$value 2>/dev/null | xargs -r -n 1 basename)"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$options" !=3D "" ]; th=
en
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inter=
faces=3D"$(echo $interfaces | awk -v n=3D$options '{print $n }')"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "$interfaces" | grep -w =
-q "$INTERFACE"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $? -eq 0 ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n 0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0 done
> +
> +=C2=A0=C2=A0=C2=A0 return 1
> +}
> +
> +if ! allow_hotplug; then
> +=C2=A0=C2=A0=C2=A0 exit 0
> +fi
> +
> =C2=A0# if this interface has an entry in /etc/network/interfaces, let if=
updown
> =C2=A0# handle it
> =C2=A0if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
>=20

Firstly thanks for the patch, we should try and fix issues like this. I
feel I should mention our code comes from a backdrop of resource
constrained devices and the above code makes me cringe a bit due to the
execution overhead of it.

We've purposefully kept the code called from udev and in our
initscripts relatively minimal/simple as the overhead of executing
multiple programs does build up over time. Taking the above, we have
loops, then pipelines, each of which runs more commands. Each command
has a fork/exec overhead.

Is there some way we can simplify this rather than all the shell
pipelines and loops?

Cheers,

Richard




