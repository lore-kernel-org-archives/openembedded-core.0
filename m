Return-Path: <Jhonata.poma@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D895F9937B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:40:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17579.1776944453374618711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9p5UHNL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: jhonata.poma@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1119726866b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 04:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776944451; cv=none;
        d=google.com; s=arc-20240605;
        b=HXfiizQX4AtGBSBXoF++c8ECSnqbY+XrWbYKRM/aDw9f2dRk/LHHQXhqnyWkpSPGIk
         uWqSAzUzqEbFIdt3DpX5Uu89TVvj7WmD2JnsLJKyWiM4nrQ2E5gdlB1ybBonVrQizf5a
         6T47jb/xLksIh2p5ZOCwPkiTSwoSA6Xca+NWJmw/dYnmA0Wo2+nAjlHe0Yuef1Oybsbj
         5SwNyebXXJI5cVO3NDziRkdrCqmUAzT3aIlADmtlqA6PPTBhiMJNak1cglxZPSetkByD
         s+tpBW1g8RRC81uyQulnhX6+80KF2MLjD1+sqrFncWkvUglKf+3xk1lfGCO0i45FRAhe
         hp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=SjccYNHFIeX69s+4S/wNR7tvwxCxpfzlTSAxnjRhv0c=;
        fh=nSpJa2jssUXYI1Wc0yvabbOH12novEF7Mnv7UndZ28Y=;
        b=OWjgi5YB9z+NUIUB4cO4TxuNXQ0K7nfb4x94ENhpE/jb4b8KdtQc6koHU2SVE3KZmg
         x0fjfA+jm/xABCx1K9seS5rxboW5jaEXe6FwSSxdvLNXNhSMMqJhQzJ+xrRm4NFcNUvx
         XcNWNI/YXG3TqJfLlAIm/Uh6OAjb+7RvS5cb1G/CiSL2xK4dP806DyPnIaCfvKWLqner
         w/pN2L1uSOBunvQWVat27rRXxOeeP9zO2GhoHzuOlRIgHhIt7wBlVV8X0GFrllKTIk40
         2vuguVu6ke1vGDQnHQFJMs4VEybV/5Ua5vfJ4ILRQwDUZccRab1FWD7IftiSd6KQWHkV
         7YAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776944451; x=1777549251; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjccYNHFIeX69s+4S/wNR7tvwxCxpfzlTSAxnjRhv0c=;
        b=b9p5UHNLYxdis+fWD7ie088MMpMd68IziWpx5jMR4zmiznVmRahW6weWKZVZFOMa76
         PQnILwoHjRxRuzVYgurmOcWVtQatosIDUB8NdlYD+Dl+gaxfigyw7U1YN0xlUaN5wJFC
         ge1tKYbEqn5WzK9Tz3j/MtU3NaIYMr4T21QVXOl46NigSHc/ca40MqWSBpQvV4N2LKQj
         ETV7jLMRuMPlqrSu+3hM56pBTX/fPp+oE1Z0rcp2ZnhotLybvlfjAEFt/EDDXwFPJWGM
         Kh1g3pQOZWpA3NIRqYExXYIaiisJNA4lv+/bpJd14sYfddKRo4avHyt8JFcno8bumW9y
         XNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944451; x=1777549251;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjccYNHFIeX69s+4S/wNR7tvwxCxpfzlTSAxnjRhv0c=;
        b=TE7Ggv38l0qERyQfEaz2zZ7hf5cB6AW7jo92LtH+WfDj4qYJNGdtnFRPXHXScaPy3E
         zU8+wRMYYISZrQVg1ivGp9NfwMCfCTMsjfKUmRkUp5dfFaJkv10iMfuBJ3NovV49ZW72
         x7Yks2bmxLP5tahgDvQNtbID+Tz+KYBirWdegGtItafbT9F41pCGWK1/CKNMVp6mQf2n
         2WqyPufgRpnpttk+xjQ0EmqaGZO8F2NQx7WBI0DRp1TxaHS8seiYFsCFfOyrLMMFJ7S6
         ViJwMIKxQm21VRYe9xjxtyARYolzlOPOvoK18gCkHrduRABv3wvDewSv2MPKWq3cANWR
         vXNA==
X-Gm-Message-State: AOJu0YxGh579jwswn1Eg0OF0aON8nhEai6eo4UFblKE8+shur0Lp8YX3
	qRIEHAUhLB7W6tlOnGNceusJTEdCyml9L/xwuayxJpoCs6kmcga8M8w9aCvnjHRWcc2PCa5D0sV
	UdredH9lv8CoxGkFNJ6/GFHLr67+ToT/K22EP
X-Gm-Gg: AeBDievbY/o7VWiZmk+LwZmcnIMl5bG9hqsSQvH3VFPRdCRYuflL7DyOs4ZwKdTK4eg
	rb2iCYB8sl8Kr7nstp4BiqIlOV8lyR5gSV08JjpzHW9qbq2vJfKdXz5TIJgssZf7g8g7UHxjA+A
	LhHDeA1ikZGHzOk1T4Nh38N5cS8/2paBRx9xNFsF9EU0fM+Z4nYvHRfkjXlV02DtSU/hT93D99q
	fi1lZE886KrDNg08oi0Qd+ISp6gWRIMpPvyRHhp+RfxpVJqXyWhF//NFkr/7L3SKREtT5HJG+tt
	mC9hE42xy7AZ6XyGCdj4HjtAGQB/J07ZBOa0qyp/LZx9MAuQd3mS+mBBbwXobKfOhLR8I2Kyru3
	aAMjZBbqNX4tFMfc=
X-Received: by 2002:a17:907:5c5:b0:ba7:7a1f:1097 with SMTP id
 a640c23a62f3a-ba77a1f5279mr875379866b.12.1776944450901; Thu, 23 Apr 2026
 04:40:50 -0700 (PDT)
Received: from 235873185967 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Apr 2026 06:40:50 -0500
Received: from 235873185967 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Apr 2026 06:40:50 -0500
From: jhonata.poma@gmail.com
In-Reply-To: <20260423113024.2549245-1-jhonata.poma@gmail.com>
References: <20260423113024.2549245-1-jhonata.poma@gmail.com>
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 06:40:50 -0500
X-Gm-Features: AQROBzBUtMnVz2Af3F9EE46hCOhhE2pmYtr_KAqhAF9GELDhoU4sH1i7lEvKAaE
Message-ID: <CACgZWq7DAVwgyx_iRHO89pmBocNr-TmtOsAGXTPAZJoz42q09A@mail.gmail.com>
Subject: Re: [PATCH v3] rsync: add ptest support
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235761

Self-correction on the Subject line:

The "v3" tag reflects internal iteration numbering across today's
runtime-verification cycles, not a response to prior list review.
This is actually the first version of this patch to reach the list;
there was no earlier v1 or v2 on openembedded-core@. Apologies for
the confusion for anyone searching for prior threads.

The patch content itself stands as described above.

Thanks,
Jhonata

