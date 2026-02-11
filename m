Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8771E9E2EC
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 11:47:56 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17221.1770810473556052426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 03:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPwuzgHm;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c5384ee23fso562157085a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770810472; cv=none;
        d=google.com; s=arc-20240605;
        b=Inkoyy4DEq7IAIHmgVIC/cs3awp7JPks5gejF3WUyU7d0nnDSe/6P8WXfMPqqKCqAj
         9sGdu+x32DUL075TSX+kTGOw+9VNdlhwPAZgfA3HuL0KktrXT6G8M5w5KzajKaZupQT+
         OVDcZiL8v+/I9DdUtGgl2/uCtHpZ7+Ir+pOg93Rfld3doAlA2ZsZqMWPP+g71xXX6c1p
         8Vwl/89ZOoulkhBeGuivft0fAVPvloY5lHV929jzVh6Np/YzgNopPZZoxDFO402OHBzw
         HxEwumYGSLDyQEGtG00Nrx3AY08Iyt4TXAowSZSA1pSiaymmtEl0EHWIT5vGqmrqPuLI
         xnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s86dMpwgaZ5UhZq5ddRGIVgUbImXm5DKfHvisyaboEQ=;
        fh=GUvEGEcNGOV3jMOSaxLlPgkLl8zb/XGrvGx7aKAQ9fA=;
        b=T5DGmvyT9MyJhpYJsiKyOFRIYPoR+mxhsy+z5QCj0a0gFnnbEWRd3YoeGI5gb9xMvn
         yPZtcOh2z01UuFTq6+3PrsIee86+uOa1ueofZu/0ag6h9iWoOWLTeH2eXGhmAoVX5IiM
         DKylQIVjXo3roJ9NkSscsJn1AqBtQr6eiYfvj6AAQ1eMGKHRfZSrSm7TVRNNfR2ycdja
         ad8Knd061tWfBQnYi9ACFKS5bY/dRUmtu7FnmLWpsuX1cwxXvQzCRxaxUJCF6fv648Qe
         rEnpdwhQmYbSp3EVp5YKAJ6NBSJ2O9z1f44a4G71mzIdLA7RPjFZmlHnjtaOkctstLD4
         P64A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770810472; x=1771415272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s86dMpwgaZ5UhZq5ddRGIVgUbImXm5DKfHvisyaboEQ=;
        b=hPwuzgHmOIo1b+jFuIRGWUGXfzLyK6sF9qlri4CiLkFBPVuVqtqpePirceYn0yr6rS
         AEYU8U3kH3+Dv9dJ2+rNi3G3xvvQz6GS/u6WRdhIusnv2Ujvzi4h2QcGn++5Gj+fIvbE
         VWy58eAODWpWaM7RY+klLJT5l2uA09ISL4Aq6ZmdPd1Rd5iaiuJ5GD0Trn17ptdO2fjg
         dltPkWaw2UD8iQqQAZ8cn9jmunQGnV7G3etDJOwaG2b9ZL5xmFWB+YZcObhJYVMBUZUe
         RBBkE5UNfUuC9vEBbvvH4RCmSWQsy4bLjgETuMaGfoNYeV2MTP7ilt3JjXFNM2rCEO1W
         XXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810472; x=1771415272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s86dMpwgaZ5UhZq5ddRGIVgUbImXm5DKfHvisyaboEQ=;
        b=aLB0rJnEdYWkEFbXqHPM95pRysELbj+JF3d1/Vr911O/sqI2UOwmxTS+rE1e9LV8ai
         vMyxxHSdYCSbJJzBfaXfZWuvkysbELK9wspElcGWR8y6QqiVCMxZlmk+lqrrR/skaI4X
         TBaCiRiF15JIXPtLuAX9W28E/QMBxjxMFsED1j9YdFFUMr7WDT/BL8FgMZdO7uGNR81I
         c4ld+3fxl+EOrBCh/7+7MOXZtVF/v9eQ5vVseNDdgM8jBJn6b+m18IW/te5dZ4p066Q4
         r3M9MW0oO9XUxshc/6e498fLdmTLN8VdPmRjfv69DlvZpQHX5kRtyNQvmRnnREJ0lv15
         k/ng==
