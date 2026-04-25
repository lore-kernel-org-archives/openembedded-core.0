Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABECFF8860
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 15:55:01 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.220.1777132496067728105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 08:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rMGy9qNp;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8f0a87e23daso409214685a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 08:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777132495; cv=none;
        d=google.com; s=arc-20240605;
        b=U7qv882U7/YeRgsgUnYoNn/HgfGmOcPA6uRxwQXmY8U2blz2tEl0bXpjzPiCP+nvIh
         o+B5nsmCiBX6TqnsiQvd08hJ9yl3cX/BK6Sylai4G4kqPcNHop+iwwaVaJs/SpPSSIbp
         nPH4hwxBN4qP1zWYgimp7k+VOZVx35uemsn/f1aFGpiAEVRxcF7+n4oQ6qXIl5EEkD8p
         YgtZxdALugCOfPJvhSOX6Rk9lLJHbzeXm7OjJKttUXlYdt7OwG5yJqMwrQ9OhJiH6JRK
         qTNWW7ObYkti7w1eHEO5W8KYEtDdHf/wvkF9rHONxO2VG8t+wgb6UZy1rsGxCc0MGbfT
         0RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QI/qzdBOByWaU4ddy49+WO7vYerGBWABsg3ddq/80sk=;
        fh=N0upAYIiDVqGfj5GUfc6e4DBLv/4Q3r1ndLH3rRtA2Q=;
        b=dSDOowvA8QrIkjX+ysLeBzDY8TPSojHNGz3KgqBv81VvyxcKhQ0QVptVZwvRSMIq26
         ZpWVsfPPk52/tWfcqiNdoBggkQ456p55Uw9yRobE6vPgFxzC2N3/sGgqImsqHRB/Wb3J
         WtyrZy5D1MHFmx3ddaC17aDaLY14YWLBO7ErpkgDZRScO7qvYpis8v/TXExydXYsvrrS
         VNQiMSmKBZde0tdDitLXmvoA/v9xpOyebqlU89arh2lRHiaKrdExUFR6SuOOvwIFj5l+
         gc7nusDD6S+hX6GBCPKcJZ3/7/txdFZnzCo59+73WkYsiIkrsJdOPysnd0MKeX90mSn6
         6mQA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777132495; x=1777737295; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QI/qzdBOByWaU4ddy49+WO7vYerGBWABsg3ddq/80sk=;
        b=rMGy9qNptb0NzVfxSff04e+mMl95sebewFZtID7MFkrSjjBO+KB94fdVj+XbUVIFhK
         /9XJkzn01f7YmGACUbWCzyS1G5a2n66BOF29yAzdFNT000baKnufeXSsz1/MS/BShzrQ
         YTeACXDi1PufI84pZ+CnciNtecIxw4sJDKj0vivRRamSZqZN/vjxGKtXFlTSco0Evje6
         6AEwQnAd7nbKbqEK57xhxPetJ+BXuZmSbLx6PHi/GCkoDC94meXz52n7LgGWvzps5PuN
         Q1oiz8/qTDnQ9A9dqwW/WdfRP6wdPRdJumzQ5qOPO7PFIx6LxF4Imq4hVm4kVxvLbdAQ
         GjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132495; x=1777737295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI/qzdBOByWaU4ddy49+WO7vYerGBWABsg3ddq/80sk=;
        b=QfMrEtY1Oak/4CZw1AimddD8Q/zU5fu1ZYFGuVU63m2ZGa5l5frtKC7erHQqF20Zma
         CPw61SLfs429SLeXAI/Ev1cNrUVQZl+onUV6j7Vu3Y0wFxhjOiMaJ8dKFiYXmj6t6lbL
         7OdZoPp8k4d93IHhKQxIxo+PF6cRRMIhQqiQuCVPfKdNk37VcNawDAWdC3W/VdOxPIB+
         uLdoKXdWMT0B8R22wmp0sfUd32O+585TDr0YrwLUB1VvlFmc7CTS/H9kb3oUpAUKwX/V
         C0UJvjEw6u4CFpahn/jlU+EYAs1eM99BjQS+l2/gF9LGQc/xUJprcosxTs6nHIb7GTuf
         5CJQ==
