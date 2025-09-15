Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD177CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 15:33:42 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.37282.1757950415653746383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 08:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNyWqRJ0;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d6051afbfso31997397b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757950415; x=1758555215; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u51a5nXBErdIfn9J6QoCmPAgyz6Y+XtzaIJmYxyIRg=;
        b=NNyWqRJ02t6WujHIpFEiy7p1YuloavxeX+3RxRxPpiDQxwH2gkNAlm0q2Qt8cs73JB
         VCWjExfW9VnANqsm+U3uRDjV7rJtDwIvCGO3oROsLsiMkfKdtehfTEqa4KRoCERS84Gk
         qj5BwGcmE6c/2q+CanwkxtLMXZID7fMajBSLTTIbk3++6KkNYS8hYCRqImCZwk7tmA7M
         jYKlPUpjjReeOuj3YGxbZw1ZsNwjlxr5A2q/Y1LOIErDzQCRUUdE/eHbxcuw01Wi07hQ
         yH/+Q3QfEYEKg+n6qUxZBcH7f7Z81r05QQ+okFEcOfhryj1kkSzCmDbhHS8lGtUzP8EL
         ZUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757950415; x=1758555215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+u51a5nXBErdIfn9J6QoCmPAgyz6Y+XtzaIJmYxyIRg=;
        b=EIyLJX3QLofzVYsIY7r7osdNc5hR70VY8sy4J9MlSCfeMG1+Mhenc+hJn/d2yi4a4B
         gb0/shqgofeyi8iRJ5RGnNKoxJLEXHD/5gZIljB20BTu6aqVhmhIlbUb4RZvWWB/twAe
         eqeIPS5k4+9/RCMS+W5gm2XYrAkE+5Kn/y0iQo1QCEH+OIxQ0Edytp13lodQeQ+WIE50
         iFk7DRZ4EzdQjb0gyCwE0+Py70NIAmTNBb/0MUSy6CABhLOtvPlUXx8l7JgE4ZYUelDV
         JxNyXeTrJp1gMP75eqARnlIpPQho3hwBtsvw9ujgxhBHT2+yrc4bJANeqpAL2B6PBBTC
         prxw==
X-Gm-Message-State: AOJu0YzJVtMmw15SfW1C8uUBCErpNVq209LiG8TP2dOt9KMjNJ75bSNr
	UNq5uJ7kSP8OJE+f+TWcKXuWcPVtX19K+AiP+K10eBOSPZMvQLnVbkpetANox0rb8U8DttWy+OT
	jCRe7PSMZ0m9LpiFcRJ3uFgyk8Fm3p9/KMjFH
X-Gm-Gg: ASbGncuXSJ0l1RjYI4kOEkFJM65XEgsiepMLHTW6PgapfTqCSpke6hwBIpLRYECKOeo
	u9oA9TrSKm53lK4BZizDD5dadP8UjpzG3PuLLqyarGuIeFSuyBl3A9K7AWXLTvbtpmb5PIHedx4
	7J7jvBw0NVIPZrjRE+Df2+yRkjp6cKYSw1CKWXke0gyX2F8EyFoAjn8wYP0eojzahMT3Q+fADjD
	SDRMoJEMS4cH13+9jngVfMh0oWmH7kra2rk2IYaYYS1j5yb7r7Ysjtd1sjMyXgcan6hCEpglz6A
	rT1NkRBWxf+NT/PbNj0LTR2lRuOyQD5mHqFNjH8GIJ/k7T1V3jTJWcB2ZA==
X-Google-Smtp-Source: AGHT+IFGmE/tNCdsfFyFqyYZny2PwlpOZ9aQTQ317EPdAraOBrie4ebVUlQStF7AXdN9zVVketnlVzUzzOMix/z4JcE=
X-Received: by 2002:a05:690c:c08:b0:72a:2d15:a2a2 with SMTP id
 00721157ae682-730627c9015mr121140897b3.11.1757950414252; Mon, 15 Sep 2025
 08:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250914133258.2625735-1-ross.burton@arm.com> <CAMKF1sonXyyzKUeSDeYjZXieBxmYsUNBaawDsk45QDmn-=JawA@mail.gmail.com>
 <2ED94C84-624D-4885-85FC-2441F74A4AC3@arm.com>
In-Reply-To: <2ED94C84-624D-4885-85FC-2441F74A4AC3@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2025 08:33:08 -0700
X-Gm-Features: Ac12FXxmg0Q6hFBIbenmTtCaGnXBLb11QqK3mZ-bA6-B7dbNkfZcExo7mhi4A9E
Message-ID: <CAMKF1spgqgPrnbpfP1matYSJ_wyLY4Uo+NatADFxid_RkMQUdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/6] clang: improve opt-viewer PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 15:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223493

On Mon, Sep 15, 2025 at 2:45=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 15 Sep 2025, at 06:23, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Sep 14, 2025 at 6:33=E2=80=AFAM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>
> >> Instead of patching the python module detection, we can use the hidden
> >> option LLVM_TOOL_OPT_VIEWER_BUILD.
> >
> > How are these hidden options materialized ? it will be good to
> > describe that because there is no description of
> > LLVM_HAVE_OPT_VIEWER_BUILD
> > anywhere in llvm sources.
>
> Holding back my rant about the llvm build system=E2=80=A6. all of the dir=
ectories in llvm/tools/ have enable/disable options created for them, which=
 are marked as =E2=80=9Cadvanced=E2=80=9D so they don=E2=80=99t even appear=
 in the =E2=80=9Clist the options=E2=80=9D output.
>
> (llvm/tools/CMakeLists calls create_llvm_tool_options() which calls creat=
e_subdirectory_options() with LLVM and TOOL which creates options for each =
directory it finds).

Right. A note for this would be good to have in commit or sources to
remind us in future when we forget.

>
> Ross

