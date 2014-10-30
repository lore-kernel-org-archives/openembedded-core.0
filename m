Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B27C565C87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:27:16 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so7395468wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=/iiPcGAOw6LpKP9oftEDyRSdiVLw2JvAQjaE3/O7MFA=;
	b=JQw4t+e0fQh76lrvQNSzpYpn8oAcQ3o4wfYYkzmXpYE2JSJTOj3sCAnV5zpYCtor7o
	CzIO7Bf0HsdqsgPNGb/1ju12c+nodiZTI+Apmkx7eUa4lL/pxEJhnduwYkpbujSdEvk1
	OwlNo+S6HxjxjdC8V2pF2mFHMc+IANqdT4DzqpI8xLGQ6txG+a7/Bjlve93dVSFUl3R6
	NOioyfqZm5+EF2c7XQMK+HbP93A/e9wOHj7OAoEA1jTPs2IoJbXPInawrVGE+UIVTtY9
	QBTHRVJqki66tZbP+mUtvabZUzNv/hkqTn0GIcQCux+pGSqXYw4BGXXGY3Pq6OzF1zJn
	f77A==
X-Gm-Message-State: ALoCoQn32CnJK6MNWFASRizY9TukXMhNcWFlpJ/Oyj5531pzg7CzYH2dY/Fg1sORx2fuJf4Tqdtt
X-Received: by 10.180.101.200 with SMTP id fi8mr43696488wib.77.1414675636932; 
	Thu, 30 Oct 2014 06:27:16 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	iz14sm17811338wic.23.2014.10.30.06.27.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 Oct 2014 06:27:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <33a3b945ec946aa6f0fba68afe7242c3cf8c0fc9.1414659743.git.Qi.Chen@windriver.com>
Date: Thu, 30 Oct 2014 14:27:14 +0100
Message-Id: <6DFFE445-39DB-47D1-97F2-04CA26866DEC@dominion.thruhere.net>
References: <cover.1414659743.git.Qi.Chen@windriver.com>
	<33a3b945ec946aa6f0fba68afe7242c3cf8c0fc9.1414659743.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libpam: add system-auth in case of systemd
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
X-List-Received-Date: Thu, 30 Oct 2014 13:27:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 30 okt. 2014, om 10:08 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> systemd needs this file to be there because one of its configuration =
file
> in pam.d, systemd-user, requires it. Otherwise, we would have errors =
like
> below.
>=20
>    systemd: PAM _pam_load_conf_file: unable to open =
/etc/pam.d/system-auth

Isn't it the same as 'common-auth'? ISTR this is due to debian vs fedora =
naming of PAM stuff. I think it would make more sense to check what =
systemd actually wants and then see if a symlink to common-auth or =
patching systemd to use common-auth is the right answer instead of =
blindly adding system-auth.

regards,

Koen


>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> meta/recipes-extended/pam/libpam/pam.d/system-auth | 12 ++++++++++++
> meta/recipes-extended/pam/libpam_1.1.6.bb          |  1 +
> 2 files changed, 13 insertions(+)
> create mode 100644 meta/recipes-extended/pam/libpam/pam.d/system-auth
>=20
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/system-auth =
b/meta/recipes-extended/pam/libpam/pam.d/system-auth
> new file mode 100644
> index 0000000..ffb08ab
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/pam.d/system-auth
> @@ -0,0 +1,12 @@
> +# This file comes from systemd.
> +
> +auth     sufficient pam_unix.so nullok try_first_pass
> +
> +account  required   pam_nologin.so
> +account  sufficient pam_unix.so
> +
> +password sufficient pam_unix.so nullok sha512 shadow try_first_pass =
try_authtok
> +
> +-session optional   pam_loginuid.so
> +-session optional   pam_systemd.so
> +session  sufficient pam_unix.so
> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb =
b/meta/recipes-extended/pam/libpam_1.1.6.bb
> index a84e51e..0910b6f 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D =
"http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
>            file://pam.d/common-session \
>            file://pam.d/common-session-noninteractive \
>            file://pam.d/other \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'file://pam.d/system-auth', '', d)} \
>            file://libpam-xtests.patch \
>            file://destdirfix.patch \
>            file://fixsepbuild.patch \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


