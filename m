Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81496CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 15:37:30 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.635.1756395444123077956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 08:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gELVISEf;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61c51f57224so1629236a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756395442; x=1757000242; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wp1VfInfgMQp1cbH6AJGYny5QVbk7EZqCZ2av6DFpqs=;
        b=gELVISEfiQQfmNL0awhtx4EAT4bG+w989f9VJxdB3Hr/gVJMG64+eql77tw73CrCbf
         glbG0fGMaoGwBVtWOhIomp/yzUgCr3F0yUUmF5utxXHc0NlCQeRpnN7BFR2eG80ntmQX
         NNPInRABBxVX+2fJuyWtF5juPFNCzl8D8swl4J5MMF3Xq2PJHAlfzTHwaBOcQanMB6KL
         KUtNXD52BJTHUsewZb5Ba9gIfiIEpulSg5M//fdYLz+4pkUOOWgW+wHHA8wYCzxsk6WH
         Wml8MDbXBedjRQlh0XQ5TxJ3Qf+TlndRtcii9j5YZu8lNurTDhiZ86z9IfhHspfiqYhV
         PvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756395442; x=1757000242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wp1VfInfgMQp1cbH6AJGYny5QVbk7EZqCZ2av6DFpqs=;
        b=pm5d8dGghboLeKeYwoAqfIbqrfh6VcruU7Xe9HqIkW5ymqVMnILlIU3ySqePqPk8ux
         kW8LEvCJ6GOea/3NJcfNs9cdfzZKrZR6jp9lq5C5btN6AXF+TRN/TTg2Jfk4Pbbqfqyy
         n6qr6uZBePrTIUpo2SSDuWh2g8ih4tsE99JpnCpdNkpyHMrytnXSNuLAEa6O7Fs8U2aY
         /IMRDEdcw7hVDi233qdvuHYExdx5D2GJSL+FK/OJ44ySCkanghD35VT5lBlT4uERBVpA
         dKbHubkEK5mj5hmxBI48yEtic7DrQKDff2Nz1DJXp1sFtFzifxmLRb1BxA11N9TAUAoR
         id7A==
X-Gm-Message-State: AOJu0Yw2MrfysEKhRoh/x02ZmaIIKiPbT19WozEHS8rbysMNsPkDjxiV
	68jwRbPZ4gQIsU/6wJicpH4lS79SzILhZQPUXTSgxAOLHVGW6a8DdeU4
X-Gm-Gg: ASbGncuKgN1ZYKystz251E4ms0cq28kdg4C01ijnXhaipZ68uGYatzRHH7eqeDZ3hlw
	6SJEzlK/kMsquHQxQ8b8YTyZTEfGdR6wiBm2xmqeyjpykEmOwWbJ6W9HX11fFDxywa7R5clcPlz
	cayYh6DghN4tYuq0aGedb9lBREh5Knw3VcJDF0z5e4UyIzgAjzse1mxoMM3op9g7VXc7o4G7PVE
	8mrPbAztIE9whgrPiwGfJG2o+jOyBV51riefzfuM8447AVp0vTY0hY7FKjpZoilzmLVM+pICZux
	B4ZBo+SN8t9DwX5HL7HqxFm9uy3+Ucl8bb3zFh3I77eiBR+gwghIAwchi2G9gwLWUMIn5VxJwTo
	R8AeJMBroKtVACY7S6TGdwCMYsrYeCekAT4uc59Zrgrqxwx1bkOqm
X-Google-Smtp-Source: AGHT+IGhvnvQdmAa9XtsyDov3hxuXdlxTFTOIrUf03/b4K2/SJEuIt5bckv50SBXZGya1EJLBR8FbA==
X-Received: by 2002:a05:6402:d08:b0:61c:1b27:56d4 with SMTP id 4fb4d7f45d1cf-61c1b91475cmr19075904a12.35.1756395442220;
        Thu, 28 Aug 2025 08:37:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cd59d6ff5sm1772221a12.25.2025.08.28.08.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 08:37:20 -0700 (PDT)
