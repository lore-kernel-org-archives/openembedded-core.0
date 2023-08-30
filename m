Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A33C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 16:25:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.1675.1693412744212205696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 09:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xvvdOV4p;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52a1132b685so7928634a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693412742; x=1694017542; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5++x5+uQzo7nkh14OYLWzFUeI7L8Z1C/1ZMcbbKGRA=;
        b=xvvdOV4pNF/6Cu53g36oe7/ujT1vYc2v5zw1Um9dpcFvSD2wYUEf5uXzQqiuE8uERb
         USMUDs1mGWN0pbGIFIYQlojqM6sAQC4YxuYONYRYJtp3Uua4btkNlpe3Ryz8Raw6EnFW
         26v6+yX3VGgjHXjFPJplaythO6U2TLOdnkv9V+vsS2n03OUCKpGuuOjaQ54MmOdYEVmP
         a1NFXGCI0ntWWHwRRXt0QNyyL7CPpQth9BQrYD8F5v7/xWGUI56Hd9J9Tfjnm1A9a+D0
         goBErdBWo+HWuUT85zxO5e2xHkO9CRMPNPmvo6TGwGe46dwFAQ3BLxShvEcncCqqPdTS
         loqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693412742; x=1694017542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5++x5+uQzo7nkh14OYLWzFUeI7L8Z1C/1ZMcbbKGRA=;
        b=DF3u0qpjY6vfZGpUzVLXtwjJ+WgJBOwNs7OM/x7Fam/m3AMZHEIVsPc4H1W+Rm/xGe
         YcYhHSKTbSeSFIpRjUjtseORQnI4OEk3OLdIYsNqyOpuBeO/LARPrjenKaGOdjoV5pRn
         fctJWRL5aO4u43rGjsSg50YoNV1Q8UCMJTY+lhbEn+Dc/Ooaygb+ACjUpKTNZHHKb7Ou
         pabx2IIkXXn9eAwbAngwkA5URUzUYLwcvNtz4J1XfPR8QqWfm0e7d5hZBGLjjKEbbeSw
         JSJ4ZU9BNhQAoJunGeTaxj2L9LAaFd+ZBotWIBJPtlT/nxODtEz9/493qUsXW46zAHrv
         jeqw==
X-Gm-Message-State: AOJu0YzuAOyXShhP/Ap+e9yFdK0QhhVPmivCvjbKy0971tDQbNcCANR6
	kRBSRz7iKONpHAL1EGWDIoro/6Ub2htLQw0mWMRuVA==
X-Google-Smtp-Source: AGHT+IG0Zeh/n4s+Z1TPMsxyakMTIcKMHu19D571XOt2lD+Wyade5EtkBxF1Xm+lJBN2bchK4b63DUZSN/NNazVwkFg=
X-Received: by 2002:a17:906:21c:b0:9a5:c9a4:ba1a with SMTP id
 28-20020a170906021c00b009a5c9a4ba1amr1991964ejd.59.1693412742500; Wed, 30 Aug
 2023 09:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230829170046.231673-1-adrian.freihofer@siemens.com>
In-Reply-To: <20230829170046.231673-1-adrian.freihofer@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Aug 2023 06:25:31 -1000
Message-ID: <CAOSpxdYv-UMU3POD5F5uOxYp18v1BxjWzv7WuVeVAty2G+K0jQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] json-c: fix CVE-2021-32292
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 16:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186899

On Tue, Aug 29, 2023 at 7:01=E2=80=AFAM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> This is a read past end of buffer issue in the json_parse test app,
> which can happened with malformed json data. It's not an issue with the
> library itself. For what ever reason this CVE has a base score of 9.8.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2021-32292
>
> Upstream issue:
> https://github.com/json-c/json-c/issues/654
>
> The CVE is fixed with version 0.16 (which is already in all active
> branches of poky).
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../json-c/json-c/CVE-2021-32292.patch        | 30 +++++++++++++++++++
>  meta/recipes-devtools/json-c/json-c_0.15.bb   |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2021-32292.pa=
tch
>
> diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch b/m=
eta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
> new file mode 100644
> index 0000000000..7ac08c4cb0
> --- /dev/null
> +++ b/meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
> @@ -0,0 +1,30 @@
> +From da22ae6541584068f8169315274016920da11d8b Mon Sep 17 00:00:00 2001
> +From: Marc <34656315+MarcT512@users.noreply.github.com>
> +Date: Fri, 7 Aug 2020 10:49:45 +0100
> +Subject: [PATCH] Fix read past end of buffer
> +
> +Fixes: CVE-2021-32292
> +Issue: https://github.com/json-c/json-c/issues/654
> +
> +Upstream Status: Backport [4e9e44e5258dee7654f74948b0dd5da39c28beec]

Should be Upstream-Status (you missed the dash).  I've fixed it, but
something to keep in mind next time, otherwise an error at build time:

ERROR: json-c-0.15-r0 do_patch: Malformed Upstream-Status in patch
/home/steve/builds/poky-contrib-kirkstone/meta/recipes-devtools/json-c/json=
-c/CVE-2021-32292.patch
Please correct according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
:
Upstream Status: Backport [4e9e44e5258dee7654f74948b0dd5da39c28beec]

Steve

> +CVE: CVE-2021-32292
> +
> +Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> +---
> + apps/json_parse.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/apps/json_parse.c b/apps/json_parse.c
> +index bba4622..72b31a8 100644
> +--- a/apps/json_parse.c
> ++++ b/apps/json_parse.c
> +@@ -82,7 +82,8 @@ static int parseit(int fd, int (*callback)(struct json=
_object *))
> +                       int parse_end =3D json_tokener_get_parse_end(tok)=
;
> +                       if (obj =3D=3D NULL && jerr !=3D json_tokener_con=
tinue)
> +                       {
> +-                              char *aterr =3D &buf[start_pos + parse_en=
d];
> ++                              char *aterr =3D (start_pos + parse_end < =
sizeof(buf)) ?
> ++                                      &buf[start_pos + parse_end] : "";
> +                               fflush(stdout);
> +                               int fail_offset =3D total_read - ret + st=
art_pos + parse_end;
> +                               fprintf(stderr, "Failed at offset %d: %s =
%c\n", fail_offset,
> diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-d=
evtools/json-c/json-c_0.15.bb
> index 7cbed55b3b..4da30bc50c 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.15.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc351=
23ba193fea8ee216f2"
>  SRC_URI =3D " \
>      https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
>      file://run-ptest \
> +    file://CVE-2021-32292.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f=
7d4322f02341a4c6"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186865): https://lists.openembedded.org/g/openembedde=
d-core/message/186865
> Mute This Topic: https://lists.openembedded.org/mt/101035436/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

