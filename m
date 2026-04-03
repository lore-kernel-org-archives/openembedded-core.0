Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4A6E88D72
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 22:53:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6689.1775256812328395571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 15:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B9GMIn/P;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so29837575e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 15:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775256811; x=1775861611; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YL/NOFzFgdSSRkmnuLmtD8L5G6brLUg/fZ+1UXvhczc=;
        b=B9GMIn/P+/0Koc4zJujuEUrDqweHEThznFLd0jjmxF5ADVG9mhU3Hz0CZJDPXDnFZy
         Cp8fhg2V3Sz+NcL9PhMU0SJqtGKeK8lBObrjAsSIpa7fxP3Yrw5kwde1WhoIhvb5Vu+f
         h31QuKxGeCQCEHkeRn30K2CX2O+OCvVcDZph4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256811; x=1775861611;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL/NOFzFgdSSRkmnuLmtD8L5G6brLUg/fZ+1UXvhczc=;
        b=GzEkSWRedZ0XsaUtjeOJGSm7USrYrXyPktp5vfFt4GvG6kERQN7MHb/5L60Bz7j6hc
         bDd/IV0mq43Joc+X2JJIo1CROnLwKhKDeDezO/mhf2p4l6pH4Lp88+XGW++aCaOniAvQ
         mbKBRV4QaLSTbJbHHSg1mQLJobob/LYHDkfIKIMpKo74lBxSZH17K9qWpiu1NIiYBw14
         zECck+Io7tPn5ki08JzAEerV9T/zoy+tb/ytVJVK1GIgy5LpdmtkqpAhbPGglP29rB4W
         eyHRHjINoPrGUUtCOcq6WFRyDilgdow/1mQJgI2T2zbdRmt51kkWUE9/uHpADjw3n2i+
         s/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUz4/HO6Z7gpE5xnZegDA+lrC0J2Yegh6y0D01SYHz0hqetmYUIGYgvkqNHbGuLYn7s/Qw1s0bvQfzn8WglifPjdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw87tnAJ+kHR7bk6gi+Noh+vhxHoSpDdA6dWaG9OZ9m3ahuN4f0
	pFHw4XPGeCVv/xPtsVI6eOZ0X2GxxZVHAIzSAVPD7Fk+uQ1CCqIOsJlBXjgjRNxD2vY=
X-Gm-Gg: ATEYQzwJcKpX6orfg9BixxIuwyFRMarW2j0KllwwXR/iIrgxDs8xy+yqd/ZvBdsvbk2
	33Uz6/Pcfz2DEbuOTYzezQPF4VnUWJ2s+SXWnMPnRYJmdiLhcNNWfeetwgySyS/dMo5KY4NOh5A
	Kz+v1kl8bXiMfMDqIKiV/FEc6h5ht3MCm0bOZ+LMjj0q0rgqJFZ86gdwMuNaGZEGaUs8y4CXxdg
	wQkizsh8Tkk5Qm11emwvxd6Jq3+yFXy22mxZ9RUIcpCijpXZNo9J1su0V+v/Q86d+gFD9eoo+Vu
	SBwWDJdAh2TYqExU8UBXxvRLoCsUr+vIhiR6cU+lOzSkWCrc1mMwf57PFdAx4W7xnzPQjny9e/y
	8mcpAl28OcS5PN2XPIyC27bP+chd457gj+JPuEeTBWqZDbzzNt+vNqqBtgvfcY2KFta0I96lBiC
	CBSw+Lp+hpmqmFW1KaWOaH49j8uuFzn/igQyng1jRCxdRgE1GvNC5rfDGEe7iwvNSGCGUYpbN2+
	JnrvX30vm5WTx4=
X-Received: by 2002:a05:600c:3105:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-4889975f7ccmr66414155e9.13.1775256810660;
        Fri, 03 Apr 2026 15:53:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm498614325e9.2.2026.04.03.15.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 15:53:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:53:29 +0200
Message-Id: <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260402071559.292708-1-vanusuri@mvista.com>
In-Reply-To: <20260402071559.292708-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 22:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234606

On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via lists.openembedded.or=
g wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Pick patch as per [1]
>
> [1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
> [2] https://sqlite.org/forum/forumpost/761eac3c82
> [3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

As far as I can tell, this CVE applies to master. Since this is the end
of kirkstone soon, I'll take it into the reviews series but can only
merge it if there is a patch sent for this CVE in those branches.

Regards,

>  .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patc=
h
>
> diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/met=
a/recipes-support/sqlite/files/CVE-2025-70873.patch
> new file mode 100644
> index 0000000000..86004c0b74
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> @@ -0,0 +1,33 @@
> +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Sat, 6 Dec 2025 20:41:24 +0000
> +Subject: [PATCH] In the zipfile extension, only return as many bytes as
> + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
> + 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixt=
ure if
> + ZLIB is available, so that tests get run on unix platforms.
> +
> +FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6=
a4c26160909
> +
> +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c=
59d4d75c03f23d5fb70feac9f789954bf8a]
> +CVE: CVE-2025-70873
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + shell.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/shell.c b/shell.c
> +index fa45d40..3c4902c 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -7668,7 +7668,7 @@ static void zipfileInflate(
> +       if( err!=3DZ_STREAM_END ){
> +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
> +       }else{
> +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
> ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree=
);
> +         aRes =3D 0;
> +       }
> +     }
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes=
-support/sqlite/sqlite3_3.38.5.bb
> index acdd80022e..9e10caa399 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> @@ -10,6 +10,7 @@ SRC_URI =3D "http://www.sqlite.org/2022/sqlite-autoconf=
-${SQLITE_PV}.tar.gz \
>             file://CVE-2023-7104.patch \
>             file://CVE-2025-29088.patch \
>             file://CVE-2025-6965.patch \
> +           file://CVE-2025-70873.patch \
>             "
>  SRC_URI[sha256sum] =3D "5af07de982ba658fd91a03170c945f99c971f6955bc79df3=
266544373e39869c"
> =20


--=20
Yoann Congal
Smile ECS


