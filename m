Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA3BC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:00:50 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20716.1782824441814509922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Av/0E43w;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51a0188b92fso46467081cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782824441; cv=none;
        d=google.com; s=arc-20260327;
        b=dHZsFNerAac+0oyA5Nh+eekSHMGr/CLmn+M05biSG6AyJUxnQXaXgdRKapI8bzeaWL
         oGLIL8V4isfgPClpOZNS5O/Ejv0TGJ7bDKzrKwZye8POlZ2qq27orDQkeKcm6dH63Xj9
         0j+WWOJF9ZMyQq7Z2i4Ld9gzqvqM+LLHA9tojwFx2zKYqHlCUzCc1djsJuvIW9Wg+6ix
         JaHdWLjBcdM9ty2LYu2LSHKUXF5PEAOD4gLy8tZmJQp6etQ1c6nR50sDgJH1+/aB6Bxm
         dfelyWxFJBrHcMB/xZJO2CLMjShCzG20z3940G+s1sRpIY1acDsbJxRNqhLnWC4ZvPOG
         142Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zgm7UekIKGzG0m9dNpaMDc6nCQzuWy2X6chnIPWNlvs=;
        fh=rfgv5aKH3wH6E5DF+Qq21jNmqrid9KZ9KlIMaA1cAIY=;
        b=HcTPPfIeVdWUqfuQGZFet8uNvfTpgFTt2yWUgdva4fvZW2kr86zXTrTRzPBD3o2300
         g5/x6kXSXERMnGnLaJDCke59HPjKXrNdBBgT+en8BKlrMjS/+ng0vIjAG1HVURx5xrtf
         Sfas8M3MKv8Qw0dsrj4wNUnXdy3tYKWuoc26Xm39jmjPt/lH8VOpjfA8xt5DLK5UdE1c
         tMlVbEy4IA8d1VqMmOhbAfqxZeS3XCZeXVg3Z6jW33uO25qrSXCgmgDmfEEPopvaex4n
         bm+HPDogin8Y1g6yyvfcpGnR8fWAWgDwJrREq4/+7J9PtJv9MCwejt6RmGMU++4xx/+y
         2zQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824441; x=1783429241; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgm7UekIKGzG0m9dNpaMDc6nCQzuWy2X6chnIPWNlvs=;
        b=Av/0E43wR0rECFXECqRf7mcedyjxK90PnUPMh9K+0RpkP7PyA5DH9RqnzAFnz7mikM
         xYIsDEfSz0S1IqJOicizRqmfeWXRU+2mt7OaAokgo4kAlJRwQVq9BQoiwIWp7d3SPzIH
         JQKQV8JDwpyYTxRj/Dya1+wqEAoUQdGo5bH+fGFmlxi5Sgr6wgKomFemHbYqc8E51l91
         LdxA2R/2iwvbK8A8YEjm6/N8DpCQ8Nr+yJHk3GPOg6t7Sgtsq9C19n/XoaBfdlJiDkiH
         +prHBc63z/0QJ3Bnb2S8hKw+VMBn9nqnQrjSRYdTw+TF8KCbLeSNp6ltO10Pjmf14Ls3
         Ir1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824441; x=1783429241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgm7UekIKGzG0m9dNpaMDc6nCQzuWy2X6chnIPWNlvs=;
        b=HdvUSZvtFRFhOjrJWL/ketfYnY9t+XxZXvFCl1j4Iu39uQkZ9zhXvJKYLByDEGzLID
         pdl+/G8WEpe0MQiSayIxhHxVyGfGiZU+2rqcnJNDodZA7g1UZ/o3kXrHoXilE62StECG
         MKP03AV1omMTk4fvA24kBgGjyL/k4NrKmLz4Dtq9o6u2ugfFG9VrNzVOrT5Q4T5APdHP
         m9vC71BsPXFFkhHNDFvWAj8JrvUFieq9YGMWHnAsvtrSse4RgKcDHRa8VoHt9yvqBHKw
         o0bzE53HKoChaQkmnbZxeBybNjo56Fgigdwsr+Ai/3DHWwUrRSr7R6T1SWWXQvisHHN0
         2noA==
X-Forwarded-Encrypted: i=1; AFNElJ+6AkiS+Eo47exccFQbX7oQ9urbd1Et0/qm4bhuNvAj2+QjZtGmmrZLrojw3s0x0bZ+CdxnVnuLXA9v+gTG8vtpnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0nBTHjoKbHpRpepxuIaC06fTn5zHKX4qalSkrIigoJ1EaD4EP
	EXOdSrJeaGQCQ98Coo+JVXHAI3dSmvqQcMTdOzWUbHS6zA/8GiDYVQLP0OKkUYDQUu9/fJtrmkn
	N51Lj4KavWaw/vflcaMxIW8kDbdWFU38=
X-Gm-Gg: AfdE7cla4ZRFOaxzv6uNjwXnI7XiANecOuoSkJXt4VI7Yj4V3kbkyo9duFHPKJYzDX9
	yNULTefxArlmmxB6jongo6XOhAAKio6DaMoS1WCkxN2z78crWI7n0fKwPv58QPQbw7RDlzKc9vW
	v0sbioIskmKfJliE9w1IlwCdLdGV/7tlBHL/ZljoxW76v1FtxB98iK3pFstZHZUz74nvlFqHk4/
	DfndP6Ldh09yXFUJ1Ltt66eYaP/ZMpi3aWCesN6inDS431xegBeP6yi3Ej0qT23PqPbYUn+Dw==
X-Received: by 2002:a05:622a:98d:b0:51b:ef2c:7bf0 with SMTP id
 d75a77b69052e-51c108bbbbcmr43474931cf.35.1782824440473; Tue, 30 Jun 2026
 06:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260629061229.702229-1-Moritz.Haase@bmw.de> <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
 <PAWPR09MB8030781990889EA67DD21074EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
 <CANNYZj81bU-dwR1Y7kzQXkHCQ4QwNCiT5diZ2USYzr8PoBzM_g@mail.gmail.com> <PAWPR09MB80303C3EF3D64358FDE169D8EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: <PAWPR09MB80303C3EF3D64358FDE169D8EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2026 15:00:28 +0200
X-Gm-Features: AVVi8CcC8n0WDgWwLY8KUnvGb_GsWQ-6rOaB6_7_dFEffI4VZRPvvh0Jfbdkp_I
Message-ID: <CANNYZj81Fk4ReEYAPFVh-Dm0tYUs8_s1GdTUdnNb8Vb5Q774Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
To: "Haase Moritz, DE-811" <Moritz.Haase@bmw.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239887

On Tue, 30 Jun 2026 at 14:33, Haase Moritz, DE-811 <Moritz.Haase@bmw.de> wrote:

> just saw that I originally disabled the build of the apps as part of the
> CMake 4 migration, since they were not packaged and upstream doesn't
> consider them ready to be shipped (see [0]). This hasn't changed, the same
> text is still there and there are no install() rules for them.
>
> Should we still try to package them? Even if we did that, the test
> itself would likely also require patching, as it tries to execute the
> json_parse app using a relative path (out of the build dir I guess).

You can probably just add the required binary to the ptest package
then into a location that mimics the build directory? Ptests are
similarly copied manually out of ${B} so it would simply be treated as
a test helper.

Alex

