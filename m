Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9BAC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:49:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.34769.1742806179593676329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RCMUs7OB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so41289365e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742806178; x=1743410978; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1lEDmkfJTI9aTFbbYkEcqQBh4+kBJ0y/6k/Lj/gjLU=;
        b=RCMUs7OBkTGz/BlerTtCwcNxLtPQKfcIbxc0Ofs4GtAbhweo47wWnV2RvfJsGcNizn
         EPDpEYeZhGoAHDmbdsPWN/KReemsGPJ4w4mN0EG5452C1O+/wl+9io4kyCYuWbS3OVp0
         P8/yFWBkndvV1exhEGUwuUdw05Fr/MEOdwj9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806178; x=1743410978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i1lEDmkfJTI9aTFbbYkEcqQBh4+kBJ0y/6k/Lj/gjLU=;
        b=ggl6gOTd2KJxv4iZranTC3N9Pa9u6H6DUI6a8apIt8el05WXHFA2YegS+m60JqQHVp
         6WLvQ04LFwW6aUGJKk30qRUZycnczsubf4Izu1mmGjH2+Zpoc+Y7L6B0ofbqK09Hi51O
         sffc/nN71ViB9+c1VTNuGnoh/LU45FtsVM51m3q9nw7eg+c++ihhrobMDQ2ccPkqsCA2
         O2GCUHD1d1m1R66L+SrdxwD/yQg4RDgQV2rRhk4MtTq+WzoyGqE91Q7Z3fT9eXqSZbHk
         JepMEWeTjJW0D4ayruJ3hlkxw/UxYmm0TaU0HbBAALic81hjB+4ChqaVuO7bOg3H0oqi
         gfkw==
X-Forwarded-Encrypted: i=1; AJvYcCWaTd382P7CwfzsdYSWZ45cnMqeY3Hzgm08y98CVk3y+gLT7GJxk6p2IWuZNtNwDaxEheogwXgmn49rPp1PcmqYpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqkZzwtoZR0kwwujg/CLSCaMfyOQB1hgWp3pwzXYl8fpJ9ZYjz
	YpiWfhsV/xp0LS70m5Vm4jMu+BdHcYRPxSEXoH4hLo1C5EY2I4b/7Aqtovajkh8=
X-Gm-Gg: ASbGncv9O3/Qln2ftzc1D8E93YP8w2hZbgqFrLRc7rCDilVTTSsfUL2ufVEi6oHhLCV
	BJRsD7/BHr34RAhN7q48A+TGCUBMhlVAF8GdKwzwgOCIDrqGZAJvrEVdXsPU+p1dYZU2O19fgoc
	jaUG91V5mUsfaSaLdjDyNt70Bkla0YqG9+tKCryg0gSy9NZoPUIg6QHK6Mpdf4QCcoYTXa4RKT1
	cxv7pv1nrQp1Iggh/8XeoBjRfzDaiAobzTGUO9m0BeZA1bo/LGPpMeI3RKpQKFm6h8vwU7XTNS3
	P4kOUtrtwHOB2g+alcoa1Wlqq+OnvG0GY9uoSOBss9pkuzTvcZ9B1vzhrfQOtFgGjFcrFpgb7iT
	jT7Pzq7tAZxwuXY/yf9gbEWP3p/llQJM=
X-Google-Smtp-Source: AGHT+IGs/nMpAS7QNBIgdJbKxZPFk3ldFIGhMvsAmukj3vQ+LpzpvzIaTtXYKZQGpX8nufWvZkTxiw==
X-Received: by 2002:a05:600c:4ec7:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43d50a35fb0mr77418255e9.26.1742806177906;
        Mon, 24 Mar 2025 01:49:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24f9:315d:dc7:9e14? ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fceafb7sm116063945e9.1.2025.03.24.01.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:49:37 -0700 (PDT)
Message-ID: <69cb191f942678d2d23d95965b076f9d88a5de24.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2025 08:49:36 +0000
In-Reply-To: <Z-ENC7b_-K6L6tV5@nuoska>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
	 <20250321132517.670372-2-mikko.rapeli@linaro.org>
	 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
	 <182FACA25EBBEBE7.22661@lists.openembedded.org> <Z-ENC7b_-K6L6tV5@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213515

On Mon, 2025-03-24 at 09:43 +0200, Mikko Rapeli wrote:
> On Mon, Mar 24, 2025 at 09:29:48AM +0200, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > Hi,
> >=20
> > On Sun, Mar 23, 2025 at 10:53:59AM +0000, Richard Purdie wrote:
> > > On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via lists.openembedde=
d.org wrote:
> > > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > > and in u-boot. Boot without "efi" in systemd works with
> > > > EFI protocols but for example efivars is not mounted at
> > > > all so various checks fail in userspace. Fix these by
> > > > enabling "efi" support if it's in MACHINE_FEATURES.
> > > > Fixes efivars mount to /sys/firmware/efi/efivars etc.
> > > >=20
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > > =C2=A0meta/recipes-core/systemd/systemd_257.3.bb | 1 +
> > > > =C2=A01 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/reci=
pes-core/systemd/systemd_257.3.bb
> > > > index 64fb8fe69a..9bc4532021 100644
> > > > --- a/meta/recipes-core/systemd/systemd_257.3.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_257.3.bb
> > > > @@ -69,6 +69,7 @@ PAM_PLUGINS =3D " \
> > > > =C2=A0
> > > > =C2=A0PACKAGECONFIG ??=3D " \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl=
 audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d=
)} \
> > > > +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d=
)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'm=
inidebuginfo', 'coredump elfutils', '', d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'w=
ifi', 'rfkill', '', d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'xkbcommon', '', d)} \
> > >=20
> > > This makes the systemd recipe machine specific which isn't currently =
the case.
> >=20
> > Can we enable "efi" in DISTRO_FEATURES by default?
> >=20
> > That would solve the issue without checking MACHINE_FEATURES in systemd=
 recipe.
>=20
> Or we just enable "efi" support in systemd by default, or bind it to the =
new
> "systemd-initramfs" DISTRO_FEATURE.
>=20
> systemd in initrd doesn't work if the EFI ESP partition isn't mounted
> and for that the 'efi' support needs to be enabled.

I suspect enabling it by default might be the simpler solution.

Cheers,

Richard


