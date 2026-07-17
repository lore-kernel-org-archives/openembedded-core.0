Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB34C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:05:45 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14448.1784297139805566761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jgyP1xMB;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b29356f8e7so265008e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784297138; cv=none;
        d=google.com; s=arc-20260327;
        b=d5PJ114L+7J3ffjAo+xS6oGuZotpcC4c5lZAvOFPuqNSiSPFYD9JnwYDrNSzb9Huzz
         46VgZ1REZKUyMrGRNGy9URtUcSTaIX8tb3Q2DRTO/awmO8mPapedtMPyZgb2ERMVMIJ6
         ngFOIfIqwqrfX/yU8WLrxANdIcO72frK4ZzvKoAbUmOiH8/+lQGob+NgwuOHL/7KvPOh
         qAk2M0kl6ZXqBY1SZE6LVaZzQkLQM3Q11IVCa74403qvpAMUg6Wfa4uRcdCze46hz8j/
         SmhUiVpjC5ea59NsVPP2W12hcgFhdYuM8kh8qpTg1zqnjw92MQVRICdMY29gIdxr23cq
         tRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XEdfbQ7yk4R5l150BKkdgV16u1v5101rAINkMLwouBE=;
        fh=q9MGl36J+cO9AQZQdwKXKzd6dDY46/819QrlcCJSSgM=;
        b=etuuNo1KIbRxWcPwK/gYFA4oACwz3cgWjWRUHQPQhvQvIZPd2VyfXZhBxLp0Esx+Tg
         xTFspaxEliN8/EKoJiEHYNL7wOVh0TbiEgk4RrAsTVwhNNiVXAK1s5v52KolLv96g/WW
         iIcfwfipFzP5IC6apLub14F21z7VGKrCigIaHGg6+xxKLqsyxE474g0PiE0gAa4Twzab
         U5fmVUM6EJdTfDz4GQRl8XnLVa05Jmzm0pWzPHddxHFvwsA8OLwjdlYryID4BDma8eby
         hDEXLnSIL/8W1/HDoIryIkWfusM2kN/bPtakvtV04Ppd3L/xunF0EB0m5vO7quWXlaDM
         x5NA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784297138; x=1784901938; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEdfbQ7yk4R5l150BKkdgV16u1v5101rAINkMLwouBE=;
        b=jgyP1xMB4hxXOf7+xxFXFIFxBeFkK5tmQnZAo1yUL6gUDPNBhFyw83prg65c8DvoAh
         xKjWX+KIm60UlsCXS/ts8KN6RUH6wh4CFxn7tlyNcmROm+8hiWb+kqgDKx91JVLQcE04
         OWRUcO49kji3OQ1m0vYRmYeEf7CErk/avkaAGbOe3EQWzDWql5bAnJFTjNBI+Sa0Zt+C
         SiqfRVWx9JK8l3xjStLhyA/qMErjeFMxwIuhaM9RmD+imAgF8hQ77YaYdOID/nxOhMzA
         t9UXkXyZACO5Pxv5uINYQ/O1INnNOPTRTf7yzUuJ00zvI2rhnNsSPYWn/0UJuCbmP2BP
         Iphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297138; x=1784901938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEdfbQ7yk4R5l150BKkdgV16u1v5101rAINkMLwouBE=;
        b=pCod6bnTDSsS5mYE9Nz0FJkkewZU4Ok27YLWVtV+3MlEsjrVn2iDXn47qIBUObyYsC
         Xw88kA+qIpdzweJEifsakw+PbUqZEE8TKp5gGBBK2ZRV09JE2UEJPPRhs4w7j7u1M7wx
         BeeDRVcSuw9kxDZXaodyidFy2z82lhKMm1tZZAdGVbFrDadL1C2pyzS3ZQ76fNQTnguL
         Dl3lFrCOaPLKgwqCKmvrB1lNUZoh6SX/U505ZKou/HJ2mSQMq8XZtK9APb/aHjjt6DIi
         Ug0dxpbdR7xbnFGe6W8/OGCOrJMNR5l+nt+1afSfje2o+GTVqbEju4FI4tMeOFbDgAf3
         cQKg==
X-Gm-Message-State: AOJu0YwYl4ro1xDWA/XGTumVhKvnZVWt3VUhKQAzyOiTiomhrsJDcnVJ
	AXO5vA8Nj6BdB3YygAory2QSdJJPi2UYjMAngzwuAhUbkun2wiWKQNkesxQbb5IZzSYv0Q/txSb
	QAnGpO3O0dkxr+mWer8T+RfrNcqnVvNYBRA==
X-Gm-Gg: AfdE7ckjvzvo95KpwYbJ6RVj/YPpPs2dHwZZZzpDkPcsfbU3u6rCn6rJincCcpMguib
	xYb428RnX8fh5HQ5AtCpbg/F6VcuATAOmgRLihXxLjcIF9oikwAik4GPTMyHKd7fNi/KYYyZ7DF
	dy3ULfxClFnpzL6pVD1FlwV1xhLGqCTvnQjmhz5DFJCGQ5YYnuw1zOeSi8x4VhGOyNPP505byOH
	lNe5QtnlTgHO33wh70bkZNGLa05rYx1PNJuHDhxc6KSVRNu0a0JBZYKOIP6zkc4hlDecer0p9bl
	0PR30i5fyRh3Gf6H3jmPDxtm+PsUyXrceECPJh+Qqj9loOKQ6A==
X-Received: by 2002:a05:6512:61d7:10b0:5ae:b7d1:161e with SMTP id
 2adb3069b0e04-5b28f9ac52dmr476308e87.39.1784297137357; Fri, 17 Jul 2026
 07:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260716122219.569673-1-festevam@gmail.com> <DK0LOWOXHOHF.T6NXM98XR1SO@bootlin.com>
In-Reply-To: <DK0LOWOXHOHF.T6NXM98XR1SO@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Jul 2026 11:05:23 -0300
X-Gm-Features: AUfX_mxI6YCVss95VLt19hLOb2PGt76xdRoFE2-nUA2XBVmJfZxzWaV_cc6MJ3M
Message-ID: <CAOMZO5B2De2AKoOY39L2ktL7_bVSjOrQndtnF5Y+8JC3ryoKSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gnutls: Enable p11-kit by default
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, marex@nabladev.com, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241194

Hi Mathieu,

On Fri, Jul 17, 2026 at 2:35=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> It looks like this is breaking the
> minidebuginfo.Minidebuginfo.test_minidebuginfo_qemu selftest, beacause
> of circular dependencies. It's possible the issue comes from the test
> itself:

I have sent v2 with a better fix.

Thanks

