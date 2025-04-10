Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B50C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:14:59 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.30650.1744280089072597767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 03:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DkUbJcsn;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fb83e137so4758636d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280088; x=1744884888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NCLOsxuwBwN2afM3zMJUGVcm0JUrQCx0TVeZXvOMJgE=;
        b=DkUbJcsnvCSJhwPF68vabYBPO2N2LtLrRyBZuHhTlZ5u4Hm06mJ8VGdD0ISHRK40OE
         x25Y4WfJKb2MQiCbTgNz2WNRsIIVecVcLFinP1eUOaiSArtB3626ws3b5vdMrvJJ8xkN
         0zH34l0vE6LUzuF6za7pqvO8y8m0TH/gmgLaGuAUnDba8eZq/QLDiWNbiy5kZ0BWV6ro
         DT++NvirP+RXOT40H+6/pjS62hstBGGKFwgRps20aLS41I2TpBApzDimLFNwKycYpTlY
         QwnrJNOuSKCF1qlc33NjiYz+qrVu09Vh4J1PhTEhgYGU5yVTzpy0bpOn+lGdACY2r7sS
         jbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280088; x=1744884888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCLOsxuwBwN2afM3zMJUGVcm0JUrQCx0TVeZXvOMJgE=;
        b=Oh7Hqg0tdbisyCr8cBKhZ0YhzdAvX6RnhBpiSHphNWFs3oTwaz8q4FQqWNjaOyzKoR
         KwrDRME/dOquqzF4F0XwWKvaYJP7IjSzevSxwu3IyGT9659VnsfkICRyo2auy6ZuVh50
         mo91hl0tBxUAwJ4/7A/707mrszcO1bOwFOZZI/llj2PbGrh+5axccrxy57kfwH7t2ljW
         OWyKvfFTta5/zvz+RT9bXZCDwPRY7a3dWwuKMgqLDBP+v1QVYpJdwAYLixWUCZSOQShn
         8M2YyICtAbTNlHRb0MfFFM/crVRKmwCpSwLhaR3Vsna5GgkezqQoLZFWT0FI48i88GBJ
         6TJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrSxNjLSZChqq4Wh1wmh5dxvb7OGXg7csb5TUiXStso+OqtEZqJBeoEzbgvkb29TkCWWvkeAX37fwDV7Tf/sW3IA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLKHbNtL3ykLrV1Ti3NdYh3sL56bA83e1amIx7fbiPOF1N2mWI
	r2i/zKfcqzh+7ctJY7f023oHufFSdRd4uinIF1C5vlYVofQ2d/Ab0hfyeSA2LGSj+Yb91DEhKsK
	tgajA+LHvRAKgwRYs4mB6ue/Zs9o=
X-Gm-Gg: ASbGnctZ3ca0tSc6AK0zW+oH/qBqkD8nQfpeRvPwdywGvtqFwBqzwQrPsfz24/rwAlx
	FR5kqTa22B/ZboiUbvXsES5pvc6xXIJELs1Rg4LMzrRu8oinwmohCsl9ebeyQCx90GQM66mJ3Mg
	kYbxRS9TF6oJRg/bUhOc/FQuq+WGwQdv8D68HB1fFbRe0LkbQqd+Yo1+lj
X-Google-Smtp-Source: AGHT+IFAZ4ZuiLa3iiYm+SZ7xL/GPkmoYqPElXmn6idQ+2DI017/8LBUIN+vt2EKogOvf0GQTDR+J1iwJdRarj+X16o=
X-Received: by 2002:a05:6214:d46:b0:6e6:61a5:aa54 with SMTP id
 6a1803df08f44-6f0e5c944a2mr30241576d6.44.1744280088073; Thu, 10 Apr 2025
 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl> <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
 <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
In-Reply-To: <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 12:14:36 +0200
X-Gm-Features: ATxdqUH34Jx31J4eIijkmxUQIZsrEf0lYEUt1PBTGYMsi5G94w_Vl86G_TGJUsE
Message-ID: <CANNYZj-+Td=3EtykeKT3mEq-0c6Ue5EKQ9if_3OCY3TrxTPUJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug devices
To: oe@myspectrum.nl
Cc: richard.purdie@linuxfoundation.org, Jeroen Hofstee <jeroen@myspectrum.nl>, 
	openembedded-core@lists.openembedded.org, 
	Jeroen Hofstee <jhofstee@victronenergy.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214638

On Wed, 9 Apr 2025 at 12:40, Jeroen Hofstee via lists.openembedded.org
<oe=myspectrum.nl@lists.openembedded.org> wrote:
> For completeness, this is not some theoretical issue, always calling if up
> directly after a network device is discovered does cause issues and is
> against spec as well.
>
> The sed stuff isn't that complicated, is it?

I beg to differ. The code is basically unreadable (unless you want to
write an elaborate comment with example input->output transformations
for every single line it), and that in itself is reason not to take
it. Any software solution must not only solve the problem, it must
also be written such that other humans can understand and change it.

I think I'd prefer a patch to busybox; even if upstream rejects or
ignores it, we still have something that is easier to take care of.

Alex

