Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE0CC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 13:27:12 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.140521.1719235628561236442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 06:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PoDBfomf;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so2423898e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719235627; x=1719840427; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KTH3n/xcSj/QtqPky/z7BPyn4PUD9ZadL63Uk6VKUE=;
        b=PoDBfomfFEu9JA7SzHdyH6EAXtSKBSIHoEJtHQrqnMBQaWgpro9FUqMviZnfV+I1sp
         jxBrne8uoJA4v8Oi87AM2txFcCLRr9G07MjVko3Q/IAComB5NEbW6+vbvvcu8CK2jote
         TnzVHdKdvz7AgcqUzpSbiw6TqHXpxeToZxMWLcwE3iU1DN7Ln3AWIzurlAAKfa3c9IYd
         FYqDs+fErKal3uPEHrzsV5cWBKj01IhCkVZbhJks+Bdozmvt+bP1pxBK+x2SieLwN6L0
         CcHlieQo0drNLGUKoNhnDU/R+Dyws57n+GzBEJyziZE0Ni/xjoBzaZ3BC89UGF6Nnzla
         /kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235627; x=1719840427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KTH3n/xcSj/QtqPky/z7BPyn4PUD9ZadL63Uk6VKUE=;
        b=s8XaIxMH0Yg36BDpGxYA0yYHzZA/oj5ima29pZzH44vOIi+uoZajnBh+HobHNSgiXS
         IvymUrLvT7DS2gnAZj3QOuuh41po+mSVyJQO1qye4O6FZupoGBBj/vEgnVz1r+L3F+k7
         IKyDNkBm+g5g0lS4Dkbtk6gIMWzNm8JyYH+NAU1cyaK7Ej4y9ovrQX/I15OlPApLAr7p
         OxgsDbfNqwSbpKutHTpJ3i2YWfjL2mbMOmJDn/iRgJc1orYqJIll+nXwNgigVIRZ26T3
         FLZ4HSRAd7kUz6zlhb5seuT0gZIUJFylNKIj34es55/HPusw1N7HhIDvHxV4H6cvoliZ
         KEMw==
X-Gm-Message-State: AOJu0YxkJPjZ9BwOkKGHCSeJQO8lI5RVihcTDa8aRGa829Xo0nwkcjLf
	jx/Arq8wEezWodvLIHOClnHYNObk08dEp2xNoU2vKcEh5GdyXkLkVkL670rmfRxBTWu/dl1qxa/
	S2eZ58xPt6ZiSIGyKsLSngTSdhlc=
X-Google-Smtp-Source: AGHT+IFXC9ch8TDxyLA++PB74AcL5zWhn2AM0Dk0hmpkur6YuFL6v2fvcDPu/QKIT3QNfG6WKsYF/aYoAHrT8q96XGM=
X-Received: by 2002:a05:6512:2813:b0:52c:dfe6:70e2 with SMTP id
 2adb3069b0e04-52ce185f9efmr3343897e87.47.1719235626564; Mon, 24 Jun 2024
 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8LT7JyO1731na1c0a8+_rfoCSjwyr=QfMC4124QAT2kw@mail.gmail.com>
 <2056.1719234122993514513@lists.openembedded.org>
In-Reply-To: <2056.1719234122993514513@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 15:26:54 +0200
Message-ID: <CANNYZj_hwcsE7J0BjMANgGrFA5TYjWx+zDceXKtLuMZ=5m0BDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix broken dev package dependency.
To: sreejith.ravi087@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201087

On Mon, 24 Jun 2024 at 15:02, Sreejith Ravi via lists.openembedded.org
<sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:
>
> We should be able to install the dev IPK and resolve its corresponding de=
pendency chain. As I mentioned earlier, enabling recommended packages and i=
nstalling them increases hard disk usage and installation time when install=
ing a lot of unnecessary recommended packages.
>
> Yocto handles the dev dependency chain by parsing the 'Requires' field fr=
om the .pc file in the package_do_pkgconfig function. However, there is one=
 more field, 'Requires.private', which also needs to be considered when cre=
ating the dependency chain for the dev IPKs. With this, the dev IPK has the=
 proper dependencies listed and there is no need to install the recommended=
 packages.

Very well. But you need to resend the patch as an email with 'git
send-email', not as an attachment. Also, make a better commit header:

package.bbclass: consider Requires.private in package_do_pkgconfig()


Alex

