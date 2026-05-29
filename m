Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BDCCD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:18:00 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14401.1780071472762325946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 09:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GGBWupX8;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-914b5f85129so676770385a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 09:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780071472; cv=none;
        d=google.com; s=arc-20240605;
        b=fZsuUb58/y3+ljQAua4DnG9upkYvs9EYuQIpl2+w++VGvLFAZyETsoLky5dJNWKozM
         zTDrwWMgOZkHJDT82pT9FGqZ9Rpa47esU9k2l4YIEQP65QWV00wxzNnpVNiELlyNCVtp
         uS1JN0TsFImsKJ0VIer3QsWb5wNvb75SoGfxdL4aAeaavXqGl9uEJa3rgjRLdP2VNzOy
         QsTWnWgYrSF7BlVvvXXFyDE5oFycNU6ccBjCMjXhHZPrLz+VMEEq4Lrp+V3eCN8weaGV
         tfZS1xwZeyFKht1f0eVMl2azMt6OL0lcK/DzFY2GtbqnKZbHv9ZW+0/OtiPn+tv4O6Hf
         VThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bdpXrxr4fCnlHnbgyQ6QA6l7mj9pM4yCZ0OPiduFf0o=;
        fh=n4+G4yHpSFrLi2EufbFtYW5Iv27q3LO4pMU2B2aa6D0=;
        b=FQLFH/ENLg/lLGGubTCPnNcSbbzVtpZ1qJCVLtTOdNlYZvOICjkz+WBVoeEt9F5pyK
         olMnP4AAVb2MdQx9tjrI5Bv2xeMKrkGsRGfVU0oj8fXUMcto1nIfMSouFgKdahaC/ESt
         K0V8Qpvrtb61yBylAkZlTOgCm1uSvtaBo5LMX36vTKZdYG+cwX0uvm6xHFFyrZQiNkMW
         VCiFWDt0DhmKql7dHFWekcQscNOX4lyl0wPjhHyI4fzutwz2KMksaNRR0AQ5Ji82YzW4
         f4YsutKLart79czEPCJd195DQl6IsVTRM2pacbNyRN5cmyO2AKxfexKfdOoClaePyBPU
         NxhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780071472; x=1780676272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdpXrxr4fCnlHnbgyQ6QA6l7mj9pM4yCZ0OPiduFf0o=;
        b=GGBWupX8YHhJBkwnWfRvpYJbepIHLSHfqeibLmPlRkYP7CEhNLGqSXtH5HjBZt9568
         pSn3AAzHG3LSbtBfbJn8qLd4J5ek+GG47SnPt9FGUGFHKfwbYjwH09Og0sRNydCiIvIw
         SnJGpt+xNhQuztACaJ3jDDOtRFZI9KCERyadD7wvIJCM6HAhfJN6aBcbuxpyivaD1xC6
         S/UVgIvlRwoaNwRqTr9NOrXKB/fIfsj/ap7jcf/mq/P+QbRh48RvJSOjXuiC97IDwKaF
         XBuv9NT06D/6F2cmDFjGPyCtcMGg1pvA1AzpkUl/eil+uUnxQ1OO/YSvSD2SYzsFSDDz
         wpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071472; x=1780676272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdpXrxr4fCnlHnbgyQ6QA6l7mj9pM4yCZ0OPiduFf0o=;
        b=BvGtuP1ugkmAOfBnmSgAiTh6oDDu6W1tzBxxFBiGDgxFQyhfz7oYqR6MluOmBVVh4V
         PhZwpkHCLKezitHz+h61zZMzOpomV6yg4xrHfA5Pi587MA7sUL/hqv65gHqKOQ5it6R9
         Ck4lHKmRpzwfXk8y8a6QvyTsEEaVMWo+vjYib4+m43APvBtfQTZSwB4K/bmg5xEq+fPd
         B2km38JE9lW6AT/KD+Zcqs81Yqd4DJ4B80JyZFaygwE6iFwJpepGYMRAjSr2zda9VmtH
         tVLFZvWhfpHOjV8rxa/+WWOIbNnP+O9whIm9AM5bLbQJVjLfLxLg7MEbwMOde8JP15It
         0Bnw==
X-Forwarded-Encrypted: i=1; AFNElJ9KM4JbLOi0k4etbHuxWxkLtm+nGGZRgQYp19DUoCuqKudj3aHXyygqvVgGL4xGEqhnf4PG+HDyBgXsLajz6YbUlA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlOQFAS+PJzGqcAFre46EIeTGVuMKabtFfCdwqgv7mFAcHyk3k
	WVZB+ADdZZGKsuaRVKQxnnWKz/QqNsqxCgfekSB16ZoMzt1sKWPCiq9klcWyJ5GaixmQCWWCDZ9
	Jtqeh52b00EjWs6BXl/byCy+0TMN3Hxo=
X-Gm-Gg: Acq92OGMd2eDbVuliERVS4GdzFUZaAvy+RIV8bgxu7t+4INP5BNZzx+azNWuGh+8Ckc
	NDq6psdnAdJHwo7nfScJbqybtoK+ljInjsereQpuP6dv3/19eMNjiAsjWr7NJ8Uax6cA2Eiyrd7
	gMw6FNlGmlqE2PVoRwJQJUVYGM9T0FBo8ZPXQ5pukV9A2DdO2ShQx0JKgiuadF2ycAbCxoXEnzf
	gvGWpIdvQ5qtex/f/f6dMterewMBfPAGe0b+x4RMgIYl5xnpUG2UhmYJUTy5GH6BtrBLl/Jp3CJ
	+OuOw2R+JNbTYo5qnZ6HbWPLARcBkI2yckQUmehjO2SRA96LerD7
X-Received: by 2002:a05:620a:371b:b0:914:ca75:e8ba with SMTP id
 af79cd13be357-9153da487a1mr53192085a.52.1780071471552; Fri, 29 May 2026
 09:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com> <71990304-87b3-4b91-9d58-dfd0b756a0ca@windriver.com>
In-Reply-To: <71990304-87b3-4b91-9d58-dfd0b756a0ca@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 18:17:40 +0200
X-Gm-Features: AVHnY4JPdinGWOdZWzaOkyOYd_crAMSoGoI1vcJI5XGU_XSGhlaZznx3aRj7Zb8
Message-ID: <CANNYZj-=tr+tfDz1SuAGRAVHiBGbBa5GbCaVBaUPs-y36+JXpg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 16:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237765

On Fri, 29 May 2026 at 17:52, Quan Sun via lists.openembedded.org
<Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> I looked at your test logs and not sure if you performed the test by
> really using the qemu 11.0.0. (Note the QEMU binary used in the test was
> built from sstate cache (1851 of
> 1852 tasks were cached =E2=80=94
> Sstate summary: Wanted 187 Local 187 ... 100% match, 100% complete),
> meaning it may have used
> whatever QEMU version is already in master's sstate, not a freshly-built
> QEMU 11.0 ?)

This is the second execution of bitbake after everything is already
built in the first execution, and bitbake only needs to run the
testimage task for core-image-minimal. The actual build of the image
and qemu is not in the logs, but I assure you, it's building and using
11.0. You can also see that it's using my
akanavin/package-version-updates branch, not master:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3930/ste=
ps/9/logs/property_changes
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dakanavin/pa=
ckage-version-updates

> Regardless of the AI agent, but the earlier test really failed on the
> worker ubuntu2510-vk-1 because that host lacks GPU/DRI3 drivers. Have
> you performed your test on this worker ubuntu2510-vk-1 ?

Yes. You can see at the top of the page that both tests used this worker, e=
.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3930

Alex

