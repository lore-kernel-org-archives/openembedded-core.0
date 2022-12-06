Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10281C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 15:29:53 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.50846.1670340591849497418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 07:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hGoBuqMm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id bs21so23990575wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pt0S3b6iN0qIbXKuLrzqv8cNpJX8yuBJWuLl3RZz/Mg=;
        b=hGoBuqMmmmoY//MLhLnrkZi0/7fhio0gkQJSbZhVRI7smOGRb4ay1V0P53GGmwOulx
         w5JLMcR9lY5qQrq9zwZKgpKheYkAMEK4zgWfgX+16NM/SX/7S2EcrVZXTwPR+6lEjgkJ
         6slk6zS7tRuhSfrVp37c4gWo1MqcfSgO/ZvnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pt0S3b6iN0qIbXKuLrzqv8cNpJX8yuBJWuLl3RZz/Mg=;
        b=Y5toO3M03cUwjU74L42RIC5YEnkBX8lJ/YttvvWPpTGHE3kPMKWBpWpw9nwkIor3Vc
         vuhDlARZI1NPlbp+xvbhO7LFpgAYXmTTwYjN6wXI9+emjSZijRXpxI+0oRcXKiNaBlBA
         EDKaZXEuUUMeWPigcqU8VjxZr2fe16FswBFVi3q5KkNRcuqJ/OSGFKk+VIOS5C5+jCpc
         ZwHpHgph+veKDdZ//gtLUXD3LmaE6T1WGfAfAQIYjS9le7lvPOVw0q2N3t3yS3Uz7h0U
         +tF0JphKzNaBqctU+bYi8MPMQdNPK2ny2Mxt6XeeOJ7vDBUgJG8nSbHnHWJXUvdDRjjV
         FU0w==
X-Gm-Message-State: ANoB5pmThevobn85LBtO6ZW/9xhN09HvpZSy2erF/0GiZ2JWdtZ50Zuy
	vG4xQb7toOCUHltLFKQZIgzXMoV/1qLJEn0H
X-Google-Smtp-Source: AA0mqf70GEb5O7XOPS723/8I/UN3tQ/TvdI9xVdhuu+Ionmk3TN0RNeilpnzWG6TXRw13toqfSv2cA==
X-Received: by 2002:adf:f590:0:b0:242:36c4:1f10 with SMTP id f16-20020adff590000000b0024236c41f10mr15575029wro.275.1670340590191;
        Tue, 06 Dec 2022 07:29:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6:2c80:98d5:dc63? ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b003a84375d0d1sm27699694wmq.44.2022.12.06.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:29:49 -0800 (PST)
Message-ID: <4ed4c85070809d440fcfbbe421a911fe2f3fa524.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] btrfs-tools: Do not use 64bit functions
 for largefile support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 06 Dec 2022 15:29:47 +0000
In-Reply-To: <CANNYZj9WLFJ7WvKsutsSc702Of2f6j8fyZvJD11g5Bfkyeb+fA@mail.gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
	 <20221201190248.175753-3-raj.khem@gmail.com>
	 <172CC0ECD8B86688.27320@lists.openembedded.org>
	 <CANNYZj9WLFJ7WvKsutsSc702Of2f6j8fyZvJD11g5Bfkyeb+fA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 15:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174324

On Tue, 2022-12-06 at 15:58 +0100, Alexander Kanavin wrote:
> I want to once again request that the whole set is not merged into
> master until every patch has an upstream submission link. It's fine to
> test them in master-next, but please do not merge.

I did a quick check and the acl patch was merged so I think that is ok
to go in. The pseudo one doesn't need any further work either.

I'm worried the mdadm upstream isn't very active so that one, whilst
submitted, may take a while.

I do agree we need to at least get the others submitted. OE isn't in
the business of carrying patches, particularly when this is near enough
musl feature development :/

Cheers,

Richard


