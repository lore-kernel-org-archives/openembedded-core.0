Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 779E87C6A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 12:20:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z19so10917539otm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nrrDVMhV8TIbhneMAXsKByYSCM0whQXS9tgbD2jxbpY=;
	b=use6LziLHvIxbGHDjTORZ20+syG1mTgeIDMc7JaDYgUHSdR/yDFewhFpS5UUFlvF+F
	YENSyG0uVv9yI/yLKZsccNHTmu6s3ZNMDQxu6AZmKp7nmV1Qmc48Rb2R1Jm2DDrDFMIL
	MHkqtqLL9yKnpNeQ3fyNz5P/gP4LXFHxRem3Jv3BquP6ImZUR1Vst7a6KnEiD8b3Z6TW
	y4MqF7tM6N/+DV+cqNyHi6h6T5oM0tXQlirCoTK0IR3ZRcYSBPzfTSDc0COZXwC7y4Lp
	hl3L46I7+mU0rr70MQRLh3dBn6pdFENHypidFpuNajTmpCklSkB3bNYEtRIecAg4QN1H
	w7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nrrDVMhV8TIbhneMAXsKByYSCM0whQXS9tgbD2jxbpY=;
	b=h6GleY7y64h4U91qlKQLaozqvmybsn5GtpUXU1om2Bty8DU6WSGW0NKJwsoVjTjD7F
	TsEkc99IrOW6afGs2shUs/PBUYLQQKIk63epVoIMKv1GxJc5jbZXiE5U3q5ugTfnblu3
	EAbpevpN84x6S2O/erp/ImwV/2tao+EV9LzDNCBY4n3Fq775Sy+z1cdmD4+lcMSaWDYZ
	L41Km099s0lEcFDNfMUQfkSDT4M/t0Dc7dxft6Tfn80h2FjYwgid20QbxULXCaJeqa85
	HxFcoLiR4a1eowIyrOHPI+X15Uex5KO9+FNQrDIes5UdBUXAYiTWoGZyHNojc+1l/6hS
	ujvA==
X-Gm-Message-State: AHQUAuYVMw8fhTixc7aa3H38XTLUM4I/22dq2ldVY47bcD1ojFGGd8lP
	Pc4/+sIsLuf8V37nPZR+Tx9DSDsCqOrM3qL2aBw=
X-Google-Smtp-Source: AHgI3IZJHm84bBlCetUHsHRZpxeTaSVe5OnPe/QbUhXkHqyOKVIdNipoTPkFlgkWOB5rdq2VWSc1sJsasdjammVJOew=
X-Received: by 2002:a9d:7544:: with SMTP id b4mr15242159otl.326.1551183607278; 
	Tue, 26 Feb 2019 04:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20190226113559.9398-1-otavio@ossystems.com.br>
In-Reply-To: <20190226113559.9398-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Feb 2019 13:19:55 +0100
Message-ID: <CANNYZj_XPzrqbSZ7_XmqkwhLYyMgJ_L5J8AUSkkFBjPf-U80mw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 26 Feb 2019 12:20:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Feb 2019 at 12:36, Otavio Salvador <otavio@ossystems.com.br> wrote:
> We had a c_rehash shell re-implementation being used for the native
> package and there is no reason to not use it as well for the
> target. This allows it to be available without the need of perl being
> installed.

I'd rather not deviate from the upstream, and use what the upstream
provides. Especially considering that perl version does have command
line options that the shell version does not, and the difference might
increase in the future:
c_rehash [-old] [-h] [-help] [-v] [dirs...]

If you really really can't afford perl runtime on the target, and want
the shell version, how about making it a PACKAGECONFIG?

Alex


>  .../openssl/openssl_1.1.1a.bb                    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 9f6e26bcf5..3e9e45e4a4 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -122,7 +122,13 @@ do_install () {
>
>         oe_multilib_header openssl/opensslconf.h
>
> -       # Create SSL structure for packages such as ca-certificates which
> +       # Install a custom version of c_rehash that can handle sysroots properly.
> +       # This version is used for example when installing ca-certificates during
> +       # image creation.
> +       install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
> +       sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
> +
> +        # Create SSL structure for packages such as ca-certificates which
>         # contain hard-coded paths to /etc/ssl. Debian does the same.
>         install -d ${D}${sysconfdir}/ssl
>         mv ${D}${libdir}/ssl-1.1/certs \
> @@ -143,12 +149,6 @@ do_install_append_class-native () {
>             SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
>             SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
>             OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> -
> -       # Install a custom version of c_rehash that can handle sysroots properly.
> -       # This version is used for example when installing ca-certificates during
> -       # image creation.
> -       install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
> -       sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
>  }
>
>  do_install_append_class-nativesdk () {
> @@ -190,7 +190,7 @@ FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
>  FILES_libssl = "${libdir}/libssl${SOLIBS}"
>  FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>  FILES_${PN}-engines = "${libdir}/engines-1.1"
> -FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> +FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
>  FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>  FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

