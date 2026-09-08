Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C69DC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 22:57:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1240.1788908251404106277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 15:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gi3YoqyB;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so40970045e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788908249; x=1789513049; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQeiARZfP4qMJZEw/sUKy/41OHL/X1cDpYWScz6Z4KA=;
        b=Gi3YoqyBSevyifmvCSTrsN2MBCGPd0qEiq8X+N60aUxY6jZywtOJfsP1nXCCSn1wRS
         LBUTAK5gt7FFQQ7K7Z3IDLRiXQ7byUjST8QT3ELJFHp0CB1f1SxUf7gRRfQR6ICW/diu
         zQcGRh7DqtXabo+RLlggbm/lxbbSEdt2kzHgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908249; x=1789513049;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQeiARZfP4qMJZEw/sUKy/41OHL/X1cDpYWScz6Z4KA=;
        b=el081irXrKEIlVXZy4Gj25R4mQ++7dL5wAEgZu//MRnG3y6HJTv4nlu6ilYSyes0VZ
         NjuOgoIt4IVB8NG9pLxv0W+GsJW5IBCYaPsW0UgB0EwH3XmJVJUbeNa6eU7CFBA1JR5I
         48IAgcOMf4kuTxzMw73Ecpyp5IaPCILku5uPFeWXOHbz2eYpjwqAnRCEP9SRk+Q5Xx3X
         ui+vshO+C3mpIvIAPukQmY/fjN2gmtCYsrrkEFHppFXcbYBV4ZmqyBAeJSx5ZqB6GfPT
         USp47DlqrSr31ONgeu/vu0rkTnsXEwvrn+CVwA4YsE/mOnSixfY0PfeRwsCCl1bNqWYc
         uqrg==
X-Forwarded-Encrypted: i=1; AKwUvBwIWt9pqpmQbrkC3cRL2bx0VGV4+cBJZGwXJjR/LV3Suy09DmEu1n6cGjnYh9m42JDYKbzlymqBUuudssDkFSZirQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mblOqO3WvPwLXSffV38kZGvluvo7xWEK5UTp/MTMZn3dikzjKi
	wPRhP+RtE05RFa+axdFNWqMh4Fo2HdeDyw5AlnbO3Yq9EIKoB1Q9bg9PIZipVBjqVWE=
X-Gm-Gg: AYBFou2K4i3dIeqbqKr4EOqwVmlilwDhl5cucEMyATMCimO/pXk/DmYfMBmsIsfbkZR
	xpiu+N0KvrRcJHblJvbTKbs6z+87l+RujwFGt9RTglCR2WdDKX9GKV9QEj0tq+o6gpX5ywzzrut
	cJa9pzx7D5Vk0ig7ahGIYGUftoPjaG4z+54X4PriK3lbG2MUKl+XU69KocZndL+AcYxyEVvzCE0
	q/ysrKG4Bnp3zFC0+vgZb8QGXYcOuS9ELTwlcR6vi4H5Uqrhjd9M5Cp6G74OUFXBA9bKB/SUZj3
	cW6aXbIeOKGgmlVETuJP23/S5J91F+6d73NHk8mdwLRO1UGbzTmOPPHXzMplWQEVzuGR+dQID4p
	el5QXVkQVr58MilaQ3gWoxTvNeNa6qlldl4mpheyE4ELYWi/wJtbbdCnVQs0OajRYFSsHNqZYx9
	RVqSKh8n/P/DESF+QxSn4tywP68uPB/hDbeucvCUrjXFLjHuXgyfk9a1SPjs2Ozhc1Y871C7tXd
	1d095IeUTut9GF2p648CEOyKI9G2+Bowx/aM6Swy9ZkDLjRATWV
X-Received: by 2002:a05:600c:8706:b0:49d:191b:88be with SMTP id 5b1f17b1804b1-49d191b88e2mr92854595e9.0.1788908249551;
        Tue, 08 Sep 2026 15:57:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm419070705e9.6.2026.09.08.15.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:57:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 00:57:28 +0200
