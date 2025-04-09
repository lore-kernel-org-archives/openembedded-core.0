Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FF6C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:28:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4272.1744190871577626292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hyjQgT6g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so37627535e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744190870; x=1744795670; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FWj8ux+WdZ0kuwpzmf62RoauR5s+oYtflXXGBB7FVmQ=;
        b=hyjQgT6g6oa9cSnxSDEjYotKWbtnVYzHgJAhavVzFm4HDI93btFYbcYrW7LVod5rHO
         rwlAG0mwYLGHhWOFsfuL6XpmEGfT7/H01GqhEAtWueF8ZolFEfNQhPoDQiUaQnLHUFAl
         7Hw8GIidVYSJKg/IFPtdCFaUUx2iNdvfnf/R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190870; x=1744795670;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWj8ux+WdZ0kuwpzmf62RoauR5s+oYtflXXGBB7FVmQ=;
        b=GVs1A77gUoFCXAqCh10BxilJzVWXJ0vZtBVA2xg/qx+u9RhWd4OsmV+9+j147ewmHD
         bHuHlBzWtdFUFwP6RMSKAAlIWSR2qbps7iEBN0FAzIVBPr6lsKeuw107dnduILcKZMG7
         arR+MS7FpuFXa5dIJ1XeV+e8a5VlwvhVlh9nLiKNTXPjQWT5aWhFTF4criH6TrrrFf4m
         fKA9IQlkV34LBSQYlPBSBE4YZzDIhUmU9OwWo7qrhF4JVW9bdjPX1gKzVuM1rvbJj69C
         +g+Aq/MkT7rH+alR4/SXn2hGmUYyyGHoZ3nMLRFLyoLt0mEINb206+PGxHgDiFM1AnW4
         quPw==
X-Forwarded-Encrypted: i=1; AJvYcCXNCt1SUSP4ln1INM0nQax3G4wVI8WfFmbCe9Q/g8sfIeqFu3AY4TBtZslEkCzRKeCPOWU4DFlw/kWxCtMux2wrrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOD6DgRo2L4dTq9LKId12LrDFXzuxvJQTOz77W/ivUF1xcDr+L
	UAAGRpBtbjqR5t5sggC0PKjSqrRgJ0GftM7qw7mbMx2YbkuexnPbJ+yARA05/BQ=
X-Gm-Gg: ASbGncs/vB/OqOFci5FY6H8oKaus0uar5W2RuBijP0fH5jZyMGsJFFF9ATmJrZVKriJ
	zaIqCZFhS++jbDkjH/09PmSK5VR+i6C1/dDGVBaTuo6l/v+3fHONBhdNFEWuJ9ENPyd+zpto9Mt
	5JOdNdwaGKcNROthp/joWtGjhNWGF6J1Bfl2/pFJC3QfJJJe8+OQFv0ll2j1xxipq44v3sQQCUA
	R7mqXeAznFcdWpo+l80H3XmovccENxmRFVRMegUbkic6V4HJL/UcsjFzwfFuFTPT6CI+TUxilfm
	9U3cekQRCDNoaOqNW5qdMsmU+a0Fdz+3+OpYUTrUAQXN/VaIEf5tSkcj/b1sJ9jUWCJ1nqWr+Y7
	VFc4xDQOar2i1j+x7qCDD2qU8NX7L65cMCDqi4Dwl
