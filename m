Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931CFCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:32:02 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15182.1790955120359271949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uwf2DeDA;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso92995e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790955119; x=1791559919; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ISrgSH9eWHvSZyfh/7zYUWAFwzH7b3EN7RCDDI2rJ2s=;
        b=Uwf2DeDAFtv1kjasXvHKw+KrHqOArCpijQXVl4XPqCOTIQ7S9OyXTBrr35NpU5zilC
         CoQnFdoh8s+Af/yki+hW/eLLimBHugTXhXhBhsXplaVH9N1Gf65NH64PaFdobyRiYGoP
         cdQdYmMID/Z8fSYJ3NRnKt5mavWJlxOFWBV68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955119; x=1791559919;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISrgSH9eWHvSZyfh/7zYUWAFwzH7b3EN7RCDDI2rJ2s=;
        b=gF65i2ZGFrH8XdoYau/zf9xfT4ycegMJ+eAGaa54b0NMdSrGuezaDi7XmfOMVKD/xs
         PyLv1yc+9Y/XZFuq0kJPWREPAzmuP++x/EFdcHoAuP3+cmRtHa1kX4ym7H/dxoDBkrFI
         5yAwQguzwcOW0CYaYiZNm6aeWPCJFpXpK6zyKPnPs3TSYhbBIzsCyAwjuWebZizkXq9U
         IS6RtGODHNFoUdFMYiYTQq73K7Eu1ZlAFk1NIQTAOHtd4DqFjxPvWHif6e2lHqSyslbz
         rIsPC6ZjTEP1rbwfIuejjuvl+hdDSHZpH+w06cjsmbej/zCJJackGkmjNf4fbjTt5dHa
         8Ljw==
X-Forwarded-Encrypted: i=1; AKwUvBzNZXCPuD1/+r8I+Ggoz8Sy6SBp/KyXAHd8NZfyHGuVVLLZu0pyfECcKgIOipwAqw3y+1o9FTB6a33XR31ERM3Z2A==@lists.openembedded.org
X-Gm-Message-State: AFuF++ll35Hv5EmL5U8OPy2jzVm08gSvhnbtmIZpdKxZKyWXYXIgoG8D
	pZhAeB2384U+ewVBgbBpxJoRzCCIJvSImy6VylYrTSk5WZswyycLWSyyNjFlRDK66x0=
X-Gm-Gg: AYBFou1EvzOBsdJHt1SEt+asvCofcpEHb2eQSI1TwiXaAXK4OUNklxYQ4hrQdrRfaSY
	oWYQGKZXPG4uin3dC/tSsdDKtY5UIk0gmpByeEjpJgujS4jtPhX79D4mWuk2oPnQBHAdWvihNA7
	ZkjJd+Mn8vqlO+sF3qxm3W1+67HrEiU9/w3EUPFgVlg2OnBY5Rc9BlRy9RvOIv0XWDF4nnXwhz6
	IuQn1Vvp8zr5WDO3NgaaHCtOqk+7SjDpESs/kG3fefKtZpbntO2OfrK8LGxnz9KCe8CJescWNpz
	bw4c0kZbbwo1VG+XatBRQ3X5/ua3vPdSWW4bCabI08Rq5DIvzfWayKjVB6SOl/ZaDy4EQbh8T4P
	u5AHxFNyc8ZjcQBx/g30rHkWVS0obrif05BsDuhzwNuvwSm9cGQ8rYwkdGLuwHVbuUeums9E2So
	6UtMjTavgWq1iZje6rGjoWDZLiuOXLxKH0UtQCt16P9xdXGKtKiXEb72U9+LLPebh9YX1oHiW/D
	5DnDQ/Q+dL9r4tICPq9jsWBu8GcfL/cQsEJdANXlJibgiSBQOOPok7k+EUxYw==
X-Received: by 2002:a7b:cd8e:0:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a02758ff89mr42064705e9.19.1790955118597;
        Fri, 02 Oct 2026 08:31:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm32900215e9.1.2026.10.02.08.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:31:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 17:31:57 +0200
Message-Id: <DLUGLQRUWXIV.14PJ7XW1FBM54@smile.fr>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] curl: set CVE_STATUS for CVE-2026-9547
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <deeratho@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260929132804.1795602-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260929132804.1795602-1-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 15:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247133

On Tue Sep 29, 2026 at 3:28 PM CEST, Jo=C3=A3o Marcos Costa wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Analysis:
> - CVE-2026-9547 is tied to the libssh backend. [1]
> - Wrynose curl 8.19.0 does not enable or expose the libssh
>   backend in the recipe. [2]
> - Hence mark this CVE as not-applicable-config for the default
>   Wrynose recipe configuration.
>
> Reference:
> [1] https://curl.se/docs/CVE-2026-9547.html
> [2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-supp=
ort/curl/curl_8.19.0.bb?h=3Dwrynose
>
> This is a backport of the change below, from wrynose branch:
> "e32fc16287f0: curl: set CVE_STATUS for CVE-2026-9547"
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>

Hello,

Can you send a reworded patch for scarthgap instead? And please recheck
that the justification done for wrynose is also valid for scarthgap.

NB: we don't usually backport between stable branches but rather do a
backport from master on each stable branches.

Regards,
--=20
Yoann Congal
Smile ECS


