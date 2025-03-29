Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CADC36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 14:03:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11302.1743256979308274866
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 07:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0JO/11f;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so16523585e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743256978; x=1743861778; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7cVw2db+XM3pWriZ00YbkNZBaVem7QJp9VOwYccCylY=;
        b=O0JO/11fX7Ziy3uNZRTdFBqO9N5Zi6sCXrYB9b89ERBAOv2RvMWO2wGu4qjgnDOk6p
         j6Kf6wa9LTNNTUBdvUxQ8t5ZNrvYv/v/aMC5RFfNpjAgbhFTAgtHC4FNZucqK1h3w1ZW
         DreUUiKnHhInt+k8VHNuTZon+PMmJVJJ9Tsh/DhWScV/9xvIq/XsI8MUcXVdAk3d3wVk
         vBsn80JM1d20Z8M0vQ6IQh+x2s0Yo9UH9r22f0dfTlWn61i+eg2VbUx74YQi00aUxIja
         Hzxv6fBrjRleSe6z07CY2cWJa8S4+vjP9ubWfTiyMGxuu9PEmzrcNRu368T/3Cqg+5xE
         W2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743256978; x=1743861778;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cVw2db+XM3pWriZ00YbkNZBaVem7QJp9VOwYccCylY=;
        b=wBj76Cqfh4r1nAOUb3g55EeuDGaNuMR+TNJV0ZRGIB8RQd1WZMUFtDQ2MMxKtZTb2u
         x2dRdMuD8PYvoHZchABgGV+vIcqB+SN1nvyM2Bk/BDg/vQyvUyEC8fNg89E5VL/Ffloc
         MddWYxm8xKh5Y/Mh9nmnQJo6XEZhqIgWKpgcjAKamQzGcNYCcwLluPbl4a1np9WEj9NX
         uyVqyxrX9ZMs+5jCWVBiVduFejPlXLhckgSipGrhIKCgyIymSLLQ2k2pjvRu/k59dO1w
         MGKSPEkcmLjtlltgQrzXcUwduWQihPSnxVjs9k6rCB2GmYIbrZ5qLbXMZtEaXbh0DpX7
         1eIw==
X-Forwarded-Encrypted: i=1; AJvYcCWIsQUc5gH0sb56gXSp+5nXlYbg38QRUs2l2ve5CrqO0YGzDDbLKrMCQqDCg0b1rgbFa5uPIG1VqA4DzpTgmrfT9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNLU3iacrWhAfLMsLAQ7rmc/01WdP219THBU/ORWrO1u0zwWs2
	o9nXAmUWtw18fr9/WOS7z6B3xc1o8Mipsv4RcsTe4xCPXs5bh8/v
X-Gm-Gg: ASbGncu1MHr4Sye0dUI7kSF7yLKmb6l9ttaWIub1FbBFxUVpltDzNHpjyXSCrSTu302
	a/raDf6dVvJZWdjKwEQ3ye3tXMbCSe3BH/JfDkQdnNSM3J4Gm7MJOY4NDjJzCjjcsWb7NfMNVTj
	g5JhX67AbYEO2Ui+9b2eSqkyP2ih0WgT4kcaw0qL4ga6kKxfJPhnQxpwbhqC7r1NGsiv7LVzXdz
	kOb4me0sl51i4joh4Ap9hM2yeODdwt9zMg+wNqsVl4T0dOZ3rtgW5q+oXYhooMG0pgGB6t/uKjW
	TT0YCA9r0J/5I0tqjQAL6323zJOIUEKNfUicbVhqy/Dt4BvM550B/3WlD8sw1UCllnSngLov5iR
	DM9vmYP5RAhndQzN+Tg==
X-Google-Smtp-Source: AGHT+IEAF1SASmNPcBwBhx9poc0imyY9RyBBZ12SHzLy4U8EZm9bxUEEwoybvEzVO9r0OmLeE2mYCg==
X-Received: by 2002:a05:600c:384d:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43db62bd0a5mr24015585e9.19.1743256977360;
        Sat, 29 Mar 2025 07:02:57 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbbfeaasm62932595e9.9.2025.03.29.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:02:56 -0700 (PDT)
Message-ID: <bd99e47f7600f91dd2eca63437fe0b03b7c385a2.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/6] default-providers: Add
 VIRTUAL-RUNTIME_dbus variable
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Sat, 29 Mar 2025 15:02:55 +0100
In-Reply-To: <20250328150136.1855862-1-niko.mauno@vaisala.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 14:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213878

Hi Niko

Thank you for the patch. It would be nice to have an easy way to switch
to dbus-broker.

On Fri, 2025-03-28 at 15:01 +0000, Niko Mauno via
lists.openembedded.org wrote:
> The purpose of the new variable is to facilitate oe-core users who
> wish
> to use an alternative runtime D-Bus implementation instead of the
> default Freedesktop.org's dbus, such as dbus-broker, a recipe for
> which
> is currently available under
> meta-openembedded/meta-oe/recipes-core/dbus/
>=20
> While introducing this facilitation the intent is to preserve the
> existing functionality, while allowing the user to optionally select
> an
> alternative runtime D-Bus implementation by adding the following line
> e.g. to local.conf file:
>=20
> =C2=A0 VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

Introducing a VIRTUAL-RUNTIME_dbus variable would work. But it requires
to change all dbus related recipes which are not only in oe-core.

I'm wondering if using a PREFERRED_RPROVIDER would simplify this.
https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-PREFERRED_=
RPROVIDER

This would probably allow a back and forward compatible implementation
with changing only the dbus-broker and maybe the dbus recipes plus
adding something like
  PREFERRED_RPROVIDER_dbus ?=3D "dbus"
or
  PREFERRED_RPROVIDER_virtual-dbus ?=3D "dbus"
to OE-core.

Regards,
Adrian

>=20
> As a background, for example the Fedora distribution uses dbus-broker
> instead of Freedesktop.org's D-Bus implementation. The following
> excerpts from
> https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplemen=
tation
> provide background for their technological decision
>=20
> =C2=A0 This change provides a more scalable and more reliable
> implementation in place of the reference implementation.
> =C2=A0 The reference implementation suffers from long-standing issues
> including potential dead-locks and susceptibility to denial of
> service attacks, which the replacement implementation does not.
>=20
> and
>=20
> =C2=A0 No visible changes in behavior are expected, except for different
> log messages.
> =C2=A0 Any visibly different behavior to `dbus-daemon` should be reported
> as a regression.
> =C2=A0 Ideally, this change should only improve the performance and
> security of the message bus.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> =C2=A0meta/conf/distro/include/default-providers.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc
> b/meta/conf/distro/include/default-providers.inc
> index d3eefb754b..cebd0400f4 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
> =C2=A0VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
> =C2=A0VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
> =C2=A0VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> +VIRTUAL-RUNTIME_dbus ?=3D "dbus"
> =C2=A0
> =C2=A0#
> =C2=A0# Default recipe providers
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213847):
> https://lists.openembedded.org/g/openembedded-core/message/213847
> Mute This Topic: https://lists.openembedded.org/mt/111955697/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


