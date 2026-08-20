Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B81EC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:51:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3103.1787215862250156620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hGJpP/yL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482938466a7so1681175f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787215860; x=1787820660; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qR98IpNvvUV8HymD34h63iQzH8F4wjSB01/QVZoevdM=;
        b=hGJpP/yLvh3fdm+FwTh80Z3j19bFUnwhrTjqswPyvVs2s+op/LoUULxnQDak+Q+DO3
         mMytEDp8ZdvIANoGLIgItsZ7AwKcBQHpfHGCl5UiVLCoRK9p82C50pW6cl3Hr7CwEy6G
         6GLKiqiQmMkMJmxBLCL7TiUaF0wu1YVOu6hh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215860; x=1787820660;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qR98IpNvvUV8HymD34h63iQzH8F4wjSB01/QVZoevdM=;
        b=l69iwOrS/7olhX1+mnjNM3YSOoPiZ3F5/uA9fiek5rbeHLPhgItJti8+cdDHfNU8TA
         ohxonV/EhD7n5oAZVj7CibMGd/t8cwHroxLRXHD2MXXQcWOIurcaQtfkEne4u7i8egzk
         KoT+a2QMV5YPBNi+z7hqccK4oK+r9WUGfrdhzo4LTl7K3cOYyZrRaIaAFYk3uDIDEL0f
         6jRMU24xfhWmh1i19/Daq3buCCuRWsFEBp574toWYOADEjUby+pN/R1oArbaD5X9HQej
         iWzZARYWrNdp11yjSQSUOP22VWNGuxQYnkIBkqIqDEmiR9hvXoeg2ZMonauflPHHIU4C
         Pd2g==
X-Forwarded-Encrypted: i=1; AHgh+RpM1VqsLiXMVJsJswPY4S2JtFQD44frz4Z/ybwkNvr/L5wLkphLx0vs7ZLbE69SYVXUnvqiKuV8RXZRpwtOFdWjFg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mlcWaXVWVYw6lCttDuqPhV2jHcsCA5y8wIAzssX475O3+QTCxq
	sqMB1HTqGNz/+MIxO8JLL5dxPaMZOL23epOCxCSl8w7QLHaGLynIOOFrd5ktO4+2f8Q=
X-Gm-Gg: AR+sD10eIDz9qcxFeR/364KdHgpwGWRvJkZl0bY9rLJpOA8A3hkIXrSpGoKwjDf23Pt
	loXEe4tFWYL6rzAKlNhLk6EMzt1bUZICNSb+4MXNoW3Fr+e9sQ0OfH8stekG0/GFXCDjhvezYJV
	IfH2UFFRupudK5sWLRRYzoKPBvCf8goo9BfvRqKsfXHSGuykklSmWj1lprBe1t1GjDandclPkes
	aViI06+KInqY8WFgpgZVMj9kbulrjtXzLuQiZRFD7Apk9j3uwlHvzgRK4Wt5jSAiL+DgshT+Cuq
	xwhbX07gkG4oNrLuvqhIf7bQH2pZkrFLeuSse4S9pV1wvYq75h/olrhJFCHwhHsWcnuXWlBM1uV
	bINSRUOmeh1r9tu0vgNpEtAS6OfAWGnN/p6e9K7tR9lEV8UXcoRq2Eu5gvLVQlczayW3Hy5lZHT
	kmg2N6OvamHKDuYS7LdD8rYOqXKsMX58e0/SjsUYgaZsIXgQxwJE49NXOz0mgPazoo1w8hILRp9
	Zjkp4FcMNMbsEFto8XZabL31PIonWIEf/atuB73CE4oOp0wHE+LXA==
X-Received: by 2002:a05:6000:2408:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-482b1feb2bcmr17702304f8f.18.1787215860364;
        Thu, 20 Aug 2026 01:51:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9334:47ad:4624:539c? ([2001:8b0:aba:5f3c:9334:47ad:4624:539c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm11835057f8f.13.2026.08.20.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:50:59 -0700 (PDT)
Message-ID: <4c2bf3afcf60e78107f7d952fe90fd2b0d9521da.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] kernel.bbclass: add strip process for
 signed kernel modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: anis.bougrine10@gmail.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Antonin Godard <antonin.godard@bootlin.com>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Jose Quaresma
 <jose.quaresma@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:50:58 +0100
In-Reply-To: <20260813191749.48691-1-anis.bougrine10@gmail.com>
References: <20260813191749.48691-1-anis.bougrine10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243822

On Thu, 2026-08-13 at 21:17 +0200, Anis Bougrine via lists.openembedded.org=
 wrote:
> Currently, signed kernel modules skip the stripping process in order
> to preserve the file contents after signing. See commit:
> 4c47e5f171fa2603355e2f9183065ce8137a18c7
>=20
> However, the kernel install Makefile supports stripping modules before
> signing them. This allows signed modules to be stripped while preserving
> a valid signature.
>=20
> Make non-signed kernel modules follow the standard Yocto stripping flow,
> while signed kernel modules use the kernel Makefile stripping flow.
>=20
> Fixes [YOCTO #12927]
>=20
> Reported-by: ross.burton@arm.com
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> Cc: Antonin Godard <antonin.godard@bootlin.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
> changes in v3:
>=20
> - Fixing rebase issue.
>=20
> changes in v2:
>=20
> - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
> =C2=A0 duplicating the oe_runmake call.
> - Use `scripts/config` script instead of grepping .config file.
> ---
> =C2=A0meta/classes-recipe/kernel.bbclass | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a82bdf7ecb..0998de1548 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -451,8 +451,12 @@ kernel_do_install() {
> =C2=A0	#
> =C2=A0	# First install the modules
> =C2=A0	#
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +	unset CFLAGS CPPFLAGS CXXFLAGS INSTALL_MOD_STRIP LDFLAGS MACHINE
> =C2=A0	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> +		# If the module will be auto-signed, perform stripping before signing.
> +		if [ "$(${S}/scripts/config --state MODULE_SIG)" =3D "y" ] && [ "$(${S=
}/scripts/config --state MODULE_SIG_ALL)" =3D "y" ]; then
> +			export INSTALL_MOD_STRIP=3D"--strip-debug --remove-section=3D.comment=
 --remove-section=3D.note --preserve-dates"
> +		fi
> =C2=A0		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modu=
les/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
> =C2=A0		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build=
"
> =C2=A0		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/sourc=
e"

There is another issue. If you strip the modules here, we lose all the
debug symbol information later in the build. That doesn't sound so
important until you realise we use the debug information to feed into
the SPDX and it is then used for checking for CVE issues. I'm not sure
we can afford to do that...

Cheers,

Richard




