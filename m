Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.4295.1596098971863391226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 01:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fD1pio8Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id a15so24076167wrh.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2020 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uxVsmo/Q5+DLiF3NvYdOWX85zBXtU7/PVy+rmDcWwPg=;
        b=fD1pio8ZuPPxU0+UrASvv41JJhdKSyS7ZK0Yg6Fvvq+kQlfRlfPB32PGk88YMbjM90
         cduOeD/60GNh9ku3y3XJ/jwU4IG6qHFy4wYHyrLRLrbNz4JP2eUiEVFBA+S2TqtIVxB/
         44qVqcr/9WUNsM791rMUIGbpy/j26VVDanLis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uxVsmo/Q5+DLiF3NvYdOWX85zBXtU7/PVy+rmDcWwPg=;
        b=DUSIXNxOYq/xxWimtsHPr77IdGf9wUS5qdVqroneKaXAjNLJcN9FS/28eqLv1NW/wR
         rZmhV0hd9I6R0upQTEjkWPg5PM5gGd4FFti4qpw2qv0ZGVSDCHii5DZadJ/6ySifL9DW
         4HtUHl4HS5WPBmamKG6nsNK1taVcVLGTmco8Poa/jZN2s/WiTqDhlQoje7Pgjtcptdvb
         ZN0Ddcbq4gvn8bg4g42dFgTa8eVt3qdChFUxVcgYEQyOV45kj5xbtKMuYLFOomVH488T
         elIJZW1kSEoPoAFAagZxOHuH0AOMot+ePu9mAEl1OLZMJGabXRRj5LqZ8cnzRkP8gQ/f
         dOHQ==
X-Gm-Message-State: AOAM532hyMjAQGDGmSoNxaQTMrThDAuxTlxT2rFLa3pHiCtkYgOc2zZU
	6iH8tfVlze2Kj78zAVlZT409Qw==
X-Google-Smtp-Source: ABdhPJxnSd/szPcWAbisE2F8dmRE8siJG1hhFTw7oNSpa2dnYOHCOIJCPXpnPx8YRsBKmBqtgc49xA==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr1752570wrw.6.1596098970418;
        Thu, 30 Jul 2020 01:49:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.9.6.7.0.f.f.a.f.4.5.6.3.d.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.9.6.7.0.f.f.a.f.4.5.6.3.d.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:dd36:54fa:ff07:6986])
        by smtp.gmail.com with ESMTPSA id c135sm1053596wmd.31.2020.07.30.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 01:49:27 -0700 (PDT)
Message-ID: <93bb635493302c6cc46a40f2eb02e4af264ac2a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson: use the more specific cpu arch in cross file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ruslan Babayev <ruslan@babayev.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2020 09:49:24 +0100
In-Reply-To: <CAOpYhv9MRpHQNbv7Xd9wk2rPobj3=-897b0kLMw7Kq7PSs25KA@mail.gmail.com>
References: <20200726015614.2875-1-ruslan@babayev.com>
	 <bcdf3a3c-eda4-1c29-aad4-624fbba95a8e@gmail.com>
	 <CAOpYhv9MRpHQNbv7Xd9wk2rPobj3=-897b0kLMw7Kq7PSs25KA@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 23:12 -0700, Ruslan Babayev wrote:
> Currently we have both cpu_family and cpu set to TARGET_ARCH which is
> wrong. As mentioned before cpu is more specific. E.g where
> cpu_family='x86-64' cpu='nehalem'.
>   
> Projects using Meson can query for the host_machine.cpu() and expect
> a more specific CPU type.
> Here's one example:
> https://github.com/DPDK/dpdk/blob/74f4d6424da1297bd6e83dcb7bd84444ca8c59dd/config/meson.build#L69 

That logic looks like its basically being used to set -march. We
already set this.

Khem and Ross' question is to find out what is currently breaking that
needs this fix. In general for example, we have a much better idea of
what march should be set to in our uses cases.

Cheers

Richard



