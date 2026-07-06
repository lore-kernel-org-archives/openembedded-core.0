Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFBCC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 14:31:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152363.1783348252744124757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 07:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=drL9ndBt;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so20624725e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783348251; x=1783953051; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDWno+hznHqOvOcwGvUzMPVDzs8QqvTHnxL64AXlsgg=;
        b=drL9ndBtY/AMWnyC2rmxgiBtuxdsGC0RnyvA3cokHjJqK3VeaOnZKkzlowhDS3dGHV
         q3Zv6yPT2M96E6u4EWZxt9fv8hqTGq8cOFEHuXT0zUJSDZweSbmn7AbWnHRvOcBIogfY
         6X2yXGWQitrD6t2ZvDwP6ZAB58kc7OOI83FlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348251; x=1783953051;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDWno+hznHqOvOcwGvUzMPVDzs8QqvTHnxL64AXlsgg=;
        b=Dgwx6vLbjspBzjBTRF+KC4wWO3NuVTQIwlJqiv6tuD99lJqEsroy7yQErF1qzE6Vky
         YSZrWyZ3NuPZXIkB0Hry0AhR7gHRBwP4EynPImofXunCTekrOv15wVxF6d26v6tUH4Ud
         OaLSIP/R0DX/fAMBTz79hDibd917bH7EuaKzAu+0KEOkN5GlfxuRvhGdi5b8vJI7+DPa
         XVTC7tM7uyvQVseS+7jKz4IWc97Aw1rA3jByyF6IUvp+cV19z+YrImg+lMuO56m16b0x
         rsUupiEicqOAHa6pozohUkR1q7UVHlFEwH/8z31OfIdd5exV6C5MA/z0bvjIhvlXHw7F
         Jcxg==
X-Forwarded-Encrypted: i=1; AHgh+RqNTaOkJXZTLDTWWMCbrbbwABhfvVVB7s8naQ4pw7htgdFs+2RtZDgx1LzhDnx6l8Ygnz9azlDNLsxeSYRmKp9kNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmLCqWUgMWSxX5LvQg6Ddp0/VCRd/zEQZHbQ4vpVogHc/7o4TG
	/ku6DUVUMsdYNotzDNH1isHqN/tUP0KHWAJUSzxD4yvwkX7dFaaXR50fJyXl/5DqiPII3x4UxDn
	C/Iyiijs=
X-Gm-Gg: AfdE7clk5gXBNJAGt1x90neCxuHEgDQ7/YfcCPpl6K9vFzyShJ+UiBwy/uW3ybEuMtx
	WfKs6WSmednn6EPWdaUaC9bCEppaM6xy60Y9yAL21tSZTnDklEDveGbijFgNCisnO3yBc8G5a+9
	l+bdoGnth9/J6M6c0dBz5exz4UDxxjHj/9DcBwrB7c3ClkcWhKEaog7AcXweHE/K789Sp4VXf9v
	7otvnzx+36ZUTeboWnDyRBv/irsnEg03Kp7maMqptoHWKmXBF5TK7es48JCx0Ec7g/lZYhHI88e
	64/RfEJlqA8itY7GNmDXW2t9oxQMOux62Z539bfMy91+iB0eSvNQfbe2in5Rf0RJWmW9UD1IFES
	k6jMp2esqt2RyPyFRKfgWQzFKc24dInJNVXBs6ytXi5fcPD1EQUOs7+9ZTq2IDx50cza5W8oxo5
	fjo421VzDYH8QFpSk=
X-Received: by 2002:a05:600c:5352:b0:493:72d2:e96f with SMTP id 5b1f17b1804b1-493c9b43f6amr122401485e9.5.1783348250799;
        Mon, 06 Jul 2026 07:30:50 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm24954334f8f.8.2026.07.06.07.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:30:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 16:30:49 +0200
Message-Id: <DJRK6ZWTJOER.251NKDM8K0T0@smile.fr>
Subject: Re: [OE-core] [poky][scarthgap][PATCH v4] systemd: backport patch
 to fix journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sureshannaiah.mailbox@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260525192952.2813974-1-sureshannaiah.mailbox@gmail.com>
In-Reply-To: <20260525192952.2813974-1-sureshannaiah.mailbox@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240277

On Mon May 25, 2026 at 9:29 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files.
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
> ---
>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch

Hello,

As far as I can tell, this patch is needed on wrynose (and master, but
there is a work in progress 260 upgrade).

Can ou send it there so I can accept this on scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


