Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C331C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:27:02 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.10232.1678804017133574190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6DHLHeHU;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id cy23so62684556edb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678804015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gYFNFE7YeL5B9rhw3uakGNWKH28pxh/HEJ6AJNsxXM=;
        b=6DHLHeHU8bBIOh+wze/1CdPPB97BnzUZHdopx4h67G4tJF1SX29gMrlnddPdG9e9r8
         PbvlPTP60WDNtqbJPqwgm5r8Sk25VefO+b3qN3r/bza6AGDV2sMTxCWq4VCppdLoRcTF
         CKpOxPr4yRVlahfGkYMxZ4jdDg1+SPVmWGGW4tVE9W7khXlG77LD9iHfao/1ZSLNSU90
         XtzoUTpPsY2e8z0d61endI7e7qVTcLoCxTFsuzQTYbfUz0kyjoo2V2oxJCc22heJan8v
         VpvXZ7faoPsVVXg+c2YJJH+YXKAg6QBIPa9gl8Dn9ui69iuJJaTvRZZLBXo0XQchzqsR
         vh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678804015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gYFNFE7YeL5B9rhw3uakGNWKH28pxh/HEJ6AJNsxXM=;
        b=BpbV3F/vwXmEfXhDnyn79vxuQswE5Cmt8Vyxtz9+HQhtvkdiMYlwufrHMLLRT/okZ6
         nH48IsXbecwVQ1W8nlVYDd8wMEVY+RzpFk2mfuTfirMYp4yORClAtQ7RfIGjfgn2RLhA
         1LI3d9w8ooj4jAwIipQLmiLImi3vCZW7U0JbIbCwK7ILthw4VB80hfYXDzgJ6h8uz26P
         oRX2gvNM6fHAri4pPYAA8K0eBD1z2i0FVUsvrmIOxPwgVcDfeFmrvQgSPnQ/x0CRFlvw
         vGW9zlx08qJPLYM39frFwNJKnXNr5GeWTPTMqc/9yG03GyTQtubNyMW6ugAXj/+HJ49e
         uW3w==
X-Gm-Message-State: AO0yUKUIteS/gdwINuBNbtPI5cUZKlyM5OLi9fG4JlJX4p5d0kuTdwdl
	oY0GyQ3xhQFfMYDhQIt5te+DWgyb2YA7pUnPjeiHKg==
X-Google-Smtp-Source: AK7set+tnx8H+ym2coBZa7HkuWcYddvdpj/PEaZJ66I0cj3dI8vlPyQwGr4IFKJ77xLHdZqz8Pj4ZZ/i3R9BSahquKk=
X-Received: by 2002:a50:cd58:0:b0:4fb:482b:f93d with SMTP id
 d24-20020a50cd58000000b004fb482bf93dmr4877558edj.2.1678804014911; Tue, 14 Mar
 2023 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310095402.85948-1-andrej.valek@siemens.com> <20230310095402.85948-2-andrej.valek@siemens.com>
In-Reply-To: <20230310095402.85948-2-andrej.valek@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 04:26:43 -1000
Message-ID: <CAOSpxdazA3tfN_cQNmiL65CCauJ4uJr=6xs=DWcY-D22g0nv+g@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178493

On Thu, Mar 9, 2023 at 11:54=E2=80=AFPM Andrej Valek <andrej.valek@siemens.=
com> wrote:
>
> All mentioned CVEs are related to HSTS check feature, which is not
> implemented in version 7.69.1 .

Is this due to an error in the CPE database?  If so, perhaps the
better approach would be to send a version correction request to
cpe_dictionary@nist.gov

Steve

> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 899daf8eac..ea36c0bd3d 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -56,6 +56,9 @@ CVE_CHECK_WHITELIST =3D "CVE-2021-22922 CVE-2021-22923 =
CVE-2021-22926 CVE-2021-229
>  # This CVE issue affects Windows only Hence whitelisting this CVE
>  CVE_CHECK_WHITELIST +=3D "CVE-2021-22897"
>
> +# HSTS check feature is not implemented
> +CVE_CHECK_WHITELIST +=3D "CVE-2022-42915 CVE-2022-42916 CVE-2022-43551"
> +
>  inherit autotools pkgconfig binconfig multilib_header
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} g=
nutls libidn proxy threaded-resolver verbose zlib"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178321): https://lists.openembedded.org/g/openembedde=
d-core/message/178321
> Mute This Topic: https://lists.openembedded.org/mt/97516349/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

