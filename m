Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4C1C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:26:10 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.31953.1744284360841185958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqafLh1D;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so7389056d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744284360; x=1744889160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XPdkof+a520k6HtoTMph0d7ICYY2YfS82YlTl/OWNlo=;
        b=eqafLh1DDOJ48MKiVxJ0CQT7S73NVSKKS60jgPSGMPrknz+WmJql81QYU9j6Qn1mzT
         ZxiPmM9qbxphW3oBnigazb1A1RmixmSlW+CqxeIF1HK6mNCAQDjkvxjINBQ9L/Rsuti7
         mpxWNcu87kxlJGahkM0vfbzih2WkABkdtCqpuOSkcNyUR0ztneUkyqx55xkYvCUmfKFx
         jObSjzUnBbE1K3V7MgZt6M6FXh1Qyzrnu93c3z7AJ+rpPGBND3JewkAhzarzX642I752
         H0yoFXAffz16JDhpmCYCz9LlqrXpils4L55ctv26dN1LR/RNnzZppVC6st2OcI6IOjD4
         h83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284360; x=1744889160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPdkof+a520k6HtoTMph0d7ICYY2YfS82YlTl/OWNlo=;
        b=Wt6y94PrfMKmUFkiqGZO1OAV4lIF4lHGENj5jp9c/dfV6pjxMyIvDnTCUzHWCpJ6AB
         QP8wLidTKxhetGIRCVyKOcpSHuUWxn+vE6cQ94ikE+ks8zwq08IN2MJdpqaLTZtC21tW
         7jS4tikYKJvRNlGh8iJksyFoBAPJqxuOA+Jcb3lxaIat29syFYZZEhioL/VMf/68CnQD
         5wE2apCMawXjMqwDpchsCs6JqXhPMvKSkafm788J2Dbxeyv+vsFxyivmm0DXwyS83NzN
         iwcuX9s5RBeEUAPbdS0yWRrx8BBOWgaQslNTIE9qHufGUogdbo7PUJ4KbjoczMwFqGGb
         V7fw==
X-Forwarded-Encrypted: i=1; AJvYcCWRS8gQKu+aVFHaa2f0NCbQesTl31/ZZJ4lt5jdf8dxmECZ8jWW5s5avkJSYzi3tmZs2SbM3McFP7/nnUT/KRcoHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCkT67EkOk38Q8Zkhp0au0mz24TwjrGGhKjLjVVn4rTKayRHCY
	LFxhXOGQJyrLKJ8/ppymb8xIxVH8hWutIxEMUTE4wU9Y58FCTHoi15tKhBXdsnNjtRgPVgmQuEO
	BKE4racN79opr9P/7lZVpcMHxIWw=
X-Gm-Gg: ASbGncuaNv4yibREaMYIXOUO6/kkktMHC4+p9riYsQBKnC5pawTLPVLsmqxUWBpO7u3
	5a1zFLTqByEhv7NrrUF/t8FbP2iQ6kQF4yCHaPp14oBCJmUxFyCVEF3QETaiWybOb7RGAmH+Q2l
	5kdPAa7S2g6wet+D9iYvvL
X-Google-Smtp-Source: AGHT+IHhpu/sOWXQ/Y/K5Smg3q5vMh38H3K4kdvan67H1hjQMXoj84BIvNgJKhu/rNa1QMhV2xJB155bo2ObdjC8594=
X-Received: by 2002:a05:6214:19e1:b0:6ed:19d1:212f with SMTP id
 6a1803df08f44-6f0e5a6d1fdmr33569906d6.5.1744284359894; Thu, 10 Apr 2025
 04:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com> <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
In-Reply-To: <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 13:25:48 +0200
X-Gm-Features: ATxdqUEkDbDVe0JgEvf_gjC-6nBciW9fEwa6Ev2m6nNrSzFG3VOmXSs21t_zJ7w
Message-ID: <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate package
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214646

On Thu, 10 Apr 2025 at 13:21, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> Basically, we wanted to have a packagegroup selecting libinput, but we
> can not select libinput from archall package since the libinput package
> gets renamed. It would be logical to make packagegroups / distro
> packages to depend on the libinput-udev and then let libinput-udev pull
> in libinput10 as a dependency.

This sounds like a workaround for a different issue, so it helps if
you come forward with the issue and show how to reproduce it, rather
than hide behind vague terms like 'other packages'.

Alex