X-Google-Smtp-Source: AGHT+IESyuFQoDFkwoG+INldausAwN7PJU1licQsUPoEWMEcDCKIc4jv1jOWL24AN1HQCE3d2amT5A==
X-Received: by 2002:a05:600c:b90:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43f1eae345fmr23887025e9.0.1744190869666;
        Wed, 09 Apr 2025 02:27:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19? ([2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572bb2sm9975895e9.29.2025.04.09.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:27:48 -0700 (PDT)
Message-ID: <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug
 devices
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeroen Hofstee <jeroen@myspectrum.nl>, 
	openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Date: Wed, 09 Apr 2025 10:27:47 +0100
In-Reply-To: <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
	 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
	 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 09:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214580

On Wed, 2025-04-09 at 11:08 +0200, Jeroen Hofstee wrote:
> On 4/9/25 10:37, Richard Purdie wrote:
> > On Mon, 2025-04-07 at 19:49 +0200, Jeroen Hofstee via lists.openembedde=
d.org wrote:
> > =C2=A0From: Jeroen Hofstee <jhofstee@victronenergy.com>
> > >=20
> > > Commit 160f713917 (udev-extraconf: fix network.sh script did not
> > > configure hotplugged interfaces, 2024-10-18) fixed ifupdown for
> > > hotplug devices, but also calls it for non hotplug devices. That
> > > can cause issue, since they might not expect the ifupdown from
> > > udev, since it wasn't called before mentioned patch got merged.
> > >=20
> > > For util-linux this can simply be fixed by adding --allow=3Dhotplug.
> > > Unfortunately busybox doesn't have that option, so a function is
> > > added to check if the device is marked as allow-hotplug.
> > >=20
> > > Since wilcards are supported adding 'allow-hotplug *' allows to
> > > restore behaviour of mentioned patch, while this restores the
> > > original behaviour.
> > >=20
> > > Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> > > ---
> > > =C2=A0.../udev/udev-extraconf/network.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
> > > =C2=A01 file changed, 28 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/=
recipes-core/udev/udev-extraconf/network.sh
> > > index 500e60ae61..da79f00d5a 100644
> > > --- a/meta/recipes-core/udev/udev-extraconf/network.sh
> > > +++ b/meta/recipes-core/udev/udev-extraconf/network.sh
> > > @@ -6,6 +6,34 @@ echo "$INTERFACE" | grep -q wifi && exit 0
> > > =C2=A0# udevd does clearenv(). Export shell PATH to children.
> > > =C2=A0export PATH
> > > =C2=A0
> > > +# udev should only trigger ifupdown for interfaces marked as allow-h=
otplug
> > > +# and with util-linux that is as simple as adding --allow=3Dhotplug.
> > > +# Busybox unfortunately doesn't have this option.
> > > +# allow-hotplug is a pattern like eth0 /eth* /eth*/1 /eth*=3Deth.
> > > +# This function checks if INTERFACE matches an allow-hotplug pattern=
.
> > > +
> > > +allow_hotplug() {
> > > +=C2=A0=C2=A0=C2=A0 allow_hotplug=3D"$(sed -n -e 's/^allow-hotplug \+=
\([^=3D ]*\).*/\1/p' /etc/network/interfaces)"
> > > +=C2=A0=C2=A0=C2=A0 for pattern in $allow_hotplug; do
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 options=3D"$(echo $patter=
n | sed -n -e 's,^/\?[^ /]\+/\(.*\),\1,p')"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value=3D"$(echo $pattern =
| sed -n -e 's,^/\?\([^ /]\+\).*,\1,p')"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interfaces=3D"$(ls -d /sy=
s/class/net/$value 2>/dev/null | xargs -r -n 1 basename)"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$options" !=3D "" ]=
; then
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nterfaces=3D"$(echo $interfaces | awk -v n=3D$options '{print $n }')"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "$interfaces" | grep=
 -w -q "$INTERFACE"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $? -eq 0 ]; then
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn 0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > +=C2=A0=C2=A0=C2=A0 done
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 1
> > > +}
> > > +
> > > +if ! allow_hotplug; then
> > > +=C2=A0=C2=A0=C2=A0 exit 0
> > > +fi
> > > +
> > > =C2=A0# if this interface has an entry in /etc/network/interfaces, le=
t ifupdown
> > > =C2=A0# handle it
> > > =C2=A0if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
> >=20
> > Firstly thanks for the patch, we should try and fix issues like this. I
> > feel I should mention our code comes from a backdrop of resource
> > constrained devices and the above code makes me cringe a bit due to the
> > execution overhead of it.
>
> We are still supporting omap3 / 600MHz, so I understand that. Typically
> there isn't an allow-hotplug entry in /etc/network/interfaces, so it is j=
ust
> running a sed over /etc/network/interfaces which is commonly rather
> small.
>=20
> The loop is only executed if you have allow-hotplug entries.

This code dates from the omap3 era!

You're right, the common case is probably just the sed which isn't so
bad. Seeing blocks of complex code like that is going to make it harder
for me to argue against keeping things simple in future though which
makes me torn on this patch.

> > We've purposefully kept the code called from udev and in our
> > initscripts relatively minimal/simple as the overhead of executing
> > multiple programs does build up over time. Taking the above, we have
> > loops, then pipelines, each of which runs more commands. Each command
> > has a fork/exec overhead.
> >=20
> > Is there some way we can simplify this rather than all the shell
> > pipelines and loops?
>
> The simplest solution is to patch busybox to respect=C2=A0 --allow=3Dhotp=
lug I guess.

Yes, I as wondering about that. I see patches from a long time ago but
I guess they were never merged. It probably is easier for busybox to
handle this rather than shell code but I don't know what chance they'd
have of being merged upstream.

I would probably perfer to fix busybox to support this but I don't know
how well that is going to work out...

Cheers,

Richard

