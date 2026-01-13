Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342D8D0C85F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:44:32 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56931.1768304669275455729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 03:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRs37t4l;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b25dd7ab33so568903185a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768304668; x=1768909468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IE/mtIIo8Z1GtK0V2GxZppDp+H1al116B74uf70J2TA=;
        b=IRs37t4lJ9ijpGn2sZPYAlfi75LZK5FPtzoO+kwzryy4lnxXUDXNHNuK6QBUbg5Tnr
         KR7p0Q+2uV2Av8hDLTEG9i72r3agKfCaD5EZAyGJ17YY9ca/nduEMpLCzSzS+uajV1fP
         oMLVSefFp3nQKbWndpqOlrgS/JOe3kRtOaqvwg3NKLJtvU/It0USp6Nz4wlKnf3cXGOc
         dhK2OtSz+szLfrpue7of1SKE6aCW2SqWao+LoK3wMzkRHf+ZP1pOhMp2xmY6oEIZOn4F
         xzosBv5QwnukKe8BB4xm8SExIWB6UmD0N9woI8QGj+racUo1So+e+NhmnEKsK4vrkCBR
         4rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768304668; x=1768909468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE/mtIIo8Z1GtK0V2GxZppDp+H1al116B74uf70J2TA=;
        b=N7gJ1Xw8UwzC5FhhK4qTD5jua9X1K3tqHEbLxgWL0WpZ7VN2mfwYXOaPJGxgB+lWsG
         lZNIpD49M1fr84KoFmz+wSR1aOyBNmQXgny+E38YBAm3b/8N08cSfm2IPTNKbxB3rjg4
         m8b902q2M21y6BJp84kDwSVvzGTZ0B0Uw+nkmW7/Tz7uP70ftm0AKlwW9GwmOZgzuT8E
         ocCzK8uylY2NLFNG1KkYQZy6vBMj1IvynfnaboZ9hoqCvHkYE/P3agNVv0hFtsqXax9L
         p9w34nd/gUFKKyZghsGb6gGgpp8WdoSUGWiQBRmkq3Wugx7HyMl9OcvaohXAoiTOlBcT
         lriA==
X-Gm-Message-State: AOJu0YzEWPbVVUVhQKpAzPasWlTyjifB0TeKwM2IESGJ6rO2aM8EI/Xc
	n/JT6X7SWHFNJxfNd0gPylbQVhrd+CMZLv+kDeSk9h+vI0p+WEH8ew8aMzybfUg4tI2YP3lT59b
	ykN0O6M489LuE2dGyR3lbCWYlEmSRQUQ=
X-Gm-Gg: AY/fxX4gPg8YJ1Er71NnIg0fxqHhCts2R6VQOppAN9mGLoY+vuD598VUQ/D1mSU19he
	DyNduJPWk7OBytsQTHu9vWDeZQtOwWv8+c1c/1VlJZoVqZ1QkaTOGTn2pwHURAhCcLPNfB3TMhQ
	EFzt1iR/eC9TYTAw4F08In0DGwm/fR/DQkjHvbBFwnyxOJQs5E+G5PLAZVN7o83bT4WWC6P2CHn
	3JaU20DsaSLbvEcF1qTiHrzEVflwLn4bQdcKERdb1MAPoC9ZlNTWQ7O9yUnF/AvFI48z60=
X-Google-Smtp-Source: AGHT+IEgvOJl042F8jdtyzhl3L9CLhbSOrmoCzXEeLDDmqSzkEtuhzB4LRLkVoAFsCQc62a8eYvcXv2kiO/tzDNmRH8=
X-Received: by 2002:a05:620a:1995:b0:8b9:cf85:40a0 with SMTP id
 af79cd13be357-8c3893cda2cmr2803249185a.57.1768304668152; Tue, 13 Jan 2026
 03:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20260113101532.1505036-1-oobitots@cisco.com>
In-Reply-To: <20260113101532.1505036-1-oobitots@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jan 2026 12:44:17 +0100
X-Gm-Features: AZwV_QgN8Q0hJO88cymyfIuVb2wxcoYU8nYHRFmoa8xAfk-nTrSO0oslLXqwURw
Message-ID: <CANNYZj8Ap7fpv19BGR4NPSpigS8UPbyGdso56+=BWhMijvZ9Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] patch.py: add check for existing localpath
To: oobitots@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 11:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229260

On Tue, 13 Jan 2026 at 11:16, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=cisco.com@lists.openembedded.org>
wrote:
> Error example for this URL:
> git://github.com/pkg/diff;name=diff;\
> destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -889,6 +889,8 @@ def patch_path(url, fetch, unpackdir, expand=True):
>      """Return the local path of a patch, or return nothing if this isn't a patch"""
>
>      local = fetch.localpath(url)
> +    if not os.path.exists(local):
> +        return

This does look like a workaround. Can you look into how the decision
to call patch_path on this URL is made, and if we can tighten the
check for whether it is a patch there? Perhaps change it to only
consider something that has .diff at the end?

Alex