Message-ID: <e014ef31-e912-4d76-946b-113c9a7f1bf4@gmail.com>
Date: Thu, 28 Aug 2025 17:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ptest-cargo: move run-ptest rc variable
 initialisation
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20250828120544.2982231-1-yoann.congal@smile.fr>
 <e3cafe69-7bf2-4084-9dbd-5255b538267d@gmail.com>
 <CAMSfU+6kLVVf5jNxCJJ8YtAK6T0Xry23kHs7iV0zevooe=TsYQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMSfU+6kLVVf5jNxCJJ8YtAK6T0Xry23kHs7iV0zevooe=TsYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 15:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222581

On 8/28/25 16:01, Yoann Congal wrote:
>
>
> Le jeu. 28 août 2025 à 14:45, Gyorgy Sarvari <skandigraun@gmail.com> a
> écrit :
>
>     On 8/28/25 14:05, Yoann Congal wrote:
>     > From: Yoann Congal <yoann.congal@smile.fr>
>     >
>     > ptest-cargo run-ptest can be generated in two fashions:
>     generated from
>     > scratch or appended to an exiting run-ptest file. The rc
>     variable used
>     > to track tests failure was only initialized in "generated from
>     scratch"
>     > case. Which lead to errors in the "appended" case.
>     >
>     > Move the rc variable initialisation to the common code of both
>     case to
>     > fix this problem.
>     >
>     > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>     > Cc: Gyorgy Sarvari <skandigraun@gmail.com>
>     > ---
>     >  meta/classes-recipe/ptest-cargo.bbclass | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git a/meta/classes-recipe/ptest-cargo.bbclass
>     b/meta/classes-recipe/ptest-cargo.bbclass
>     > index ece25ff1eb..e35de1042e 100644
>     > --- a/meta/classes-recipe/ptest-cargo.bbclass
>     > +++ b/meta/classes-recipe/ptest-cargo.bbclass
>     > @@ -103,10 +103,10 @@ python do_install_ptest_cargo() {
>     >      with open(ptest_script, "a") as f:
>     >          if not script_exists:
>     >              f.write("#!/bin/sh\n")
>     > -            f.write("rc=0\n")               
>     >          else:
>     >              f.write(f"\necho \"\"\n")
>     >              f.write(f"echo \"## starting to run rust tests
>     ##\"\n")               
>     > +        f.write("rc=0\n")
>     >          for test_path in test_paths:
>     >              script = textwrap.dedent(f"""\
>     >                  if ! {test_path} {rust_test_args}
>
>     I'm not sure if this is correct. This value is what's returned at the
>     end[1], but here it is set to 0 unconditionally, even though it might
>     have a previous value.
>
>     As an example, I have almost sent an updated librsvg ptest patch[2] -
>     while writing v2, I noticed that it has not only C, but also Rust
>     tests,
>     so I started to add them too. The resulting run-ptest script first
>     starts with the C test that I execute, and partial result is stored in
>     the same variable. And then at the end ptest-cargo appends its own
>     tests, and continues to use the same rc variable.
>
>
> You're right!
>
> How about we initialize rc to 0 in ptest-cargo ONLY IF it is not
> already defined at that point?
> That would allow custom run-ptest scripts to setup their rc variable
> but it would also allow scripts that don't want to bother with it
> (like rpm-sequoia) to completely ignore it.

This doesn't sound bad, personally I don't have anything against it - as
long as the original value is also kept, I think that would do.

Thinking a bit about it, it could be also removed from the rpm-sequoia
script in any case - by the end of the script it is either defined by an
error, or the last "exit $rc" will just become "exit" which implicitly
turns into "exit $?", which is also not that bad. (Though not everyone
likes such variables, and personally I'm not extremely attached either)

>  
>
>     One thing I gotta admit is that this rc variable is kinda hidden
>     in this
>     class.
>
>     [1]:
>     https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest-cargo.bbclass#n122
>     [2]: when I get around it again, I still believe that it will
>     happen...
>
>
>
> -- 
> Yoann Congal
> Smile ECS


