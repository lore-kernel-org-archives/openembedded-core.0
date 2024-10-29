Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2F4D3A66B
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 14:58:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.21848.1730213884635728089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 07:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YMAs0X4k;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539983beb19so6586752e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213883; x=1730818683; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHzQHuOTPo3yRyUG2xz5tHumWuqQB58/2a6VxDEMoEk=;
        b=YMAs0X4ks8cOYpmszEVGPbLd/JLnk4IByhkTSNZob6LnWh7sNJGuLetvdM4duNf300
         8GxKqnQn/77szEDJ65+SYiAqs8Ew/Vm//TvXF1gyIDZHo95QpxKBve2RNjKJV8E8Eqk1
         wbcpA+pKcOsSlXfYQy10MxMnhznm0755X/oWX8hppkMZ3zBKyzuGAl+xe7aCA18M/inr
         Z47JEu2D8pMEs8Bc90evOiTnKq6462dssBjPIe/0Ekoi89fQI0lJ5wV07ZtuNdYq/4Np
         HR496WIPraiNHa0EHP1izEWSkzEvkxfZ17KMopJND8ohmlWQns5EwNoGrfvaWVHgyt3W
         lHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213883; x=1730818683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHzQHuOTPo3yRyUG2xz5tHumWuqQB58/2a6VxDEMoEk=;
        b=JqUQ4fIVss3JBbffnH502S+bzmz9OdbRAWopSFMQyh8D3qBxwJTdm6njSFMrvB19oS
         oklFWxVeaTFzfbm0j77N/TDMwGncc+2enYg0ln2CfbEqCwbXNtEAoaFH7IPz+7uta3hg
         Y00/AWWjTuG49Jw5wGTlEoBtCkEmxFbutyQtvDaA/w1EMkulH2cjhLB9u42bNiCk9hIs
         44O5fB5sSa31CN/4HFhUxOV+P2cvxuDDm15gfP239TRJGADsvi/Ba2r/9lZoo5c0pXri
         A2QEaoXedHcM0j9Ud2FOgHhMFLdL1GKEvG1ru6H0QDsUBtV9Lu+kkymQSrwNeeyTGbWV
         9/HQ==
X-Gm-Message-State: AOJu0YzbX+BYdaPL5r8TSnsxQIkNbWiiSBq4/xmopU4rCInubNaDP+do
	oOs4HNM68pSIEsnLIN02GrdtCqf1F1UP/T20kuILvLhJGaHDU++wegmjnSkdEbvXcn4KiP/nb6l
	pbd+q8SvCjhRQSRb8U3R28oV2IgU=
X-Google-Smtp-Source: AGHT+IGwqu2UtaXfOY3Y/wEpy1JDRBeNr2GEoukRFFWkCCuG86kSpU5IE9lB7OvT67AvT58z1CjBmIsnwrfRFkRmmKs=
X-Received: by 2002:a05:6512:b0a:b0:539:8a7d:9fbf with SMTP id
 2adb3069b0e04-53b3490ef54mr6136040e87.46.1730213882595; Tue, 29 Oct 2024
 07:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241029091723.2851061-1-hongxu.jia@windriver.com> <20241029091723.2851061-5-hongxu.jia@windriver.com>
In-Reply-To: <20241029091723.2851061-5-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Oct 2024 08:57:50 -0600
Message-ID: <CAJdd5GZ_h98kVVoN52NpadAUKA4uWy3-XSPWr=Vq0Lb67X1kqw@mail.gmail.com>
Subject: Re: [oe-core][PATCH V2 4/7] meta/lib/oe/spdx30_tasks.py: improve
 debug log in add_package_files
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 14:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206505

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 3:17=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> While SPDX_INCLUDE_SOURCES =3D "1" [1], there are mess of `Adding file'
> in debug log
> '''
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/sources-unpack/COPYING to http://spdx.org/spdxdocs/gettext-mi=
nimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a818397af8b8ddb=
45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-native
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/gettext-0.22.5/.tarball-version to http://spdx.org/spdxdocs/g=
ettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a81839=
7af8b8ddb45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-n=
ative
> '''
>
> Summary the total number other than print for each file.
> '''
> DEBUG: Added 7201 files to http://spdx.org/spdxdocs/gettext-minimal-nativ=
e-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a7751=
9ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
> '''
>
> [1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX=
_INCLUDE_SOURCES
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index e0b656d81f..5aeed5cd6f 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -155,8 +155,6 @@ def add_package_files(
>              if filepath.is_symlink() or not filepath.is_file():
>                  continue
>
> -            bb.debug(1, "Adding file %s to %s" % (filepath, objset.doc._=
id))
> -
>              filename =3D str(filepath.relative_to(topdir))
>              file_purposes =3D get_purposes(filepath)
>
> @@ -187,6 +185,8 @@ def add_package_files(
>
>              file_counter +=3D 1
>
> +    bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.doc._i=
d))
> +
>      return spdx_files
>
>
> --
> 2.25.1
>

