Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.22666.1611831132331973991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JcMxfYQR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f46.google.com with SMTP id hs11so7083940ejc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LMAma3Z0+hh0CL58hKCAt+9vAiL1WgmQxdTDf8SzCwM=;
        b=JcMxfYQRQJ2Z7IIqtCGXtAm+AwNt3o10JEEqEvxeUQnMyxCanI+olNRjXO4kRMYlON
         SifUC9jfOe0sjVVkHeOA6/mfAmj0/jWq2jPAEsc35+Zp87k3aOEKZw2FX0gJCxSt6b4x
         MshrJkT8oSHZY+yhvyKTK9vgwzxfOFXQlcMJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LMAma3Z0+hh0CL58hKCAt+9vAiL1WgmQxdTDf8SzCwM=;
        b=nrEOkPD6QH0tpxtiSTb21kcVzcRd2Pwk3UkVxUKW1y8YE2QtBVz+uV5Qdd908F2D1u
         7XBxpJz+CfiOX75l8HTecC6hXpEpJ8L8TQ1Wvq0LZ70M97Tt0l1ty+xzgRJun6wtPcXX
         aufXFZgEN3HZnjnnlydXOegyH3rIBeJamCA9fkpBQ+d8XXLtdIRw+7CpA5PSdWIiCK2m
         d1vMSXg5pS+SFpO5fYPrd9AifeauRNixnljO1L+8hCq52q80oshPkLViUJ75FA/00IJg
         FXrovzmFlbTpnNf3ZrEYYW6liYeim+JDvWMvIJijDUxIR+lBv0CNh9Kk0q99KlYW9oqa
         j2dQ==
X-Gm-Message-State: AOAM5315/iYD+s/ijtsbx74kri1vADRjFJeAXx9knhAwjLzIdkPKn4io
	uSTmDiHUQEsNPWDihewZQOJBjw==
X-Google-Smtp-Source: ABdhPJzCr3AUdJ7SNFOlW8o1HKzj04z0C3ZVafgdbH1hKZqmNSfFU3g8XnN3IOBWC0R8yYPDWirphg==
X-Received: by 2002:a17:906:690:: with SMTP id u16mr10633958ejb.186.1611831130872;
        Thu, 28 Jan 2021 02:52:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a? ([2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a])
        by smtp.gmail.com with ESMTPSA id o17sm2868007edr.17.2021.01.28.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 02:52:10 -0800 (PST)
Message-ID: <38a7b6cebff89a5de774dd5bda527a7e5f725a85.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2021 10:52:07 +0000
In-Reply-To: <YBKTg29d2wdbT2Lv@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <YBJ5qanQrSxjhX6u@korppu>
	 <36ea418d5095cf5ab6f8949a7c07f28e310e8a67.camel@linuxfoundation.org>
	 <YBKTg29d2wdbT2Lv@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-28 at 10:35 +0000, Mikko.Rapeli@bmw.de wrote:
> On Thu, Jan 28, 2021 at 09:02:39AM +0000, Richard Purdie wrote:
> > On Thu, 2021-01-28 at 08:45 +0000, Mikko.Rapeli@bmw.de wrote:
> > > Interesting series! Do you already have some numbers how this affects
> > > bitbake builds?
> > 
> > Not yet. I should really have split the series into two, the files
> > reduction and the native PACKAGES pieces as the latter is proving quite
> > unstable on the autobuilder and holding the other up. Once it does
> > build cleanly and merges, we will get build time measurements which I'm
> > curious about too.
> 
> Yes, split would have been nice. I'm seeing issues after porting over
> to dunfell :)

They don't depend on each other so you can just pick the sysroot
cleaning ones. master-next has some updated patches which are doing
better too.

Cheers,

Richard

