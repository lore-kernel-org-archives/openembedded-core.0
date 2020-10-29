Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.11769.1603989839520294811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 09:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HORn+6ab;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id n18so3509667wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ay05jhsoyyZGxnMvfuELeBlEPVZ5nVfA+2L3ItjYrFk=;
        b=HORn+6abNdgI5IIwd3gcyURanKhMNy4PVMqxidQzUGaNjVI1OJVmKrkOz0UIog0stK
         PJepILAqMhIQoB3umlxgv05m4tt4zuUmSxbnBWGSTsikrYl2QwtCEUjxR1kOapm6tByc
         zgzKWpRx/b89nazWsSy5AozXKtZgXDVKV0lms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ay05jhsoyyZGxnMvfuELeBlEPVZ5nVfA+2L3ItjYrFk=;
        b=b6OC53kYQZpjV+vejqA2Q/fpCvEXzTOGqdVBUqPkwwXCYYTh/IOC69TtjFkslSVPeb
         +E3IKB6rCwBSP6UPx3Tdn20Jbn4a+mk6lEXs+/6dFzWIVBUMA8oOtKTE1GTUFSx4g7bt
         w7z+/kZwMvYHzahXt8rQxWg7amDs0tMf767tXWBpkr9OztpVMXtmy3ZwbU1A5JXDx2NF
         Jd/5ob5LCK7lGZve/nm+NfTh1Af8Bj4VqDgSBI1JU4SxaAViNtHpg+1N2uLguUQC8qsO
         JGdKEdHy9NG1ChDcgbQoJpvWdjaNipiZnFJ3jy/VkG5KtOGEj2fvazwuDurNS15SQGTZ
         8bmw==
X-Gm-Message-State: AOAM531c6fy2f58UZ/Bo5zEknQDW/vsSEYfvCyqIUPBYNcFkl7V7AD2t
	frJGzpFU3my0+kWGVQjlgIg1vA==
X-Google-Smtp-Source: ABdhPJwCoNYpjoyjxcsUDAEtr93Ao7S2nKVxn58zTyNgZq77Aw2SJdcaigCms8HKLAcHoEc5a3NDFw==
X-Received: by 2002:adf:f841:: with SMTP id d1mr6781503wrq.297.1603989837985;
        Thu, 29 Oct 2020 09:43:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id a17sm6185340wra.29.2020.10.29.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 09:43:57 -0700 (PDT)
Message-ID: <968b3010cd55cd630332e3f5b43014cd3c8c0a5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2020 16:43:55 +0000
In-Reply-To: <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-2-quaresma.jose@gmail.com>
	 <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
	 <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 16:13 +0000, Jose Quaresma wrote:
> It looks for setcap in /usr/sbin and /sbin but needs libcap as wheel.
> when we have libcaps on DEPENDS as with version 1.16 and the host
> system has setcap binary, it introduces a dependency on the host
> system.
> The patch fixes this situation.
> 
> But libcap is only needed if we need to use the setcap
> So remove libcap from DEPENDS will fail to use
> 'ptp-helper-permissions=capabilities' even if setcap is found on the
> host.
> 
> In my opinion this a better description can be used in this
> PACKAGECONFIG, something like this:
> 
> -PACKAGECONFIG[setcap] = ",,libcap libcap-native"
> +PACKAGECONFIG[capabilities] =
> "-Dptp-helper-permissions=capabilities,,libcap libcap-native"

So you're saying that as long as setcap isn't in DEPENDS, we're ok?
That means your patchset as it stands should be ok?

If the user enables capabilities, it won't find setcap from libcap-
native though will it? That is a potential problem even if its not the
default?

Cheers,

Richard

