Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F183EA3F2F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:41:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16216.1770716482718662591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egDVtRN7;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8947ddce09fso6800826d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770716482; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHatTK4ySndN/OGMV3FEr/u3qMqn5nrSG2WRZZ+7fttX4wt/0TgaAB5AWT2nbtb0YG
         xH9rIEWQfHBqSpsUz6FrpXHItk1hcFOWEhGa1TgpZBSLFZEuTytXSl4rMnuLPmnJur9n
         BU1TZrkQC6CLwNcHc7FLrVfORRGK7hMhJbn3VZN6P+98wWxAEEFZmsRpRgxlj71hdbu1
         n8kItRyNNMSjyyBkbnGsCVndZncw5DuM1zzt45geLaSEyinrgm1Gzq/VOpnQoC53uM2l
         a/MxAGkL8cLtVRhjXKsCnpmHtGgc61l1eQF9HGuZChazPS+tVW/foPwWEF3oQpiPCWpE
         9hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=It/LB/XCs9Rr8G6sc33vKOGmAFAjBV8Cmbgm4tD+uuw=;
        fh=GUvEGEcNGOV3jMOSaxLlPgkLl8zb/XGrvGx7aKAQ9fA=;
        b=bFwiVJegmiUphpNpETQ/+6HJ+kpzz7svSZTf33hxYpkR3pxZasy+Qw28OO7JmGPsS8
         9NfQQZtO5u/rjMV6etRZLN2zZi/x2G6vNxJE2UE6ART9O/uDKL1QFAxz1I371B0lID0O
         SOEoDQCK5WfeiNlGRQwbWAfoHM0bmqEWwk/gOxfcDTYKhRljKUxFkK0o9m3syIH5b++f
         cl/uf0V0/Z1rCWtAu6f5wodyj2PkQVqfE+IGs+DUlifREACtj4ao3qo/FNLbOFGRQQpf
         HPoPXp3MzSHsRDXYwZN2cfYM65RHin5Po7OZ4oSvleRubQWBoIOGMtSiozO3cfrX1Ilt
         KZSg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716482; x=1771321282; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=It/LB/XCs9Rr8G6sc33vKOGmAFAjBV8Cmbgm4tD+uuw=;
        b=egDVtRN7N1nt8wX9aztwslhtM2Iauax382q6+esjI2KZ1ekbiuUv8QBeron9S/IFo4
         2HfiEehu9UdaDdKU6lQj6V8RKYZCDnH56hEZd6G4IMgIj4wpIWJQgIDhkv+4Cz3/03k6
         CWNRkyFKKYYd/SDS/TZpCdW3kpjptP233/WqcQngSE1O+26rTKQZystZDG9j9STF00Pd
         lHuRfwPO1z0627J49qmrrasK0IylfVqCOdfmz6dtHq/MD0bnhDxSdYIx62cNrZX9arbi
         +WTQE07HOqGWU/LvU8uPyUk6HEOvjJ9PMhlQlypcIiysDxj2hD5DTZPHefa2cnB41oXG
         oQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716482; x=1771321282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It/LB/XCs9Rr8G6sc33vKOGmAFAjBV8Cmbgm4tD+uuw=;
        b=kpjxmvT6BbX6k5b4olpoDGbiuOWZZh+Bf4Sa/+BZpP92kO1jVwzojcSdYarhaLOmz+
         B8oB1AEzVWUi/NOJFuf3e4Seerv8O9/kuNU1EC8m9PzONuOXMJoUV7pcaOT+fdVyrr1L
         KlpQXlxLIYkLXlWJ4myIJxY3AmWuHvlcwYxxB/lQRklABQpj1DjMX8SunMahrkfVxHMg
         eksDnGTDNohplShC3jkIzejdJeyOVAE/a4r3UyyhWXTBOE3lvEJ08s13Wimsm4KK5WWV
         cPGRHogAL8K8W0wP6/Nfx+wFdOUjp0lnmIw7b1QDiDBel87nf22bC7ZSI58CV7LLBTSS
         zp2A==
X-Gm-Message-State: AOJu0YzC8KRAXo6t7O9N88yUVLB9YeB5+sGJJC/XuwQIxath6sDjA9DI
	d0ShpNdOn24T86B5gXTtejxVo2aSKaMWJTHZZb2eJCSiY/MhX7DgLVqO7hv6YdrKSJ71y7+3Jju
	bYlKSCwDjmFwgr3FEiykn5QY+eH2Vj4A=
X-Gm-Gg: AZuq6aI1AyWUaPsg5ZnoumzgQpi5jFRV8GzZ8wJvoHlkf1kuZ8A6I/2uxnKjhbklT2u
	/9smlKnSAue1TzK0xRjIkiO1dxuTctw2AIUJ9Rarw07fd4GHLXu/CkyMRiHphVkOM6RiqRm5MsE
	HWB/J2Ke4VU1Czkmc57MpvFQWjV+w5/F9gsgcxffGv2/UOhQkHAD1DJxGwNFqKwDK5YM7yEGMiC
	1nEEWLaL8F8YDhNV46VELbRpYpU7QHkyVc0ysCU3PqANHSDuQzngPW3GudDWwqaqGi8U0os9sEE
	YuzaE1u4D4b0b9Rj3l1vB6M8tVW84vUvchfoY0kpP4squbNc8z1N
X-Received: by 2002:a05:6214:484:b0:880:88fa:d742 with SMTP id
 6a1803df08f44-8953d0dd9c5mr215532176d6.65.1770716481543; Tue, 10 Feb 2026
 01:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com> <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
 <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com> <TY3PR01MB10110F8354668695ABA48A8879B65A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110F8354668695ABA48A8879B65A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Feb 2026 10:41:10 +0100
X-Gm-Features: AZwV_QiD1QerBByviBIdrPuN7UXLbBhOcbpecN97q2z-T6tsyFAqE_803RZ53GM
Message-ID: <CANNYZj-n=j-Z4eOYhPfEp77zjHg7NfT0WpOn8ZNVQjnM3DZOTw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230871

On Tue, 10 Feb 2026 at 03:42, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
>        I try to enable doc in gstreamer1.0-vaapi,  gstreamer1.0-plugins-base and gstreamer1.0 but found a problem
>
>        There is a definition in docs/meson.build which prevent building doc in  cross building.
>
> if meson.is_cross_build()
>     if get_option('doc').enabled()
>         error('Documentation enabled but building the doc while cross building is not supported yet.')
>     endif
>
>     message('Documentation not built as building it while cross building is not supported yet.')
>     subdir_done()
> endif
>
>          So what should I do next? Maybe I should send thest patchsets to meta-oe?

If you have time to look into gstreamer issues, then you could add a
local patch to gstreamer recipes to remove the above code block, then
set 'doc' to enabled and see what happens (upstream-status doesn't
matter at this point yet). Presumably gstreamer upstream has that
because 'doc' needs running target binaries, but in yocto we have ways
to do it (via qemu). So please try and report, then we'll decide what
to do next.

If you do not have time to do this (which is totally fine), then yes,
hotdoc should be sent to meta-oe in my opinion, because enabling it to
support docs in a single, minor recipe in oe-core does not make sense.

Alex

