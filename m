Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAF9CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:25:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.9510.1755595498939100642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d95sDXAm;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce527ffbfso4510488e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755595497; x=1756200297; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaEkh5GCisDyHGwh/F6hq0hTau+Pfl12yB7mtBerxaI=;
        b=d95sDXAm1XG6W/Sld/8mcXqZXmL5hl4yOWWiFPpYAvLskhW0r0npOXSuoqnnVBy6yl
         VBfVHIim5VIPvBnZh1dFjEtZ7AKM27Hh1l/qe9qLcNiW3gzwVnA+IzGU6Qhz4jj8xxP8
         wtQy3y3A9Ov/iCP+TkoByr0akF0SxoTuGl3cbsKL4YJVHD4pXZRUhRDNeCzQt4IzA1rL
         62to3UJdaP01WcCsC3gvyOnj3prxXpdR8KjmwdcihGpJPw6j06b3mBQDB/CezijCaHJK
         fIFhEaZg1lMAIKtuGqquqiOv1HJifQ2yYPP4zxhK5gi4nRhHvsi1F1XpCfH7kUduWQg9
         nfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595497; x=1756200297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaEkh5GCisDyHGwh/F6hq0hTau+Pfl12yB7mtBerxaI=;
        b=GLFsR6yobUbr5Xnc1OpHIDX/zsSsyC4l/+yZmT4PAqdNbncaQPUSGabA4Iix5eFQoM
         smcncstsAB/kJefDUZ6JMxmfqZMuhl2Zh3HRefnNHZ74p60q3ozj+j2NriblMbf5vZOh
         p7ZX+ChqnjnpSgefSPT6DCuc78rxdSBmC9gwdz8o1ylgl1v8GHk7jDJgPcKA+q/SKCIL
         fA/LiD2x8TMzAYi8/idijJl0YkQ+XyzfUHhGarxIaNu6Qdqq8IzEuyywYgKUSODZTNIz
         TIi5Q3zbOR8lvHc6C18WYkK2QgEqJQjrpa0+yFiMcors3K8BEtVA3oSwvf5zsocxryUc
         dV2Q==
X-Gm-Message-State: AOJu0YwKBr4ekirFOyk5bysGOxKIGOipbWAyUg97C6hcT1wCuurgbfKT
	js1pjh95NuTd2uIkgtynix16d7iZReJzF+iwu70RAQnO9wTSxID3FVgZuFqGJ4eivcB1S/97VdO
	WMsRtNoKCQVbHVwX6GewXwUO9tTu8SiQ=
X-Gm-Gg: ASbGncsVFkZLxC3rQ9k6IBGL8oHxjmYyLjFjstkB7StTlbE0K0XuhyNWp12GpLDrlhB
	LhgER0cWVwu46SdrYH71v8/ErIEVMMOnSnb8xjsgeVEMY1VyiBKGshh0Xq/HrRq+f34ImBgpi7F
	5kdYwEYcLmeiMMPDRCNVYmh3ur9dJKe8b4C2leyFV0Jl4nHIKWGqACvKHCKipjXyyGrRb3nvnmi
	gGcp9HfrHz6+0QUxvKv
X-Google-Smtp-Source: AGHT+IHkVe7K5lpnLsIz+qLqDU/2xVf45E5i4cR8OU92Yqz7HMXwh2sUr1wtN7NFxxDYdUlRWSigQioW03sSdtCaJVA=
X-Received: by 2002:a05:6512:b26:b0:553:297b:3d4e with SMTP id
 2adb3069b0e04-55e00872c88mr521419e87.52.1755595496735; Tue, 19 Aug 2025
 02:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250817205033.3845672-1-martin.jansa@gmail.com> <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de>
In-Reply-To: <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Aug 2025 11:24:42 +0200
X-Gm-Features: Ac12FXwRQ-cycvUWJ36fJe9Naz18oXmkokBUypBR9p7eAjM3gNrMkRVpN_YeqaA
Message-ID: <CA+chaQeo_Fa9G-4rNRuihvsnHbGJFZx_8JS7CHV83KY1w9uFBw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222092

On Tue, Aug 19, 2025 at 11:21=E2=80=AFAM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi Martin,
>
> Do we actually support any distribution for Scarthgap that has gcc 15 in
> its package feed?

I haven't built the whole world, but these changes allowed me to build
our images with gcc-15 from ubuntu-25.10 with scarthgap (and 2 more
changes sent for walnascar).

So even when it's not officially supported (or tested on AB), these
changes are safe enough, right?

