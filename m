Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05391C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 12:01:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11416.1670587268088206008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 04:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F9uq7Uoz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 125-20020a1c0283000000b003d1e906ca23so3113691wmc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 04:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v3CFkOdsm7o8Uq5PKleEUZ6mBp7zblHO+3cJ5sG20tk=;
        b=F9uq7UozsKeZ8zecNGtvlC+8g2pqHZbaWybDcpcdZpZ1NPaTAtq4ciWusKgZl0FI9T
         M4WWSiwd4wIaR4GARcJvfkox5y5O2J3O6jfZglQhQqMrjOZS0MCmpQPs+pkZ19NxoWX2
         pNWOuGXB/z3uWLg0xZlyg9EmiXl24md1apJHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3CFkOdsm7o8Uq5PKleEUZ6mBp7zblHO+3cJ5sG20tk=;
        b=W0naXC/lymmTlExVORqnSJFv7B8fuq+b9hEdInzJaE0BKIvRKmYFZJrsfPyN+pTaqt
         Gqzb7tqmj/9CKxkHj2wO94jL3gSLVrDG5M1TMsmZB1esu5uXzO380XsEhcqqOXOpOsgC
         T8zB5L4bT5A1LaLH7cOOyquZS8tLwF+Vz9GgCVC/C7WeUktnDWO24IEvc/g1wwJz5uwJ
         6hyp2j8hCaG7kkrl5kMQmEzKJgHWk1bjlE/KThUe3rkwh5ADVrmTDO/hwV8vQwVB8MMk
         eXfWmE3IwZWp7kVQYXWv+8rnfi86/Yms44E1JwE5c1p+BoWZoD4zPbhSGYjeXWAWyide
         6pSw==
X-Gm-Message-State: ANoB5pkYmjW5IRBW7Yow+yGdY6BzheB7K671HQ1m1sHnC0Lva5t6uxL2
	cMJWJC9hmqG8O3l8FySUmRt2ww==
X-Google-Smtp-Source: AA0mqf6JcBvZq+MOo6fK6rPVke6ftK6jCdY3URf9QsKClFrOXjRyzOhUHZ5IuxPd56P8XYOee8y5/Q==
X-Received: by 2002:a05:600c:3ac3:b0:3d2:148b:4a26 with SMTP id d3-20020a05600c3ac300b003d2148b4a26mr103004wms.32.1670587266280;
        Fri, 09 Dec 2022 04:01:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4? ([2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d5109000000b002421ce6a275sm1173499wrt.114.2022.12.09.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:01:05 -0800 (PST)
Message-ID: <7f51955aada8f9e74322aa0ad15f21b9985d993d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Michael Opdenacker
 <michael.opdenacker@bootlin.com>, Randy MacLeod
 <randy.macleod@windriver.com>,  Sergey Bostandzhyan <jin@mediatomb.cc>,
 openembedded-core@lists.openembedded.org
Date: Fri, 09 Dec 2022 12:01:03 +0000
In-Reply-To: <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
References: <20221031114719.2725967-1-alex@linutronix.de>
	 <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
	 <20221207002040.GB1080@xn--80adja5bqm.su>
	 <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
	 <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
	 <CANNYZj8gX4ab+zOVN974vwL8UkJqO-gqkshxsdYVtPsHZfExfg@mail.gmail.com>
	 <1de0c6c3-cd27-1c86-f515-f4510ddd36f2@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174446

On Fri, 2022-12-09 at 11:39 +0100, Stefan Herbrechtsmeier wrote:
> Sorry for the harsh tone but you ignore existing tools and add just
> another tool to oe-core without mention any reason or document it. Do
> you really expect that somebody will patch existing tools if main
> developers ignore existing tools and provide new tool for their use
> case?

I'm not sure that is entirely fair criticism. We have some challenges
with some of the new languages. Rust support was in a separate layer.
We took some of those recipes into core, then ended up making
significant changes to them. We never took the external tool.

The hope in doing that was that we'd find a better way to make things
work. I think what Alex has done is an improvement over that external
tool and it experiments with a different way of handling things. I've
had generally quite positive feedback on the approach itself. Yes,
there are some issues with documentation and some people using it have
struggled with some usability issues. None of those look like they're
unfixable.

>  Why should somebody improve an existing tool, extend the
> documentation, add tests or even upstream its work if these same
> requirements don=E2=80=99t exist for the main developers. It looks like t=
he
> requirements for foreign and main contributors are different and this
> doesn't encourage people to participant.

I don't see us treating developers differently and I am concerned you
think we/I do. Any given solution that is proposed is evaluated on it's
pros and cons. In this case the solution is quite self contained and
allowed the approach to be experimented with whilst solving a real
world issue. If it doesn't work out we can easily drop it. The risk
from taking it is therefore low. Yes, I should probably insist on
documentation. In this case it is relatively simple code which is
relatively easily understood so I've been less worried about that up
front.

If it worked out well, we can integrate it further and document it. If
it doesn't it can be removed. FWIW I have heard people saying they like
the approach and that we should use it for some of the other languages
with challenges like this.

>  Maybe this is only my personal feeling and I apologize my harsh
> tone, but the acceptance of patches should be comprehensible, and
> expectations should be the same for everyone.

I do try to ensure that. My "algorithm" for accepting patches is
probably not easily documented but I think the factors here which are=20
the standalone nature of the change and the easy with which we could
drop it if needed. As such it is in my "low risk" category of patches.

I'd note Alex has another patch which has been sitting for months
unmerged as it is in my "high risk" to the project category. I suspect
that one will not actually merge but I need to find the time to explain
why, right now it is more based on a feeling it is the wrong direction.

>  Should others answer to your comments that their solution doesn=E2=80=99=
t
> preclude your suggestion and that they welcome patches? For sure it
> takes more time to add rust support to recipetool but I think a
> second tool without a clear reason in oe-core hurts more in long term
> because its now unclear if new features (like checksums or licenses
> support) should be added to this tool or if this tool is only a
> temporary solution and should be replaced by recipetool in long term.
> Furthermore, this class is marked as a class for a recipe but
> shouldn=E2=80=99t be inherit by a recipe and manipulates a file inside th=
e
> meta data.

We do have precedence for classes that help updates like this. Both
python and perl have code that adds tasks that function a bit like
this, in those cases for the core recipe.

Personally, I would ultimately like to see these operations handled by
recipetool and I suspect natural evolution of the code may head that
way. Both devtool and recipetool have used classes as a way to help
them perform operations so in that sense, this is actually a logical
development path for those tools.

Cheers,

Richard



