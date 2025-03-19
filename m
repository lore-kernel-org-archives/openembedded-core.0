Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5120DC35FFC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:12:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.11832.1742400720654125756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MR3NyZmH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so47906365e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742400719; x=1743005519; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dwDruciDjVGNq9zD/iaPYetnIRT1NbdDA9prxujwniQ=;
        b=MR3NyZmHK4u38ehV+uqk/3Q/47RX4C6ixvuEErezSijocupEXUFlByfPu0IAoP/9Kf
         1uzDWBooAh59wcnjwCgVBShmkTVFmD7rRFsOa8uJXy3pKVAX5riHoB6eQVpicM4PExF+
         yGJfFiE1LunD5JUHJIdRecQZoxOGmvtLZM32s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742400719; x=1743005519;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwDruciDjVGNq9zD/iaPYetnIRT1NbdDA9prxujwniQ=;
        b=pnpAz4dcCJ/OXAwJYkUQRQz3BZ1VJhjkEhA/hzCYKTNnSnHRX2aVqLQzocKWAIRsLM
         XcQ3CGy0SxumKeiWCr7Dr/7SgP7beu5mjlSFsJ/1wYBwiqIV6mMKsENRK9QvzwmiNkte
         GLySuRHww46+InM/pWmvTTFvblpC/hJxOQsI6dfyIi/1czBBBp6DRSczGsOd5kvs+xx4
         KbJfrUzAGSZ6EfgPzdQCyv6F0wIe+yuHris0jhRBaI7TM7+/Atd2g0RNNI8FjQZLjnn7
         rJttMLOHwOdUgVLIrruLy5IF2kophF0RduconZKOaVoM89D3S8OW35PbBeuR9lURX5lX
         GCnw==
X-Gm-Message-State: AOJu0Yxr8udEh3Y2YS1FO7uqN+nXqC1+Aun9kBLHwh5Dtrh8cAXV7EPd
	cG1uHHq0lynsVgWRA0lyRBviCT6myoPlimwFgrR8U0UIMeY0kxuh3mmHRlNYLVA=
X-Gm-Gg: ASbGncvQLMmwz3V+fJYGd2weyul4qs4U5QN/hbvMMAGVL6+ra95VWOOxdjD/rpjozt9
	HjB8dlrBrGo+1NMy4UfB2OYpzWxh8MlCj/GGe6It/KbhJZCEbk/R0j9c3GuV2R13YEFDGZzobRf
	72eYrR/j1RxsT8ECEz6fjNSnqc3QlvUjwIstoYBlUHrNa2C9ElNPJgqmkbxxwl5b/+W0NudjKSb
	31+zvAL8RObHrzCICE8D8FXdEGQcjWTOY8RicgJtGRT63leT2L+ubaKfu0K7L1js+3Sd21LDQe1
	uSYxCXbtNoHmOAM57dwxSeLCd185+YocYXbJHX5gIV/XZQ8R2t8sAmHWgBN4kY5KvhZDuAafLSJ
	otdUXPTxIXchLgYIT4AUi76+PAmUqtP5JgIZ3gntltQ==
X-Google-Smtp-Source: AGHT+IE+3N6HcIQ1AuHW9vQaLZZZ7WYW7Y5utA74FH0+t+wDXA+vcKI3bTCaBj3IaRanGYsowyee6A==
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr32684325e9.2.1742400718954;
        Wed, 19 Mar 2025 09:11:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f37665sm23124835e9.2.2025.03.19.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:11:58 -0700 (PDT)
Message-ID: <b825d8eb3f5ba20b9ae2ed2b76d7cbf0889e22db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 01/27] webkitgtk: 2.46.6 -> 2.48.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 19 Mar 2025 16:11:57 +0000
In-Reply-To: <CAMKF1sq-BajTxiE+BwkyyZbo07JiN3OxrcrprMvZubjVcGguKg@mail.gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
	 <9f97a4f6c9b8a5bc55f862f69012bb9e8d11a1b9.camel@linuxfoundation.org>
	 <CAMKF1sq-BajTxiE+BwkyyZbo07JiN3OxrcrprMvZubjVcGguKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213342

On Wed, 2025-03-19 at 09:07 -0700, Khem Raj wrote:
> On Wed, Mar 19, 2025 at 2:40=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Khem,
> >=20
> > I appreciate this patch series is a work in progress and evolving but
> > it is creating a headache for those trying to help merge patches.
> >=20
> > The problem is that we have bits of this series already going through
> > testing/review. We now have a v3 and no idea which bits of it have
> > changed. The logical thing for us to do is throw away what we've done
> > and start again. If you could give an idea of what has changed that
> > would help.
> >=20
>=20
> Yeah, I was trying to hurry a bit and pulling many strings together,
> sending patches upstream, addressing that feedback where needed and
> also ensuring
> test combinations are working, probably a cover letter would have been be=
tter
>=20
> v2 - Address feedback from Mathieu and Alex except ncurses and man-db
> patch, fix webkit to work with clang-20
> v3 - man-db fix is enhanced to address root cause which is musl
> specific and had to do more sadly, address ncurses issue
>=20
> The good thing is the changes are done now. I do see some parts of
> these changes are already merged so I will send the remaining in v4
> after rebase.

Sounds good thanks. I did go through and tried to isolate the bits
which hadn't changed and had been tested.

I've upgraded dbus-glib, could you check and see if the new version
needs gcc 15 fixes or not please?

I also merged fixes for the libmatchbox and psplash recipes so my
patches should replace yours there.

Resending what is left is the best way forward once those are resolved.

Cheers,

Richard



