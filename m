Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A607ACA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 22:55:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7459.1791586548350377291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 15:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i0OSwtOS;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0584ad71so165210f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 15:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791586546; x=1792191346; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIoK16kr7W6NxGF8PX+jhz6lGudzyitRgeXNxG9v2ZQ=;
        b=i0OSwtOS1H/22OVH/CUyUMDujT4xrnJvopeVMCsyk8SXhHs5WbZLX9IGaCpwPQXLZE
         m9Oh0sr5l8+xJNXKuGLgkl5zOBFx2iOnG1WHTrDpLbzI7gxnB6P8+oO2LVcjs9RdIE3r
         7WAmzPnxi5IBwJoT4iWfKYr4YUwk00P4SZI9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791586546; x=1792191346;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIoK16kr7W6NxGF8PX+jhz6lGudzyitRgeXNxG9v2ZQ=;
        b=H/rjb0KnIc2bkXQgCWd7T6FKkcFgavMaCfd2M5OBYTv3XNB/OiGPCIgM/DRsTekSmC
         EOqK2vWetk5Bf7v7K4o+hXWqkMcjuJdQQ9rQDGB6itRQSIHgD0vU0CfM+3sOTku68K6H
         yGfdyTlJPb8dn0AQKBkQ48qF/TM8VDG5EW9Picm6vYRkx3TaeZ/nLVnAeu7aOq4PLL3l
         zc+yHMbJhmWHlnDrruG1uEdMefe2cKrl7gsjm5kjxzWGC1Uiqib/vH2vvr/vj7+QRHti
         6VVWqgfUcK1XXOYmVxNkHux0ZC+AslmQRS2g6cmtht++wCqRJfuCp2hP0ZYdWwH1YSW6
         xfjg==
X-Forwarded-Encrypted: i=1; AKwUvBwx5jR1dRsGL/sMZrcYP/ZtAuJbxU0Utyz+EoIl4Jmc5SgDXqrqNNXsLftO3dQ1fogmgssFt54lSGc1tcy5pyImrA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJUC32ArFnaaxEDyTyPiS8YJaPfAhdymHUhVo3CLPlqfLnjwiwU
	1L9U4T54LWDVsY+GLIHng1Ak+65ZTJGy8ISqGtJVLV9EJhOd6nUJFe5rEvIBp/liGTU=
X-Gm-Gg: AYBFou1RToIBSRLWxpq7vIG4MSEjCJ3R5DZUDCsrp8o5TCW4RvoWWXg6zxkfDOoLqX6
	tEnRzXhmhvbbZtyEoz3LoHvDuRjAjfLhfPkizfCmixgCQpwb2kpa+EpWx75ZOxsKz6QuOOP/1xe
	dT3IY44wrOEsDQ6xNqN8N0KcnhzDGuHqMRifiia4jcDLP6gYhjboJT61JYZDajXhrgBPhW0sFcz
	4Qlwh6HnX1p5TImUc9foIedopfu9R1GVf+rtvVPIYz36Rbc4a/6X9O+/GcrO1Qw2PO6NbVdBpog
	gmEaSbycwOoTMabqvcpTfPgiWKuGbPPIKT/bjWdb+BKD5qcUSaZmdM78wGn89WdwykYjOXVYSHD
	aWLtHRiuYij0D7EDyOpuMQCV5IbAfvZzp5Ead/+T0Xmmtcy7eBZ7EQzWg0MRSv9itQGzuummdUY
	wrNd0dTzefcMF+mqi0MfFT3x6qeDKs83A8jype+l5a8nfilHBInhjT5EyfddG+thprvZ88nLGor
	jEaeBNEJ4P+7AKIjrRAsi4zJE6NGa6BufHYW6JWb5Ny8FuxxCX97nqWH4Z/1w==
X-Received: by 2002:a05:6000:40cb:b0:48c:67d8:efae with SMTP id ffacd0b85a97d-48dba7beb31mr6622631f8f.6.1791586546268;
        Fri, 09 Oct 2026 15:55:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abce2fsm6152554f8f.33.2026.10.09.15.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 15:55:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 00:55:44 +0200
Message-Id: <DM0OFC89C3EH.CCKMED8WYWDC@smile.fr>
Subject: Re: [wrynose][PATCH] libarchive: fix CVE-2026-15028
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261002110211.11669-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20261002110211.11669-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 22:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247485

On Fri Oct 2, 2026 at 1:02 PM CEST, Jakub Szczudlo (Nokia) wrote:
> Backport patch to fix CVE-2026-15028.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-15028
>
> Upstream fix:
>   https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55=
702785f82cedb7ef2
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++
>  .../libarchive/libarchive_3.8.7.bb            |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
15028.patch

Hello,

This CVE is in a weird state: I think NVD and Debian are wrong:
The link PR is not the right one and so the fixing commit isn't.

The correct path is: From NVD,
https://github.com/libarchive/libarchive/issues/3251 (matches CVE summary)
is fixed by https://github.com/libarchive/libarchive/pull/3252 (not 3253)
This PR contains 40b92de
Ubuntu concurs: https://ubuntu.com/security/CVE-2026-15028

To get merged, this patch need 2 things:
* an upgraded commit message with the above explanation (after you
  checked/reworded it)
* A fix on master: as far as I can tell, 40b92de is not in the 3.8.9
  used on OE-core master.

Regards,
--=20
Yoann Congal
Smile ECS


