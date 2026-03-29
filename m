Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56900F3D5FC
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 08:41:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26370.1774773695818646204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 01:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JzFnlFPB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe655187so43931345e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774773694; x=1775378494; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBr6Cc4WSg4/zkm/su43iT4lY6IpyxC+dzihLkmCDVI=;
        b=JzFnlFPBrdp0/KTIhnIvu4XVMfIwxYHeKZBsVJSUQAjvlxoNg6sbKYYbHUO1lL0vHB
         WgNDznR+Dgp7nPCC0KdFeuFSgmR8M2Mijndy+0sC1mfsVrOLGcv3FBzk5Lv2ybcIXUdi
         lxPRNZRF8Ghnlrs/LwREfKFlQ7T16U3czvPlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774773694; x=1775378494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBr6Cc4WSg4/zkm/su43iT4lY6IpyxC+dzihLkmCDVI=;
        b=o/Z+qQwxTQHFiDmwir+0zlyW+ysXr+LteCED3dxvKO25eBmt5SxcGUmGQidpoTcgk8
         cFc7eeYsHzuMAs4lBsDyd/DM3Qhhv2q/3CP9G7kkqxTB/9p8Lb1/ml8RLZVXP4zZglDV
         6PS2OGzQwRcj+c7i4scgISsXjXzopD081hxiwiZwlzjyrahXan6FRveJGoERk+bXIIFD
         rA25IWyesxtXpWayAA/0/Yoc8g3lP12X1lm1S9dYthcWDYqx+80YJjvLfK6oKzjPFqK8
         SBzPdA2jTSY6Uv0CU17mYWnIB4+qcrme43u4oJLsORm43Exfo6KoDtSWlzCgpO1MjJA+
         wr6A==
X-Forwarded-Encrypted: i=1; AJvYcCWYuVneRMVR3SpW1yYFpwxWjJr9B8bTYniUznJNmqvAHjA538YOCAy5b0Fz27krYZEsSYLhOA3jH0GBQvt6jAaIxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwszijbBl42Of/Nfz/huV8F7ms3oauHlOIh4njpq/XW598Iw9yK
	+2xw7HEMBttRpjekivSfWYEw9SHKKsRZrMe56hP1M46BSA5B4GLuXewRjLmsz9QyxQg=
X-Gm-Gg: ATEYQzxLcmjwlbeuICJn2+OakmffU10xtcXGFylku64t8u2y4NPF/JekZ2RBzmDDxAA
	kNFbR3cSRRBfNO9CJC5J2HivvOZhoVd+4m1j7aRUe5nFGyuvXEeTV9PldeAMyvOH/NE/mJORzFe
	Y0GG8esQSB8/+J8gNBJHlfry1CJ1PIVsc3pbI+7D+OmrRMFk4WAVNsSAY+o/iwb6sP6gerY9vOx
	vmqWKtEziTenRu4r4xRTBohu/w60/ObOPu4tkqlez061UWcYn4tOfptqpqc5rO4jCZ5R+ZAF0r8
	ZFz+HVS/ug0y5TIdQSuYR8fMQ69X7qHSkFVwPGkBNAQG6gqFfvU9tGH+Mf/hyRn4xCbtQMV1R9V
	jkVK0My0CAv1eGMH7Vfgfu3EGow85mcpT643WqIyqvtqOv/NElcClAckyolDRUoa49L4eR2m5CQ
	7BwqrtM7F0/Hnc7csAgHPHVkNwr+n4OKNK6HEgdig+tX3oCiddhx8OwAb/5Pp4TBranX7pkZ/XX
	UehVzARZjkPa1bK
X-Received: by 2002:a05:600c:3145:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-48727d4593amr143840785e9.1.1774773693879;
        Sun, 29 Mar 2026 01:41:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a20:25ed:ae3c:7430? ([2001:8b0:aba:5f3c:3a20:25ed:ae3c:7430])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm182457715e9.4.2026.03.29.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 01:41:33 -0700 (PDT)
Message-ID: <1adfc91100b38a8d18ed05a02050764ab88ff831.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] Support opt-out of any default machine
 and distro features
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2026 09:41:31 +0100
In-Reply-To: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
References: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 08:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234140

On Sat, 2026-03-28 at 09:48 +0000, Paul Barker via lists.openembedded.org w=
rote:
> These changes should be applied *after* the corresponding changes are
> applied in meta-yocto [1].
>=20
> [1]:
> https://lore.kernel.org/poky/20260328-default-features-v1-0-549331ccfab0@=
pbarker.dev/T/
>=20
> These changes implement the third proposal from my email on "Improving
> DISTRO_FEATURES backfill & opt-out" [2]:
>=20
> =C2=A0=C2=A0 Merge the current contents of `DISTRO_FEATURES_BACKFILL` int=
o
> =C2=A0=C2=A0 `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to=
 disable
> =C2=A0=C2=A0 any items listed in `DISTRO_FEATURES_OPTOUT` before use, eff=
iciently
> =C2=A0=C2=A0 and without the use of `:remove`. Deprecate
> =C2=A0=C2=A0 `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CON=
SIDERED`,
> =C2=A0=C2=A0 issuing warnings if either is used.
>=20
> [2]:
> https://lists.openembedded.org/g/openembedded-architecture/topic/improvin=
g_distro_features/118009864
>=20
> DISTRO_FEATURES_DEFAULT is now set from DISTRO_FEATURES_DEFAULT_RAW,
> excluding entries listed in DISTRO_FEATURES_OPTED_OUT. _OPTED_OUT was
> chosen over _OPTOUT for improved clarity.
>=20
> This series doesn't include issuing warnings if
> DISTRO_FEATURES_BACKFILL
> or DISTRO_FEATURES_BACKFILL_CONSIDERED is set, that can be added as a
> follow up if these changes are accepted.
>=20
> The change is also carried through to MACHINE_FEATURES to keep things
> consistent.

Thanks for putting this together. I really don't like "DEAULT_RAW" as a
variable name, we're trying to get away from unclear concepts and I
think adding 'raw' into the mix may cause more confusion that it helps
solve :/. I'd probably have gone with OPTEDOUT or OPTOUT instead but I
know others would argue that differently too.

I did notice some changes like:

-DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
+DISTRO_FEATURES_OPTED_OUT:append =3D "ldconfig"

and was a bit worried we were having to force append operator use? Was
that necessary for ordering reasons or did +=3D work? I spent a lot of
time trying to make sure the previous code worked with +=3D as it was
catching people out and I'm a bit worried this regresses.

Perhaps most problematically, I noticed this preserves the _DEFAULT
variable and behaviour. This wasn't really what I was expecting. I can
understand why you've done it but I'm worried it builds up more legacy
and makes the code harder to understand. Personally, I'm becoming more
in favour of just making the change and letting people adapt, the
complexity is becoming to great in my view. At some point we do need to
switch to something clean and I think this is one of those cases even
if the initial switch is more painful. I suspect this piece may be the
cause of the ordering issues too.

Cheers,

Richard


