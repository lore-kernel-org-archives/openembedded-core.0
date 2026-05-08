Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65638CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:03:48 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1970.1778267024208218399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 12:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QSce2eQ0;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575796e55b4so1180053e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778267023; cv=none;
        d=google.com; s=arc-20240605;
        b=bgY+qcU2J8wj9wVb2C9P3OtCYdA40RkINB/mRa9DK9AcIXApdyzWFLnJpp00xhkdyh
         CQ7a/7c0i8/GUP++NXB2UULBy/Wk0o2b4461p62gNT4QJ0zOQAuCDQdX5PluVRLZVDlT
         1qppFQtAqWuZjD6Qnw5ppzZg3gs139/zFSIeyLb7x6Kcpcms2qoVC+IYaQ9zVwthsTGG
         irVSW4sEE5EwmiBcgS9RxpulDW8aP4HDeWMnaFRSu/FKhd4hpYj5Ze8z4nSBB81FNUIy
         jE9Vm7j0+abkHxwejqv7E4IHdle4dp7V+c8ZFy94oOT0K8zvijMZ9XkXETtuN34lWMX/
         NUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ba3G+XMaeAGWYORiBgMQCo4jvK39Xy68y8xlQOfETxY=;
        fh=vQ24tw2Y56vz7qJJQyKZSM0mLLB5Tlr3V4eq5nF6CFA=;
        b=UUEKTZ8ObwsgtdA/XixzqiJgxlPNFCJNSuZP2RCcsleogEkP5Nr6xYSdxwKkE15VW6
         AxxlLOOyVZ07XkgekBPT3lUG29K60SEkSobKiST7JaEhczDnrQEa7gyVgnTKU4Hm5gGM
         O45K/ixyQU2wiFb1OuejLQDhXNl3nWkmKp2+P7wmUfUd+pxhr5vePBOqOi/NDA7KrpCh
         1PcJ2yf3KjweFCh40DAxJvxBJAokrPJnHcXfIFZaNLkUA9+pKaRkXkGCG5XB34S/Lhyd
         Ck39TPyR+ccZ09BnU/vhBiYubiWGjnDTFiqrtqU3lmnl5kofcdBFXOUgDHIEEMw37ZJc
         Gw8A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778267023; x=1778871823; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ba3G+XMaeAGWYORiBgMQCo4jvK39Xy68y8xlQOfETxY=;
        b=QSce2eQ00TVr/HTv6GELzMGekIM4pEXgKd037J1pLv0gMoqSATUZFO9Zq7SjreLgqu
         yHeXyKkwhvheATRgjWwKzbGSbw9LmA3zqAcdgi9Unw55Pe/AWIfm7Mf2FK7u8qEe1Ns7
         cZD06Dh9nhbaaqQLAHZKoTfG5Jx0as8thvSUsW/HYBieoxrBZg+ExqBxJiWmP1LpQWrM
         CXEJGLNQno4vDE07QkPrZvOBGsIAFruZjmBU3rKBjkqw+mkGyazY0RHADKaNiYye7HzJ
         99AQvKeO3o8hmSnR+acZmUPKDaCWwQfq/vAfe+IOqqytu9oc58MEmJcrTjYqGQ5o6tur
         hcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267023; x=1778871823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba3G+XMaeAGWYORiBgMQCo4jvK39Xy68y8xlQOfETxY=;
        b=cmwhbNL/Cf9GuHHXK4JooqxQtNomMc03ciTRh2GlfK+Rj0lLs4m8DR9zFcbvkZfml1
         THPpekvPbAeczGll5KlEdfqZwExvi5XdjuIzznWl//khoNIpiVSHRW5bwo3j9C7uU+Rr
         V5Pqr61tdm8sfq7ojEno5Jdud70C2IhtW3ftU9UabcsBKWBsA5vjoImyFH5uwuZyEIWJ
         q+ZEFDH2EVKEvBPO0FT7a96pMoEWXzdR1SW54KGtnjM1vy91mlMwNMziGzmdT2SRRNBF
         HroOqfKCJ6e3LD9FZP3axR+kMrIQ7SJR6Z5kZ6QfZBQBnW+jV+hGVFgA0Pd/c6MxGWOs
         XTCw==
X-Gm-Message-State: AOJu0YzhILt2aBWYHeMV5x2/eQez4+Xs3Rxdv+779NluZZWvB4EZ94+e
	/nzgh0mKy5b6ZNQ5TjFDqVNhb/HEVDZJfC0Wzoet0lx5uVM3BWQPL5HZ6zD4jhu5lXrna/ohR5B
	xlXAAcQc6PC4xIeAKj9FQksnFFqWmbWc=
X-Gm-Gg: Acq92OHIsz2dJ572zxblMZz3R1UIeXlO172+uNWDLafdrg+/N8CkGUHi/iGlUAvx+wC
	5m9rb+j8yAk464SsCtCHCIRsj4D382vzRugcehe3IP+QDrsZgYUStVZ0oQOeiWYsU2K1Bf5vLjR
	eX70f7HaD+puShdGu78qRmGJ5GePYMo51iOpnzWJlgsual2vPGTVLT80apvfgJk0ckXFZ5XnWsH
	hvEJOvI6gOsl1qCCfIfLNB5DDdPlapEwAUW6F0IrUOoNw3hrQ1FgF39yJXhQOEKRmoE4VFtFyDO
	RToY5magZgzcxBV5CfsBCIib5ibNDIFSGEQoKy5LyQ==
X-Received: by 2002:a05:6122:82a1:b0:575:22f2:a22 with SMTP id
 71dfb90a1353d-5755976ea81mr8875864e0c.10.1778267022860; Fri, 08 May 2026
 12:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com> <20260507-update-sbom-cve-check-v1-2-3c398db78f5f@bootlin.com>
In-Reply-To: <20260507-update-sbom-cve-check-v1-2-3c398db78f5f@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 21:03:31 +0200
X-Gm-Features: AVHnY4JBbxG7FuEPxKslbhQErNvsATJ_JsULr34BFjGt6BPx0AvOGGqkhQYpDQE
Message-ID: <CANNYZj80aPL282d5wvNBUrr+jQUHAP9htBLc3=vJOXFB+MjtkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] sbom-cve-check-update-cvelist-native:
 Update source revision
To: benjamin.robin@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
	ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
	antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
	thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236732

Note that I submitted a patch that sets PV and tag checks properly,
and fixes upstream checks:

https://lists.openembedded.org/g/openembedded-core/message/236714

Can you rebase the version upgrade on it please?

Alex

On Thu, 7 May 2026 at 18:30, Benjamin Robin via lists.openembedded.org
<benjamin.robin=bootlin.com@lists.openembedded.org> wrote:
>
> Update source revision to cve_2026-05-07_1300Z
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
> ---
>  .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> index 338712216590..3763e7f21f7a 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
>  SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
>  SBOM_CVE_CHECK_DB_NAME = "cvelist"
>
> -# 2026-03-19_baseline
> -SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
> +# cve_2026-05-07_1300Z
> +SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
>
>  require sbom-cve-check-update-db.inc
>
> --
> 2.54.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236602): https://lists.openembedded.org/g/openembedded-core/message/236602
> Mute This Topic: https://lists.openembedded.org/mt/119200170/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

