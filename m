Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C015CD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:04:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47380.1778497480784015204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 04:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mF7AZzKP;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8acae26e564so42392206d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 04:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778497480; cv=none;
        d=google.com; s=arc-20240605;
        b=X8d5niVGxZn9ohWwh54RUMJ8Td1+eeDe2yjLH7re8tWzaAkyrDylxSGrAz25k0Gqx/
         bSOwNFmhha2kz3D/qSzV4b2yWBeway/9w+KXtU52mzlGvudztNFKFffuJ4Hai0ngTO3d
         TT2IikJCWFOIAsC1uUAq4F+9p4V0WpOCsIIV+MiNHJcLZiJixTeoF2VoXYHx/KdsuaEf
         A/7mVKAduB9DXKDAQwv2xQYBfGmT1n6lQ89fcsHfTv/ak7PRbQjL1qwCm/elZxYjrEC3
         UiqRvu/qjW4QKgCAC4Ee+6OKB3bTp9oeocXtGeP5EYm3+fOt7rL4KMiIKNPd7Gfjao2f
         kqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r7emNuyikDrKKWCFDmD2+XDQIGm6/jlgZioKHhb0b+Y=;
        fh=zTd/cyEwchHX1XpnckVyINgrRZTp3RHip49+UeUjwoM=;
        b=Jreq5edK4K2ufilFJ2ClRz1isQt0t6z/t9D+lJhr4ipHnreLUWftaz/qHTV1Q1EG4a
         y9qF2tEvGR5dm2M1f9MVlQjgD4iELtPddPNxbWVJ4bTnYyq92r68N/Z1bjaJL8z0ZhK/
         Dmli2Aw8Xg7zcAFccWaqZrUGQv1/p3uQ/j0VKRIGPRSKZ1mvLdIi+6PQDxCreElklVRd
         m7214awQ1iKHBxcQnaVatK9hM88pcR/wC1jL1PaZTqMLgqdKGgfaU+rB2ZHyGKFw49Fq
         74qwllemguOAot7jQE/RxQ5PElBkfPM4adP11UAa4J/mMQZ0AUaxot4E5++wP1QlxhtT
         IY1Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497480; x=1779102280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7emNuyikDrKKWCFDmD2+XDQIGm6/jlgZioKHhb0b+Y=;
        b=mF7AZzKPomU0zLz3WBZXlyDg36umDGHwgt/86JieXOjOHsfCmU92MwYDBnclC8FJQ0
         zdbg2hlY3t5tkWSDhou69y8qMAo/S5cKu0JhY4gdRpPl9r6nWMctinXabLQ7nxp1w2kW
         k+h+nEkheZGr8gHNjEFCWOzKGuGeHAAjfqziMWnzjTkVr/DU23sfBEusjkGJMxAcSdKC
         eYZJ8KesSdxOAC2KTL2B7BVmXeTxJBrJs2WnvFR1NoInMGhPtFRbUTxVB//nZxsOxkDE
         A9/IIKDTVG8DjSYoboIGVSsD68LAK2cRTllzrBJQPU6zarKoyHPDhbHjSIwhnaE2rGDs
         VISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497480; x=1779102280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7emNuyikDrKKWCFDmD2+XDQIGm6/jlgZioKHhb0b+Y=;
        b=gn/8Np9kpdDAwhoiyZEnndlB0MQM9KgdeDjHiVPf9rAzezhvk6THmIXdFYWc1Op94Y
         PaF4ft63znbah9/ymoiQbnp/1OZQIKlWnY6BygU1NLOTHXUuQO/uekOwqDnsvAIZUWNq
         A3pB3/93XeL0KSmCp/YgUhDPl4Ho4nTNQvwFxnWuPVAI7ZJ4J/QcylNp9cRkIlasVH0z
         dMPMoSaj4qUYV1IqfEIUtXaE6FWGufyyS7yQO4t8fIT9VJBMDNZDACdvB0Axnd4M7/0y
         GehG2Ivh9a7TU2t1RG62PUh63KANNgxzbmkDlH0hfXRR/tJUotl9O9CHXm0ZuBAO7jcD
         i1Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+hbi8Lf+lVUivkdB9tpjPEvpliIxl+kzy3H0UJHLGwFCcH+kiJy5kqAQt8AbkAzFZ7GewHZARi/xjwlwG74uMKFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNOG/AZZsoC3FZfVmgcO0NSKl3ID+VF3sEnAXKC5rYI02qHTPv
	lYWMKRn6jbRNiEnQqJckJ0LMmTZYZm8H2xFpTSBnKH2QPVWbhNfCvtv2EX2oYFKqpMjkeHyFOci
	H3w1Sjt0e3NpIIHG/Ru3UfRFAn2989IA=
X-Gm-Gg: Acq92OG8kYxquHhdwovI9KCG3V1ZrvHICCw6ARaqF/TmDV8NIQfh6ue0MgLsqtCLRO1
	aIO4rcN6+qmCQEkaLB+zGB0p9cYP4mzWRsuoB18WqS6+6O83kQBm2ydP7qa6lP9G1LMIRyBUffG
	T5H1t+8ceETte+waSfMklrMN7Sn1AqqMPSNUJQ12Tr8WC4/UYibPTZYsuF0Wasl9nPlR2h0en4W
	REb/aImbNwuUMGfsiGaBJB8q1SfdqwRVCnj5J+mbodJueMHfEgDhiE7A1wyO9knCaZDMRaBAnZr
	/9KPZtMGvgPpQJNY22bqkjc91Sp7zzx+jAPFJPMNCw==
X-Received: by 2002:a05:6214:268c:b0:8b3:fb6a:d35d with SMTP id
 6a1803df08f44-8c1b0570a36mr148102386d6.47.1778497479490; Mon, 11 May 2026
 04:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
 <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com> <51a71e4b0f5eeae36cdc2e7a4700e9d13d774af7.camel@pbarker.dev>
In-Reply-To: <51a71e4b0f5eeae36cdc2e7a4700e9d13d774af7.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 13:04:28 +0200
X-Gm-Features: AVHnY4J7lNMYu0or3mtQ83whEOFvCIUJFNubkCRSh6y7IXT1XPBNspawn9AHBZs
Message-ID: <CANNYZj8T5V2f8knAcpG=DddtcZx54XTM1XiuzstxoWgqRYkhGw@mail.gmail.com>
Subject: Re: [Openembedded-architecture] What to do with vim in openembedded-core?
To: paul@pbarker.dev
Cc: Tim Orling <ticotimo@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 11:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236808

On Mon, 11 May 2026 at 12:45, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:
> My general feeling on editors is "Give me vim or give me death!".

As a lifetime user of nano/pico, I say 'Give me CUA'. Which neither
nano nor vim (without plugins) fulfil, but neverthless, this is the
one key binding scheme that everyone knows, uses, and can (at least in
theory :) agree on. Arrows for cursor movement, shift-arrows for
selection, ctrl-c/x/v to copy/cut/paste.

What CUA editor is suitable for core? I don't know :)

Alex

