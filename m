Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A171FCA16A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:51:11 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20968.1773078666488593788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFOEgToQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899f8c33c11so80448806d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 10:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078665; cv=none;
        d=google.com; s=arc-20240605;
        b=TmCchNVvT2CuHtr+fFJ6XFFtT6oXGcEe5zc5ZBhuzqGPbwOHo93qqi2rHuE4dMb20g
         jGXXTzyP2G90V1NWnGqXCkAws0kotL9IGikci8mIm6mSiJavn9FdG17N3i8ZNg6VRJ3M
         pSTI22C1B2aXqGt7Ez15uvkm0UPBa1jqY90LCro5wIT24nBpmTOvRaqJNJ6BO6UT0OTb
         7UQLHXsqkk0Ls6y7FiTGHDC7FDNHKBafa+/WjT3RL3kjnYOAnTtZy3LEpgyBX7wiHfQo
         /S2gbq6/wFjk0T5sEDan68dgsBCLhIwqoe3zdal9xs6rYK2gRLHWu2WCrl1Jmluq0gMD
         CRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JQaiFBy9EAGMRNlYeHeM6qjl7X0SgPvMMs/ewuGMq4Q=;
        fh=NmkcGrM9smFZtZ3XOEUskhaHG/hk9q6jU10EUTpvi9w=;
        b=Fr/shXXxI/9ZqlgKNxHZ2Xoww5S4MwtxO5YAauGi6hKRI4SIKWDuDJIKfPwca8hf1B
         LK3p4lbzV2JFqkfNJYHNdVnYhr0HQquQL+WZUDtPBZu7HJNHonMwAA5vBoU7AKLaRiBy
         l4+gcG5/wmujUizrCtgG7qq6pjgaC7YKgke/XQYgX+0JBcxD3M6rb28SAVy2698zcDXc
         WGRX2/kw+2gwHUNj7N8zD2ry9elwulmDr2RAoeH3WWvmM7RL1w23ZtDaAk29E1AIo6ZY
         184cpCIRI8AIiwLMUTsOLyji+BRHblgpbJ2DzjHu72YQPMYQWRDb0nI/S2u1QRWm0MV8
         jhSw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773078665; x=1773683465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JQaiFBy9EAGMRNlYeHeM6qjl7X0SgPvMMs/ewuGMq4Q=;
        b=RFOEgToQOSgXSn4OR5a5r5XT53lkT3av/JFCac7kwZn2Zj9pG1INwht/bmDFILPjWJ
         F3SFQIJ7vc25+RajNTDvJjNiVubG3FExA+ibidapRc6+LE/jJfsr9Hd64l7+9cfc413f
         EhRWaAqOifgCmpdf/nb5QJJwCV7tSgVJ1Xt/j0xDUq9GezSdyyvK01HsdidEVROdB+fg
         WDfUjR1JwmtKPzkD0P1XML0uacTwYa1kmsehV8bYhmIGelw60xHWrXW+DSTXce3zOJMD
         9gFX7mx3JHe9j+k/5Ck8PYygVUwtW+7IJ+fqykdcvDFMqXi4/qF39t0AypCO84/URM6L
         CjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078665; x=1773683465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQaiFBy9EAGMRNlYeHeM6qjl7X0SgPvMMs/ewuGMq4Q=;
        b=J9I7qJIpj/6QRRywgmEEGfOTFA8eUYMaKIXUNr8Dfl2qy2h9J5Dr2QSIUF0XA5ok93
         X6B8gt/UYb3EZb7SOyqkjb9P3POYffSC1SOorgx+XeB9FcDj6XoAQl6m3e6FtptgoSbM
         N2HuXOPPRrvyugO7I4zpBHWOOtLZRUtbpez8yZFNCPPMrHWj5TX1VqEc/9McvKedXVSI
         vr20sZ01Wvgfg+ljQQuDOmqFFGakDsWHKcjwzQnxoatiJ7CKe3Huu+BPMoRXqH72HfST
         fUhl58oT6+P3O7VAxqiNXbEHPo8K0hfOqw9aj6+Ipys8NXTwqW62V39qg1xmKSH7xc1d
         hlXw==
X-Forwarded-Encrypted: i=1; AJvYcCXR2o9MVFGOBKkBUqrmBzOsmDREI4i9HtL5dhlCJ7+6BDgF71v49g53cr2g2Doy4hkyhwdCKEwEZajJ6wFRYwa3/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywrf3QGNJa/Zk9eRAH+lh5BplUZYLPwfNx1v3E56r1DVcupDdoB
	KgLbV+Axzl3gPWOkU4iTcCkFdhtMYG5H2VX4m8RaFNLXtyohl0jpBpoqNWgOo0R1ZOtB1mOcPhB
	kDtdx8vx57OYqwGaLN0kYEW2vxhH2tDs=
X-Gm-Gg: ATEYQzx0z8hCiySH+vf2by43zxmGZ5OMQO1+EeAUahIje4A8yI+o56MiabW+abDTdD3
	3/JivAB7boiY/hN4u68P2j+berZndoxCii6pWFVMEoRB7JYTcriKXiO6ADtbt7MWMqnc5xlWmEJ
	l8u19YKlK3tRhPwNofFqU9Qat4IrDpsxNW7UozlYuu7v+UmjVVGFxK1HhhIO3ILYoKIxyXVynV6
	OOcR8c/I8qD+MJzS8ZOxlm+zg9NwcFXZD6JDwXR3BDo+NkN7y5i1wibdcRVuNjJua5UqjlPY+it
	9cSWygXd7Yhh0nnZLbPq4E3iQoGvowgojIV2NYVS8uCC6HJPd9jr
X-Received: by 2002:ad4:5c68:0:b0:899:f51e:1ac4 with SMTP id
 6a1803df08f44-89a30c19a70mr170031486d6.57.1773078665344; Mon, 09 Mar 2026
 10:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260225033725.708-1-liuyd.fnst@fujitsu.com> <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
 <AT7NBT.U308CGOGMJLH1@t-online.de>
In-Reply-To: <AT7NBT.U308CGOGMJLH1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Mar 2026 18:50:52 +0100
X-Gm-Features: AaiRm51wtymVFOo6L6cec8FEGYgKcQ0Ogxr8Cya5X3hNCm8FakQZnfyhXcL1NGc
Message-ID: <CANNYZj-gUOQ+Ctq1GerFkNZUtmc7hBE9ZewV8cpo3=CgGThJ8w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
To: f_l_k@t-online.de
Cc: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232751

On Mon, 9 Mar 2026 at 18:41, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> On Mon, Mar 9 2026 at 18:23:07 +01:00:00, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
> +PACKAGECONFIG[hotdoc] = ",,hotdoc-native"
> Maybe call it PACKAGECONFIG[manpages] so that it could be enabled/disabled with the 'api-documentation' DISTRO_FEATURE ?

This option isn't actually generating man pages. It would also require
hotdoc recipe in oe-core which at present we decided not to do.

Alex

