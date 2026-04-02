Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E099D3941B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 12:00:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13993.1775131237771884400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 05:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yf2qqtJ6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so505583f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775131236; x=1775736036; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0zcKKbhiqkk9XjmguJAtfJgVwQS1ixGNAvYLJenw1A=;
        b=Yf2qqtJ687zM/ATAdcBiJQlUKgYEx/rOe7eaEv7UW/L3jii691vGzpHh74l7P0iPfn
         po/S+OiESq276z0ZrhxWnNK8G9bRHHmdn6UPkQPDI9I2YkHJMjifrThRuq0eIynK0yWL
         Dj6newsi0khZbNw9vRIDFC3NrrkU34BY79VLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131236; x=1775736036;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0zcKKbhiqkk9XjmguJAtfJgVwQS1ixGNAvYLJenw1A=;
        b=IDSKzIvMJXZfUGEBYVUNL4c1CcDCUp1IYOMmuwnbKyYv3C+42mXVW9Ue4z9mfuNDDY
         7Jhx3Bhg5DGKUmekLW4gVHyBr4WCyGWFXJh1FiJMsTSk3b1P6yDWoG6ixcs+6yfdAlc5
         obva1HkamhFysA2OEKx+a8ArIb66VCPTrdpKcbPAYqi43ABvYpMRHEAfLfgCE8vR1pqh
         /GK58I+ftnruR6LSNcIyBltzUOw4yX6Ac4jr4dH375AvwHymIT2X01TGvmRTfDZKMeuf
         Yqllffaa7O0H5Mxk1EbCSUMfjdqWqxZTcfn4ZGdxacfmqeYGzIEpWvPAozaE67/YeR8L
         SMig==
X-Forwarded-Encrypted: i=1; AJvYcCXwDLDtdpvfMJaGqecu6jwIYWJu1Jvp9NAYRux1KpVAuo5+9rpSel9s0BXRrBs7Sis8MbuTMMd3vlrmal0rTY3TLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmLwVbLLfUFpcLJYexxCb5rBCj/NoIWqZLePfMTzm7ZhwAfFeQ
	yLKdyOTibMgr5u43wDFonnBipSzbYXLiX7YV4dVkErsgqFpXuyVR9apjokethpfVY6CCFp5hyUN
	QMDTw
X-Gm-Gg: AeBDieuXq7zDlBC/f2fAg47yuW8veiU6slQ+wDgifSaWllTe9WoBP7HlelV3/og1BqN
	mkoN2DLpVCQb78ru2aYFCqvLZSG3vfPAc9YC18wvN0nUIX5mHfGG6h86wk7BW5i5RgZCvWfN/tt
	j5Mq1WnM4IjEbYVssLuO9UYCBP8ZTWa6l/ybnpI7pZmVBJFIo4vZHAZf9+iIUOLe4ufe0UYx6+c
	uaO1o9R7Tx/upnJ2nJwx7KT9Kn/yOMzQFypR1+8INR2Z5MTyJ3mxxV2yj4h9K2JB7rjRiBRTWhZ
	1NG/JcSPmkH6TD7kMJLdvDuVFHV3SxgYgqT4IHEXl/q5zF/xA9wvo4u7HQ76lswE7yNL7vyUftA
	afomHGu72mU209KSXtX6iWWfp5pcdmecdPdB4PcB/CZyCkk/uztFoiT7vTJqXhbtLWbfZo4wV2i
	V3sAHBazlN977sHB4Sip523xAY1+eHEgOUWmAbqqBnwKdbUqi1kJpRHummwNQozNPwiYdfm90cM
	mU8lsG0k5ISKdM3Xsb7qPKpPXQ=
X-Received: by 2002:a5d:66c6:0:b0:43d:1bf6:930 with SMTP id ffacd0b85a97d-43d1bf60a03mr6254010f8f.47.1775131236070;
        Thu, 02 Apr 2026 05:00:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a695:b092:8c54:d70f? ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm7139956f8f.14.2026.04.02.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:00:35 -0700 (PDT)
Message-ID: <58e3254f753b7e408167969ba238b5e8288637fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 1/7] signing-keys.bb: Fix DISTRO_CODENAME
 truncation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2026 13:00:35 +0100
In-Reply-To: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 12:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234519

On Tue, 2026-03-31 at 11:57 +0200, Adam Duskett via lists.openembedded.org =
wrote:
> If DISTRO_CODENAME is not set in the environment, bash quietly
> drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultse=
tup-
>=20
> However, when python calls self.d.getVar('DISTRO_CODENAME'), the resultin=
g
> string is 'None', leading to a configuration file pointing to a key such
> as PACKAGEFEED-GPG-KEY-defaultsetup-None
>=20
> Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
> DISTRO_CODENAME is not set.
>=20
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> =C2=A0meta/recipes-core/meta/signing-keys.bb | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/m=
eta/signing-keys.bb
> index 94f4032911..c7713ed4a6 100644
> --- a/meta/recipes-core/meta/signing-keys.bb
> +++ b/meta/recipes-core/meta/signing-keys.bb
> @@ -45,6 +45,10 @@ addtask get_public_keys before do_install
> =C2=A0do_get_public_keys[depends] +=3D "gnupg-native:do_populate_sysroot"
> =C2=A0
> =C2=A0do_install () {
> +=C2=A0=C2=A0=C2=A0 # Python evalutes an empty DISTRO_CODENAME to "None" =
which would cause mismatched files
> +=C2=A0=C2=A0=C2=A0 # as the update config file would show GPG-KEY-${DIST=
RO}-None but the filename is
> +=C2=A0=C2=A0=C2=A0 # installed as GPG-KEY-${DISTRO}-
> +=C2=A0=C2=A0=C2=A0 DISTRO_CODENAME=3D"${DISTRO_CODENAME:-None}"
> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "${B}/rpm-key" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0644 "${B}=
/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_COD=
ENAME}"
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> @@ -57,6 +61,7 @@ do_install () {
> =C2=A0}
> =C2=A0
> =C2=A0do_deploy () {
> +=C2=A0=C2=A0=C2=A0 DISTRO_CODENAME=3D"${DISTRO_CODENAME:-None}"
> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "${B}/rpm-key" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0644 "${B}=
/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
> =C2=A0=C2=A0=C2=A0=C2=A0 fi

I have a feeling it may be safer just to put something like:

DISTRO_CODENAME ??=3D "nodistro"

into the recipe to handle this?

My only concern is where else this is being referenced from and whether
that would have the right scope? Most other usage sites have special
usage.

Whether there should be a higher level default, I'm not sure and that
is a bigger discussion but this would hopefully avoid the immediate
issue?

Cheers,

Richard


