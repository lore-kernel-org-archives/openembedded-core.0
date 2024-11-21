Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB4D6ED1E
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:42:33 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.9747.1732192950990770012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/G8HHsM;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4608e389407so9430961cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732192950; x=1732797750; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc6X9iElRWmENHhbbVl9SZEz5VjqbVZCdio8bgobn6w=;
        b=J/G8HHsMv2mG0pNcDsGk3+86MoKqXiY80pR9nT6kE9I7wYYfVYtOMBV+Y2G5k4amfN
         OaMANN+yKSphttu7B7j/6iSCDAD6Y/V/sl+YXeFuuzo3Q3sOXfBMcu4ShOB1imlcQJYI
         6j8luZgERoyiuYWuct8lIz5QfdytOKdMvFfC/CFGFrFmkQMjjc1lycQS0OJt314eo6v4
         sT4ooWpEpTiezQ67eaTE5NSV9hPLC2V8N4NX7KoBH3peoOohXrbvfCrPBnH0r6qBsS5r
         M7jbJHPWGEwAqCx9M8p6teVhHWFu60KMYdM2avJdg51+DQPbem53KjoBqD4Ka1W5mK6k
         EdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192950; x=1732797750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc6X9iElRWmENHhbbVl9SZEz5VjqbVZCdio8bgobn6w=;
        b=U08WFb/z/rgWpjNGBysr0wHtka/pUXdAduhnGma3wMzfBUvu7+tB+c+E268SC2pBUu
         747CtIX/+EDMvH+LY7QKK7HphWW/0jh5Q97fa66B0iecsepRkoLlio1ZV5LVUb9jq7A8
         06z2n5kZxCN+0sIyWQGitxNO4PuXcYxH6w67trgr9ipEFRFpBgJNGdExA09zSa592rfK
         NbGAa1CXYwO8PgzGhw5O/pnn1ZiGzkmcE+PBiX9XdH+brUOu19KLvNLa0RfvnEE8eyu6
         2eBw6cTe7oDQNn1T/9MA6KmScZIO0iGcT/nOG/tQWjEfOpZQSeQTS12FtWLaAc9BqPtY
         ftqA==
X-Forwarded-Encrypted: i=1; AJvYcCWy7uc8SY8JXyDgRBMIWNqKJ5JwhgBQ/t1REsK76PokEKhn6jWk5SiK9Z2fZ/Lomk+Xjc+yVhma3eNg062w2si/PQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvoGY1xdFZFrYiMfinFIE9ygkW4tmSKPsUoI9TVYp6tYgxIaj4
	oCNEGYmv7cUqtbMUgm6Vrh3ZxMxdSs32/PI+gssTM0SSl4OFShLrCwN44rKZJ2Wpa6CWATnRsx0
	o3Di7g+PpVlR05bhGFXqbC8cdJC8=
X-Gm-Gg: ASbGncvytPqy9grs3QNEv962HdFOi9kJ4xqcvBdm+1Q/SmAwjp6wPGn+2vh/1tON2FQ
	RXcKKEooBXIGoD1BjEDjTHxxV96h8Zx06rU5yKHXykYEi8FhkOz6bosf/NxUzbxNUBg==
X-Google-Smtp-Source: AGHT+IGkcSbGF4Ujcd39vQNnvdjeseqjUb5lWUk9X6Ufrj6tX9++Wy8yjEQU/7vy6O/DCZ1Zq9Zq3CqeotIM2F7ORbU=
X-Received: by 2002:a05:6214:d46:b0:6d4:2806:1761 with SMTP id
 6a1803df08f44-6d437829ac9mr88224086d6.34.1732192949980; Thu, 21 Nov 2024
 04:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20241120203005.1802141-1-hiagofranco@gmail.com>
 <20241120203005.1802141-2-hiagofranco@gmail.com> <20241120230058.GW20070@denix.org>
 <20241120235737.4oqnasclzp77buy6@hiago-nb>
In-Reply-To: <20241120235737.4oqnasclzp77buy6@hiago-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2024 13:42:18 +0100
Message-ID: <CANNYZj_uPATSQwuUzKE5g-MubEX9_K5ZH9O9xE4r91+=jPwCQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libdisplay-info: add recipe
To: hiagofranco@gmail.com
Cc: Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 12:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207526

On Thu, 21 Nov 2024 at 00:57, Hiago De Franco via
lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
wrote:
> > > +SUMMARY = "EDID and DisplayID library."
> >
> > A minor nitpick - SUMMARY shouldn't normally have a trailing dot, as the
> > default DESCRIPTION will end up with two dots...
>
> Thanks for letting me know, I will fix it in the v2 patch.

It's also good to provide a separate extended DESCRIPTION. You even
have something like that in the commit message.

Alex

