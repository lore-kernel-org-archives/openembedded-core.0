Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9206C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 14:42:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13088.1785336126584449754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 07:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gkPvDunQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956242332dso9039575e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785336125; x=1785940925; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVtYCgvSl0Vo9yHRDgjIJAfHX8so50rUn6TOw0cewds=;
        b=gkPvDunQ8Ppq0uWKyyzyqG3J3yR7l2WK1vratiN528+ALQWJMFjzJ3Z83OeE7lwB/H
         CO9ZXF+IRVRgksfo10RXK0rfn1/0PGXAzXiIrSjZ/9+yn9+FcjE9lpwGfyz3buDbvhLa
         DwvT1cM5C6OX0ZnPtlToCkxQoUwrV5vpttjlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336125; x=1785940925;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVtYCgvSl0Vo9yHRDgjIJAfHX8so50rUn6TOw0cewds=;
        b=RRiyRIfOoBzljt6/RHZassuRTY5KYHeUzgemktRjpGBBqtmpwbCBQDocj0lGSeWqFz
         3DYfDYqtTdGktSA+rtrJwfUcBooMWQ0pZQO03e7lvCJY/rta8PpeS44pzzOtGx2+rr8G
         SCb13t4R5rrIj52bZ+vKr7KuYAzjipN7i441qLkoEcDHt1BcU0fr/KjNv8dLnUXUX7hd
         JXyqClqHDtiUs3IujXT+DfPIbYJRFNOfy0VwkJLiFkqgpaYDcH/RmtWVstWoKkyN/HSp
         G1c4pUnewIGmC86zMOfZFmmzJlZOyKMSI9OIqc6KBHegsaVOtaMQryCVZvxBdtCQ5OqX
         ZGSg==
X-Forwarded-Encrypted: i=1; AHgh+RrQyBIRwmHDxOy2jqvq2sIaZDYNl+QeUvyCn5PfheyGXdu7XW69dd40z+YRCSkr+J30u289KUZOYyMC43dkWEjv9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrArlrnUaCo9zr5Nwv5qmJ8wjld4E0T8zHdcrDi7PhSput+ays
	gfePO94yO3AKmcTn+I+fE1ILvEWLrpWYTUV4vaPiiY5Y3wbpayDNtPKN0GjKpn4AdnDKogm3dvC
	S0U57YOY=
X-Gm-Gg: AR+sD13T51ZeVxCkEEyFQ1n9BkpuBqmEgHM8dWwbD7zqHtWquwGwCusRKnajPxqko/F
	IHB11jbxd16AGEuKbtHV/fpseCsLLyPzJNxktUTbtW6+PK34XDpmP102Y2F85BxYuUAZUnXuRbU
	sKKWOnT/Og4Bnvsn+HnpeyG4uuK8DOHER3K6Kjc5Rf6+evb+yTVtW0CMPccOXyA2MUugv16anBd
	M8zB+cYVJEzI8EzYKiOESMsambp23aqpn5jr2DpAE3uq8+Tk2xlm8O/jCY0/DKpm+QcutVKiI1Q
	KuS6feDxPwyWZjxY64S3tvDQT404PHW+1FgRAhSA2FBhJ98ttaunU0hUraeGKofAzdJDvRcJBIc
	TAkvLA0Qra0cAeFJeA7Lr6hK6hvUVnExUS17hQJ397GktXcypuaAFRWB1Ye1L8dgzMr9Q0fXfaJ
	z//93mGpMTAbxehfLYyteCOOyQjs9aT9Ag9L32IlveI7WBbDXRxKOBDGsWBWI4zOdkSsecQpUl5
	lg2u81h/PagT/3FsxxGs7WxyG/pkygAzta1x44EJmgr0ErgYRPW
X-Received: by 2002:a05:600c:8b2e:b0:495:4dd3:ca97 with SMTP id 5b1f17b1804b1-496c659f843mr95569815e9.29.1785336124634;
        Wed, 29 Jul 2026 07:42:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496e905fa40sm54212755e9.2.2026.07.29.07.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:42:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 16:42:03 +0200
Message-Id: <DKB4U4MQEPKB.3FYR6DZ0JSOE8@smile.fr>
To: <wes@mitsi.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] cpan_build: disable .packlist and
 html doc
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260729143729.3759497-1-wes@mitsi.com>
In-Reply-To: <20260729143729.3759497-1-wes@mitsi.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242272

On Wed Jul 29, 2026 at 4:37 PM CEST, Wes Malone via lists.openembedded.org =
wrote:
> Currently, Makefile.PL-built Perl recipes (cpan.bbclass) exclude
> .packlist files with NO_PACKLIST=3D1, but Build.PL recipes
> (cpan_build.bbclass) do not. This now results in a QA error due to the
> TMPDIR paths included in the .packlist file.
>
>   ERROR: x do_package_qa: QA Issue: File [...]/.packlist in package x
>          contains reference to TMPDIR [buildpaths]
>
> A similar error is produced by generated html doc.
>
> Here we add the corresponding Build.PL arg to disable packlists and html
> doc.
>
> Signed-off-by: Wes Malone <wes@mitsi.com>
> ---
>  meta/classes-recipe/cpan_build.bbclass                    | 7 +++++++
>  meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb | 2 --
>  2 files changed, 7 insertions(+), 2 deletions(-)

Hello,

This patch should also apply to master. We have a strong master-first
policy so any patch need to get an equivalent merged on master before
being merged on stable branches.

Can you send an equivalent patch on master so I can review this for
wrynose?

Thanks!
--=20
Yoann Congal
Smile ECS


