Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366AAC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:55:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.57246.1753952123330138692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6efLUcm;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e6783335a2so14389785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753952122; x=1754556922; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FyF8vFF6wOThvPpkSAY3SqrB+macv4wyogHsk2T8FiQ=;
        b=N6efLUcmX0xpO42MzP4Eug1Ojte5F4qkodaaNLQpvtqD6j4stI69uaDzlF2avhcVhm
         K2De9bR0rJWAxELxTak0XpBeE4adH2rpa12y8Hh62QA+O/0GjhLroNTayPK52PuqlqOG
         3IUWLWn3H4pe4GsXLeXedOquqtdgXWSag3pFxy4ggxknuuJH9c82e8iripNGSJvDDQ9i
         nuj0QYp5W7NbjTTQRRTo5Sy2eNEj0AFIYAnkeBICWXd3lC4ydd6z59N7m2kkHYp0JGqS
         ELz0fYmBH34J4+p43DEWzx9kDsQyydmAbWpytkFkuNmR/MiJP3F+aNJDPwm7aUcgHMjO
         40Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952122; x=1754556922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyF8vFF6wOThvPpkSAY3SqrB+macv4wyogHsk2T8FiQ=;
        b=ZDLGYtAxYpmf5AbJXSaPnN0qXKNJRD2MnWQ2xwrNn6p0FiVkzbTskurSKTK2OzHo+s
         gMY2pNN1vNqjTL7vkkIUjrD/OJuvEiViOaJVpd6wvjpIC0jjvm8xiya/qEbpYqUxy730
         ZeyksihacMdhoRSZGP2wrnSaK+77c93lFhO4eT/Dbb/rbCwj7KBXGRLJFhq2UbqLnhMQ
         /h/X9CnwuGLqxN/5+/CIWqM3Fa32Qj6w0SI49hMvN8a+Y3MCgnyd0DijS2wa6f1Qhcxg
         am/+Itk69KJUvA/kaKP6fYcrdh9d7a3pgPF5/WA5RFlCUDgCiBexHBhhNoPXKnjZgX5O
         lV2Q==
X-Gm-Message-State: AOJu0YxvFT01GB7DDs7g2MaTbJddondphqEMSlwoOccpiIk7yS3cREJN
	I9bNeYOJCMM57n4+6Ky6wDcEvylX+qaE3227of7RtmeIEpTkSCX2WDs7vIlRL4NIP8m+cj/OnAW
	Jeyf2V5T2Ov1vGJse3Ph/kd8SgE9lgCk=
X-Gm-Gg: ASbGncvY0mdvknwqE6zvw27n0tGpLHQeb4rmT8kszp6UQe/55GcKFkmcAGNXukkejPJ
	v3uudc4MsfM4N5omPo0nyTbGQrUyePUW3nGEAFREtlvKItdNpOHU8e+zATR/c/iJ8Cnqps2/0r2
	amlWXb8Viu00lMhoLdeXL5nR+7BsCpcgecLhgVdL31kMXBvNwPwC/BzBjvmyiJW6mb3x3+4qnT2
	vGnJgTHR4Xfo9MxZfT9bgT/e+J+lDUnFDXRF/MW6g==
X-Google-Smtp-Source: AGHT+IHrbuIUOb0tWQMg6XxrFB0z9oW7bleXmeABJ+VgNXh+3vJ8xet7/phCqESbPQhrm2SUxC9O9Uawk7/rZmZZTag=
X-Received: by 2002:ad4:5763:0:b0:707:5df5:c719 with SMTP id
 6a1803df08f44-70767478e57mr105631356d6.17.1753952122254; Thu, 31 Jul 2025
 01:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250731082707.3481718-1-yoann.congal@smile.fr> <20250731082707.3481718-4-yoann.congal@smile.fr>
In-Reply-To: <20250731082707.3481718-4-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Jul 2025 10:55:10 +0200
X-Gm-Features: Ac12FXykRU3J49OgyLuUG7g4bDfiOp7LSTPa1oX3ViYD47eg-Qo-67dbYikvoBQ
Message-ID: <CANNYZj_a6qhBpGMXjUsmvZOb8W8JNu-yhdbhJT2Yg-yC_iyJmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/4] runqemu: print snapshot mode state in console
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221183

On Thu, 31 Jul 2025 at 10:27, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> +        if self.snapshot:
> +            msg = "Enabled. Changes on rootfs won't be kept after QEMU shutdown."
> +        else:
> +            msg = "Disabled. Changes on rootfs will be kept after QEMU shutdown."
> +        logoutput.append('SNAPSHOT: [%s]' % msg)

msg is not a good name, snapshot_msg is better. I would also avoid the
if-else block altogether, and just use a conditional expression after
%:

'Enabled. ...' if self.snapshot else 'Disabled. ...'

Alex

