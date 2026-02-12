Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A4FEB4912
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 11:43:03 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43200.1770896576823300874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 03:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CCIoX8KA;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c7120353f1so645001085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 03:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896576; cv=none;
        d=google.com; s=arc-20240605;
        b=GwinPzD031BxW7uK9zEiusX9VQGPKIItlKLNXQXsrq+DMX8vYSdWlaDXG65AXQX+em
         vklNQDlW7IAa2BITyirKotqK15O5UFkgbZuHV1WZjVQGpLiOgb57F+Xp74rzdY7ZXbei
         qUnJSp883zzN4A1p+JeWMnBeiLX1/4LBka3VixYIXqkzlAobIMT13jfBkdJf8N1Lit8M
         zCxnDWxORz47sia0b+a1lho+CakVpwbkQ1FsHEqo0K5+oAPZvR81esIwvGmPE/poJRI8
         0pPCHb4+tq2rsK1BiMVHz4FUGjPEDtC1ApdJogb+qHT5lMEmkzabEiaK5JGWr7C5PcvR
         b5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wvs9yUjnvct/HMO20C+6PpYdrK44GpewOkODV4f+TW8=;
        fh=GUvEGEcNGOV3jMOSaxLlPgkLl8zb/XGrvGx7aKAQ9fA=;
        b=Ga099czobI6lDM8WrC/jQ7nOpgcXcsE3SJLp64MYfIIdO4kMjpntUgjMaXo3BslxY5
         /QYZBmUoC2Dd0QOOrq3YGbcDwUwRooM+eSip3XoMgpEcvV3qhHie7hv64zdGkiizryl0
         OPkdnx3a2KqeXx/667w2Sv7NbZZCoamXImN8gBuPpmLmPA1qBk+bCQs6xBJmVAfOeYls
         xKXrOePSeMRTdA94Nt3K5aOuLU9yt8NiaabOrzFg51cHUF2bwGr2/yKkJYGXCVKORdlC
         8Z9FPTrXEN6ktsZKVtEKllAbJKrCwbfhA9/bjlTbDRacqonDZtVZ6jIRetmRTCEGUwUf
         zeAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770896576; x=1771501376; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvs9yUjnvct/HMO20C+6PpYdrK44GpewOkODV4f+TW8=;
        b=CCIoX8KAbSoRb4WRGx0JKJIV17+k0UV5hn3sqBqXNFQBCYjwLNSf5DDbZZXRSIuAjB
         dVngwHysxrlbaqNZyZvw+tiRwG/JrXEMq82FzWnBk+TxceI7oONbX8j8zD80+SW3mAQ3
         A1f+4nEXb6vQugiGAmUXedLkxoZ9euBnQIjSzQawooj/k8ybclUMYKyRwUXoHrgwnqZS
         nkBBv2s/pD97TFScXjmS4NJp5ON2otFP9IewXshEJXNFtz/eO6qYj4bx7F6WilxIrt71
         NUUBgWWb9PCz+PB1zR9VYh6ZZKM4WOcL1Fi2eu1BexyPVqJQIJ+wpi/JmcGBP8hcHBz1
         dLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896576; x=1771501376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wvs9yUjnvct/HMO20C+6PpYdrK44GpewOkODV4f+TW8=;
        b=LJJakj9H6qXuqN2CF8grMUsNXf0PSZ2Bw4pQpZWrTni2s6flZAOt/kxjT2c9yLg8GM
         MjBVzM9pHZUu87jMwHQLgS5h8aIfRh8/OtROlnF9fAPHTjmyA2u98l55nsOZDGllCS6T
         l3YfZMC7U32iM/4w0Ua9TYexz/9mHIfqlKSkgOxLG+1d5yEUhjOHyt6Vc75Zx7TghqkS
         xpRbeeqpWUr9CvIZpaCdrhmB1MEYxnM7vhH2942GirPjBTmkVp2OFWzJMFSXhRXu69t7
         qnXClErlsvhYR4Aav+4ZKsuqKLkU9QfL/St28bjrrZIP0j4d6s5+ZIHW+j7PFceMYJ0s
         4Tlg==
X-Gm-Message-State: AOJu0Yyf3aWEYdA/ln+Wj3VLnLDlLZj3ZOBnCZM/On+sbMf27zJvCGXR
	gyhS94GJHMprvVjmwH/yj/XWf1xs7QgOXstAQAZJRgOjQB39tfk0MOmefdcNaRTN6avFZ6ruuIu
	mArMqAJmpf18hxThNOulpClNh6qlSe/qINw==
X-Gm-Gg: AZuq6aL4ra1VDwNaYtDmo1Zz0MihZr/DHTmZKAXcwWekFvcTjkBhEApneRKgbJ7To54
	wZ7boPPP8bc/gLmb9Ihd/0XAt3NxwrN6tjMBmY2xygffLmZ+rxic+YJkZlxGUzYUq6WjH/qo6YT
	1ok9SEJ6OuO5EaCUTTZKWaPwDwTM0hgbEpJwSyr8Cci7o+ZoD8RTJGreFsPd1dilLdmxy4Cm4JV
	LLKcFqzlPRFm4jIxHf/pgO0aKvpkiNlK656wsLGnxkIPmBvzdARdbj6pv06AKV+gIXO8o0eD7ro
	9G2U59VZFzUrj4IXb4bsKUVJLw14vQTgGMJLFzZ6tXFPXeyzkYVP
X-Received: by 2002:a05:620a:4491:b0:8b2:eb66:c64 with SMTP id
 af79cd13be357-8cb330a4bcdmr296474085a.29.1770896575800; Thu, 12 Feb 2026
 03:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com> <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
 <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com>
 <TY3PR01MB10110F8354668695ABA48A8879B65A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CANNYZj-n=j-Z4eOYhPfEp77zjHg7NfT0WpOn8ZNVQjnM3DZOTw@mail.gmail.com>
 <TY3PR01MB10110B64798FF535BF65516019B63A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <CANNYZj8RYWPvi+stELUXo0Bvt6-pW-kVNBdQppfaXze-decngA@mail.gmail.com> <TY3PR01MB10110E9B9E9D485578765BEDE9B60A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110E9B9E9D485578765BEDE9B60A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Feb 2026 12:42:44 +0100
X-Gm-Features: AZwV_QgBPioGwZv1_S-B-XCKbpBP3NT6BexMWS_LpqvZ_hyJxfMTut4n7vOnilM
Message-ID: <CANNYZj8VuJ4MMkooa6xfPr1kJ2ajhg7ejB2K-0aFWOO850qaNg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 11:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231026

On Thu, 12 Feb 2026 at 03:16, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
> > I am starting to lean towards just adding all of the needed recipes to
> meta-oe to be honest
>
> Yes, I am also prefer to add new recipes to meta-oe as meta-oe already have half of the RDEPENDS.
>
> Then I will send following patchset
> a. Send hotdoc and its depend recipes to meta-oe.
> b. Send orc/gstreamer docs enable patches to oe-core.
>
> Is that ok?

Yes please. The oe-core patches should make all the changes that are
needed to enable docs (e.g. add PACKAGECONFIG[doc], adjust
dependencies, etc.), but not actually enable them by default, as
default oe-core must work without meta-oe :)

Alex

