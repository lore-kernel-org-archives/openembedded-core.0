Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED59CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 09:58:18 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.48227.1758535094290112208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kx5XXhPK;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-77dd76f6964so50867606d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535093; x=1759139893; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QQoozVgTLc12C3rhNDBXh9w7tepA6JzpjZOnTn9/UA=;
        b=Kx5XXhPKBmfJSWuWF7ib9AEKUP2zj8swo/bEdF5z6kYwLsIB4ZcctPGkeQfM/kDlJq
         O4O8ElU8GVxwOVpthTZ5yxttAYd+L8rBDHvVjnAmROV1nqIIbbjMD2oysGZ3MdVdr4QW
         Fm+Hq/ZX0aiJinFVkuVLpVjhkP5+WnirxmNl7KfDR1r9XTtZL017sQydU2Z3OkB51kM9
         QN6uYT7RvqP3aX73G+v93wuBf9/6n1TEXeh/OYoq4uByWEKkCyx6TkoscCSySjXcaFmv
         XIt7ndevaONJ5z4E1mKt2zl0Lkrr3CvvxEkY+u/JlIZoMXxGTLUUiV2F1vZw3YYM+Sr9
         ncBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535093; x=1759139893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QQoozVgTLc12C3rhNDBXh9w7tepA6JzpjZOnTn9/UA=;
        b=fbpQIZKGy29c3IU9aOUh4LQPEFP3EJ2bhC+0ccDYh5EW8dQ0EfUzwFJVKtdwQDzeOx
         Bwboyiedc6rRW6V2NecuQ5lX/y+qkrpgRIBIN8FtZMvFeHTGcHpwZul4IXlwaTajHq3h
         EJ1xMqJuv1XjPC1PbKauVeH8QWR6MHooP9ecUFHNf0kKOhLMA0mfjU2IrTC/+O0kh5e6
         VcU/CQUXF+c73Fo7Y5PK1Cy2PrFP8vCSedbB/nVdAIMoiIMG+k4tJNOdTFhDVL+NYeIj
         uOhtp6FDYHvJNK0jwontYS+NPBwRmWzuUweLiXDTsCXaRkrrG2OdD0pTBZPQwWG0yWk0
         6Yog==
X-Gm-Message-State: AOJu0Yxz8BIdBYE2LqfZ6yUGaSFVF+xJ3ffmPqVcX9Cef+4aqf5s3Kj3
	4dWWK3YgKJWhAO7OGzpY88aKn56Zk9yz/rLxjDu27BTMG4t7KHA5aUw6K1eP1W0xoQr/YgdS44b
	b+0IkWqsyyQdQmsSYyX3z6Ul6qCIvNEs=
X-Gm-Gg: ASbGncuu+biSVZBBlAgFhkyEZtTRvHCeuorEr9N2bSGl6TP+adlKg22G0I29WpQGmWT
	rp4F3+DAToEAVrLv8aWurwLUSkuMm5iGXxtidHGn+dLEQ6x8xPLn911xl7ssMBvyqCHwvJPTses
	UO1V2MmVOPwmCNGvLV79wOJTfHZTnoPuGO+uf5Q1F4R75DOw5L48qvUiztNOayyKgdLyyfw4uXq
	y6uEoUUUa2pvUrWVbYC22EuZj4v6imNH7InWH7/zTXMXG0jA4f7+dNNUrsTXt8CYtcbzSC8hEQF
	B1ITvQ==
X-Google-Smtp-Source: AGHT+IFdieZCddjvxbbhEW7GVQI/x6KueLad5twJXmmu0WavLkT3UNZeQyD2YDV76impUtnV5czfweChyYIX8y5lzys=
X-Received: by 2002:ad4:5be4:0:b0:78d:592d:fd03 with SMTP id
 6a1803df08f44-798c43b12f7mr149725106d6.25.1758535093193; Mon, 22 Sep 2025
 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <bbe0c5a1368b36754e800576d8f93d1ca406ab86.camel@siemens.com> <19647.1758530483327855783@lists.openembedded.org>
In-Reply-To: <19647.1758530483327855783@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Sep 2025 11:58:02 +0200
X-Gm-Features: AS18NWCpmsjRgsoC2t74yV6ouezvN1BJ-HcDXLYfabqL6RiCCN3BsYA0hFtX7Vs
Message-ID: <CANNYZj8sLn06K6YZjh1Lk8hbV_v09tjpBMqc5pRrFOdzMde4qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] kernel-fitimage: add support for custom ITS
 file override
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 09:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223816

On Mon, 22 Sept 2025 at 10:41, kavinaya via lists.openembedded.org
<kavinaya=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
> We understand the importance of maintaining upstream compatibility and mi=
nimizing user frustration. To that end, we propose this enhancement as an o=
pt-in mechanism, with the intention of collaborating on upstream test cover=
age and documentation to ensure long-term stability. We believe this strike=
s a balance between flexibility for advanced use cases and the robustness e=
xpected from the Yocto Project.
I have no idea about this .its stuff, but adding hooks for replacing
existing, not-quite-perfect solutions with proprietary magic is not
particularly welcome in open source projects. You should work towards
improving what already exists.

Alex

