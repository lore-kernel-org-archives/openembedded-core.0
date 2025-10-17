Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A88CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 16:43:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.21364.1760719417583014760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 09:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUg9FMZl;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so12627085e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760719416; x=1761324216; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LxtyVFLNikcSri5txauI9ub8dfvj8Mk5+pLIFk0O9zA=;
        b=fUg9FMZlMUBoSpeV4RvMlLGKmVEuE780Qv5tYAt5RbGdyXAsuES4/9sqxBiGPiiJjT
         a8mHKART5OH3ZgBvWzC/OVKdMAGpD3ApwYGzvbIbN7Q6cLxP43E9VlWixczhW17s6y14
         t3EQ1xaJMqXzYkUlSdCRjz9DDZvQ1XuPMPY0eaROD/teHvQ/fHo4rZGop4ZYuNwCMf+E
         nUsFRSjklqIqJ3uKfzOV1NrNStidRI93WktoXpf6peJERm22ol3BzefnCY5ghzkdIpey
         hbP4nq/eJg54p8D84eAbeVQJ3Q/hhsRE+qvFNW0osz76Jr/iNsfOsBVO54tvITiocV+8
         Y8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760719416; x=1761324216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxtyVFLNikcSri5txauI9ub8dfvj8Mk5+pLIFk0O9zA=;
        b=XbmErJqKJuAAK6e0caZhJ0qDDfvC6Lq8i7xZ0xjcTjbiJqUGzsbKok/69e/xhxlbbz
         Kldg0dqjJwOiMxOUEQbusVUsyINQ4dUw6SGEeAuObEZPRAfjWkpZ8/pIqnjbh9zGkb6D
         hhpbs35b1tZOvyyz8VevbrNbvDnuvZ1lEt9dSc9Hy6wW94z9XYXxaWLojkuPrq9SibCQ
         74mlSjX1YfZi7Y84jquHnRnnZri1zAmBFs0iN3yL+/p6hhiqg2DuxGhbxf5hBN8aDP1j
         QUfHNKkcbQqtM/bXBNbM3eNwEwK4dRJrxQaiIIK/XdEguMsEfd1il8APxcZscoo6deno
         +lRQ==
X-Gm-Message-State: AOJu0YwxUpRAhFrwBH6Y/+wWnFLDf2ewd/nQauCTRdBf8xdn/XySD5GI
	CfK8s2Lb52RSQyQsH4LjOpLjObQMaQ9GOtXBfZ6WOniOABtyV7Rr4KiI
X-Gm-Gg: ASbGnctOedlh4COsz+0hsLBphRPJoADKjvPyVhYRIdrKJfRE0iQ4ivgpk+7El8BwlXD
	TRz+jKPLtVLFhmU9Tj1ignDtSXL3xrIBIZfU+lcBC7XydCkt/w8rwPYD0UWEg4IiK7wmkMQpQ4Q
	uSJEYZzKtbNecvTLfDEkn3cfIY37IwtQGxU8Vhm+wgI2NHrqPF2A9q0o0BD26LP4R6F7CxzK1Rn
	uvQfr/2mAMytqGhW7DnFcSwMCyJloQtDduK6lgMKnxHWD+s7qrbMZPDrnmPkqY6Q+D3vdqlvdZG
	29vI7Iak4KvK729s70HL98x3CTBSo9XBNbROBTsEgnExsmO/DxENVawS+Uhr/ADE3dkyc5XSOa0
	sBHUKQCHTyt/blejIEfFXLudPSEzwHz/EAtwPX5RU3VaD/SQX6FymtLQNiyYmAPBFtJSnXBScXE
	tUsupN
X-Google-Smtp-Source: AGHT+IHmxfUYYQcGkV2xq876AzdpMIEK+JCrElMPAPrRYNvQZDUu7/8LRJ7OIK9NqHUXEYNo/4o2MA==
X-Received: by 2002:a05:600c:3554:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4711789e374mr29041555e9.13.1760719415674;
        Fri, 17 Oct 2025 09:43:35 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152b42911sm3123275e9.8.2025.10.17.09.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:43:35 -0700 (PDT)
Date: Fri, 17 Oct 2025 18:43:32 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Yi Zhao <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>,
	Hui Min Mina Chou <minachou@andestech.com>
Subject: Re: [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
Message-ID: <20251017164332.GA355538@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20251013185934.GA114595@pevik>
 <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 16:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225026

Hi Richard,

> On Mon, 2025-10-13 at 20:59 +0200, Petr Vorel wrote:
> > Hi Richard, all,

> > [ I accidentally deleted mail thread. Unfortunately I don't see Message-id in
> > web UI [1] therefore I cannot set In-Reply-To:. Due this also any reply to other
> > LTP developers about runltp vs. kirk would not be in the thread ]

> > > > $ . oe-init-build-env

> > > > .../build $ bitbake ltp
> > > > ERROR: Error importing OE modules: module 'bb.parse' has no attribute
> > > > 'vardepsexclude'
> > > > ERROR: Unable to parse
> > > > /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
> > > > Traceback (most recent call last):
> > > > � File
> > > > � "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py",
> > > > � line 372, in eval
> > > > ����� layerid, fragment_name = f.split('/', 1)
> > > > 	����� ^^^^^^^^^^^^^^^^^^^^^^
> > > > 		� ValueError: not enough values to unpack (expected 2, got 1)


> > > > FYI I also plan to get rid of some patches posted.

> > > Are you setting OE_FRAGMENTS to something in a config file? It
> > > shouldn't traceback like this so that is a bug but something is
> > > triggering it...

> > No, simple clone and the 2 commands above. I'll later try it again on fresh
> > git clone.

> If you could share the repo/branch you cloned (poky?) I'd appreciate it
> as I did try and reproduce that and couldn't. I will write some patches
> to improve the code/error regardless as that much is clear from the
> failure. It really shouldn't fail like that, it is embarrassing :/.

Master branch from my fork [1] do:

... $ . oe-init-build-env
./build $ bitbake ltp

ERROR: Error importing OE modules: module 'bb.parse' has no attribute 'vardepsexclude'
ERROR: Unable to parse /home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py
Traceback (most recent call last):
  File "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse/ast.py", line 372, in eval
    layerid, fragment_name = f.split('/', 1)
    ^^^^^^^^^^^^^^^^^^^^^^
ValueError: not enough values to unpack (expected 2, got 1)

Kind regards,
Petr

[1] https://github.com/pevik/openembedded-core

