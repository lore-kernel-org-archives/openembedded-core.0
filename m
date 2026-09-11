Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41048C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 12:33:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38246.1789129978606081182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 05:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H7fH+QcT;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso594672f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789129977; x=1789734777; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMX8CFi1qqHeCtEdYntVCeajsBCZqi1wfvU7RvULZ6U=;
        b=H7fH+QcTZRiwC+i1r3X1vH+cp7Zt7NmRaVuhio1bexouUVANjpCE/Sz64bwMQsgOsq
         xM/CHBXA5seLtmmZRs4tf/WWQZuJQxM/aZw5U6+3n6Zw9p/BcF8wdSM7HeNwKWEdDERe
         rxecnrxFt6FOspn9izlB+0XSdJusjr7sy9/qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129977; x=1789734777;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMX8CFi1qqHeCtEdYntVCeajsBCZqi1wfvU7RvULZ6U=;
        b=mvdg/lgGvVdSZcEOZY3GjdQ8LmNyPgaMqsPqyXwZ6fE7PdwF7z59UW3CegL8mLyLjs
         TBtKVgqzZgl28ER2kXfzjKejo54+gSb2yLKK2oPcu+sBjII+eIrJaEP+XxwEKNsHCQxT
         2orJUoQ+snmu8tTr1rIN9ta8MG+HvRbEhSCyvEJummnXHvO7uoJcAB9gjzI/Iz+vo2Lg
         sC/kBU7NVH9y7p8euPug8ltBFbfLjeDC7rwNOEN2ZxKMm9tzEt6HbP7Ny+KGmvIg/7Q8
         ziEf90dkthyL82+UbnFuGFkbOJ1vmh+8aJmvHx97a84qv80IoAjeIXwzvSmBU9TwNjHt
         /QSg==
X-Forwarded-Encrypted: i=1; AKwUvBzALuHKXxNHylzfY+Wpbaoczle61/KjBtYcR2QJ77Kfpg9j3bvR4Kunb9skbFTNVTL9qstuKAa9d8X79ejM5W/lcg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lurpKm/RTgoUGip1LP5GNq/aq48Qo/aDrvpTKiJth5Wk5U5UBB
	8ijVQejQQsmYg8rzta6KWANqRjYt/I6vXaREgCOaVRR9d1XIXCC7XJmyA5IAPIAxJO4=
X-Gm-Gg: AYBFou3zzp4s61mMs/bb+/nChwZLcc2cpTQjpY9Z3F25R7BmGoyAUpta4Fa7TWJ89/K
	bW8oIhZGFrlrJhY02rXk6sZRjbNTerIXFCBfD7Z4psKDqlQ2hxhfe6gHkyDEEin23tHcGnpeBnz
	xoH2exzn3zv5rkqj4xJPvWl95qb6UdMFZxhgJPOf1n9f1ebhS/yoHFou27KzUdDrRvtRM2tNHFo
	+jNtfwrXyt8umGt86L2vcVGlaD7uet/Zp/sUqiqwHcT1Zx7/qwI7bIgJJNMzqglNAUpn69IuJvl
	UtUXPkyN0s/Oyg7XXUfDHakz5Rm0vBtf04eGSKQCmCxvdVUolh0oWiyN4QNFu+CXAOGmtWIk0Ec
	LS6R0I7xseF7VClscTTVdOBJPbrzsQn2CTiLeS3rH775aYkVkxevBM7uOU3CblpFAalFgZfZ4l2
	6oRwkrNaZULGZd8W3p8c03kS0nvGj7WVWfXV6uAob+Hp43npFI3llSRdYEccmGFp0NgTWuJmVKf
	3pqdERTysmc5ASCgbiZVOuj4Nd6k2tlMdRqK20vGBi1oCQ53Yw/5fhPElNF1EEMxwt0701Lqw==
X-Received: by 2002:adf:e004:0:20b0:484:3326:983b with SMTP id ffacd0b85a97d-486eb335b18mr3342019f8f.26.1789129976660;
        Fri, 11 Sep 2026 05:32:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5837908f8f.31.2026.09.11.05.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:32:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:32:55 +0200
Message-Id: <DLCHN8AZBSON.6FA3PJWOP4EM@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] testimage: avoid symlinking
 missing qemu boot log
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
 <20260907185127.493115-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260907185127.493115-1-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 12:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245640

On Mon Sep 7, 2026 at 8:51 PM CEST, Peter via lists.openembedded.org Tatrai=
 wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> When qemu test runs only produce suffixed bootlog variants, the base
> bootlog path may not exist. Guard the symlink creation and log a note
> instead of raising FileNotFoundError.

Hello,

Where does this FileNotFoundError happen in scarthgap?
os.symlink() has no problem creating a symlink to a non existing file
and I don't see where we would open bootlog (we do open bootlog in
wrynose/master though). Are you sure we need this fix on scarthgap? Or
maybe we need something else?

>
> This is a partial backport of master commit
> 7a6596925cb0eb8dd48a0362a51875cdd60152bc, which also introduces
> bootlog variant globbing not applicable to scarthgap. Only the
> symlink guard, which fixes a standalone bug, is picked here.
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>  meta/classes-recipe/testimage.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index 33b1c13f9d..744de5d7de 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -395,7 +395,10 @@ def testimage_main(d):
>      # Copy additional logs to tmp/log/oeqa so it's easier to find them
>      targetdir =3D os.path.join(get_json_result_dir(d), d.getVar("PN"))
>      os.makedirs(targetdir, exist_ok=3DTrue)
> -    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog=
)))
> +    if os.path.exists(bootlog):
> +        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(boo=
tlog)))
> +    else:
> +        bb.note("testimage: boot log not found at %s" % bootlog)
>      os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.b=
asename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
> =20
>      if not results or not complete:

Regards,
--=20
Yoann Congal
Smile ECS


