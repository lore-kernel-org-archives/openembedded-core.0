Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9644ECAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:31:59 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.12030.1758871910675760130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0DKlT6A;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-856cbf74c4aso256740385a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871909; x=1759476709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7TPiweVzryOPevD753WMMF2GoyIJlMfs0TJmpIWUDY=;
        b=Z0DKlT6Ahs0M2gY+72OL7UwGSqX7/wdiFfXHlJ81s/E77tP+suUrH68IU+c+SEcsZf
         OmQd6bsIRNmKFS4lwyPs2YBgobirqzgw/aceLfdyVolnoBIaOPIHZTq+asrR/X279Lgj
         Oyl5m/tDcGoLu4qUDGryX8JiNrnyWgS5I1NEyVlEKCgq2+Ux7Mu3c7HwlWo+p2XDyJvb
         cmZIh2ZC7kxTEzga1VfDWRMebp6AENfZa1a4j9tvFEeSpw2TxC3EZcvti96tFX9ejUY4
         k3E76alLs5y5BiYGLEfFdrjjuvuL2VFedZ7HLT7PcWDnrGOBQ+LvLvEYDh5n/0om7HP5
         O13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871909; x=1759476709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7TPiweVzryOPevD753WMMF2GoyIJlMfs0TJmpIWUDY=;
        b=a81UZS1xp5u6F6IcJVoEZ/zjwnbqlstp4RQCQzvxQ1Mw0JMrFXRkFoaK4Jlmp3/RNa
         p52HT7+1BntCvYbaaWVEP7VwyRQasF1pJKBV0slnm5LLd0U5kFt4nZwYzoiniqrwaIHo
         AKbA7yl4seAiIaSiRX8TXzmUuTfKgW7MuNToiUhUsx9+IkevObt5zBcA2PXBLZzAGgtM
         19qsUZ1vvkL3pti5ODF/URrKuxxE9qmkKz+nmR6nzzckpkP9LUJpZsfA411GMUbHyXzV
         rygwtLnH8raNRQrQycEW54Y4Z9qXNO6Bs0OEv+f4mA5klhE6z8mS93Gzo69mKv0Vg++e
         m0OQ==
X-Gm-Message-State: AOJu0YzguEZEcm1eNaIWT9fo1J7RhBCyDvjERrQP2KoyDaFO0KWoeO8t
	MgqiCNYt87spCchNbEaDpqRHQhU9k75s2J/b9bW2irbv1eUQE0qRSkijUgMnEJ4E/eYjv7IkkYi
	nDMNhZqaMmmaAoCO7VwA7TpsbS+Jq66g=
X-Gm-Gg: ASbGncvFjf0PBtsTWz5/kEdwAx2VhezS5I7QJT9GxxnhQarB4CZPlN7W5/m6XI3N69U
	bibN4yzKCoW/s2g2oLmaTkpYYAJHvVY9/LQ/JzCqDp5NATfLN9gReG0vrSPGnEoGB/DNaLyt44t
	lddv2CQgCDWDp8FK1CQtGT/dDjjKsesB4ULT9yY7AL7rLEWuRU40J7/GpAHYuZ58a6Y2tzpbj8O
	sQMgTItonvYTteVQ1qxj1lAKAfa1zViyU42KLb8ax4zsRDF/yLH4CcYnxlVh6CnWShJG9Jm8Slz
	1QaJGX7nf3i4Ktk=
X-Google-Smtp-Source: AGHT+IF0PWUwHPx2BKV/alUm2iGhooPO1tqwwowm08PRF46KXzjd7YF0Em88VewftuItb009xJa4Uq40ruYw5SX1lKQ=
X-Received: by 2002:a05:6214:6115:b0:7eb:2915:e499 with SMTP id
 6a1803df08f44-7fc3b6ded36mr66604106d6.40.1758871909570; Fri, 26 Sep 2025
 00:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <29002.1758707163729683981@lists.openembedded.org> <27560.1758858140781391880@lists.openembedded.org>
In-Reply-To: <27560.1758858140781391880@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 09:31:37 +0200
X-Gm-Features: AS18NWAXVh9YEFX14fNCwUAMfRIo7U70IPKTdPaJY_uOo42TROVU6pUzEcaMq1U
Message-ID: <CANNYZj9RXcePZWt4VfMqxdyARDLyoEkmdhnmF0vueTskcJgE5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] kernel-fitimage: add support for custom ITS
 file override
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224057

On Fri, 26 Sept 2025 at 05:42, kavinaya via lists.openembedded.org
<kavinaya=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
> We are not hardcoding anything or bypassing upstream logic. All BitBake v=
ariables and artifact handling remain unchanged. The only difference is tha=
t if FIT_CUSTOM_ITS_FILE is set, we use that file instead of generating one=
 dynamically.
> This ensures we still rely on the existing process for preparing kernel, =
DTBs, and other artifacts.
> Regarding extending the ITS generator: yes, we considered it, but our req=
uired compatible string format is very specific and would need major change=
s to the generator, adding complexity and maintenance overhead. Using a cus=
tom ITS file is simpler, low-impact, and keeps upstream behavior intact whi=
le meeting our UEFI compatibility needs.

Using custom files with unclear, unspecified ways to produce them also
fragments the ecosystem and inserts vendor magic and
non-reproducibility into the build process. That is a negative impact
on the project, and goes against its principles.

Fixing the ITS generator is still the preferred solution, even if it
requires more work on your part, possibly including writing tests.

Alex

