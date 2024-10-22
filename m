Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF553D2CDFC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:16:06 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.22535.1729613756626175115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWZoVfLY;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso6607677e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729613755; x=1730218555; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4ywaglIccK4xnGMwVd1g12tVSH7MKtTaOJ0W3OjxnY=;
        b=dWZoVfLY3VGzlC38k+sthEo0AriS5jIhMndOulLOrwmicdIu4NwbXY0opCgHojfNuv
         o3kRlDEZ1HKRhnp70H6FNSp8loJd439R9K1bM5O4E4KzTacL399xZhIGo2Ygr+nu+u2P
         G9g60TtPzwKEeDQbd3wrweDMav8Ml3ph3551fN5ctWtpndvCKuXb9eJgsldmUebvVGbC
         sLHvL2QpOL5cDdoKpA1uZJ5YT6ZQ2evkSh5CTtqYFcRGLpXnKp9P13gh/QHw/TK4bZ8+
         HEAnAj2+x4fAK9wUQmIkVH0YE3+ZZysYVEQwgexZT4v8oNpiuowwsc+bihBOpn4owb+i
         JIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729613755; x=1730218555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4ywaglIccK4xnGMwVd1g12tVSH7MKtTaOJ0W3OjxnY=;
        b=ocHGs3ezTI7Uf7mB0u/Kfqu8LRA4RwE5RgFlFhpjndhFKi8pX6xQ6R6NQ63TS58uJB
         JKJEi5ItY6UQa3tIq0XiDQaNfqqtepYNdEejMjP6EKnM0q3gT2G3LxSN2ctlmfyHmgeI
         kT4nUo6lpZ/VrsCvHl99ssTc8A2jxZcDIKTcDoO/KkVpw/jTTL2FMCi1JOYe6E6j9sti
         iootyQfpgwlXXkeoPh8Uojq7SHB7+FU/XjVzikwbkHLnCwwfjIFDJfr7OIdzL+cjuqzr
         taytszsPzPKqeydivVdF9CPSoZoxtpKf+hYXoD4xp/2Xy5/6jR7XPsYnobTgsZzH00lB
         qQyw==
X-Gm-Message-State: AOJu0YxmK9PedNvsw/DpiZn3bU86RMquP9XClf+G94/82gtqUvW6DGyX
	gwYubsQ0uQvHTAn/LkR5W1OjfGcX2gcI3EojHTqapLKqt/FHlXKYkvST5zU9XKH1flDiR8K1TKx
	Uvciq1Vk/Wm7IPkvBGdIjKRfgzg8=
X-Google-Smtp-Source: AGHT+IGU20ARajmGSgdgvE6xmepnTuSmCTmDrpb5/+4OqwvmD00ZIuEmAMljITpbIjTkfl5RVCh/z/OXWV+RbzWLVfc=
X-Received: by 2002:a05:6512:2344:b0:539:8f3c:457c with SMTP id
 2adb3069b0e04-53a154704ddmr8053379e87.53.1729613754340; Tue, 22 Oct 2024
 09:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-5-alex.kanavin@gmail.com> <21294B27-3875-41E3-9A81-A02A8DE8E66E@arm.com>
In-Reply-To: <21294B27-3875-41E3-9A81-A02A8DE8E66E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Oct 2024 18:15:42 +0200
Message-ID: <CANNYZj-XKvPj_DyT3RF_d9w-XoC9Dkahufv8suZkX+Di5jcTZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] python3: update 3.12.6 -> 3.13.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206160

On Tue, 22 Oct 2024 at 17:57, Ross Burton <Ross.Burton@arm.com> wrote:

> I still see a _tkinter.c in the cpython source tree, so this doesn=E2=80=
=99t seem right?

All of the changes to manifest aren't me editing the manifest for fun,
they're produced by the manifest script running and doing its thing. I
don't generally deeply investigate the changes that it's making, as
long as they're not crazy, and do not cause AB fails. There's just too
many other things to take care of, such as, oh, fixing all of core and
meta-oe, and getting to the bottom of armv5 crash, and getting the AB
to pass. I'll take a look at things you singled out and add more to
the commit message..

Alex

