Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.9570.1603894885352619260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 07:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jx4qrRnX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id n15so5917797wrq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gOIeMRoTMlML1PjjsUok75nkVwsLvNFImRc91B+lB8c=;
        b=Jx4qrRnX1mwkvkGXJrleLtJ5siZzob1Vi9XjhfeQYDR8s/yo4d5yex0XCNTEmJ8/eb
         2ucpZWQEolh1EEDdbCU75h/SJwLX3EUL+7AtXaIR75NNio+6OSz6LBNn3zHDgXO6nJEC
         lbx3Ra0PuWgI3hni3gb5I6vsUrvG/z8iEWD8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gOIeMRoTMlML1PjjsUok75nkVwsLvNFImRc91B+lB8c=;
        b=th7PCpCsivM6JHNa2KIEM93+ymxzZebCDahJQ5YMwVKqXugyckhs0gmWG2HFDkscfu
         GAmW+OqnomgdkDc1PclJmSmKOC0UZTx27CLwx1QZhBD9h7T8kT9xQQemmfNqbRWJDfMO
         I0YjPzwlcTdWTxpN0CcI7dui5sSIkbQPhKGUby2bGqRwDOd9UxVebQDM/yqp3W5FRX3y
         S1K/Kq8feZlWxvGo2JWN6mwWhJbP90cYy0JPp0+d46GL72WGnYYM1Tr/92q6Hj5Fb6Wm
         At6T4Vs6OGHnYdBxshAHWudFwxSG5TAhYCVPWCI5SzQCTX4KyYe/RHo6IXEmRh7plJqf
         md+Q==
X-Gm-Message-State: AOAM530BE+1n+g31m0p08tEoDI/CVWGMGFTnIhfYAyzXe9qCIngfB8Ja
	eh8SsC714mqMaucWirgfpUyXAw==
X-Google-Smtp-Source: ABdhPJxoGxu39325SMw/Pu/NfXKj73c92h24KkvTx03P6Q3Mid3zQ/9OPc7Et+O7vg1XfwbAw8dPmg==
X-Received: by 2002:adf:9043:: with SMTP id h61mr9562002wrh.237.1603894883747;
        Wed, 28 Oct 2020 07:21:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id q6sm6929598wma.0.2020.10.28.07.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 07:21:23 -0700 (PDT)
Message-ID: <f3c0e0b9ce68c2377148e85c522d9f5003a580bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, paul.eggleton@linux.microsoft.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2020 14:21:22 +0000
In-Reply-To: <20201026064259.GT2040@korppu>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
	 <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
	 <20201026064259.GT2040@korppu>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 06:43 +0000, Mikko Rapeli wrote:
> On Sun, Oct 18, 2020 at 09:03:56PM -0700, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > 
> > It can be useful to record SRC_URI into buildhistory for the
> > purposes of
> > tracking exactly which sources got built (we already have SRCREV)
> > as
> > well as getting an indication when changes to the SRC_URI relate to
> > changes in the output.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> I have similar patch in our poky trees. Also have patches
> to export LICENSE and CVE_PRODUCT to buildhistory. These are used
> by some post-build QA check scripts.
> 
> Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>

I'm actually fairly against some of these kinds of changes.
Buildhistory is meant to be there to highlight changes in the output
over time. Using it to create manifests and for license checking
purposes is not what it was designed for.

I just feel if the original author of the class thinks its a good idea
I need to give up :/.

Cheers,

Richard

