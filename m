Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3753D609B1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:42:36 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25881.1765899750333715024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z3m1xDvW;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3ec96ee3dabso3388570fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765899749; x=1766504549; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmuiIIhIgV3vSwwnM1Ts99zKG6bMq1q2C6Go5kOQDIQ=;
        b=Z3m1xDvWo+aQ/QwmWqHIjpk/el1b0+nL0l+O5X5wK5xDsPOtGaT1yHV11zfnJD4cV9
         /bj8qATj7xC85m+x2lkGXdbOTMlpRJG2gWnEtXw7RZelmtq8gYWFDaxH3UCKla8XuCtz
         HC5BbmGj2s2gaK9lrvtjn936YMlCuGDZ++5byNvziiQKq/A1YLDOWH0w96ZIZF2uE0CW
         TdHcimnWTGE/gClvtfJnko59IVMOnxKepPE4+Jm7xYghu7758MQvs7kw8j7+qX94CzTk
         xPirvUMBQowQw0I/omEM6xnqpWy3f/O9+SAjk+d/ii5ThOsO/csB3wxku+58gwKq1yJ/
         W+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899749; x=1766504549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmuiIIhIgV3vSwwnM1Ts99zKG6bMq1q2C6Go5kOQDIQ=;
        b=W2DdMdoPQMTXOno3u7qgTZfDaHTW9FZcwpTVxoZ6MBa/uV7mGEavHrMq9bzd8YtEor
         DRh+ABGKLLtfjMyXk3Ens78SezYvweO9PuvHsPrGP2W5HFrJgfq+VfMV0uf83x1eT0eO
         44cmDKRLGfSDNKq4qGfcZBSTVirKnsJmpB8PNQJluU/r05dgQ7F7eC5zLhYKOR5xz7WF
         zCpyi1Jo4AWuSMV9TvIDvW2SezEItyWD1BOAhodm2W/FaT/OMl46EiePy27JViOhNCd4
         VD5r0dl9mSOMMH2QS4ywyI/gsseFJ0tG7d6qoaZFj88Fv5i6oHNGRXqkCZiUNpy5lNrR
         lhuw==
X-Gm-Message-State: AOJu0Yz8gzk2jHTvvn/sb//e1r0J7DAeC2WuIdrNbagOkgUedd6oQYl7
	bHQjkfhxFu74hWFe0PboIsE/W7LcOpt+zDMaDePrvY551YiOtCEU6Kd70AyxnPnF+c7U8Vy8QMY
	+wcbnFs+/FI6LfEim4n6kFErLjOyyzQedyQFw
X-Gm-Gg: AY/fxX5hVawmwlJoT1opGFwDxJvzg2bVDFTaHkyaNwUpHRnPSYC/6lwE05vD2Ntn/7v
	RDMZbWKHBDVUrSctox4GjL7vwvNtkhKZpQ9X4jvJfZsc+fvOQ7+rIDayIFhRZjY3KrTHOJs63IA
	wbYiR/fedRyN/UzJgG1g1E0omycc/aQ6myw2uqHFoaPKOLR4B0Ph0nTnyO9cQoPXf8rxva8Ln1J
	Yqq1vHJl8ibraa/CXl3P3oTpuqOXKo1SQUvIoLZJwNAmeahrc3ZN32yC49nNQGrdjG2D+aqHA==
X-Google-Smtp-Source: AGHT+IF9kgW5Uzhi9Gi8l/c1SYSWYH5cfqR0wH9j7HL9CuSIES8Av+RcmXp6dM30CLunOFhlnj61umvvLoF5FheETt0=
X-Received: by 2002:a05:6870:a188:b0:3e8:92a5:3287 with SMTP id
 586e51a60fabf-3f5f8b352edmr7092237fac.1.1765899749322; Tue, 16 Dec 2025
 07:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-9-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-9-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 21:12:18 +0530
X-Gm-Features: AQt7F2pikvcu-xtlejikZWy2GaPIUX5r-_bhunpe7lvgCW1AAfvpktZZvCcVr_A
Message-ID: <CADySD0Esc+QMLrgPrKHORjO5vEr4FH+dMv47w6tMMpgwNUd-FQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 09/67] uki.bbclass: use basename for
 dtbs available via KERNEL_DEVICETREE
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo@foundries.io>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227972

This patch doesn't bring any critical bug fix, hence can be dropped.

On Sat, Dec 13, 2025 at 3:30=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ricardo Salveti <ricardo@foundries.io>
>
> Device-tree files set via KERNEL_DEVICETREE are deployed without any
> vendor sub-directory (e.g. arm/juno.dtb gets deployed as juno.dtb).
>
> Same is also done in kernel-fit-image.bbclass.
>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 27a7fbb767c0a25b34a03cae90320908f8ade8de)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/classes-recipe/uki.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index fedff222c6..a2b1c8a82d 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -152,7 +152,9 @@ python do_uki() {
>      # dtb
>      if d.getVar('KERNEL_DEVICETREE'):
>          for dtb in d.getVar('KERNEL_DEVICETREE').split():
> -            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb)
> +            # DTBs are without sub-directories in deploy_dir
> +            dtb_name =3D os.path.basename(dtb)
> +            dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
>              if not os.path.exists(dtb_path):
>                  bb.fatal(f"ERROR: cannot find {dtb_path}.")
>              ukify_cmd +=3D " --devicetree %s" % (dtb_path)

