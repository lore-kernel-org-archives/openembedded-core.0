Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94416C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:13:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.32659.1744287170513914843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YtUFQRqj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5ba363f1aso106437585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287169; x=1744891969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64nUNZX5lrrve8/USnN/6to9IkfvTm7EkrafgAWhwWY=;
        b=YtUFQRqjuTmIuRkMCFPSgTwPTG/2YwwbsCu9a+9qh3BVgdZA3zneptJ0NngluuX51+
         /Gn7akXmMlkbBfSmWi9cBEyQcNyW1tBhRxrxnqTG6bxzHw8Gu/7o3Pd5ZyMAt58oGLKv
         eGI7QBl6SD1xMNl9mJF4s6FiepR4BGYcDmOomGjcDojt3v/6o80ttgSTHTD7+CBW1hGn
         32qMKQQrHAYf06XRv24oZzESGEb2rxyd6Q5s26C6mVM2iFjCb6u/XvCYazOlZaIRZ/ZR
         vooJrPLSaZCr22MjHRa6EM+0/yPJZWOwrj2begihAa7rU+WpXyIUAbnGUpTB8tw9ZiN/
         aEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287169; x=1744891969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64nUNZX5lrrve8/USnN/6to9IkfvTm7EkrafgAWhwWY=;
        b=cOHm+SaZ3OVSnSCDAPsiyTXwYxfmGoYFmyInlJMRCRW8+hc3nZ9X0C26BzhQVw1/4X
         xQ/yYCM89X3vs/RB1TWdvPoGoj7pnsOaZB0IEKdzjA9Z+QPY0J8lSOywLcCr/TeMk/6t
         94+5wedAeqm/12VQ2LHIwqHN5NwuWQxHEK323zZY1Dv8Y5zrF6aige8RGxrwE5GAUE03
         yn7RQuXhYgPf/r1pP5HMlTp+Imz2E5PbP6XVKT+St/UfKmDsuvefNsC0ncrRuZHlFgUA
         IdFrGxua7qgZvjMrf2iXcY1Lsvl3vqLKbpEi6v0f5zlB2LHDXSB26A/2JZfZYew95Cjo
         nZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXNn8Lcke55/TAqATEKflgBKNDk/wjwP/QqhW7AORRO+uzk0PTti5m+jFE79Fqtv55p9REhK/iWhvH4K4GBvMtWpQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCb7JLPcGZYLOMwhwZHew6t6guGAOYExgu3GmnLMvufBqV/Fd+
	fkGR+aSBWNkGP9AiodtChAs+mzA48iex8BANHZPI4AJxvIyWDHUq1dzvDEUfwmw33pmrdyLYLZ9
	T0UKJI5YQYVZ11tR101Z/wazP+Oc=
X-Gm-Gg: ASbGnctUcAX7F/2z3o1yZX64FpqP7xVVAespzCEWXpC631CNbEuRqNOeScXTybmfNuC
	HzFHlteEoQDBIAQmj2ihIugLWzZkSf/GuaCqC/4FsPp78pBC7d5J8yjU/kra3jFZxiDOXJo29AB
	5n4suWy+0xLhAwff0J1eZL
X-Google-Smtp-Source: AGHT+IG/W2EYgaSfy2/u9+It2wJA1WO40T0FhW9eg8wkxIt9aLQTQ4pDG5Z6LzxYYVNyZtEiKQw2Gsg2iquejh8AIG4=
X-Received: by 2002:a05:620a:f0b:b0:7c5:61b2:b84 with SMTP id
 af79cd13be357-7c7a766e493mr318339185a.19.1744287169539; Thu, 10 Apr 2025
 05:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com> <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
In-Reply-To: <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 14:12:36 +0200
X-Gm-Features: ATxdqUEyPIwmNIrfiYWMfDGgVJGmFQu2UqwgEQlFPBS-uoIvLW1OKw_AN46Mi5M
Message-ID: <CANNYZj_6bKTFQburZyBOq7sO_7coVsh_ZTiu+r2byWYdo4DYxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate package
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214657

On Thu, 10 Apr 2025 at 13:29, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> The commit message definitely needs to be improved. Anyway, here is an
> error that we've faced:
>
> ERROR: packagegroup-qcom-1.0-r0 do_package_write_ipk: An allarch
> packagegroup shouldn't depend on packages which are dynamically renamed
> (libinput to libinput10)

Can you provide a way to reproduce this with just oe-core/poky?

Alex

