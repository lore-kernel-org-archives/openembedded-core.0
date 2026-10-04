Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0C9CA5FEC
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 09:30:38 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20629.1791106230745173894
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 02:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P9glS/wj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so9248455e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791106229; x=1791711029; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yBOfdyqXynYzpeKSoL3l/5PVaCQgH41rOwvX3GOQDA8=;
        b=P9glS/wjgKwiLGPF93gNiDhMw4DN10odz98HL4+AmWHvdNT7Z/dpuj6gdIxsQvU0q8
         oAVhsW4vZhkEe8/EHmUzFTMeLPiAkCKme93jQggjNwHMNQ7STbkTz7WK2/OkPRQELpOQ
         DUoVR8ACRjz69bj2X0BEEW4ulytoVje4azR30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106229; x=1791711029;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBOfdyqXynYzpeKSoL3l/5PVaCQgH41rOwvX3GOQDA8=;
        b=f8/teDd30Tjaox1+5y5fAjYruM5GWlAX7uR8TekdhckhSPghhRvQX1ONa0gir/OSuJ
         1JNDdkh8ldpzMSCSCiQkuI5DwouD5OjeaYs6g7EgUtdDE7UWmReTOR22YHHEaPFZT11O
         N4AzTf8tw7rWFkOq2rLP0q49Z7AdZ6g6yx3rGaB8J3ljwOydcjz/+/XPA7GePzat3myB
         UM2lPab6ELHPq92E3I7YPWI8gQ0pQ/TOE1vEPkHXK3PtGHphUbS2bapUv7MwPGc6SM3v
         pbxvIYyzSpV6cr/LXOybyJPkJIezqXfRcv/z07sG08GibNkSBVon+kMjHxD+iqcV2aGL
         o3Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxS8pH8j/jtGHc4/gHBKWCFwQGKgbIiCxxHCacrZczofrPGOgFNCKmAtlvSUu6D7P+HKEvVgkMGQ/4Ku9LSMMR8pA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kJRDnQW6MneHqeOd+adps+hkcThgmfBeCyWBWni09Vv/TXKuZB
	eSZy6459EoGSLTsVs1UgJDvnHM3dFVuRSOIRg4tjBHf8wFCM1HCo/3NA5JkZPs0xh1s=
X-Gm-Gg: AYBFou1iC6HHbeORkzRk97iO20Hk8Jt2swbswxrc+VrsCPMMC7Lqdx4t69pZqkijUep
	Wn6Y6X23tcemOMsTkVsnRWbqwG+SXS+yqsuhCsl3y9BAH92JQMmu+R/b2JXjw8Chms7aZUxDE7A
	UPuTP1t+14VIRrcYmS+DMcT6h/Bg86z1hgbXHfYMRXzg0u6/Cj/BU3MTHdKrVdfmi5NaE1fuW86
	92rukB3JnSyWUH8lbtTOy+4RI0DKqLl4ZLJ65UpR4ZuoGbJ6l7kDefUC1Ha03y6KjtQc35YaQ/6
	rmFGJnq1KN+uQY8vYgVSMCFJ9tbKirVb/jVcnyDRBznem0FJr1Nabk/06quJJyMayCMnL+4RP79
	uTGMmJ6bgxRyZKLDP6Y0FnOySDgMrnem641kAaw8s1Njbp+GVF/hpR8tvmWeJr8dtx7ShF3xQQn
	ZKRHcA0fkSZ4uXujDMlxfEzGRh6ALU5eN9hpBXpFdMB1x9v7iCQA/lDTZF9ZFIfijLukuMAt5PK
	Ivx58fhRUbhdFObDtbCrZQtsf8PVrNeN6dvKddSJzEe0bGOe06nImnIh9Uucg==
X-Received: by 2002:a05:600c:a011:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a02756716amr123214415e9.10.1791106228930;
        Sun, 04 Oct 2026 02:30:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bae4:e96d:1337:f26? ([2001:8b0:aba:5f3c:bae4:e96d:1337:f26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm242988455e9.3.2026.10.04.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:30:28 -0700 (PDT)
Message-ID: <12078688ca6d7ca74d455b210aabe013e9cd6337.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gtk4: upgrade 4.22.5 -> 4.24.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, ross.burton@arm.com, 
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Oct 2026 10:30:27 +0100
In-Reply-To: <DLTQ77V2KN0T.2RKW1BZSWGKCG@bootlin.com>
References: <20261001115440.669670-1-ross.burton@arm.com>
	 <DLTQ77V2KN0T.2RKW1BZSWGKCG@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 09:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247199

On Thu, 2026-10-01 at 20:50 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Thu Oct 1, 2026 at 1:54 PM CEST, Ross Burton via
> lists.openembedded.org wrote:
> > Hightlights from the upstream release notes:
> >=20
> > * GtkSvgWidget is a widget to display SVG, with some support for
> > =C2=A0 interactive aspects of SVG
> >=20
> > * Wayland:
> > =C2=A0- Version 3.2 of the text protocol is supported
> > =C2=A0- xdg-session-management-v1 is used
> >=20
> > * GSK:
> > =C2=A0- A number of 10bit image formats are supported
> > =C2=A0- We are now using clip masks to reduce the number of offscreens
> >=20
> > * The gtk4-encode-symbolic tool for producing symbolic png icons
> > has
> > =C2=A0 been dropped.
> >=20
> > * Snapping: GTK can now snap contents to device pixel boundaries,
> > =C2=A0 for better control of rendering with fractional scales
> >=20
> > * GTK now respects the reduced motion setting in various places
> > =C2=A0 and avoids animations (GtkSpinner, GtkStack, GtkRevealer)
> >=20
> > * New GtkShortcutTrigger functions it easier to handle synonymous
> > =C2=A0 keys (in particular keypad keys).
> >=20
> > * Type-to-search (in particular interaction with input methods)
> > =C2=A0 has been redone, switching from a "pull" to a "push" approach.
> >=20
> > * The first part of ongoing frameclock work has landed, improving
> > =C2=A0 our ability to deliver frames on time
> >=20
> > * GTK supports the ext-background-effect Wayland protocol to allow
> > =C2=A0 blurred background behind windows
> >=20
> > * The visible focus timeout can be changed with the new
> > =C2=A0 gtk-keyboard-focus-visible-timeout setting
> >=20
> > * The GDK frameclock has been reworked to improve precision and
> > reduce
> > =C2=A0 frame drops
> >=20
> > Add a hook to rewrite the content of the meson-generated unity
> > sources,
> > as these contain absolute build paths.=C2=A0 Manipulate the file during
> > the
> > packaging process so that the actual build tree isn't altered,
> > meaning
> > rebuilds are not affected.
> >=20
> > Based on work by Markus Volk <f_l_k@t-online.de>.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
>=20
> Hi Ross,
>=20
> We might have some reproducibility issue here:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5098
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261001-l7m_wa7=
_/packages/diff-html/

I think I know the answer to the gtk4 mystery. The find/sed runs on
packages-split and it breaks the hardlink between package/ and
packages-split. rpm builds off package/, ipk/deb build off packages-
split. That means only rpm is seeing the "wrong" file and this is why
the reproducibility test only reports rpm, not ipk and deb.

When we debug, we tend to go to the deb/ipk files since they're easier
to see inside than rpm...

Cheers,

Richard


