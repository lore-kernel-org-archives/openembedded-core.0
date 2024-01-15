Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893B5C4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:08:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.80510.1705327688412351758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqcsCVQf;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e67f70f34so9050872e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705327686; x=1705932486; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io3RYMSnA2mZ/2TAxvPrJ8VHJ4ZruxxZXYnTxeiA+yw=;
        b=RqcsCVQf1DDU42Nb0FD332VpiqC44UAOzk72+/4TmXqnKomuOX7kJi9bD+pNyAC4MS
         m69KF0Ig4MoyAqDQHQk0JlLwWmn3P17T7DlQCh/rHiQw1oZWUo1/6dbA9DYT5QQPRqUu
         UAQRAE2yXOQ9fo6xbe4C7iPqQFFnyh5595qVqaf4KowuhHa0poqM24GsSTFhFIF/gcu2
         Kij0fyu/VzWV5KfO4iWdUZ+/b5zuh5MGyHHuAe8w63kTB8xqXLzcKB8ynO+B+hIghMxG
         uGL1sT5hziCs7YvHDZ7iWjCzBSUPH8FXjVfVRiA9xYTuLtslSp7z4ULFpPcoYwf41cSd
         mySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327686; x=1705932486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io3RYMSnA2mZ/2TAxvPrJ8VHJ4ZruxxZXYnTxeiA+yw=;
        b=ZqlNF0U69KFbiqW0bwaUuPNdcNwyhtfOgLbR7cAhXy/RbggPEpNDAs7PRZrtvZalGJ
         EEWnzGyIMa1nrxHfGWu8yAmK4CPceCS2mKgBh9p8/yA3OA5S83b7uD8IxFH0xpD4IDb9
         j9qZ+I9bBBBLTTDkrJZKOr806zVqRVDkkS0wZGDt84FFYgZK+Juqkf53mkwdasQ/3QiC
         NdtW7Aa/+nq+Dt5x5fEexnnKnwRKO6bu3kwNg1Z09QSB+EpUCJvmBH4+jwDE4TZsDzu7
         fYYL5nnl5Gdu+bS0oCyN3iMFLdO1vFjA2pa7AsRMymwnvBhTmv73MYIcrHrc8te7IW/k
         3VBg==
X-Gm-Message-State: AOJu0Yz9CD/aQoktq8QvmA7PGoN/1aM0zXTOM4iBrAd0rwNl89KbYc+b
	88o4GcOsmM7HydlyKm7j54I9jUby4p3IO6rBp93lYi/N
X-Google-Smtp-Source: AGHT+IHBHQ/d5/E/GwTfOZcLkUd/GtwmTRD5VIvSD/o0CxTPUKGRBxlajTaZJ1pr6DkvkBYKkM1jf13YgxcZg1G9SxY=
X-Received: by 2002:a05:6512:1104:b0:50e:568d:d527 with SMTP id
 l4-20020a056512110400b0050e568dd527mr2975748lfg.11.1705327686381; Mon, 15 Jan
 2024 06:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
 <CANNYZj_oydN+0ODz_kCjus74uzF-wUhcZ1nfmYqrRo+BoupB4A@mail.gmail.com> <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
In-Reply-To: <3642B18A-B5F2-40EF-B1A9-303923477117@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 15:07:55 +0100
Message-ID: <CANNYZj_9sQir9xCHNuXRY3DxtG1jgNnk+kAeosQJiNJWMpj1qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <Ross.Burton@arm.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193681

On Mon, 15 Jan 2024 at 15:04, Ross Burton <Ross.Burton@arm.com> wrote:
> > This issue is reported upstream, and the link is in the patch. Yes,
> > given sufficient time one can become an expert in intricacies of glib,
> > openssl, and their interaction, and then develop a real fix all by
> > themselves, but I think a more fair expectation is exactly what Khem
> > is doing: report upstream, add a reasonable workaround, follow up
> > upstream requests in the reported ticket.
>
> This is a configuration that upstream doesn=E2=80=99t support and we don=
=E2=80=99t enable by default, so I=E2=80=99m leaning towards Khem carries t=
he patch alongside the bbappend to turn on the openssl backend in the first=
 place.

With this I agree. I don't think oe-core should carry patches for
configurations it doesn't test.

Alex

