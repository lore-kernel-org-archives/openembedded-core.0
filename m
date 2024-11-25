Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61200D59D65
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 19:37:46 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.27766.1732563462749810649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 11:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7+eru5O;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5153bb54f09so250811e0c.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732563462; x=1733168262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBkv27eay/F3lngu9Aueve0g3vPx4hqNV7T79RdIcs4=;
        b=U7+eru5OfSuIIoUF2rcz3jCRXQJzqYKU1H6LQ0HisMIRx2Gg9YQqMN5qc/ZN2jKrpw
         PcSu4cpU2BpNnzKH4yyyDiQ/kHXyk8jveKZ8P+Gq7o9OGUbpCE4bdWpPujTkdt5AuggB
         Kk4WhsNr4dYdS4zAav19ZZOpG8rB5oIbquI/mWT9IbGo1+tTvHJ5kHkxcJud9eh1eQZj
         iqQj/YphiHoFn3no9pAvcjhmMLc6/79mwLEGRAG36A4NNpvfq4NSYOo+AQ5YYArFmgQN
         4neORZtPkZpepy4w6G/CwD8n0iZEijtTiFFATDG1+CpPduhYgZIP4rrO2OT6EPh3d3YF
         17pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732563462; x=1733168262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBkv27eay/F3lngu9Aueve0g3vPx4hqNV7T79RdIcs4=;
        b=ehq8Kji1oT1yCLsFWcrum0Pl+SCj3g5FdNdNfQ3St8lPLo2fbp7dbvxmHVmyCABCu3
         apCabopUOZeh3IzKle3OuUiN04nN27wwCC5uqrgTOF8Q9Bz+hECbRKq1Jvxj3/BccL4t
         hJOV30XpeF2QcCtK11KoJx73QLBG5oXtVqkq8b2QJZURrPZ9AARovgCTgLkO17pBVwZx
         +QjBEfLV0kaC5e/yAKgR5m30UrhNqk0UD2JpYEnjWsOnnfJFp3zUMaizduh2UBwNsJL5
         6MEZvisFinqPSaEhyzd0jWPusr02uqumKx6K9qJwx8KGRmpQ4uvKLmh/PlvASKt1qfUj
         kWrA==
X-Gm-Message-State: AOJu0YzVJgqyjL8wq0rMLvduP/Vl1gLInRNWUAB9EzYprEkOQBGUNMEk
	PTWvxb/xaAVqSuLukbeflp+3eGYwQqCpj26zUsH57OM2tiWJzX2qNir0CTHd78lV1AHSmFntcye
	xGQ120dqZUIta9ZDGSZKbsxKnicQ=
X-Gm-Gg: ASbGncsH++fFd0stG1AA/m6Z5r5auaLL7JKU/U79Vqe5TlMYi9L9lqREoF8lTcGEA4x
	TghMmaHvMVPLr2T/3tGLOQ50CgP2tR8cb
X-Google-Smtp-Source: AGHT+IHNHHA3B5r90vNVlOgqCygvEgTmgMC0z+haZoRb27XBZ+hmYEGVUogfPwIufV/4a8Qfcl8aRu0EfMwPXRHwyz8=
X-Received: by 2002:a05:6122:2804:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-515004c9787mr12799593e0c.4.1732563461677; Mon, 25 Nov 2024
 11:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20241125154739.416548-1-danismostlikely@gmail.com> <77816C76-BCE8-4321-9DE6-DFAC8639F8B9@arm.com>
In-Reply-To: <77816C76-BCE8-4321-9DE6-DFAC8639F8B9@arm.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 25 Nov 2024 13:37:30 -0600
Message-ID: <CACS+7ZS896wWUTNVGLLoq3NhG7wD5-BioJTKyANCmLUJhqgLzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: more optimistic dlopen notes processing
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 19:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207799

On Mon, 25 Nov 2024 at 10:37, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 25 Nov 2024, at 15:47, Dan McGregor via lists.openembedded.org <danism=
ostlikely=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Dan McGregor <dan.mcgregor@usask.ca>
> >
> > Ignore shared object names that differ from names we've already
> > processed only by their version number. This assumes that the
> > highest priority is first in the list, and ignores those later
> > in the list if we've alredy found one.
> >
> > I saw this with the qrencode PACKAGECONFIG enabled. Its note lists
> > both libqrencode.so.4 and libqrencode.so.3, which led to a packaging
> > warning.
>
> I=E2=80=99m unconvinced that =E2=80=9Cjust take the first one=E2=80=9D is=
 the right solution here. What was the resulting dependency without this pa=
tch?  Our qrencode recipe is version 4.1.1 so libqrencode.so <http://libqre=
ncode.so/>.4 should have found the qrencode package, but libqrencode.so <ht=
tp://libqrencode.so/>.3 shouldn=E2=80=99t have found anything and so a depe=
ndency shouldn=E2=80=99t have been created.
>
> Unless my code is buggy in a different way, of course=E2=80=A6

The dependency generated was correct. It found libqrencode.so.4, but
the note called for both libqrencode.so.4 and libqrencode.so.3.. see
https://github.com/systemd/systemd/blob/main/src/shared/qrcode-util.c#L28
When it then went looking for libqrencode.so.3 it didn't find
anything, so emitted a warning about not finding libqrencode.so.3.
The goal with this change is just to silence the warning if we've
already found a package.

>
> Ross

