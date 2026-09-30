Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5629ECA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:20:38 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12085.1790770829844115196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RWfas/Gb;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so30996675e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790770828; x=1791375628; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xoiRohqpQIb5nCcSIizRijRmW0nNR+Zh24LSlmNShnE=;
        b=RWfas/GbXbcNPBK0iSReUwrCdGTQuLeSXg3UoBZyASwiNxyAyF5n1ByLRxeedkOu0t
         Wgy3+jceEmJ0woo61cBFuHw+BTzpKKzNCh6WG7RnwmEqtOOk32TFXg2hQa8Rjf9KhPtp
         VR6X3pqembZ9o87M6LnpGZXaD/iLc0cwJvKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770828; x=1791375628;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoiRohqpQIb5nCcSIizRijRmW0nNR+Zh24LSlmNShnE=;
        b=awx2l7T8qU0uiwlrhSINTPybEtpa0pVrAxtmrgVZjCkVJgpZbOs5bNI93vJwneQvtt
         QeZqZvUC0OsmsOWs8N6lbpaOuXk4ffk6FtH1/Z4JlJP/cJZpuGOeML7IqyoZFeLyUcTi
         hMnHofA+70F+Ni0vUXat+UxEVidXQCZJYW9tk89XiC1fG8T/WXX18vcKcxvYcsy/4uIB
         W/cuXtsC0AdKIWEADAfDYwGpXc9fKPdQ8I6Y31ChMDiaRrJVhUK7vgPv8+yH0sDIP8T2
         v1YDnWtZPfBcbyeTUcbLWaO7xdlX8KKVsbJqVw+aDeUua5ztf2aLwPb1sLGXFB8ajkB9
         Rhqw==
X-Forwarded-Encrypted: i=1; AKwUvByflTxCEOoKdFO1FFPY99+VV+Brxju918NCu0Vbef8D5j7rcLia57rwRLV1NeoQGoAPb9X64rNDhev3x1WUox+C+g==@lists.openembedded.org
X-Gm-Message-State: AFuF++k4k69cuw4Ve8Xq2rMY2O9SLLI4/F/OFEgsrImF1AjjAinNrtG/
	8x1cmDOpJyeAS7Ysd5EX0BwNgC8FyzXQ5GHZqEUyNbCMRXQVhh1Sqtpm0Q2HkoFc3vI=
X-Gm-Gg: AYBFou26AEFnjFzNyiOQZHF+iF7y7KshAPBM9YUBlzutRZXoW74LC/Q6pq1AVdMrZtV
	LMPvA/+4lT8/rJYW+6j5BHDeGCihfmK1iCUBvp5vm/EP26c6r5Ciw7mTJfz++U/bn+SbXTPFhoJ
	K+dvLGPyOFIyTMwar3oIlDcn9HTGQZ5Bijx7tRY/Sxx8zPKrh3bEhPwEwLw2tZ6nQwHzOY5YwF8
	UHcRxiaIDarE4EZG9altBFMndhT5s1FbPvFkiq9g/9UMEyUdnbWbXrIXKGud6o01SKJFQbQ3ylI
	fz4OsRl043DDhSeFzQHLn5mNSw6O1WhmROWuPAX5smMZqUeYkKfKbhCw65OgmAncQwh9Fmgkcit
	WmIWKEb/wDN9uFGHKV+bAMDmk+paKI/e5EhnlVorMfPDHo43IuewcVqwTUXgL3+7RdkM6Ig7bgr
	45h9UG6cCuxPFoix0xHFj7nOUqjZxAhCAPHi+7A7oVqrC6fnHogMG7zRsfCNRhI6zWSp40TJzTK
	BPBXNXAwUQGRq624XWFPrqC1kHs2qAcXGD2554dqZwcReqBuXgLqUU3OS6P+5E+kKATTA==
X-Received: by 2002:a05:600c:1c29:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-4a01aff2edemr23488765e9.15.1790770827885;
        Wed, 30 Sep 2026 05:20:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01cd67d57sm2404895e9.2.2026.09.30.05.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:20:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 14:20:26 +0200
Message-Id: <DLSNA0SNWRD5.35OI7E86U90GQ@smile.fr>
To: <patrick.vogelaar.dev@mailbox.org>, "openembedded-core"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] strategy for curl CVEs
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "patrick.vogelaar" <patrick.vogelaar@belden.com>
X-Mailer: aerc 0.20.0
References: <910530019.414273.1790592882868@app.mailbox.org>
In-Reply-To: <910530019.414273.1790592882868@app.mailbox.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246963

On Mon Sep 28, 2026 at 12:54 PM CEST, Patrick Vogelaar via lists.openembedd=
ed.org wrote:
> Hello
>
> Currently I am trying to fix some CVEs related to curl and figured out
> that the code base has evolved quite a bit. Which makes makes
> backporting patches a lot harder especially if used function in the
> patch are not even there in the 8.7.1 codebase. This in combination
> with a changed test framework (the last patches for CVE fixes were
> already without tests) makes it hard to backport and at the same time
> ensure that the CVE is really fixed.=20
>
> Now my question would be if it still makes sense to try to backport
> some CVEs or if there will be a irregular major/minor upgrade anytime
> soon?
>
> An example for such a CVE would be CVE-2026-11856 [1] and the upstream
> patch [2]. Here the structs like Curl_creds or Curl_peer and the
> corresponding functions do not even exist.
>
> [1] https://curl.se/docs/CVE-2026-11856.html
> [2] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45c

Hello Patrick,

In OE-core, we do have a quite strict stable policy about what can or
can't be included in stable branches:
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_=
Acceptance_Policies

Since the curl version after the scarthgap curl 8.7.1 is curl 8.8.0. But
this version includes feature addition:
https://curl.se/ch/8.8.0.html
> Changes:
>  curl_version_info: provide librtmp version
>  file: add support for directory listings
>  idn: add native AppleIDN (icucore) support for macOS/iOS
>  lib: add curl_multi_waitfds
>  mbedTLS: implement CURLOPT_SSL_CIPHER_LIST option
>  NTLM_WB: drop support
>  TLS: add support for ECH (Encrypted Client Hello)
>  urlapi: add CURLU_GET_EMPTY for empty queries and fragments

So, I can't accept this upgrade so we have to rely on backports.

IMHO, dropping tests during backport is fair.

So, yes, it still makes sense to try to backport CVE fixes.

Of course, at some point, the difference in codebases will be too much
and the backport will be impossible under our stable policy. Then the
fix will have to come from outside of oe-core (downstream layer, mixin
layers, ...)

Regards,
--=20
Yoann Congal
Smile ECS


