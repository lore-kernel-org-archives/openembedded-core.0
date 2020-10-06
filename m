Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.883.1602002950082207853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XupmRJtw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id k10so14253012wru.6
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VT8YUpfyY7MKvjdPKphCP51dV7cGK4ASFvPy2+ZCpus=;
        b=XupmRJtw8tTKsRVndRkm7SnW6xgntOrfVMJ/N2IfExRSoFEv/n6HcgKVxwYcLB/O/I
         Lsl+a+7MGPoFaLMYyFa/gENSxn6GTDT4A9WZbBP2MCnTxCf1ccMxrjNUk8JF8wHCXl4P
         Yk7B08zv81uz0WM380NUc9oMG1XFPHtz07HU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VT8YUpfyY7MKvjdPKphCP51dV7cGK4ASFvPy2+ZCpus=;
        b=U9wycEuHNTBMkBeoyeIYHpLukjNjcrDG8JpNI6iLAu5ghKs5zi5YqX9hFTZ3v8+PKZ
         oEUcF2KCrdv1PAaOzhymzpJUsfMNmLMw6bmMz4m79PQ7Pfpa7h9WpCtJMlEk/8l8wWj+
         bJNvSGbMxVfNvBCRuAzEPDlmfs011K4/YBz+awtj8wvgUxtkZS8+2HXI4bxgbNPDw76d
         o1o2KCQ8Py4IO0/h72UAFQV5/FXW87tUJxv/VDfkZxz3Quf+F9UBMHlUW+aYYXRoiAX7
         AL0A/UZMCwU8dzi1Al1cG0VOOpYdSzTarW8kC9LFTQcLEB4v5V3XJBn7Qewehvr2llCU
         komQ==
X-Gm-Message-State: AOAM533eyJg3vIG0eYa8ue3DFSREsVnoaubfLeeKhNJLeI0AY/rXdMM+
	W9mA4prpjT5PQZNJc4HRbjQAJg==
X-Google-Smtp-Source: ABdhPJy0EFUl6EYnvLpbafr4VK6mQiJwLZNn2VRbjAdWHd517a+2nOcZhB2KIT54Ix93/wMv2szp3A==
X-Received: by 2002:adf:a28a:: with SMTP id s10mr5998195wra.300.1602002948400;
        Tue, 06 Oct 2020 09:49:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id y23sm5510857wra.55.2020.10.06.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 09:49:07 -0700 (PDT)
Message-ID: <1ef1432ac36ca2224dea67e2824c5b8f04cc1066.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Oct 2020 17:49:05 +0100
In-Reply-To: <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-06 at 16:07 +0000, chris.laplante@agilent.com wrote:
> Hi Richard,
> 
> > Most recipe-sysroot dependencies are handled by these prefuncs.
> > "configure"
> > is special with a decidated task, prepare_recipe_sysroot which runs
> > beforehand.
> > 
> > do_prepare_recipe_sysroot does not have to be run before/after
> > fetch/unpack/patch, they're independent tasks. If
> > fetch/unpack/patch have
> > sysroot dependencies and those tasks rerun, stale items from the
> > sysroot
> > could be uninstalled and since prepare_recipe_sysroot doesn't re-
> > run, they
> > could be missing by the time configure runs.
> > 
> > Fix this by adding the prefunc for do_configure which would ensure
> > the
> > sysroot is in a good state.
> 
> Is this patch something that should be backported to zeus and
> friends?

Its fixing a very rare problem that I only ran into whilst doing
"interesting" things most people don't probably do.

If people were running into those issues I'd backport but for master it
was more a correctness fix which did fix some weird corner cases I
debugged...

Cheers,

Richard

