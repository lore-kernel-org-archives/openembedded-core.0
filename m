Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A18C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:56:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5753.1742280975076902975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCRtebdn;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2239c066347so108889395ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 23:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280974; x=1742885774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LrFIxZIIYdadx2qZKp9Z2pNnh8FZKnxZD6z7r9pMuv4=;
        b=mCRtebdnbhb/1Ka2YY2X2asaC7ydqCRkxvUVOIgZ4LH79SfqU1FyvCUjW6EH2brTEm
         Wi3qgGxsZ+kCyt28DZkQjdJXTEYIOsX9ZL6C1F4Saa2/Xdi3vXY/6ZFQXf2Mz9BkcLKg
         NlN7BOwx5rl8I/K/mjDJ3VOfIaO/mZJQTjD+3ETaabay589BTxBcC/dgxIDmnJhh6sY9
         RUamV6Gm17MH5mrEWPo1iczzmLy1r6xR4VXE4d1l7IpV3TUkV98qai1rbgUyVDxJFcJj
         09NhdnCAeMK+49exuBzRjJhOmBtK1uLFgcNDjejnH/H8JaJS3Et1UjRBQ3WGkxKSJMgR
         BEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280974; x=1742885774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrFIxZIIYdadx2qZKp9Z2pNnh8FZKnxZD6z7r9pMuv4=;
        b=oZuopkR4+4b3PpasitWLLyuEBa38fbNfmTLdbIBsYj7UXSFN1GR1T9Fae7u9SneQ4N
         twA6PS1sYD32x/WTcIcCsPy7kgJLB7oxXAAmdVOKDYbe4dQoRrSSOtBOvhnGtkxvdGuO
         IB/29J7YvVzYZjnpnZLiP9l6EtwyZW+u6XqpKm13Zis8rtCy+vX2ZY7kYIWNR++BKsOq
         5jkq17ylqA2T8MKL7k8CmTe5R5pKuFKStOxWSIdtEbefUUAnE5Sf5+vyhXoGMCybRRvX
         ZvwPJbvE6VnQX9HFf+npGLzpQH3I3Z/xkheZYFxGCAdboNln531IYjUL/nCkXixaKdjJ
         HICA==
X-Gm-Message-State: AOJu0YyotcB+3ind9QuftSD6WBH6ZLnQapXF2wTV1Xdr5Rm6S8aMD9HC
	MDwCz8WLYaeyoZVQz0skdHi3Sa08Km4K53egmGWqKg96KbgOSs0M8UUXY5vRg4uJ12RuV15tq/1
	EDztZazKTne0QHb8ZZJukLRaId0/qIg==
X-Gm-Gg: ASbGnctmzYbqUntM7Ns71hnL6jCpyv5nLoBUEiZETAdtrvGkqBhJwNJqzGdvJ1vbI2Z
	wEAvmgxl1UWMXn3+mTqv9LyA33w4RDH+czxn+3ZotdECDTEVpkM+N76fN7b/2p8qKKC0YjsaRky
	wYrF0g3V9quBlHNWqlj3/1ezt2Y07v
X-Google-Smtp-Source: AGHT+IF0PbRq2eeqzg0TTr/RL1Q7Wwa8fz7XjlPhKuCjMqyGc0Lo75fSv2g+G46wqXUQXRfQY7jspxotDqjJwT7ISdg=
X-Received: by 2002:a17:90b:1847:b0:2fa:13d9:39c with SMTP id
 98e67ed59e1d1-301a5b16adcmr2120632a91.14.1742280973701; Mon, 17 Mar 2025
 23:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250318065403.8198-1-marta.rybczynska@ygreky.com>
In-Reply-To: <20250318065403.8198-1-marta.rybczynska@ygreky.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Mar 2025 07:56:01 +0100
X-Gm-Features: AQ5f1JrRtO_O0kn-jozntA_IlAbajQONNqNF4pjqI_HUomkNcu7iTpPhmgrkmcc
Message-ID: <CAApg2=SHr+uahMKSudWA605zHHpt2mCCGuxvT8i1-xvZGzP-xA@mail.gmail.com>
Subject: Re: [PATCH] cve-check: change the default feed
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000089595b06309866ba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213180

--00000000000089595b06309866ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 7:54=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com>
wrote:

> Move to the FKIE feed by default, as it is showing better stability
> than NVD2. Content of the feed should be the same.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> ---
>  meta/classes/cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index c6a410e2b2..555fdaad77 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -32,7 +32,7 @@ CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>
>  # Possible database sources: NVD1, NVD2, FKIE
> -NVD_DB_VERSION ?=3D "NVD2"
> +NVD_DB_VERSION ?=3D "FKIE"
>
>  # Use different file names for each database source, as they synchronize
> at different moments, so may be slightly different
>  CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if
> d.getVar('NVD_DB_VERSION') =3D=3D 'NVD1' else 'nvdfkie_1-1.db'}"
> --
> 2.45.2
>
>

This is late for the release, but I think it might be a reasonable choice
for months ahead of us.
To be discussed.

Kind regards,
Marta

--00000000000089595b06309866ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 18,=
 2025 at 7:54=E2=80=AFAM Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@=
gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Move to the FKIE feed by default, as it is=
 showing better stability<br>
than NVD2. Content of the feed should be the same.<br>
<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@ygre=
ky.com" target=3D"_blank">marta.rybczynska@ygreky.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index c6a410e2b2..555fdaad77 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -32,7 +32,7 @@ CVE_PRODUCT ??=3D &quot;${BPN}&quot;<br>
=C2=A0CVE_VERSION ??=3D &quot;${PV}&quot;<br>
<br>
=C2=A0# Possible database sources: NVD1, NVD2, FKIE<br>
-NVD_DB_VERSION ?=3D &quot;NVD2&quot;<br>
+NVD_DB_VERSION ?=3D &quot;FKIE&quot;<br>
<br>
=C2=A0# Use different file names for each database source, as they synchron=
ize at different moments, so may be slightly different<br>
=C2=A0CVE_CHECK_DB_FILENAME ?=3D &quot;${@&#39;nvdcve_2-2.db&#39; if d.getV=
ar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD2&#39; else &#39;nvdcve_1-3.db&=
#39; if d.getVar(&#39;NVD_DB_VERSION&#39;) =3D=3D &#39;NVD1&#39; else &#39;=
nvdfkie_1-1.db&#39;}&quot;<br>
-- <br>
2.45.2<br>
<br></blockquote><div><br></div><div><br></div><div>This is late for the re=
lease, but I think it might be a reasonable choice for months ahead of us.<=
/div><div>To be discussed.</div><div><br></div><div>Kind regards,</div><div=
>Marta <br></div></div></div>

--00000000000089595b06309866ba--

