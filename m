Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367BEC02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:03:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.113555.1738667025699687449
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Aauf4MUN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so54149285e9.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738667024; x=1739271824; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny8+KC2LG6opj2XWV6DbWAkjDlKOPvl8hq4ZOPb2umE=;
        b=Aauf4MUNsizRDs+kbN6xys0X14rvYvtbU3v9HZLS+p3oZDuy1XJO+fgrxuhnNIqRV+
         TtzhxrXgBSsWCC2zgJM+/8PKkwf1cgMFF9QYQ2pyNYoPqy+naOy/RWiM4g7W3IU/wcJL
         NGUXA8zDEgzKDOYUL3FWRb/FR6VNeofK5f4Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667024; x=1739271824;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ny8+KC2LG6opj2XWV6DbWAkjDlKOPvl8hq4ZOPb2umE=;
        b=KZ/X5J/tmzwLhtBsalW/ptTuZ97BLqAjg70O8iLYOzE+rVSXgf3H7hSYROLA8/4GFd
         uSO/+SwdlbyeZW9FrJD2TbAyxQ9aaRD8hXrC2oGc9qCAYhBb4Sr7nOyS4IRAGughLsoh
         PPh8TV1jzP76/yIcA7hzW1oDXGCFpaJC3cy6LmVjvkwJAbEFdI72uC3+KdglaPP/zvT4
         Ku/NilCnG9THguH+vM0iCqEy5sHDIFWGpe/k5VyLah7oQ9Kp3XijjEAR98q0SaeIzJos
         5de7fKSLSoKYJlikjakMBGRXorfJorU8za5He6UHIMX36FlfnoJPrj3pmSeGlnMKuz0a
         T8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNWROuqK1JTF6KSstUA0oeUMd+AghHv9741VaZCsJq1YufLy6Sk8fhQpRhFa9fRdx6TrYScWSiJaDEKpjux+t5Ng==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx16FbSJ3dO2RsJUL0WtKeBwtmmdUDywKXi3+QHUmnVk/7MeSc4
	s2kTdY9j01m6ireC6ZzSjr03fQ845hi7lHRSgdELKd5Ysug2n7FsgbDDldkG52GgUO5+SeCfZXp
	a
X-Gm-Gg: ASbGncvp3z6Lx1Q7mO3FQ/liCzMOpiF2NnoUGfRapS9Tld6/jT1VHkTk87HaJsiKdM1
	aGHjSQQW3DSeiSYoQHHqPh2MV3CyOinN2/cTJoDIglRoVPxbHc4Y1zZ6zDHR/ZeQPUxTvgJty8f
	YEpgjnmFmFpDsRdz1Q48BvuThCANGAHvoDti1CBW6Y5e9274AeQSFnyaQi6qPOrTyxKgkpt2ln6
	t7IPaI2Z+cyHBNjQn/yQdpUZIs1QMmo7wbJ76foP8iRK0KjIdL/wBiQvX+b3fHgzNtZ+FVjJQ0i
	BAO2f2BxEzOLLKI5Xf2DuvBLrrF0jZ7o5GX+9+7bv+YgOPnVyJiegd08enl1tbvFNJvOwmA8eJa
	UZYJf
X-Google-Smtp-Source: AGHT+IGryx0Nuo47C6qbK/FYOkcCKfMLwQQyKlYkN8cv9nR0Nm1WxxCe6rYj8BiSd9pPCCQh//ngXQ==
X-Received: by 2002:a05:600c:1c93:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-438dc41d1cbmr195578625e9.24.1738667023867;
        Tue, 04 Feb 2025 03:03:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d? ([2001:8b0:aba:5f3c:b0f0:1828:fe17:cc0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ef08sm223233205e9.22.2025.02.04.03.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 03:03:43 -0800 (PST)
Message-ID: <e1e68f2bdd10981d996869d23fe36b34f15c0bf9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] bitbake.conf: Add conditional host
 tool getent
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Date: Tue, 04 Feb 2025 11:03:42 +0000
In-Reply-To: <20250204105315.84079-1-uvv.mail@gmail.com>
References: <20250204105315.84079-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210771

On Tue, 2025-02-04 at 11:53 +0100, Vyacheslav Yurkov via lists.openembedded=
.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> In case of systemd init mananger, it's required for the native build.
> Even though we don't build systemd natively, we might build some of its
> binaries, which need to run on the host system.
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
> =C2=A0meta/conf/bitbake.conf | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8b607088c6..6b1bfaf64e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -532,6 +532,9 @@ HOSTTOOLS +=3D "${@'ip ping ps scp ssh stty' if (bb.u=
tils.contains_any('IMAGE_CLAS
> =C2=A0# Used by archiver.bbclass when compression is xz
> =C2=A0HOSTTOOLS +=3D "${@'xz' if (('archiver.bbclass' in (d.getVar('BBINC=
LUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') =3D=3D 'x=
z')) else ''}"
> =C2=A0
> +# Native build of systemd tools requires getent utility
> +HOSTTOOLS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'gete=
nt', '', d)}"
> +
> =C2=A0# Link to these if present
> =C2=A0HOSTTOOLS_NONFATAL +=3D "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc=
 pigz sftp socat ssh sudo"

I'm a bit nervous about relying on getent being present. It comes from
glibc and I'm a bit concerned about the host implications of depending
upon that. It certainly gives us a very specific host dependency
(unlike more generic things like coreutils).

Do we have any more information about where/why systemctl is using it
and whether we really do need it?

Cheers,

Richard

