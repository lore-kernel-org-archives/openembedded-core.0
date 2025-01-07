Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF2CE7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:55:28 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.20598.1736258126775063698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IFy/lx79;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e46ac799015so19345223276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736258126; x=1736862926; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+b6J0td614mKIO6X+WY8OwxnX3JGpZvlrP0lfxOLuM=;
        b=IFy/lx79Og3OU+q65okUniCKra3V+SvflAy6cthJf/oIignI+6ZgtKm7c9gMUxniJJ
         XOcueirGFttasDrpuiBEOusG3NK6qZH1GPGvas7r9LiC76a0R+bRzNfLOXIiqCpEBaG+
         JeL5gQRfqf9Xns3PB8bGYUkPMpoAVF0cabi7Z0WySdNgue+bYYinss05L3q4/LP6WOci
         lIVBdIZ44eUL3p8MoovaxosRVPYdkWZJ0q9dLvZclw7j6NOBaFzsEvi7mmKKticzIP2F
         hriHfjx6KxBIbRLcR9XAHeshpEIpy5tmDv84CLLZ7895l0fJBqSWi5PVGh6Nur42iwsT
         auPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258126; x=1736862926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+b6J0td614mKIO6X+WY8OwxnX3JGpZvlrP0lfxOLuM=;
        b=CKeXHhu7KyQuIj0RzaPtcH8X76sHDDvAurvApTlYwV+4q/QIN0jeOonZQR2zOuP73H
         Ml39nHveQ6QEgXOmRl0G5oyy8AcK/Diaxw4gzvjj93W0hJkeR5I0+n76MYDVlZp5ScPG
         h97GOoHXzhugA51V5PlL78OtZR/HgWWMnzsl4E3eErJmFS4BsoQZil8mD3Av4Ug5gLMi
         QRn+ujTFcf6N2lOdUor3avXEJY3+eg6YN5Kpmrhde3bHd4fflATkfUT56WZeyd4V6gDh
         Sga2o6tytHU1NUJ+f9eBHDkiLw7b36Vr+Rqroo9jdceVezw2QuRpazEEYw96VdLybHDl
         ZMCg==
X-Gm-Message-State: AOJu0YzantW80tZJqbdN5HB9q+5XoZ3LxB3SAOeIP+1IexYpeFkFVJql
	4IxxNbUB4GkRw8S1hSbKd3dM9VJJ81yIkmQUwx5dzkkbhF/EJXSwYOlWKtwnpOUK2OfZrY9Xp0q
	Dnvr4F4T0opJg+1ARv7hS3Q+HUcSrq3g4FJUyJw==
X-Gm-Gg: ASbGncv0GBWfwNYn7dmY3pKm076L/kY8MH4U2TUP3ssIvcdQ66obv2WQbe9PZ4E7KEC
	6Uyl+SoMLIqew6LvhPAMF3S2K0Pan76+hDkrh1g==
X-Google-Smtp-Source: AGHT+IGFREuwOkIyu9zOBIzNkqqPe1D5jTtDQdGuqG7nVW2EUDiMS2dlAScmD+gl3j85ZLvmGgOZz25z8NCdXO7qe+Y=
X-Received: by 2002:a05:690c:4c0d:b0:6ef:4ed2:7dda with SMTP id
 00721157ae682-6f3f7f33052mr482942127b3.0.1736258124493; Tue, 07 Jan 2025
 05:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20250107054539.4002240-1-mmeerasa@cisco.com>
In-Reply-To: <20250107054539.4002240-1-mmeerasa@cisco.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 7 Jan 2025 05:55:13 -0800
Message-ID: <CAOSpxdb82DqKg6tQG0wcO+rpTeFGF3mEpABprEu=NpFFgJEE4w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] db 5.3.28: Ignore multiple CVEs
To: mmeerasa@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com, 
	pooadire@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209472

Hi Mohamed,

This patch will need to be submitted and accepted into the master
branch before I can take it for the stable branches.

Thanks,

Steve

On Tue, Jan 7, 2025 at 3:35=E2=80=AFAM Mohamed Meera Sahib via
lists.openembedded.org <mmeerasa=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Analysis:
> - Unspecified vulnerability in the various components of Oracle
>   Berkeley Db was identified as potentially exploitable without
>   authentication. Later these were closed by the Critical Patch
>   Update (CPU).
>
> Reference:
> [1] https://www.oracle.com/security-alerts/cpujul2015.html
> [2] https://www.oracle.com/security-alerts/cpuapr2016v3.html
> [3] https://www.oracle.com/security-alerts/cpujul2020.html
>
> Signed-off-by: Mohamed Meera Sahib <mmeerasa@cisco.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/=
db/db_5.3.28.bb
> index a7d061e0da..d93e77a1ee 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -120,3 +120,20 @@ BBCLASSEXTEND =3D "native nativesdk"
>  # many configure tests are failing with gcc-14
>  CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-function-de=
claration"
>  BUILD_CFLAGS +=3D "-Wno-error=3Dimplicit-int -Wno-error=3Dimplicit-funct=
ion-declaration"
> +
> +# The risk matrix of Oracle Berkeley Db was published in July 2015 by wh=
ich many vulnerabilities
> +# in different Oracle products were identified.
> +# https://www.oracle.com/security-alerts/cpujul2015verbose.html#DB
> +# The Oracle Berkeley Db issued the Critical Patch Update Advisory in Ju=
ly 2015
> +# which determined the status of the vulnerability whether applicable or=
 not.
> +# https://www.oracle.com/security-alerts/cpujul2015.html#AppendixDB
> +# Apart from this, different CPUs change status of the vulnerabilities e=
.g.
> +# CVE-2020-2981: https://www.oracle.com/security-alerts/cpujul2020.html
> +# CVE-2016-0682, CVE-2016-0689, CVE-2016-0692, CVE-2016-0694, CVE-2016-3=
418: https://www.oracle.com/security-alerts/cpuapr2016v3.html
> +
> +CVE_STATUS_GROUPS =3D "CVE_STATUS_INGR"
> +CVE_STATUS_INGR =3D "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-=
2640 CVE-2015-2654 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 \
> +CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 CVE-2015-4778 CV=
E-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 \
> +CVE-2015-4783 CVE-2015-4784 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CV=
E-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2020-2981 \
> +CVE-2016-0682 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418"
> +CVE_STATUS_INGR[status] =3D "fixed-version: The Critical Patch Update of=
 Oracle Berkeley DB discovers these vulnerabilities may not be remotely exp=
loitable without authentication."
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209451): https://lists.openembedded.org/g/openembedde=
d-core/message/209451
> Mute This Topic: https://lists.openembedded.org/mt/110475404/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

