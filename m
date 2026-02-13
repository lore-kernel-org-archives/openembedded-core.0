Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2E5EEA876
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 01:45:08 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61717.1770947099588101772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 17:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lwc7bypz;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-463a0e14abfso26358b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 17:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770947099; cv=none;
        d=google.com; s=arc-20240605;
        b=eViIX5bAwa5DQU7SiW8F4okDE4DYckQNR1mZpt49Uo/hBzuafaHJAH4qxylpOyFqiw
         oSD0kQ3kTrpW+5LR2KiWhz/iSfriI0Arn4RiwkozEF63R1YeY8tNZp6FR9G6SvACQuD+
         M/GF3LW8hmfswx2ih+P2BWP0ybaOj8TSDnKwE2C8meMGL3Q5aRr/kvtk91UbHB7AqKB5
         cF1K6Ezvsd/KhTp//Auw3GmuSIfrQeivV2+ov0Pa6rLrSHCE5z/AQD+18x5/+XMkhaQm
         8t/RHTdklYb0u1wyKwX0vtjQZYxoShdTvCW9mdG67tFh4HLMAFTa/eR9qGwP/h9bLKjV
         subA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRq/7BTVo8uiMiKyNKG+I+wTqWJ5uYrJBEHlm9/v8r0=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=XzIdnpJrGgLeOh7LqUXCHAuckt13EfOG0EmMHL3yLpZhVgAKeYHrizrOi6w/BWb4G+
         xUsrWOGS5mPiXe8e7ZGCAySqO3eIrng6r1Xc4zcJNV/vcIxCEW6YwTaH6WXZoFD10CEC
         FZRuyNebPPszaSup2y6F8GI5xuhClL/jyfZJYlSxSl5Sc9RJKuBBb6kVBYUHnkyiqSNc
         31EkeAZoAdbc2eNv37hoCjkRgvBhnSJZl90jYfii546pAsS8x2PFlrCVswkIBa35vLyO
         jOvZfO6/Ni5VR87Zfu7zdfXfP/i2RuKbFx9ucCL/MDznsBLWhGAwCM5rEYpXCH8mE7Uo
         meqA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770947099; x=1771551899; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRq/7BTVo8uiMiKyNKG+I+wTqWJ5uYrJBEHlm9/v8r0=;
        b=Lwc7bypzvtqkAS5w4Iedtb2/OleNZ1Ar42s3gRo4jG13LAxOJ6Cz7wuhLW3kY3+uMB
         fItxVTK5ObWATyUheLAWDvSns3XP5VzqrtFs0lPKaY93/+bptqSbmJa0YC21V4G/JopL
         b/qb4oZDI8gzEFcTsyyzqYPBs6btZRo+tXPF/Lx5/aD1PA7Uh0GY2m+5rgGgzZDx7raM
         UxJIujfpgQzVBDtByBwhX2a+QGB0ckCUZNwOtNYCIy9Z9jypmafPY/bow7aKCJXQXqyR
         B/WTOF9qgxdNlOznwi8nP/pYtK4BwEFSvSj8j/zpO5GvB/yq+Nu2+8uGCcckO/p30Kma
         25RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770947099; x=1771551899;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LRq/7BTVo8uiMiKyNKG+I+wTqWJ5uYrJBEHlm9/v8r0=;
        b=VKmvB5FJvhO15zXhyOtcgZdomlfBjA7FdscexQIBnepXPE9r/JrkxfjKydUbhkBrH0
         BqkJtF507EKLgpX7cjRG0Cs7/ftY84P1Ewp15CN3fG3hhwiLnOAHFLYE+wITpD4Kvwnm
         X6bKAP6wCrhDP+ZOfGOfHGoDYJ98eCLHcBbh7/HDBRmVpCywwbwf5p1aiP/XQ01YyZct
         YrAoO3CWdjMpRnULyPiulMuuQtDCUeLe2P/qRjFkwoJ2ikhEcjKWwdPUFtV/rIfbmMaO
         OGdcKnBgl3PfAioFt7G2Xwryy8H20TXi7b0sJgtsaH478ahEYsg1HZRgzr3yrvg4SrB5
         nhew==
X-Gm-Message-State: AOJu0YzjT2ec230IFoJnkwL1zJHWUfJ2VIjvndk/kJEG1/S2nkzd6bRZ
	05AFX64HJThU7/uv0qd9S2JFvmSrNkuSPfXLXXZF7LHyuUPBB+spAzFLclja0ho8KfmbepGz9/v
	wMeQr1LZAOgc1g8d8BDDtkqDuPlw5m8kxNg==
X-Gm-Gg: AZuq6aJf3LO26JdpifhPAnhswVdycgMs05yokxjN+9BbqRN5nfb9l/DKdtoMdn5FzcT
	LPEiwMHI5tyBrYe0KwQmbEDkIwdbHnD8jCNRP1ANQsWrQ8xxIQa9/+ikpk17RdSzS53bUgjQH8o
	ZjiJDONE1vIxFRv+uio1v2e3mkPSPxxoPXogZ/R78y7UqGEODEdOpo8cJr3pFp8pqcCUXoCuqfA
	QVwNMbKW8Omcm+qQs2/t0GDUh6hEihTHisFRbJqCUvxQj0RdMIwkAOnKOisE3ngGq2PjnAlAENj
	/eTkRsjx
X-Received: by 2002:a05:6820:498b:b0:672:d632:b1a with SMTP id
 006d021491bc7-6771ff7c080mr371465eaf.12.1770947098340; Thu, 12 Feb 2026
 17:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com> <20260213014119.3451355-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260213014119.3451355-2-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 13 Feb 2026 14:44:47 +1300
X-Gm-Features: AZwV_QiiHRXjrkMNqD7Eu9smou7hCQPwhF7iqIMQM5sVySK5fyEDtu56FQoyYH4
Message-ID: <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 01:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231081

Hello,

Since I am unable to reproduce this error locally, I have sent this
series only to be tested on AB to investigate further.

cheers
Ankur

On Fri, Feb 13, 2026 at 2:41=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> This patch is to validate a possible race condition theory during install=
.
> Also fail the build if sed substitution still fails for further investiga=
tion.
>
> Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16166
>
> [YOCTO #16166]
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-extended/mdadm/mdadm_4.5.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.5.bb
> index b30d3d776e..7dda5b064a 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
> @@ -40,11 +40,15 @@ EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CWFLAGS=3D"" CXFL=
AGS=3D"${CFLAGS}" SYSTEMD_DIR=3D${sys
>  DEBUG_OPTIMIZATION:append =3D " -Wno-error"
>
>  do_install() {
> -        oe_runmake 'DESTDIR=3D${D}' install install-systemd
> +        oe_runmake -j 1 'DESTDIR=3D${D}' install install-systemd
>          install -d ${D}/${sysconfdir}/
>          install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysco=
nfdir}/mdadm.conf
>          install -d ${D}/${sysconfdir}/init.d
>          install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/=
mdmonitor
> +        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
> +            bberror "Build failed: 'BINDIR' placeholder found in mdcheck=
."
> +            bbfatal_log "sed command in Makefile failed to execute corre=
ctly."
> +        fi
>  }
>
>  do_compile_ptest() {