Message-Id: <DLAB1S5RI2GH.390CCRCOAB6TO@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH] gnutls: fix CVE-2026-5419
X-Mailer: aerc 0.20.0
References: <20260904133715.46685-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260904133715.46685-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 22:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245391

On Fri Sep 4, 2026 at 3:37 PM CEST, Jakub Szczudlo (Nokia) wrote:
> Backport patch to fix CVE-2026-5419.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-5419
>
> Upstream fix:
>   https://gitlab.com/gnutls/gnutls/-/commit/1e627aa5ad95c6dc0518d94e9a009=
997b081a1ab
>
> Tested with ptes
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patc=
h
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch b/met=
a/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
> new file mode 100644
> index 0000000000..f75aff35db
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
> @@ -0,0 +1,247 @@
> +From 2f3732538d7d8e1ae255ca68c20efc61a1d5b3e2 Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Fri, 4 Sep 2026 09:17:32 +0000
> +Subject: [PATCH] gnutls_cipher_decrypt3: make PKCS#7 unpadding branch fr=
ee
> +
> +This tries to make the logic of PKCS#7 padding removal constant-time,
> +by removing potential branching operations.
> +
> +CVE: CVE-2026-5419
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1e6=
27aa5ad95c6dc0518d94e9a009997b081a1ab]
> +
> +Backport Changes:
> +- Adjusted the upstream hunk to match the GnuTLS 3.8.12 code layout.
> +- Drop .gitignore from the backport.
> +
> +Reported-by: Doria Tang of Stony Brook University
> +Fixes: #1815
> +Fixes: CVE-2026-5419
> +Fixes: GNUTLS-SA-2026-04-29-13
> +CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> +
> +---
> + lib/crypto-api.c  |  53 ++++++++++++++++------
> + lib/libgnutls.map |   2 +
> + tests/Makefile.am |   2 +-
> + tests/pkcs7-pad.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++
> + 4 files changed, 152 insertions(+), 14 deletions(-)
> + create mode 100644 tests/pkcs7-pad.c
> +
> +diff --git a/lib/crypto-api.c b/lib/crypto-api.c
> +index 01539d5..7749fcd 100644
> +--- a/lib/crypto-api.c
> ++++ b/lib/crypto-api.c
> +@@ -497,6 +497,38 @@ error:
> + 	}
> + 	return ret;
> + }
> ++/* If succeeds, returns the number of padding bytes to be removed;
> ++ * zero otherwise.
> ++ */
> ++ unsigned int _gnutls_pkcs7_unpad(const uint8_t *block, unsigned int bl=
ock_size)
> ++ {
> ++	 uint8_t padding =3D block[block_size - 1];
> ++	 volatile unsigned int mask =3D ~0;
> ++	 volatile unsigned int count =3D 0;
> ++=20
> ++	 /* Count consecutive PADDING bytes from the end, in a
> ++	  * constant-time manner.
> ++	  */
> ++	 for (size_t i =3D block_size; i > 0; i--) {
> ++		 volatile unsigned int mask2;
> ++=20
> ++		 mask2 =3D -(unsigned int)(block[i - 1] =3D=3D padding);
> ++		 mask2 &=3D -(unsigned int)(count < padding);
> ++=20
> ++		 /* MASK is initially ~0 and will be flipped to 0 upon first
> ++		  * non-padding bytes.
> ++		  */
> ++		 mask &=3D mask2;
> ++		 count +=3D 1 & mask;
> ++	 }
> ++=20
> ++	 /* PADDING =3D=3D 0 is effectively excluded here, given COUNT
> ++	  * will never be 0.
> ++	  */
> ++	 mask =3D -(unsigned int)(count <=3D block_size);
> ++	 mask &=3D -(unsigned int)(count =3D=3D padding);
> ++	 return count & mask;
> ++ }

Hello,

In this added _gnutls_pkcs7_unpad function, in every lines, a space was
added just before the code from the upstream patch.
Why?
Is this the "Adjusted the upstream hunk to match the GnuTLS 3.8.12 code lay=
out." change?

If those space were added by mistake, can you send a v2 without them?

Thanks!
--=20
Yoann Congal
Smile ECS


