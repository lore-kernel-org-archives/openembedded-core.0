Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D1CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:08:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2.1778170128438174226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yZuSZ8qV;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-453903ee4adso571563f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778170127; x=1778774927; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+vOZHvASKbxu9506/DksL6Uyx7ZaKdPOaFi8CsZLbI=;
        b=yZuSZ8qVw+KjAC24uBXOee43RJbTkPQm73hKo2fREdzti4OLg38J5P7onoMuKQX4Yn
         BBpN5AX04TGWaR20CCrPTt+eES2U2+V+RMDY1lO8mCzI2tNZ1Dnn2kh/0SjQpdIH6Sgm
         Eba0zglwC8QwtxiLr69s+qMMzn1J3u/nzcohc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778170127; x=1778774927;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+vOZHvASKbxu9506/DksL6Uyx7ZaKdPOaFi8CsZLbI=;
        b=Q7D0ojPW+T5uRL6XBhkaEaLDcpFvEGJ28s3GRtC/ckG3BcD9/eZrVwKTvj2Rq66wjn
         GwuHu33NL6wFJGlPNJx3HHvNVMJUWJHj/b3L99q++JfrT3uH9CGsI2zIPzuCTgEI6HVp
         feJHCY/91uvJCr/XfPqiRuvT6xIzD5e+1P0MNvtBDDOHNhFNhZXjscq2DzmiMJ3WDcva
         szSs0uNm8tmh61hfjD3eamsSCDHoqoHBpyrQ72m8R1nhsumeb6Fy+w3XAI+T5P7QaJ1/
         KGpkL8Vl1/w71vZgA5P40XBRyLpaCSo9cV4+9WeIyETfNp72hLLbqhIONsC17LYypg54
         GqpA==
X-Forwarded-Encrypted: i=1; AFNElJ9+Bu5C9QxaoAVtACTy5ZaPunuic5xE1VGXhMEJTUnIEkNXuIjj9v6+lr1srHT1rOyINnJKpyT8cil7weVFDysJwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyG5hfEvVD+Qvzb4BUc16Oxv8uVKLJjuse3xG/uinnR6mKGXnmB
	W/grjRTvq8y0SeHr/qFKUeiDP54jh6BV9Ur4GbeVgObtbzZ/NJFzJ4mvg+PGxpCv8XI=
X-Gm-Gg: AeBDietoPrll2UIU21ziFNM5QaLwAnraDoRMcmw7b9MilsckrXzAFyTQm0tNJlszXm/
	MmhfdGTn4YwXGm1AVM6ugg0gJeZAytVyiFL90hqrX5u9uIMC+p/Y4AU13YGytki3BnX7RueJbc1
	pN9UuYLUb1pVd9zlIBh3FbEWVDaaKyEbQk6YCz7n+Yi5aqwfGlxTzKIJ27ZHWBGUx7TxK+hmdcj
	cC++zUHACbaZX8vX69gIMMOqgeh1yrmr9DCl1kZ8DWe//xVmGzatZYVrWy9Sa3Fr6fgaLw2782r
	gYVH/OF+Bk1hJSTPa9HLVbFvEw65dpuPLO5orEQNFyZT+2g75kZDMdI8Y3fzrecSAIPgKPu67ob
	GwvFgA54R9fiRf7+QBeSX1Mo7UMxsfpuS2nH2qfeKticoWujBfTsFZWE1z+uSBTemGKFDsuHhDN
	p85UcofvwfGl4r+B16Acpw5wIwFSeYcjHKHSWyINdFdwxSh+MuOPdkiJBv2/fIx1ydbmij5zs0x
	ZgaImuffErBA8RlhbkCMxn0Ng==
X-Received: by 2002:a05:6000:40dc:b0:448:69c0:8da0 with SMTP id ffacd0b85a97d-4515b056b6emr13513503f8f.7.1778170125673;
        Thu, 07 May 2026 09:08:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820303sm118069f8f.4.2026.05.07.09.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 09:08:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 18:08:44 +0200
Message-Id: <DICKPA2E8VHX.34330DQ2VL0B1@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: Fix CVE-2026-35414
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ashissh7@cisco.com>
To: <pahaditechie@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260406073618.3629883-1-pahaditechie@gmail.com>
In-Reply-To: <20260406073618.3629883-1-pahaditechie@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236599

