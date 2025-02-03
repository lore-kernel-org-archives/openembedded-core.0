Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0693C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:37:58 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.85841.1738582672595995557
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eHrGCN5c;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543e49a10f5so4476036e87.1
        for <Openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738582671; x=1739187471; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRuV0EyTNQfgHhKgOh5++uCrJzfSjafWdLEiwcGnEMc=;
        b=eHrGCN5c3DezONa7rZxpDB3t0nZ/dnLoua0U/H0LDZnHIMsKKRNjc5wLwMxEb/3c5F
         bchzYwp4JfGqjqoF/NGuRNeHawXrR15BNZ9L5ZshN0Z5XwvUdwCh35s+eErn+lWVDC5B
         adwPOiVEF2shfSkY8EWzgZROjBl3E7SxhoqFCtz7LGzZSEMtqqYaXv7wQxgWfKD4sw9L
         Mp/f+PAhb/saNeququskTrj3ciNOOXGNslDYJGDZS6UZH9VvZsao2T3OICPd3t/1tmHG
         GP4dl0BnUcUmQVQeJrGOCvoR3dOlgVKaxZYh5/p/JcuGxil0f8qaGSOFyb1K112rZiOL
         QcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582671; x=1739187471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRuV0EyTNQfgHhKgOh5++uCrJzfSjafWdLEiwcGnEMc=;
        b=tAWHQIQRaoVWtLH4OnxAiWqggXrP3pZFFXvwtjweqXfARECvG/ridkYuWsuflgBC4P
         MsrbCa57Mmh1vzW+K3yHHBrz4FzNu4iR7I61A8G6mU2DeH2HzVqrHPky/dA6/Rj4QhMj
         PHZIv6kDMzZkTa1XyiC3TR3Jt799FRQfnRCWu6oMKxKBYd30O9JYbjfdQEkneTxGyzV/
         1WbaY4ojrqbaW+w9PGwdd07d88aFES5KUHHPTNuB91La/PgW0IuCi4T4lhEVwIooQ36v
         UZslQ5OswoAXQ1r/cljQO1lLqBkoI1c0esLL5wf/rv/3x9j+QHttqKVEcfhX99RQ1tdw
         WEZw==
X-Forwarded-Encrypted: i=1; AJvYcCV3QbvbJckiqPHwh7v3/e228y5gY4BL6JCAHLXqWKAdA/pDUYjMtiV9BYOIoXEeu+tthSBqWbQfDSYUgdxBSz4vEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywfj6KSAzVRJupLD1iHv0Eytxwdtic89GKHpmcE5rRa9Sqn3uI+
	IPHIJIkOGYz+DFag4rVAXCvPWg76pABW7yu24D/Oe61fJAX2fIvAmL8s+tP5sIxOZuQJkpOC+yM
	ywbM=
X-Gm-Gg: ASbGnctoTaN8ARagUFwbE2HJiHbtnqUMOJobr5oGpKo3jNOj41hAhLovD+t6K8dHT2L
	YHZ1nRACVI0XhnshL6cFpIqNDNOEw146e/G/jsOx5bEgncP6CjLKc/k2eqcPTFyFnDYsODxA77J
	YjBbEX4WSZKJ419QoSPFfQnzbjJosHLuygrgqisvZM+DlP259E1DndooJhOxkqCkUkQzhD2RzyJ
	iCE7qHsmk2deoHfac5kiNaQ+XPkWobUMVuJQMaqmbSu1+1Ej24fuSHLU0rTcKM6cWi7oBmzJ6N4
	rgdd2RxU8wkT5C0ddq9j0OU3hJeklWAqXHHcr148
X-Google-Smtp-Source: AGHT+IEiKULfqiuvlMRFqsLWx0AEAArRFoxmiBxLTUGcvBZoGadHGLFWbjt22l6Q2Q5rw6sRnUEIhQ==
X-Received: by 2002:a19:7508:0:b0:540:1d0a:581d with SMTP id 2adb3069b0e04-543e4c03875mr5530775e87.24.1738582670597;
        Mon, 03 Feb 2025 03:37:50 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0993sm1244692e87.132.2025.02.03.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:37:48 -0800 (PST)
Date: Mon, 3 Feb 2025 13:37:45 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
Message-ID: <Z6CqiWKzMu3BEKRe@nuoska>
References: <20250202200319.82231-1-uvv.mail@gmail.com>
 <20250202200319.82231-3-uvv.mail@gmail.com>
 <Z6B2HKSlI6k9wNXO@nuoska>
 <CANNYZj9xjYqke8RvU3atSfwk2V=OC4Np8ZdXSO5hapCOnO75Dg@mail.gmail.com>
 <Z6CoNsKRvAibY0D9@nuoska>
 <CANNYZj_sU8f011m_mxXO8s0FdsUrcjdQHcB-fBDE+6wXAo9aQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_sU8f011m_mxXO8s0FdsUrcjdQHcB-fBDE+6wXAo9aQA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210647

Hi,

On Mon, Feb 03, 2025 at 12:32:10PM +0100, Alexander Kanavin wrote:
> On Mon, 3 Feb 2025 at 12:27, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > So changes without justification are fine then? I'm not against this change,
> > I would just like to understand why it's needed or proposed right now. A reason
> > could be just to reduce custom patches in oe-core. That would tell me that no
> > actual usecase is currently broken, apart from ukify.py and secureboot for which
> > I've sent a patch separately and which was seen in meta-arm side testing.
> 
> Yes, reducing the amount of custom code is sufficient justification in
> itself. If you need it explicitly spelled out, there you go.

I would like these to be explicitly written in commit messages. It is
hard to guess the reasons even when I'm actively following mailing lists
and irc, and even harder much later when all I have is git log and a bisect
pointing to specific commit or its cherry-pick on a stable branch.

Cheers,

-Mikko

