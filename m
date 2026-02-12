Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710F2EE36B8
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:02:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51872.1770919320200431387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y9E/VyeL;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c7146b0854so14693885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770919319; cv=none;
        d=google.com; s=arc-20240605;
        b=Su0ncFsREJjx6aiCnHy3mia7oja3XXra9WxzejkjLqkGEgR9l9JuCQyEHn8ofWBq2Z
         dDn6tVo9bKIDvUnpC3VjnuS0bm6Ljz5APhYltOhAxxz+7q3bUH180QsmA4iV7QgEKKd0
         TMeYAKAnObaRaJmvJSYgS8Mfs8mopwOVlGLsvyW4uVJL02jiN7yd8Tc+q9e1EFsKx3q0
         iteI9XhA3batqxKYVBuZRN6x85NY0xEz2ZhGl+Sr5Wxxes7Z/fQl8ki+D8I/0WxBDUgw
         w3RnDu9lqN2+/olcdviY5vYJwYaG2pKZSw0LrHCqR1/lX0aK7VwQmJkj6GHU3/Qs1YtQ
         2lmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wT/AO4SoLY2+6t6BvA8XstyUAX0tXfzkaqMX4moyzVM=;
        fh=JixOvEdALCsB121263bjiGQqICxvJ7MiYcjuX53jpvU=;
        b=JwFn61NyJW0eGVA6j4y4IyvurTrn/wfo/PEPWIbZPzAiEOfPhoEZIIw7JtfwiaMZfO
         vh20VXc8s/npGcuCdP5xGUApAz+b0KCMX1LYi96nls4Kfa5YPLuBxMaFNA6bSBmUEupF
         KX2bDEjWdpFczgBz0lSqZLmmux3Dr+HJliAU4JTvcVdIiAgRAXV7AGYAF7YalCtgSZcq
         sUzdx9Ku+Fg6cUWFgOo/0+uQzHGWrR2ARQMLLHp98gUEY6d8jPbEJfEsCpB0sHDZ2GTn
         6XUmexkzg9ImXDbpYTlY0nzpTUIwWN/5yR3YrBpLHEcOyMRrO1N0s38YbojTyd/nYonW
         IrJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770919319; x=1771524119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wT/AO4SoLY2+6t6BvA8XstyUAX0tXfzkaqMX4moyzVM=;
        b=Y9E/VyeLekg0/grm9zY2Ht18fm0jomR+G4EEUK1b1WDaN1Pc573RAi49VUoWRwpPHv
         7SrvFHumx6defgadasAl2mQ8XEAoXpPpC15lgyikqWZ0YCeGv5V26NaqPXGFMhigrjgg
         b9a8jLSrb8qxJJOii+DAS6CvwNdRwkmPkx/MEus6q/7bqaIs0G2fZfZFA7TMy87H5owQ
         crUYI4tkcGhGuOIgm5MveaWGWeJozPHIaXjIEQnxmY4M3dZhTrh94QcOjQ46tjwGPlXQ
         uSQt4bI9HZdSiHX9LlcvGnBKRMDaq3T8SUi1og0XEpPbHnA9ExvJzfiP1UD2kax3Pxza
         9OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919319; x=1771524119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT/AO4SoLY2+6t6BvA8XstyUAX0tXfzkaqMX4moyzVM=;
        b=f7ZWxIn1+jYgt8qYWax1XuGiqRro9+Cpct6vJ2CkXgwguioC0eZKIsCwckEhLwg83D
         66/XyHejEwGXPoSzTJ6Nray/E1/UCqszpRHYHb6ha/uF9QHhFe0/WaIvA+Tyek/6F/Kv
         QI1im52oLhmPVyAO7491/7s1iRBxfNciHID7SowlPkL4295sw0k9xl1K9ssUYDZeFuwH
         EM9y7+5XZgsWIsLHz4yW3VNZ+hm6LMv2xmxbMeWSdDUeuDA/ywNcyP/Uk73hAt3GxXU1
         eWe+yfiEiYXTNzBvQu9w4d6Gjg7uZBt/9v/RJIR87Hfydemcy21aKjgp4v90iTRHdF7N
         aoFw==
X-Gm-Message-State: AOJu0Yx9kRr3h8eVomSLER60Se7vJ4LDxWLpdynkG30I7Z3gwC/kElYL
	pIUEVXOCRlizWdCcRbGFsVIVRts+j+ZAbuPeTxJT/FAvEtL9sh1W3+yrykvj/pq1QQnwGlJxRsB
	S0wSe3ViFL+1DKOhcXarhB5MZ5c4Pat4=
X-Gm-Gg: AZuq6aLmMBnyX3KiDWSCpxHogEmjmkc84Urfi8HyiQUXzNVPsMC6drgFSSdZzYClli/
	tPn03tzGdIWKQaBVgsX5svrVXsMV5E7GXbDeHMHnOmKQZETPFXgsysEtysPRNnQg1ij3MCwiRth
	KFEa7sNE2j6L4Pv+lfLrFH6axju92qi0ZmjOt5cVO+tgbs0y3TgLUeYlqrua2N4XLLR3pAYJ1+b
	nMgYg05htJCC06iejDNAkJaghM5hVGjlEzB4UbQkchVX5Kc1BDge8ONfiPw8PXjzTKxyc9FAikM
	khGmQ4f06D/JfSbA92As3MsP3X9i4wRB5NvceN1/TA==
X-Received: by 2002:ac8:7f4d:0:b0:4ed:6831:56bf with SMTP id
 d75a77b69052e-506a3f54daemr4257681cf.13.1770919318975; Thu, 12 Feb 2026
 10:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com> <8c07bed6-0dca-47bd-a1c6-176bfb1031f3@windriver.com>
In-Reply-To: <8c07bed6-0dca-47bd-a1c6-176bfb1031f3@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Feb 2026 19:01:47 +0100
X-Gm-Features: AZwV_QgApeIGS3m2dm_1vz6U9oNz-6ybAGnw5WmS-965oUw_Xu96pfB7uEw1BbA
Message-ID: <CANNYZj-FXm69sEZGuUjqjV0wZ9F-x3NjwMBPL_8mDb5QRJpYRw@mail.gmail.com>
Subject: Re: [OE-core] [RFC 0/4] Oe-selftest for Clang, LLVM, LLD
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	paul@pbarker.dev, Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231054

On Thu, 12 Feb 2026 at 17:34, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> I would greatly appreciate feedback on this RFC. Please feel free to
> share any comments or suggestions you may have.

Just wanted to note that depending on how busy everyone is, you might
not get much feedback, which is fine. After some time, just repost the
patch without the RFC tag (if you feel confident about it), and it'll
get into yocto CI, and there will be feedback from that at least :)

Alex

