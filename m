Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3240FE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 11:05:13 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.31710.1735038305181730235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 03:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T6za1jN/;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d888fc8300so23587916d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735038304; x=1735643104; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IF4FdcqGIjMy9cZ+7A4WT1cVawi2shj+y6Ql2ysOaGk=;
        b=T6za1jN/GfSXN/QaTDNGe9LTZRviLl6uR+gClFVnnv8W45qemfY6d65DNBbCJ1hDXp
         E3J9EYL4UgIzpzdepR+oQsYrWJ09dB2Tm7i2uRQNCIswCXLWZJGFmgbIP9reH1/goMty
         wxV6bTYsbp7g8ieB/S2mDq4VBMN33Fad+VhKv2m9KsUUmpfPIRAl5BzDXvWpVgKeMEGJ
         xxhfXzDwbqMnJ3WySvbU/CcP6UPQWWB/ft7Noi4AK5VmGsJkvyTGBakuygI/Nb2lEkdQ
         fhK/wjHTOAdsFEfgjNfHKLMDtnNrGTKzR1QnXqqpqd47j1E/Vvp2WxbU7htr7jsbQAYD
         jZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735038304; x=1735643104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IF4FdcqGIjMy9cZ+7A4WT1cVawi2shj+y6Ql2ysOaGk=;
        b=qaS+hoJmlxXYQhvi19hk708MHS47r65KbV/TPHarrXm9Gk3hQ7Gnk75gaAvH/OvdZY
         2mAvDulTxmuyV8RMEz3ltxkl5IFmQLM4RYSXxOOymBJOfUIqm7ci4GqMZugQby66n3Pw
         5/q9sRO1gwLGTUphhTzA6D2/91TY2+juw85p5UdPPp++nLedC2687NugL0tX5fu1kmXm
         KRpNUMvS0F2zPJizuOMUnoexfBLy+Bh9ofeADUITMDZwecIIm3UMFeVd4yxgcDPxKCGf
         5QCb2PPbgqdvrAJC3a62ubRRKipGRnghJ+DFH3bu2oxp2aZtfxYt5JJG1A1RbzN11Fji
         oJHw==
X-Gm-Message-State: AOJu0YxMOF8AaHJZFg15ct7nE8kgieLc233ESyGOs3s8y+71z3TqaH24
	QMCfdc1m3CWXQoS87eTeuzfayi4+hon/TuHx0bKIkU1r8mdUf+IV9j/FmRaBwHIWpHswUcP1oeQ
	cu9BZ4SnWTygyIVhgUprHTlU9ui6Znw==
X-Gm-Gg: ASbGncvQJn2ySb8ayKEulkl8B+kvICkAvZRG6puTNfK62MJxY8ZtAhlCyJDShIQxB2o
	p4G5vXzfhISSvaNeESPu6uRDtRlYu7/vyL5bSUT4guNjbukF1uyzmpq5z2N6R0nK7UlL5vCap
X-Google-Smtp-Source: AGHT+IHK7ZfzW5sgTAldhahYf5UM055LZIgGssQmJIjvQu3WrPm8IMFhb16h6GzuaQn5YJZ0w85FH1OaRXNsDxNeGf4=
X-Received: by 2002:a05:6214:509e:b0:6d8:9815:92e2 with SMTP id
 6a1803df08f44-6dd2332c084mr224152586d6.15.1735038304067; Tue, 24 Dec 2024
 03:05:04 -0800 (PST)
MIME-Version: 1.0
References: <b046094a02d423bded4d88cd6edb72b74c254fde.camel@ziswiler.com> <c461d8b75ed8f72df198d9c95deb44589bff8dc3.camel@ziswiler.com>
In-Reply-To: <c461d8b75ed8f72df198d9c95deb44589bff8dc3.camel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Dec 2024 12:04:52 +0100
Message-ID: <CANNYZj9Y-ZmM=oU=U8KgR_CKUM_TU5rba=XzHKVKO=PbDRQXVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gettext: upgrade 0.22.5 -> 0.23
To: marcel@ziswiler.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 11:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209066

On Mon, 23 Dec 2024 at 23:01, Marcel Ziswiler via
lists.openembedded.org <marcel=ziswiler.com@lists.openembedded.org>
wrote:
> -       cp ${S}/gettext-runtime/po/remove-potcdate.sin ${D}${datadir}/gettext/po/
> +       cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/remove-potcdate.sin

This isn't correct. If upstream has renamed the file (and they did),
we should not be reverting that rename, but rather adjust to it where
the old filename is mentioned.

Alex

