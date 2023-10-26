Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2220CC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:16:26 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.68044.1698318981688036749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 04:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dq6Rmyp0;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9338e4695so10857871fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698318980; x=1698923780; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOfBahZ0Q1k9VF14RoJAFcMkbNT0J/oQAl+Tv4ejRMQ=;
        b=Dq6Rmyp0q5l9dxdI2njE6kqbuI6fbUXzdAW7tvRKbi1IAA0x2751tNMCO5ccYMOT7w
         Uot71xSW49cGF00gzihu68hVzNk194JssZaWf+2/PVh2//Ese1ErukUlAmQbeqJN/TkE
         TZ9+IteYgcanbsUqbTQBKOwkZwz819otG7IrH32ZDEDPgcobPxDda7LlLvUI0feoiqaP
         CYSdNT+2LJ+rexRrAh0b8s5w6WdZfZj2IQvktCtnruybr1u9GFF8MSOzH4vS1Xc5Z63Y
         qylLRtBm6v5XcyyaA3JQfzDSMq8qNHkZHjV7rDsjIUNk9v1+qPs+DIl9TjwY305vyknH
         8FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318980; x=1698923780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOfBahZ0Q1k9VF14RoJAFcMkbNT0J/oQAl+Tv4ejRMQ=;
        b=IMiSz9C1UgcWLFzYyJvpbYJSW4Ax72rXUChp9Ype9HAimUErTfUHzGTOLDbxL0xOfN
         7/X6uQ1R6qp7H3ooPPk8NUd68HdmK5OSSRL6iDVbUDorUxhZvpB8rZJ2UDNBoMu4r32h
         N3W6kRnO46ZGw69RSzUDG73NWws5gK8Ivq5qCq5Id70n++ACS5++fpd4e5MqfXjju4Z5
         029L2AYaVvc29HB4kXnQ0n2B8id3yI/c6vsVyt/0m6fFUB8QOUDv8l7sF0+Xth1anQDa
         0qyHZhU/piG81sqQtzbexb25w1VEVWqHIezQDa6wPVggVgVHLlm2ORsriHMhGHRzBFfa
         L+oA==
X-Gm-Message-State: AOJu0YykskMNwaYgcofVA9ZVvWl7QB3S3G9w8Vx4hp0lgltH+Dynv6QN
	lKT/Ks615ORld9rT3AGOrtLylkbTzManXJ1MvRA=
X-Google-Smtp-Source: AGHT+IE2UIaK41tIVzHwV6/g3+85Y+FiAcg1AG1Rr5hUfYKhF6JP7YenIPIR5zxOE/NwsyP5g4pHseqwC17jEiYonSk=
X-Received: by 2002:a05:651c:1545:b0:2bf:f6f6:9fd9 with SMTP id
 y5-20020a05651c154500b002bff6f69fd9mr18841809ljp.0.1698318979589; Thu, 26 Oct
 2023 04:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231023110618.3525311-1-alex@linutronix.de> <20231023110618.3525311-3-alex@linutronix.de>
 <20231024103345.306b9171@booty> <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
In-Reply-To: <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Oct 2023 13:16:08 +0200
Message-ID: <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 11:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189720

On Thu, 26 Oct 2023 at 12:53, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Can we file a bug to look into that?
>
> I'm also a little puzzled as this does seem to work some of the time as
> I managed green builds of this.

Filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15253

We need to think of ways to test/debug this that don't require running a-full.

Alex

