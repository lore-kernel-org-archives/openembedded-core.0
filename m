Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5D0E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:38:14 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.14347.1733413087336529392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgPa4jVQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so9424676d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733413086; x=1734017886; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QlofjmVdvGxo1LZJ8qc3VuiJmDz66bA3/011YUDUl0=;
        b=dgPa4jVQN7s8u+CRFEf+UYI/ZNSxEupRessWzjyrYp4E6kqP0qwWU/4I8wP1hNAwzp
         wo7ENxkVuoQkeOhoWYHcRLzpzSfOAdRncejk7+gC9oTf5Qn2nFqc4Zxu0Ub4CzDgO32e
         YDYgcEcr5FFr/XQ8DivCSjCf7ArgwG29T8Lrk41lJjv0srm5YbfTcw1s0MLEbDrsCtst
         +tqPz+BSeXGqQCyUHCEXDE5p7904VN27xtlG8/mLjBlIOROkE6Jj7D1S2Pmwc3ZeGapG
         tNyw0vj+30EOJRmfXgclcIcYngcHoX5KMmMMmQ6O022au0Wx7cNCEUpV60VzTcdLlWO/
         fh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413086; x=1734017886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QlofjmVdvGxo1LZJ8qc3VuiJmDz66bA3/011YUDUl0=;
        b=cwmcKxNob0SSsDHLtXoUU0ub3MKTis9GSARVDsTYX0Vrre7duMtJu3wcWqAw7rFSQu
         1OYfu2MBXSL93ZpfIdNs+zeV3/+9G+Rx2Ej5h5NAjE5IYlJVdbcckJMG6AAuvqwBpACL
         xtSTi25zpejfnt27tHE7tVH2Ed1Yqp1AWSSjTCc4LQ4JOnzDhs9xoYDt4ExJr+36CXvV
         GjTdRIhMQRrpzMT8UcWo+QnyIbaiJoXjceLxvl2TsDJtb4KJCjsN6o/VOHHQ9I96b75L
         s/uGHoCs8RR5leqcYQfqfsJ8Zo1DBHlVaNTWb60F3Hk9XfPVKePM64VuzX8KVNqjhJdB
         LRmA==
X-Gm-Message-State: AOJu0YwPvOVlbTdFZSpWEPbH6qutjAbNmmont5LPSE4wPPXAt8bbFm5q
	XyscRi7g9h3opE6EiacLPzuqE2+1aIuW7s7ESNjHtKZgYRMo7n/MbmW4uB5ZMXb1KyGxg9B9lkn
	Wj4FqrXpvgB61xGKn0U4W2hRdAd4=
X-Gm-Gg: ASbGncslr8hxqLSamFzK5QjDlr/dgn4aaNeVKu2zROs6zlxGg+TLZCnTjee/vY5YKtS
	qMkDeaouvEtDschsB3a4DwAgh056CmErtoZ20zZopOf6St095P24l996HQalOkcl5Yw==
X-Google-Smtp-Source: AGHT+IEdDx2QJaAq/i+9RTo+YNOF9ybTuEHihoTkYKG5/jKEoGOpdkFRnNgEOusKvyGxeNRVr6U6ziYSFL4lqaRjJHQ=
X-Received: by 2002:a05:6214:518e:b0:6d4:fff:f9cf with SMTP id
 6a1803df08f44-6d8b740e1c7mr154883406d6.35.1733413086357; Thu, 05 Dec 2024
 07:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-14-alex.kanavin@gmail.com> <181C637A-AD13-41CB-A6B5-152AA612102E@arm.com>
In-Reply-To: <181C637A-AD13-41CB-A6B5-152AA612102E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 16:37:55 +0100
Message-ID: <CANNYZj8m=0jYObXpvDhGta2i2aN6WYgN2p_MPJaZxGLhHQR9Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/37] dtc: upgrade 1.7.0 -> 1.7.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208386

On Thu, 5 Dec 2024 at 16:33, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 4 Dec 2024, at 06:48, Alexander Kanavin via lists.openembedded.org <al=
ex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> > +PACKAGECONFIG[tests] =3D "-Dtestss=3Dtrue,-Dtests=3Dfalse,"
>
> Typo, =E2=80=9Ctestss=E2=80=9D

I wonder why this isn't reported in a build?

Alex

