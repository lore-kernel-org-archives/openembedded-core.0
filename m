Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BE5C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:39:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17521.1789054774280444874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E8GW5cwR;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso65385705e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789054772; x=1789659572; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMsQRqtLTboHOMKAx0ZRRfdSAJUJ91dZHVg6Oqyu628=;
        b=E8GW5cwRUYBhugYirEmkWiQLD85ceCA44zgWiAC6OsqGiYh8PNfXuSB4UWCUHcLL1C
         2nCAPIMQbuvpFRUXMGXqeukX/V2z2CUkJ4I8oNpU2bJO0TFa8hDbYdUfBuSldnGUWCHg
         jB65N07EtQSs4g7dC1XdwBdo6jqusT/wzCUCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054772; x=1789659572;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMsQRqtLTboHOMKAx0ZRRfdSAJUJ91dZHVg6Oqyu628=;
        b=FlOLnApV4xfbouW4JHjRBiCsHw18eelo2q9Y5qNTXvoKV2pQRD1/HyVIg+I1RrhXSQ
         85Zft3C1YhCu00lES2kqyQ0skm3Pj1t6AGLoElZ7PJA+Er/VMYq2sEVk3+vQjZAXK9ye
         VumQkIYaPLwpNClX8ggBFs9uJdTp7E8iY7yuC6iG2Mqz/pCX6F7+0J9MveuFhzzJ6GfZ
         ku0eGZeYkUKxxS1ruQ+QMx3gjUzvr16jRxSf4CYUslwUgswu+/irG51kwrhRPYXVpXE+
         Rvd3TBzeLgvLTkZvX8kBMKUqbLFe8Jbri4tQONS24OYjEQLykLO7MZ7JnqWnX2pbUY6a
         EgYA==
X-Forwarded-Encrypted: i=1; AKwUvByr03GjzV72Jnz5cvPwiyqDxhqVckIE41mvhA73OzrBXo7EOSvcfZZWXcKiNjuQVsE7BVEe3H6CnbPmM4awEkAftA==@lists.openembedded.org
X-Gm-Message-State: AFuF++n5dPACBICDs28p4mp5A5fO03l1jscWga2Npet/uQs/k7tOJAz/
	xuoRtLtMP6slO1rmW5nSzQd4TQjHTJQiObpq50xH83KB/P4Q69Od9fLIOIzVqlISSlY=
X-Gm-Gg: AYBFou1UD2a00sXeSnvvp9M2BvtIHHt8f6X+JOV3KA7RCIF6vWZMT7uIavNuuHaFXZd
	O+uVra4CcjW2CTEiESzz9ltVmsS1h9gvasOBGb1ahITnchSxSuYF3iJKnXbnGQyLTStNGkA9iwV
	tQcNb9UAeaCU1fP0k1Z9KSiGiBPXEmCaZulXSMMB/DDAet6PFYlvDymasqpnLIrRcvM6+PAS9RP
	Hn18wAjqRdR+JMvkW6c97sZRUn4zjFusEBYIppZE2Nlf75+HtZLGBnHfzRXsd6+b97INu8liyjt
	zdwmHCM1OIKon+Zcll/KZECXHLTs5DKkwKl6YGi95AyrtXCgWHCK9j3AABqfMYjacf8CbMfrDxb
	9mkYfddV5cfhpv1SHt5RrTIQwt5ksY9fLiVqBk65mnxjc816k3Oc1Czl2hgB04EU0qXrFiPrtvg
	sFjnNJ2GDR5uKOfwISNwd2VOZs2YVtxI9wyhgd6bprBmMlIWNg/EciaQvqTdJxVFYhjscxVLI91
	uHS73v7hp3sGrK24+Y49aqjONy/EsowriO4HPw1bMOS6mYj2RYA0gFPqZO8zDtcYeo4pQMZHQ==
X-Received: by 2002:a05:600c:3587:b0:49d:17d8:abec with SMTP id 5b1f17b1804b1-49d17d8abf5mr188413505e9.21.1789054772452;
        Thu, 10 Sep 2026 08:39:32 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm138646075e9.6.2026.09.10.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:39:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 17:39:31 +0200
Message-Id: <DLBQZJYT26YH.23YA0N3PX5036@smile.fr>
To: <hfranco@baylibre.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] improve_kernel_cve_report: fix
 crash on entries without detail
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260901-fix-kernel-cve-scarthgap-v1-1-405f5d7a8957@baylibre.com>
In-Reply-To: <20260901-fix-kernel-cve-scarthgap-v1-1-405f5d7a8957@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245589

On Tue Sep 1, 2026 at 9:42 PM CEST, Hiago De Franco via lists.openembedded.=
org wrote:
> When the CNA reports Unpatched and the scan reports Patched, cve_update()
> reads cve_data[cve]['detail'] unguarded. cve-check only writes 'detail'
> for CVEs carrying a CVE_STATUS varflag, so an entry marked Patched by an
> NVD version comparison has no such key and the script aborts with
> KeyError: 'detail' on ordinary cve-check output. The unhandled-update
> warning below makes the same assumption.
>
> Use .get() in both places. A missing detail falls through to the CNA
> verdict, and only an explicit CVE_STATUS =3D "backported-patch" outranks
> it, which is what the guard was added for.
>
> Tested by calling cve_update() with a Patched entry carrying no detail:
> before it raises KeyError, after it takes the CNA's Unpatched verdict,
> while an entry with detail =3D "backported-patch" stays Patched either wa=
y.
>
> AI-Generated: Uses Claude (claude-opus-5)
> Fixes: d317e2a52bd2 ("improve_kernel_cve_report: do not override backport=
ed-patch")
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
>  scripts/contrib/improve_kernel_cve_report.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hello,

If I'm not mistaken, this patch is the squash of 80ff4903ea1 and
f5da16b0d3c. I'd rather have 2 clean cherry-picks, this make tracking
which patch is needed or not easier.

Can you send the 2 cherry-picks as a series?

Thanks!
--=20
Yoann Congal
Smile ECS


