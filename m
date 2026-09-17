Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22454C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 20:07:49 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2563.1789675664973729071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 13:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E+S1VqGo;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so201005e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789675663; x=1790280463; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tNfVGNvb7hiszsY2j44g6Z5qHJbI7D/8nxsVBddQHjI=;
        b=E+S1VqGokwkFNhXYMwbaqOF7yD7dg9RORif8yRu2D2fTguZQkGyEMJmFNhO6TJwsEC
         V4Xy5pa7OA91tL8LufGOdMP4cWE6+QAwMYPEnbJDQ7ioOmFe10DyvGOd+Zzpk5+07Iua
         tEnaSIT4wpUXCht19Q+2D4X0zaSJlkjTRaACc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675663; x=1790280463;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNfVGNvb7hiszsY2j44g6Z5qHJbI7D/8nxsVBddQHjI=;
        b=MVyIU4ACbz08xixm/vJnqP4f0fLBYVYWVkL+peuy2CnrmPAKr5T8rKbgyxSweEWQxz
         Z6iwrJkSkHa9Lu9bFqAkRou2ShclDNZQRQ8u/46+vwkKSY1sDm7OjWop2Fu7JKziV14w
         9IoDc7IpiT7wDEUZ2sCG3w4HsIYNLLpJeI5yEalwVKILIwUlxAPhhbu0la4wLI8hkg8s
         sPXCivhNvHRX9ILp6TdnW0Bh4iMjHgXjXgczpH+We7tPBXodV26NidrWWey2UV8P3UNF
         JSyuG3Yhx63fb0gGsnM9IuSv00mDe2UozynDG0r7V8CzjQPrR1rUqM2rNbItzd4GKF40
         1Hzw==
X-Forwarded-Encrypted: i=1; AKwUvBz2zLgGGV+Af5EnGkmoufuWvESCtkGic72Yv6A+1eEowoPoxQSNhi9FTxxDUzPZ74lf2nNToceI/YzORxuJfhrWRg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lVTxh4S911dn5mL97ODZTapQ7G8ZkYNTmD2tVJ0TdrbS73sDUn
	Gb+FtHaxsWXkwiRs24wYxS3WqGgZpq5BYukIM9A3c1uWLDP5bHjV99AM0m2WYXvWc/I=
X-Gm-Gg: AYBFou0+pDPEToxj/BIZ68+HTieX3MH1j6n1YTLm8EaeFHxIVQ/9ZkedqaZXXYykFzk
	NwH24F1X6dMjaxkFAoF9d0NU/uWNVAfIKujGJp2OucbNuoASjNoxlTlInrPtjfYAGb/3/jr/1EP
	nEfc2mMQIjymJAOZbefn1gj9X0zKPdJfDqfOXcLCiDJ7jB/pieG6z8RD0rv9aLaFh5/7mBIp3dS
	rL/FET18zAp1xdOdQProsycSE701cVv8U90Z7NY6ZSM1TtAg1NugPBAl3RNMYDNx6OxefB6S9XQ
	gudRH5rNCnwb7q/rK9XH9rgMShbxPGCm/iPEjC47L1V7BCHM1Encjpd0YCpf+A+v3nhvEkxGnrz
	l31802jQp63720ufIQmiicXH0rTG9kUOK5aZbdaF0qK1DMISGXUI94idUWdFo3lj11gaBBvtSoB
	+Fg9RGzW4jxQOKwNmGPaic4NVAqRX0EOktMM4zCnUkgp2EPRZbUSgZRFRwqq301/mj/vh4Idlw2
	WCcPUpugqBmo9ZRKFsvsSONZJY2/pKlPRFe/tbRU0Im8UNgztA2tgrhVfq0KhVF
X-Received: by 2002:a05:600c:8b72:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49fc566458cmr1003505e9.2.1789675663091;
        Thu, 17 Sep 2026 13:07:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c29e:2252:2a50:5c93? ([2001:8b0:aba:5f3c:c29e:2252:2a50:5c93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216ec7sm95899405e9.8.2026.09.17.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:07:41 -0700 (PDT)
Message-ID: <71c2e47fa714ca48052d175ebc205e59803bf8d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.21.7 -> 0.21.8.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2026 21:07:39 +0100
In-Reply-To: <20260917074956.22252-3-jaipaul.cheernam@est.tech>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
	 <20260917074956.22252-3-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 20:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246088

On Thu, 2026-09-17 at 09:49 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> NEWS: https://github.com/GNOME/libsecret/blob/0.21.8.2/NEWS
>=20
> 0.21.8.2
> =C2=A0* Release to bump meson.build version
>=20
> 0.21.8.1
> =C2=A0* Make secret_item_load_secrets_sync match async behavior [!180]
>=20
> 0.21.8
> =C2=A0* Allow the content type to have additional parameters [#114, !175]
> =C2=A0* Support individually encrypted items [!174]
> =C2=A0* Ensure we return chained up GTask [!179]
> =C2=A0* Ensure length of DH shared secret match length of prime on GnuTLS=
 [!170]
> =C2=A0* file-backend: Add thread safety and file-based locking to prevent=
 concurrent write races [!171]
> =C2=A0* file-backend: Fix possible memory leak in error path of secret_fi=
le_backend_real_search() [!173]
> =C2=A0* file-collection: Fix memory leaks on repeated calls [!173]
> =C2=A0* Replace some SecretSync with a sync implementation [!108]
> =C2=A0* Add linker version script to hide private symbols [#70, !159]
> =C2=A0* Stop using CONST annotations on non-const fns [!176]
> =C2=A0* secret-tool: align behavior for collection option [!164]
> =C2=A0* secret-tool: document --collection option [#31, !164]
> =C2=A0* meson: Put test setup behind a feature option [#101, !162]
> =C2=A0* Several test and CI improvements [!172, !177, !178]
> =C2=A0* Updated translations
>=20
> =C2=A0- Refresh the pam-tests patch for the new release.
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0...meson-add-option-to-disable-pam-tests.patch | 18 +++++++++++----=
---
> =C2=A0...bsecret_0.21.7.bb =3D> libsecret_0.21.8.2.bb} |=C2=A0 2 +-
> =C2=A02 files changed, 12 insertions(+), 8 deletions(-)
> =C2=A0rename meta/recipes-gnome/libsecret/{libsecret_0.21.7.bb =3D> libse=
cret_0.21.8.2.bb} (92%)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/3394

Cheers,

Richard

