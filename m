Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E754FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 09:31:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34982.1777973469347853164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 02:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YRJ9cMb+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so33633395e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777973468; x=1778578268; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PJQqzKRJrS9jTRb9QE0GRFplqyyryOAXKJQg90xbL2w=;
        b=YRJ9cMb+DfwlKIhfA7vFPfECiCiQIaTF/47HnngZZ5IaMggP320EGwmFGXfClefOkD
         lTJ52exggqK25+Bj3vfpllyT6yEnFEfnDVwsdn0yNPAZjup/YcaXS8lCZ/I7jxVGga7F
         jPhX9UlcGP54OA4PrA7yQZqkxIr+Uhut/zMR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973468; x=1778578268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJQqzKRJrS9jTRb9QE0GRFplqyyryOAXKJQg90xbL2w=;
        b=YaTKy4A8xODVCvqMF/9Vjn8rAPSNiOuvwBNEAzuokdHL4ARzDFbVvSUubqYm7kOEcc
         9lI4p7z+7EJlIXAEBbSeDubw9J6IRZgb5RaJZ3fBw6WFb6GUXjqwd+fYZw81NtzA1F8b
         v3HO8e7GzC0rT3nhwXk5GP8gXY4XQ60/HvbVVxBx/qxE7W93aSaZI489Q0b6lQizX0k1
         xIdqxSf8UnWVgMqFFiiWEbMWZ4Kr/VUqs3KfLQtlom4AYnmCsTivgQfDESKMv+os7NRa
         F0EYtghKsVSK4lIexBvsRpsI9dBmKk1u6s+zysjRz3Cx4fPnCxdW99VWme6XoSbo6LGU
         jskQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ik79TiKZPMUdwrE4HrpX8A7XRLM7ws5V/s4vJLjg7k9iz8dyc1Dpn6kvRUPKmT61+cI54jpLmld8iM9pojl/fOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0qf7trU0Y2bTqwnfv8T8C1ph7z71lMDiinlSW6PwmpL3lX9LL
	8kJgr0D4T7fGjuF2h518oriB1qJtR/EmtKy1L+PHS+Xv0g1TpiYhsMS6J5y7/tnE0CA=
X-Gm-Gg: AeBDieuBGJg6eGd0id3ihSjXECF1tw836DAx1y47UwkVtt29Rf5wAufUD6nE3p84TGF
	PP3bGj6I5hel4CyOBlE7i2nQGnNAefimYapcnEWfuv9emCyGGnARfzmBE4ejq5/K6TrIDQcbron
	GZ/peNWkl6OAvEZb3x9nD+D6Fa9lbaVARl15RFcXSTJiAB7Sxr5VF9e/6Ofa0ASwhJmb88KssSr
	lgkeWY1iiveu0zJSYcrsIzpMdloC+fKUAtmhTBrKD/g1kmJR6k3lkwugDmOGyrn4qft72tUC53q
	8mchqI5eOtJNDpmD5tCfTxoHC7Vb+HtXeZJsKJlF5EWf83EVOSoZtyhAfcoQs1K01z25rsKXEDW
	BYeAIN0pfz0/mulxlEKecQo+tNfhkkpRzezD5Xhbcs4N0EMB1UQF0oqbgh7MUEznNDmk7PO/Frz
	CDyC7VXNpacuy36qp0lN7AtaGh3ywVWxBQpimH8lF/Y4tksSxFO3V6Qht9XZGn6PaY0LF4mFcP9
	BXJNTgOjDe+l0JO50BJ1SU+/RQ=
X-Received: by 2002:a05:600c:c096:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48d142331dcmr33112715e9.4.1777973467443;
        Tue, 05 May 2026 02:31:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm554362795e9.0.2026.05.05.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:31:06 -0700 (PDT)
Message-ID: <5bb50c558f394d8e734019e00218fc45c4e1fc0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/5 v5] clang: Set CLANG_ENABLE_TESTSUITE = "1"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 05 May 2026 10:31:06 +0100
In-Reply-To: <20260505081625.849368-4-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
	 <20260505081625.849368-4-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236475

On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> While running testsuite set CLANG_ENABLE_TESTSUITE =3D "1"
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
> =C2=A0meta-selftest/recipes-devtools/clang/lld_%.bbappend=C2=A0=C2=A0 | 2=
 ++
> =C2=A0meta-selftest/recipes-devtools/clang/llvm_%.bbappend=C2=A0 | 2 ++
> =C2=A03 files changed, 6 insertions(+)
> =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bba=
ppend
> =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbapp=
end
> =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbap=
pend
>=20
> diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/meta=
-selftest/recipes-devtools/clang/clang_%.bbappend
> new file mode 100644
> index 0000000000..32c236b972
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
> @@ -0,0 +1,2 @@
> +# Enable CLANG testsuite
> +CLANG_ENABLE_TESTSUITE =3D "1"
> diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/meta-s=
elftest/recipes-devtools/clang/lld_%.bbappend
> new file mode 100644
> index 0000000000..32c236b972
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
> @@ -0,0 +1,2 @@
> +# Enable CLANG testsuite
> +CLANG_ENABLE_TESTSUITE =3D "1"
> diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/meta-=
selftest/recipes-devtools/clang/llvm_%.bbappend
> new file mode 100644
> index 0000000000..32c236b972
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
> @@ -0,0 +1,2 @@
> +# Enable CLANG testsuite
> +CLANG_ENABLE_TESTSUITE =3D "1"

Having bbappends inside meta-selftest isn't something we've done before
and feels a bit odd. I think it will cause yocto-check=3Dlayer to fail
too.

Why wouldn't we just set this variable inside the tests that need it?

Cheers,

Richard