On Mon Apr 6, 2026 at 9:36 AM CEST, Ashish Sharma via lists.openembedded.or=
g wrote:
> The match_principals_option() function in auth2-pubkeyfile.c used
> match_list() (which performs glob-based, comma-separated matching)
> instead of exact string comparison. When a certificate principal
> name contains a comma, match_list() splits it into multiple patterns,
> allowing an attacker to craft a principal name that gains unauthorized
> access.
>
> Fix by replacing match_list() with a strsep+strcmp loop for exact
> principal matching.
>
> Backport of commit fd1c7e131f331942d20f42f31e79912d570081fa from
> openssh-portable 10.3p1.
>
> CVE: CVE-2026-35414
> Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> ---
>  .../openssh/openssh/CVE-2026-35414.patch      | 78 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35=
414.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
> new file mode 100644
> index 0000000000..dbc0968a3f
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
> @@ -0,0 +1,78 @@
> +From fd1c7e131f331942d20f42f31e79912d570081fa Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Thu, 02 Apr 2026 07:48:13 +0000
> +Subject: [PATCH] upstream: Fix matching of authorized_keys principals
> + option against certificate principals containing commas
> +
> +When matching an authorized_keys principals=3D"" option against a list
> +of principals in a certificate, an incorrect algorithm (match_list)
> +was used that could allow inappropriate matching in cases where a
> +principal name in the certificate contains a comma character.
> +
> +Exploitation requires an authorized_keys principals=3D"" option listing
> +more than one principal AND a CA that will issue a certificate encoding
> +more than one of those principal names separated by a comma. Typical
> +CAs strongly constrain which principal names they will place in a
> +certificate. This condition only applies to user-trusted CA keys in
> +authorized_keys; the main certificate authentication path
> +(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.
> +
> +Reported by Vladimir Tokarev.
> +
> +OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
> +
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/fd1c7e131f331942d20f42f31e79912d570081fa]

This URL point to a commit quite different than this one
(message changed, not the same set of changed files, only one part seem
common). Backport differences are expected but non-trivial ones should
be explained in the patch body.

Thanks!

> +CVE: CVE-2026-35414
> +Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> +---
> + auth2-pubkeyfile.c | 26 +++++++++++++++-----------
> + 1 file changed, 15 insertions(+), 11 deletions(-)
> +
> +diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
> +index 896ea19..e729cc5 100644
> +--- a/auth2-pubkeyfile.c
> ++++ b/auth2-pubkeyfile.c
> +@@ -50,6 +50,7 @@
> + #include "authfile.h"
> + #include "match.h"
> + #include "ssherr.h"
> ++#include "xmalloc.h"
> +=20
> + int
> + auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
> +@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct s=
shauthopt *opts,
> + static int
> + match_principals_option(const char *principal_list, struct sshkey_cert =
*cert)
> + {
> +-	char *result;
> ++	char *list, *olist, *entry;
> + 	u_int i;
> +=20
> +-	/* XXX percent_expand() sequences for authorized_principals? */
> +-
> +-	for (i =3D 0; i < cert->nprincipals; i++) {
> +-		if ((result =3D match_list(cert->principals[i],
> +-		    principal_list, NULL)) !=3D NULL) {
> +-			debug3("matched principal from key options \"%.100s\"",
> +-			    result);
> +-			free(result);
> +-			return 1;
> ++	olist =3D list =3D xstrdup(principal_list);
> ++	for (;;) {
> ++		if ((entry =3D strsep(&list, ",")) =3D=3D NULL || *entry =3D=3D '\0')
> ++			break;
> ++		for (i =3D 0; i < cert->nprincipals; i++) {
> ++			if (strcmp(entry, cert->principals[i]) =3D=3D 0) {
> ++				debug3("matched principal from key i"
> ++				    "options \"%.100s\"", entry);
> ++				free(olist);
> ++				return 1;
> ++			}
> + 		}
> + 	}
> ++	free(olist);
> + 	return 0;
> + }
> +=20
> +--=20
> +2.25.1
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index 1cdd888ccb..4d0b9afca0 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2025-32728.patch \
>             file://CVE-2025-61985.patch \
>             file://CVE-2025-61984.patch \
> +           file://CVE-2026-35414.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
> =20


--=20
Yoann Congal
Smile ECS


