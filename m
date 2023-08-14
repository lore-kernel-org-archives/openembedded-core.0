Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9362EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:54:52 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.104184.1692006887106245609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GSypmHJN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso63628551fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692006885; x=1692611685;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+nS5iIhm+98R+EcMJzxvtReygxweE4y/t14uXfCd37E=;
        b=GSypmHJNU52hla9xjphaUJSxXybEssR6uQ9gEMFQEI+CT5da/0E+No/2ObFPnXioCz
         seaJAojD78lPIp6Ye4RYUxswfxr1M23dZX07OHJ1dC5ALOEt3v1CwJG/peRUov6Wep5c
         7QAIiy9KhmpcJokn96TWCUDBhKm+8KV0SsQaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692006885; x=1692611685;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nS5iIhm+98R+EcMJzxvtReygxweE4y/t14uXfCd37E=;
        b=QC5rK3ftpEqph7fLNM3Qjqnbkl1ru8NL6c10k/ErmByFbEnRhAvLRDm3IQTFVBgWRv
         D1wcCgxvHO9/pNFCCcs51h/dgjlxACxJuSDPETG34rk2KWI5c10FdepyAIY/8uKkXyCz
         ejtHluxD//+04N5c0cmK8eJCTubjBpTzk+8YBLHnM3huC7D/gljr1c1otDnZgy4Y/sP+
         Lg9vVbN0qcHUzLaHbkMci7Z7D/JDceNCOMa2/GwnYTO2eaemZzF02PM4G2fL1st7OhTP
         ZMwJNI+dr51I4uOkbJCRmO1qvaJRi7uiZEZjnqWSUKtk44csJdn/7pFk8ZiVymv1thx+
         Engg==
X-Gm-Message-State: AOJu0YyQcf43J9VajBcE5/7NEI30Z9claSJX2MyOuPqJ3cBXCMYAET/G
	OfaOWRnOtyt4qD74Mk90ytxQw7MOPLgbyb7RwwE=
X-Google-Smtp-Source: AGHT+IFRDAyt4lykx3lBmgWBpnPIbtO2wyC2KvHPNL5p52ZeaA18yCzS42J9XZVX/pjb2VIpPzKKmQ==
X-Received: by 2002:a2e:9d85:0:b0:2b9:c644:414a with SMTP id c5-20020a2e9d85000000b002b9c644414amr6125400ljj.46.1692006884854;
        Mon, 14 Aug 2023 02:54:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a? ([2001:8b0:aba:5f3c:f4dd:8e09:bfc9:5f0a])
        by smtp.gmail.com with ESMTPSA id l24-20020a7bc458000000b003fbb25da65bsm13810248wmi.30.2023.08.14.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 02:54:44 -0700 (PDT)
Message-ID: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
Subject: Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Paul Gortmaker
	 <paul.gortmaker@windriver.com>
Date: Mon, 14 Aug 2023 10:54:43 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185930

I'm becoming a little weary/wary of some of the changes that are coming
in. The challenge is that once they merge, issues become the problem of
a very small number of people.

My current dilemma is the 6.4 kernel. People would like it, we'd really
ideally use it for the next release but there are issues.

I've worked through a few, at least pinning down where the issues were
then resolving them with the help of others (thanks Bruce, Jon, Ross).

Remaining are:
  * an error upon boot on preempt-rt on qemux86-64
     (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/72/build=
s/7616/steps/36/logs/stdio)
     We'll probably just have to ignore it in parselogs as it has been=C2=
=A0
     around for a while and nobody seems interested in fixing it upstream.
  * some random hangs:
     https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/349=
/steps/12/logs/stdio
     https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/354=
/steps/12/logs/stdio

The latter are rare and intermittent, mainly taking out CI test builds.
Most people aren't affected by them, find them hard to reproduce let
alone fix and will ignore them. That will leave me/Bruce/PaulG holding
the pieces.

I know Bruce spends a ton of time debugging weird things just to get
the kernel to the point we can even consider merging and nobody ever
really sees or appreciates that work :(.

Systemd was a similar challenge recently, multiple patches causing
multiple issues with a significant impact on CI. In that case the
issues weren't intermittent so resolution wasn't so bad.

Rust and reproducibility=C2=A0was given a pass so the rest of the changes
could merge for it. That just meant there was less pressure and the
reproducibility issue is still there with people saying its too hard.
That issue is now spreading down the chain to other recipes.

The toolchain test reports have thousands of failures nobody is really
looking at. Similarly the now consistent ltp controllers failures
(previously the reports weren't even consistent!).

I'm worried the access control patches changing the tar format are
going to destablise and once merged, people will move on to other
things leaving any remaining intermittent issues to me. Already we're
seeing things like sstate being blamed as it is easiest to do that. I
end up having to "prove" it isn't that.

There are intermittent ptests on the autobuilder too. I took mdadm
ptest patches on the basis there was help to fix them. We are still see
a lot of failures in CI from there. The glib-networking intermittent
failures continue, I know Trevor has tried to dig into those but he is
alone in doing it in code which isn't easy to navigate (and I don't
know how to help there).

As an idea of impact, every time one of these things fails in CI,
someone has triage that failure. The bug triage team has to triage the
bugs too.

I don't know how we fix this but we really could do with more people
able to dive in and help with these intermittent issues. I'm really
really apprehensive about merging some patches as I can just tell
they're going to cause pain :(.

Cheers,

Richard


