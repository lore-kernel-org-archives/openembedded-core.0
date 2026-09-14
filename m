Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A4C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:02:36 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20778.1789394550933268636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 07:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AMUtRoaF;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso4285995e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789394549; x=1789999349; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEpNI1BKAIzerPXUWh9eXzcGqQoTP3tA/jIgBYwOs3g=;
        b=AMUtRoaFoVNcMNDdpwNuXI31Sv8YdYkyhGF2g2nWM9O0j62txxHYlSfF35p+OWtDcU
         55k9mwkrvooWTlbkZ93yYmNcc2HbD5/GcCUizB+QmIM3kFT9lXLCXpkclFLG53Gpz21V
         EH8iQVJpB0Y5aou2b0biQOZFiNFgj9qi4+Zyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394549; x=1789999349;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEpNI1BKAIzerPXUWh9eXzcGqQoTP3tA/jIgBYwOs3g=;
        b=XYFU2zDOx5jU09lzO7+1n3UJvPkwR2zsku/0ECL2l6h83+gADVv2Uch+gptj7QexzM
         DlbLlAYPHnsTEAkEWzAUbbUTGDByP2t/wC5PdT+ncoB2Anq6Ku8Kn21v9xpshpcD4kdc
         mQI/6XTKugQCbxmb8ZEtc65u7iUgYmVwl0BJAT7fE5e/8N7xtva9FcDrvyHOsO647zLt
         MWUyKrztHESz+p8E79qlUu3Pxj6UYlK8xwQPu2ZEcdvRJ5P5tYXtZNNe6/OvN8cq842d
         EFgesKpRJ5CdnZ+ONyuhmCK5lecz64sXqJu4a5/svzIs5qzR4wRI4+ndRuQnCWIoac/g
         hRvA==
X-Forwarded-Encrypted: i=1; AKwUvByGGHo29HC4k2QJr2D1yxnWxyPxt13miYkrfq2nXPFzCPE010oDtxmw7dhqwM42OK5B7NWFG2qUSCRTkk5BRNfzSA==@lists.openembedded.org
X-Gm-Message-State: AFuF++luLY3HP1C3LNoGxt0smUt2+rpPWAXurmF5MxwedYPSH4m7Zgln
	oT4n1qCSQfsajunnwM9L/Xz1ArzkFkJ8N9XOdMda8x0nuUtfs+CfbcHi/SWTvxKEY5Q=
X-Gm-Gg: AYBFou1l36TPc8Yf+vEi8y3gVxlQEaVqKDk4qAxHEKFtroAf98g+HH+xOyZSuOUS5Ze
	gponHS3LWp32E5nNiA+DiKQsYqObfXnsdXg/aB9L2WVpym4KMifT0hci+u/5QyC0SoxH8jENs1e
	lQoATcq8G8RicLPjMuC+uWweahmjylJCpZYSaZGDTgR1/X6ehaUg6zghSHNdIzWlY5ImzqO06Ld
	N/7LgAhsZLy/LAZXoCB6A/Ohat9hLO5XnvQGaZQ9JC8YGPoePP8WZD1LWfMsrQZnqGRXcF21Wh3
	d0q1cEoh0mpOQEvOouF7yDk1BYdVXkZ3L2OVETRUMkkXKXr533JArKMUZjuHqxRT6rrDjQ3wdQI
	ecmoeLkCh7nfYwxBzenGx/+JeMCLj+rhHlxvNnvFgWg3wJkVVY9M5e++ThlbNg1ekHRnXl8Z/Fs
	477a+s6pav6MRn07u5loznjaoPDkLwprqAvSbaA1ZVYuHFrKzMy6p2ZtztXa/WM6z3SByKglBUv
	FL4+5ofdyTJXI5/Qp+DJckGvyOs3oa6Dh71jS40CB5bUgpAHlwBuIhPjh+BwrA=
X-Received: by 2002:a05:600c:3b11:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49e7a6868b5mr28373735e9.18.1789394548943;
        Mon, 14 Sep 2026 07:02:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm486804465e9.13.2026.09.14.07.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:02:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 16:02:28 +0200
Message-Id: <DLF3FF58P4TN.2CQBWW4U3MHIO@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] testimage: avoid symlinking
 missing qemu boot log
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
 <20260907185127.493115-1-peter.tatrai.ext@siemens.com>
 <DLCHN8AZBSON.6FA3PJWOP4EM@smile.fr>
 <AM0PR10MB3570E8E68B19FAFE5DBD942BDBBB2@AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM0PR10MB3570E8E68B19FAFE5DBD942BDBBB2@AM0PR10MB3570.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245784

On Mon Sep 14, 2026 at 11:03 AM CEST, Peter Tatrai wrote:
> Hello Yoann,
>
>> Where does this FileNotFoundError happen in scarthgap?
>> os.symlink() has no problem creating a symlink to a non existing file an=
d I don't see
>> where we would open bootlog (we do open bootlog in wrynose/master though=
). Are
>> you sure we need this fix on scarthgap? Or maybe we need something else?
>
> You are right, thanks for catching that.
>
> In scarthgap this does not fail in os.symlink() itself: it creates a
> dangling symlink when the base bootlog is missing. The FileNotFoundError
> then happens later in our CI pipeline when collecting/copying the oeqa
> log artifacts.
>
> So, the issue is narrower than the v2 commit message says: the patch
> avoids creating a misleading dangling bootlog symlink in the result log
> directory. If that still sounds acceptable for scarthgap, I can send a
> v3 with the commit message updated accordingly and without implying that
> testimage itself raises FileNotFoundError.

Yes, I would take that :)

Thanks!

>
> Regards,
> Peter


--=20
Yoann Congal
Smile ECS


