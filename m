Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA7CCCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:23:00 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.7783.1761304978381521534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gE1Tai6Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4e89ac45e61so18939671cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761304977; x=1761909777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xENpFhdm3tX2svjjBCpkdD5EFJVJ3cSr/qlGqMEskM=;
        b=gE1Tai6YskZX5D07TC95IRN4FphlHT66X8k2GGP/rP8Ud588I9oqoT5LO5C0sS58dZ
         7dsedupvv2LmQEx5y8PeqPsgP+MMSFybdkAOWCoLNfJnOLkJWGMuGBZtPPan+y33D+z2
         yJlM2T/kJSDJHR5VmGB43DGKV9pCrUG7HbmYc7xYPWlKRawWTlsnygRgFt6rFFxVApzU
         /AWWtLkDNcXhT3WcSvvUeNsaULMn+D2p5exJ7sEjht7o7oOsM+0sa8EERL+QOEPzHa8H
         mbPyJ3CEyLaSCbpzNJDAdV2pUa+gClFr3BrUeknh7EGOdGjZhMhNS9zfzGXqMSEf9xGa
         iypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304977; x=1761909777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xENpFhdm3tX2svjjBCpkdD5EFJVJ3cSr/qlGqMEskM=;
        b=fcAnpnAlVOAIaz7n5nmxY9tZFPVgVwbWDNaFS7RxXMHn4aK/P/JS/PIHY1dkZ0Px4y
         /kEXq7gwYNlAACVEjAw3/jPFVxQUDEuLEGdCOTW/GQfK6QSnavxNlw5vewCjHezT7zxZ
         jpaK3+udg7ODldfMVKdWGO0x+36Xu34S5BJvf1WL4InpkBXRDz3NFLzY1eWgETguhqu0
         1kLhlhJtc+B/ElaXDTmV2q29lH9NbS27N4kImFo5xXTrnSujlYp5Mexk7H6EmtapkhFj
         9f9Iu5Sp9WqTFgVuYT+P/uFGLq3DPFC65+6xLVP35p9ywesqM//tm519z5WiRPipTO6R
         bXzw==
X-Gm-Message-State: AOJu0Yz6P4Ln8PQ3q7OJbiZHLTK4YYQcCVbR21YBWYgzm8M5l/k8eyud
	0/tTrIVOq0UtVS7z3GbXHpaI7kUvZmemla0stWCe8YNkCzbs/gYf08DNTuhxQxSFQpiPamPqGBm
	ZyFcEWAj72yb7+vEZ5LA7WHq7dhVm5DTWNA==
X-Gm-Gg: ASbGncvuhj/qnVb8aQe4Ca/TRGMUhgnTLrt5+HUyxy0ppIM1oObhEEudFJoaq1SKrdy
	RFye2vey4JOcGj/JUgX/MS3PtrQW7R9fgipNyDfeuagfZXiC1Yp929MwEMFKVPGtpyFtY8iJ2xt
	JY6Md3kRPyRpXz51fB4yNXsD7bpNIcOgnmR4uIDWpbTb70DZG8kfxgRuY+uR0rj/JWkoBNtrSIT
	RQdfQJGmkAHEk/bOcidkeN9GXA9zd+A8aT1MaT/Avukr9ER2HE2mMumFcmf1XejPkZHIUO/rx31
	KKpqeDyxLBCpXicT/IRLCz1m9y8aeKEadrOhj4kfHZcEEEfdXLt94Toh9bQrIuHBN4/orDIzv/5
	5iAD9VAzlF+exLeY12pEXXlU3wr7Tf3jmWMmldLk=
X-Google-Smtp-Source: AGHT+IE8qKVvEDODwvdnxnfowwSLaAlNyJgAx1m+g784rqmJxpfLVH9amnVzd6qbV+VqDwR6hUtnTwDdQfO5kxSl58o=
X-Received: by 2002:a05:622a:1826:b0:4e7:28b5:86b0 with SMTP id
 d75a77b69052e-4eb8109cd38mr70068181cf.35.1761304977420; Fri, 24 Oct 2025
 04:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <c9b01153cce85ee303c68507f6afcc74903dc3de.1761070660.git.joerg.sommer@navimatix.de>
 <CANNYZj8Dm2f=XC8sKcKq0c_1emmVtjS52bX7_N1Yp4cFG86eQg@mail.gmail.com> <ypksivfvbqelvf5s2btkdecctrxqk4qjp2ipr7ykz7yqe3q6oi@zpjhqtabnokz>
In-Reply-To: <ypksivfvbqelvf5s2btkdecctrxqk4qjp2ipr7ykz7yqe3q6oi@zpjhqtabnokz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Oct 2025 13:22:46 +0200
X-Gm-Features: AWmQ_bm3HbfqR4gp3JxY8dqZUekr5RDo4R0MkTfeA6Qvn4odIxxWDhIbhI7tC18
Message-ID: <CANNYZj_OBSfiXm5dfyphE64TB1xbVTrkRp99FO6AofAaZKFdfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gtk+3: Update 3.24.43 -> 3.24.51
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 11:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225289

On Fri, 24 Oct 2025 at 07:34, J=C3=B6rg Sommer <joerg.sommer@navimatix.de> =
wrote:
> > "Let's change the name of the project in the middle of LTS cycle, and
> > hope downstreams magically find it".
>
> Yes, that's ugly, but on the other side when should have been a better
> moment? As far as I saw they unified the deployment system with 3.24.48.

Not that it matters, now that it's already done, but for gtk 3.x there
was no need to do the renaming at all. Gtk4 has dropped the '+' in
2019, and it should've stayed that way.

> > Anyway, there's a number of other recipes in core that use
> > ftp.gnome.org, can you update their SRC_URIs in a separate patch
> > please?
>
> Yes, I'll do. How about the gnomebase class. Might it be a good point to
> start using it or is it meant for other things?

Yep, converting more recipes to it where possible would be great!

Alex