X-Gm-Message-State: AOJu0Yx5IdxoYcKe6or2f1UnGJq6DIXmW4PfoogqNOO7y374kZW9OBSk
	CXk7/MwRD45H+MS8zhdWaBmoaxMbjMVkDf+fRZFONvgQpBXJ835SRvqySTv2ITz7MI5NAzii35D
	MQL9l+dSp2GZAPGGHwE0GMkm8s+TdEuA=
X-Gm-Gg: AZuq6aJ8qV44FgZCpewLZxbNEoAm9LgMhS50tSWUPF4SHcqx1GTsNNl8WG1/qwJscTs
	FYmwdEysTvhcAr0Cxss0vdk7oFJmBAtGBck4H2dQYcIAwilGWBw1f49qz1VYK08hPL4UJSY1Id9
	X+8+MegH9rPZW+0MND7VntBgDzxZZQmeDf+1BhKlFCwFCIR9aPDoBPbYUpJNdPWfaCQF0LtzWsJ
	eEsa1+o2n6OAw1GDkIrs6bKhCwze3OuX7b9fK76aNHykU27vgkC7yyJuYkeyExcQoUCmOBO9ejD
	epSAO5sXFXAAkY3Ms2WUOHQ/B9UzcSzowqfzc+215A==
X-Received: by 2002:a05:620a:7014:b0:8c5:2ce6:dc2 with SMTP id
 af79cd13be357-8cb27f759a9mr300406985a.17.1770810472514; Wed, 11 Feb 2026
 03:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com> <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
 <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com>
 <TY3PR01MB10110F8354668695ABA48A8879B65A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CANNYZj-n=j-Z4eOYhPfEp77zjHg7NfT0WpOn8ZNVQjnM3DZOTw@mail.gmail.com> <TY3PR01MB10110B64798FF535BF65516019B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110B64798FF535BF65516019B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Feb 2026 12:47:41 +0100
X-Gm-Features: AZwV_QiotKro1JO4JYJsi7MG3N10AtVP5kETnq2NfzYY5uD2b979Ix7fl73kMpM
Message-ID: <CANNYZj8RYWPvi+stELUXo0Bvt6-pW-kVNBdQppfaXze-decngA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230978

On Wed, 11 Feb 2026 at 03:35, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
>    In order to make hotdoc work for orc and gstreamer1.0, I need to enabl=
e Extensions of hotdoc to work.
>    So I need to add additional RDEPENDS including: python3-dbus-deviation=
 python3-networkx python3-cchardet python3-pkgconfig clang llvm
>
>   After addind additional RDEPENDS, the RDEPENDS is as following:
>   RDEPENDS:${PN} +=3D "clang llvm python3-appdirs python3-cchardet python=
3-dbus-deviation python3-lxml python3-networkx python3-pkgconfig python3-py=
yaml python3-schema python3-toposort python3-wheezy-template"
>
>   Among these RDEPENDS, some OSS do not exist in the OE=E2=80=91core, I n=
eed to add them newly. Others already exist in meta=E2=80=91oe, I need to m=
ove them from meta=E2=80=91oe to OE=E2=80=91core as following .
>  Is it okay? If so, I will send the v4 patchsets.

That's okay, yes. Thanks for persevering with this. Please do explain
the need for llvm and clang particularly in the commit messages, those
are heavy dependencies and we should try to avoid them where possible.

I am starting to lean towards just adding all of the needed recipes to
meta-oe to be honest (and not enabling docs in orc/gstreamer by
default), the amount of new recipes we need to support in oe-core does
not seem to justify the outcome (building documentation for gstreamer,
a minor enhancement in my opinion). The patch review will make the
decision based on the final patchset.

Alex