X-Gm-Message-State: AOJu0YwFffJbWjm79+JWCLs4ayYmlsbDiSge6ktrioo85f/nNUmF+pU+
	23P8y6IftZhwPAw8cKqjvpwHQqKoLdQH8ISZkUa7KHY42aTdamc0U+xQL4BokKDMcbWK97RQX+e
	7wNu0xnW+uyzftM8ORHs8SHgMyR4brfQ=
X-Gm-Gg: AeBDietd4sJPt8EgY7FFE4xfzaQi7x3QpFFKAjS8MkpFF8Y+TPZxY9Qlk5zhdehvjrm
	2rostnxMnrBJrg/og1nfoAlqxtTmDeGGpEQteewdHLPJ1YD4yFuZ2UOX5urY8sIqmvf4XAEslP4
	eAjOH+J2oR5rwrQLdyLiBONyuO/jOr+LJCFMhOa+8kzfITfdjjgWFR5bwBcinIB1o5eLuz888kI
	afLR4Gzx20gSPrA7GX+AvZbgMsE+b5cmVE0xmj9a/4daC9KDO4DpQPqfOFxoAbhe7ZhS499mu8u
	YGSCg4/LG2hWB2dRMteyU/dFMux8o9xzxW0NbemE/N2q90gkLXjO
X-Received: by 2002:a05:620a:1a21:b0:8ca:305b:749b with SMTP id
 af79cd13be357-8e792a5d8c3mr4757379685a.60.1777132494997; Sat, 25 Apr 2026
 08:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <711678500.248994.1777008574252@app.mailbox.org>
 <CANNYZj-O2OXqe4JnHhnP1D9ETtmWgwPt+D-hJ+YQ=XheMietYw@mail.gmail.com> <385919975.284796.1777047471445@app.mailbox.org>
In-Reply-To: <385919975.284796.1777047471445@app.mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Apr 2026 17:54:46 +0200
X-Gm-Features: AQROBzA-idHoZJ1YqWVa1J5gETVfNRH54UzMMg0lGaQ6S-15XPKhlR_JBSKRJck
Message-ID: <CANNYZj_0Uno4v2JYV1YXmsJGh=nKkbwYZCMQiOWt9uTodGJYeg@mail.gmail.com>
Subject: Re: [OE-core] DPKG Issue - guidance neede
To: patrick.vogelaar.dev@mailbox.org
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 15:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235944

On Fri, 24 Apr 2026 at 18:17, <patrick.vogelaar.dev@mailbox.org> wrote:
> For me it is not clear where I should provide a fix or bug report to. Is it:
> 1. a problem of the sstate cache mechanism because it cannot handle compiled in paths?
> 2. a problem of the recipe because that path should not go into the binary or be configurable (which would also mean a change in the dpkg source)
> 3. a problem of dpkg that it should treat EACCES the same as ENOENT or make the config dir configurable as a runtime option. (But I guess that I would need to discuss with the DPKG project)
>

Typically yocto deals with such hardcoded paths in two ways:
- they can be set to something bogus at build time
("/some/bogus/path"), if there is no use case for reading from those
paths. No one found a use for placing something in CONFIGDIR until
now, so that's probably the case.
- the source code is patched to allow setting an alternative path at
runtime either via command line option or environment variable. E.g.
this is how rpm/dnf are configured. Any such patches should be offered
upstream as well.

I can't guide you further now, but you could look into both options.
Leaving a non-configurable build host-specific path in the binary
isn't right, as the behavior will potentially differ depending on
whether it exists/is readable/etc. or not.

Alex

