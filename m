Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B686CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15038.1791816901451845171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 07:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I91hjXwS;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so1404656f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791816899; x=1792421699; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xod8Wl20VhL4TNQhzW45u3lDmnJoiyEBVXtrZzmJYw=;
        b=I91hjXwS66KRYM+jZIEwvyOg0/2Ogw/4sbrmlU07XK0/JAeM3YrXR29r/dqQhEYR2b
         ZbxXJ13XqjI1p5ThS9yebjvwfw6T8NxUbNVWddIiKtvcAgKXLYi0fmmRV3vdXT6sPGrZ
         oyPJeVmy48OKWBQoXePDqOCqsEP+EM5OnS5us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816899; x=1792421699;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xod8Wl20VhL4TNQhzW45u3lDmnJoiyEBVXtrZzmJYw=;
        b=2swfhET9+GuhD/Lz2n9I/JJeinMSpD+AIz4+/LeGWULBBnoRusYY6Su/WDXQsub+IK
         3CgU6BmCbAs8EcQciimEDRlIpHPuI/l2Qz+6TH7rzu8O+5xldAfi49gUB7OOx689M4fQ
         2Bq939iu0ZVNYFjsKDy0BiWmJjzVVS8Eu+6jV2QVceT9f+J5BOAQD/Xy4St64Njc+NVC
         +uaa/Vnjs8stUFHuGbCA2mqe17yutdLWbbmYkInmGY7zmmMkjRotbTzeTMOTt59KfmQs
         +rc0fCUhpm9BsfpTE178fQlGbNG5m09N7a8d0YNgGCvT9Dh9gQWowgDtD4D0kX1ILdC5
         grnA==
X-Forwarded-Encrypted: i=1; AKwUvBwtBNoSRhBl/lS0w67IAQOq4P0xfsJSOLI4FrsrMHxQ071k54W74htH3rVJ8Ytci0/VuaeVicP9Aeun3J9/8YRS1w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLr7TTupIGD4q/JYlIUgjVpyvKgzd5laHiZKQUQvbjKa97C8bms
	zKPgmmtiq7Qh72GbYAZLtnzxfl5JJl8yIJ6dshYX+4PMGeLQYL/ou3ZXCpoKpMhWsXeH433wq3b
	dbBiNpes=
X-Gm-Gg: AYBFou3TCcXzyQ/JSiaOFp/UZmyokQFO3WqouFA6S216zW8z9eoqb+NE/G4JcvuQUIr
	WQfHcfIq4+t/1NKq3Sff7cyxNIT+rgamUvE/EXBiIvb+q5YQk7KMDiHaWEeeliw8jKnmikURMuK
	quEGTnGRHEp94fx7h5m2trgfd5OtGEnpauWOELZ8duaQXs4u84Yvtm7gLlKmo7tiJ+pZP2P995l
	Yzuf5zjZLkyaIxmdH1ZVvXH7dS+gdOZGuXErSIKCZjyJQ8R0mer+2IaXcSrM9gBkDiaqRxFmBL6
	x1F2R+P/GAelS2XcQweboogKhrM4Bvq5tk10PD92BlMYhlDMH1CpYOJ3tyCSwxnvhcYtO8pNGQY
	P+mLiXIzybGm8giRqUMfs5jnjGE09fyN7WFaO1JZupfdvWJgPkR8Fu0Bo/szRPrpBHHYDvYvZXX
	e6RupI0SH5YdbwI+m9KWEm3rSt90bALW53pSr21bmX+e/EZeLD1iRAoug7dLNRKeeYV6RYFX208
	W5dfDc2BkEHpZd23+P+lKESw0w6KdZf91rjQBjSmceQNXHqDt8vnEJVrCx1Xw==
X-Received: by 2002:a05:600c:4688:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a18e4ce84cmr202862605e9.23.1791816899235;
        Mon, 12 Oct 2026 07:54:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm341357485e9.12.2026.10.12.07.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:54:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 16:54:58 +0200
Message-Id: <DM2Y2VEE0N0L.7A2FZZ991X9R@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2] u-boot: fix CVE-2026-29009
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Roopa.Kalmath@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261009120200.848470-1-Roopa.Kalmath@windriver.com>
 <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
In-Reply-To: <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 14:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247664

Hello,

This second version still has issues and those are similar to v1.

On Mon Oct 12, 2026 at 1:14 PM CEST, Roopa via lists.openembedded.org Kalma=
th wrote:
> nfs_readlink_reply() validates rlen only against the incoming packet
> length (inherited from CVE-2019-14195), but not against the destination
> buffer nfs_path_buff[2048]. A malicious NFS server can send a valid
> READLINK reply where pathlen + rlen exceeds sizeof(nfs_path_buff),
> overflowing the BSS buffer into adjacent memory.

This paragraph above is referencing upstream code. This is not what need
explaining here.

>
> Reference:
> [https://nvd.nist.gov/vuln/detail/cve-2026-29009]
> [https://www.cve.org/CVERecord?id=3DCVE-2026-29009]
>
> Backport the patch to fix CVE-2026-29009:
> [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6a=
ae974f9cec72fd6e58f1bc]

... instead, please explain why you think the above commit is the right
one to fix this CVE? (e.g. it is referenced from a trusted source: NVD,
Debian, ...)

>
> Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> ---
>  .../u-boot/files/CVE-2026-29009.patch         | 38 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/re=
cipes-bsp/u-boot/files/CVE-2026-29009.patch
> new file mode 100644
> index 0000000000..860e504414
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
> @@ -0,0 +1,38 @@
> +From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
> +From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> +Date: Fri, 9 Oct 2026 08:38:23 +0000
> +Subject: [PATCH] u-boot:Fix CVE-2026-29009

Please keep the original:
* Subject: " net: nfs: fix buffer overflow in nfs_readlink_reply() "
* Author: "Sebastian Alba Vives"
* Commit message "nfs_readlink_reply() validates rlen only against the inco=
ming [...]"


> +
> +CVE: CVE-2026-29009
> +
> +Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/=
-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
> +
> +Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
> +Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
> +Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
> +---
> + net/nfs.c | 4 ++++
> + 1 file changed, 4 insertions(+)

Regards,
--=20
Yoann Congal
Smile ECS


