Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14DFC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 08:21:00 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.135550.1719217255216286626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 01:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CasuV4kr;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so1496083e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719217253; x=1719822053; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4OnxpuT6VG/+9H8bcGZ7tLCT9OLbu9rN6KiH1SU+HW8=;
        b=CasuV4krYtqOCajOgqpiPBlwebqfZx655JrXZjq23kPGsWkt9RI2s2ytbEV9aowM1t
         8apXkuXtpDhEWRXo8xBVEhpKJAokqCkdgg0Trm44z7Nw0f+B+PofnnRaH+L9NG8fNrg9
         qFC/ZnnOm4Vx0+JhSxkKSMBNhvjkZ7hc2H/cNtCvPwfk5X7aOQeb1Hz4O4Vjh0KTd3Lu
         SUcaOYfnkN+LO1QHLJSf3eEoMO4bFJpX22QR61/XH4ZuB4QBX5SK3N8dShPsbxXROnxD
         Iw9jtiUO1GWUtrQMsJNu46yhXk/mUVFrFylBL0ARbPH9lg2gulGTTldEeCm53jO79nZ7
         OoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217253; x=1719822053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OnxpuT6VG/+9H8bcGZ7tLCT9OLbu9rN6KiH1SU+HW8=;
        b=CONJiNueUlQ65DX2zYcWsG4w2IlAonDMa5shNsmtssthPcV5OfZYru+DY67yeoKLWW
         tcHzzAcRWmPdV7WsWhIUKQkEprTzsvQXW+b8VuF4+eCMJqu9Lub9u1Ch33tTUC67THlk
         CqC9lpsySK/VKBl8i9R6PgdVoWOrslV9lUnT89eZvzDuQr22J9fIsJMitPaqibpu2MZV
         RyxhzS+oZwEm3COj/bkOZ37oz8J9+Es8KiYvtyHj+7vT0uDFvbuOpyFp7RIz6Mxdgjf7
         C9xr5ZqkXvbalUftQtbdj4rjzPO6YXLBeO/o8mDgnbRMkVM3TGWBqPvmk3dqNo0Cfi92
         9tHQ==
X-Gm-Message-State: AOJu0YyS9AWS4pJ3DuziqtsKeHflyT3tWqhcNHo3pB37i9OoS/Clq8qc
	imhoxTmWkSAdNmXVpSKyluP0DpCVF1ME2dWVOAUiGBv2iJDr6B+ZXNgXHrVS61peqN1WpB7e+GI
	BMOXDjPxKao4XA+v1uMDpdF0hfTA=
X-Google-Smtp-Source: AGHT+IHSXQcCY403LGvLK4hkYicXEVj0Y6tEmSdJUPMt2KSJsHUHlje9ugXQa+ifOuDOOcN3f+/b2ko16d4K98RODDo=
X-Received: by 2002:a05:6512:1248:b0:52c:e3ae:2737 with SMTP id
 2adb3069b0e04-52ce3ae27c9mr2417318e87.68.1719217253037; Mon, 24 Jun 2024
 01:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8ya8btVw9JspAHGA_iHpsydRTncHyLoGmPW-9=rpEhTQ@mail.gmail.com>
 <2056.1719201597345518399@lists.openembedded.org>
In-Reply-To: <2056.1719201597345518399@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 10:20:46 +0200
Message-ID: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201067

On Mon, 24 Jun 2024 at 06:00, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
> - The hash-id generates identically when the rust built from it's sources every time.

This is not the case. I just built rust (without sstate, from sources)
in two different build directories on the same machine, and indeed
rustdoc is different:

alex@Zen2:/srv/storage/alex/yocto$ diff -uNr
build-64/tmp/work/core2-64-poky-linux/rust/1.75.0/image/
build-64-2/tmp/work/core2-64-poky-linux/rust/1.75.0/image/
Binary files build-64/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustdoc
and build-64-2/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustdoc
differ

Alex

