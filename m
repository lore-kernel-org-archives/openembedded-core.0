Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B0E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 11:45:21 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.60865.1735559120489955913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 03:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js9G9vs9;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8f65ef5abso73980876d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 03:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735559119; x=1736163919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=96gB9xE6+uK0UtQDRCVG6FNVCscPx5Fqg7+m7KcBR0o=;
        b=Js9G9vs9uvd43Ug4NNuIcuIIt9pNRGjZL5Wv/5e3xdoSJTLcVI4c+YxILHkBzMqopg
         +MVyZHj3YGMAtClkoFAjlCtvGrXj4i7VeVNU2G4fHtrKhFJTMhtPYwTR6hkVAoiA2m8w
         EBQ31yPMuaNXt4FQBpagUERxOgB3LPxBpg5N+EvnSXJX1CF6ttO+arCb0pZ3YFiC3WJq
         pLrulm8RcLtfIUZR9nhmSzfrcfHzVQJKLcjwUpbjMh7rNIC7B9YvXTmAbP8TrhezwDgF
         nUOl7I+tCVxYEl1kzftOFxN2ESv+iJJZ0p38F3ElGNbsj/bThXZ5YywRxovIdNJ1GEXR
         OMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735559119; x=1736163919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96gB9xE6+uK0UtQDRCVG6FNVCscPx5Fqg7+m7KcBR0o=;
        b=xQ7NwRj9LWC8GZ7dJehz4Z8jCSYIS15bcYLel1Fz0xOye4lT/HxkAkhZyWzKBGmhYu
         Dwq6A+SG47byuULVsVAWpERUlc99Er49wVDhEPCQkwHLPNI99r1pl/sYrZmJR1fneAG2
         wcv5EDI65icSuPpIwmBea1IKZB9rl6/MF/RXTfXCSVE7ljqnUaPl8jQBFPb7a2onyY26
         CFLnq2pDoKEZ8CveFD+b8TxlSAImqFa5t8n0GX1821BYeU1Ena2ndbBKItOMnxcKRAfi
         nWb6exuhJYZksHmcvEY/vh+XX+7dOG2C1Yx6U2UfUFmjuJUeAYlqwUGM50mRr20jslPU
         XFiA==
X-Forwarded-Encrypted: i=1; AJvYcCWHPpzWOGROl6lKgdWgj2dJAFAnlxguuBOeF75JGWLO5ZbkrSGlmEsLX5EhBXOEp6oouAYzfllBJO5IgSzaNlqO/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTOGGWgOZsy+hKPWcoDTxppnNtIjEzfU0oJF3FwZHuiCQ5I01O
	UNz3n4jq6jg1JTPZj8tQjZGTkxXUvO5VAlK3krcQ58ULuvTXXFKOUnwVItSCKg+ZPrsH/MRdZ7v
	1U1ObPgVH8oYTXFJGItqE9erHIJA=
X-Gm-Gg: ASbGncuAKB9cCSHuKIAZg3jQTVf0yyoWYq1anwkxxiiccmFAkwMSlmxCc8qTfm65ni6
	PfsSPDTTu6WA6oMZE+ojVIqbBJPqElKM5ZvZu4brrg5RErKQxWfrMMDLOD6mx0k7II86J3pRt
X-Google-Smtp-Source: AGHT+IEZE4/zcfuNKCW56WMN5nKesfvfH+AT8EhHJn/bkRZfwPYyL/Dy/VZ/wCTqvQn2bT/FDKmz8qW2rHZ598Ejuyg=
X-Received: by 2002:ad4:4ea4:0:b0:6d8:96a6:ec25 with SMTP id
 6a1803df08f44-6dd2331ea66mr516990976d6.8.1735559119623; Mon, 30 Dec 2024
 03:45:19 -0800 (PST)
MIME-Version: 1.0
References: <1735536183-2876-1-git-send-email-wangmy@fujitsu.com>
 <a761c6d9-26d3-424a-8c01-d7e3fc518965@windriver.com> <TYWPR01MB118618A7D75098FB4063D1F97DC092@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118618A7D75098FB4063D1F97DC092@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Dec 2024 12:45:08 +0100
Message-ID: <CANNYZj-=sFbHo8r4_kJGj_qJG-LdxwbRJedG9PqALj3eccMMfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Fix install conflict when enable multilib.
To: wangmy@fujitsu.com
Cc: ChenQi <Qi.Chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 11:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209157

On Mon, 30 Dec 2024 at 08:51, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> > If so, please add corresponding info in the commit message.
>
> May I ask what commit information shold be written?

When adding multilib entries to recipes, we expect that the commit
message documents the actual conflict, e.g. what is the difference
between lib32 and lib64 versions? Can it be fixed with an upstream
patch? Especially items in $datadir are suspicious and should be
carefully looked iat: they should never be host-specific.

Alex

