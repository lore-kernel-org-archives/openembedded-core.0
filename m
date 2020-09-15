Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.7944.1600153761433902975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 00:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dRzB7rTv;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id z4so2085752wrr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 00:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=rghLeEEfH0IHxE7lc5FwV3aW4gBuZjAyfrGVykCaRpo=;
        b=dRzB7rTvoYOBlN/PMFWnx79WDNDz/18IGc84hgRN0BC24nN4tTG8p9VBxWWDnzUbPr
         aj2IEzxJfIhSAR05A26b5Jme1o2cXcQxFFM/MGFpdvNu/xQq8FV4MxNzUu0nE1upzBeK
         4zkSBBIFc7kR0j+k0/j1fmOODoKzoT8DoEfUBSS41Iumllf8VMaY0x5zwIyC4v9nSa18
         pwgY/ol1ea680bI1rN26bnRITdRYuJl9tu1tJ77KCFrBTh8IXx2lxZPUDwIVrTpXLwH/
         djZt8FqetOKBXjkq4o8dvC4CypaRmlL0S99UajlAWl8hdwnONiwFQIARloMG7sijAsD3
         Rp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rghLeEEfH0IHxE7lc5FwV3aW4gBuZjAyfrGVykCaRpo=;
        b=SN33eeL5+uPcW1itpBg4BNlAwEsvbJUCdvq6ATRvPps7iWM2Qo2ELcBdgPpSwLKXrf
         2dpU09SMyTRjcudPWLDjPzt6PRmJSgtBgGXgFsOAXmy3HiZl9FDzAybVA00As4ZlrA+n
         ETU+4iQukEVIZES6bSVcGVqrJuesHGDxBUvcIghD1Vnear95VBYpDOgTMgKU7TPvppAx
         VokZ2SHanQUFi7KaqY3TBs7owDMMZ/u6fZ6sZfrnVbG8wfBJQSIgnjKtUByNLk3pYYyF
         iF4n32PJ8dm3m8yovos62PrRUMos+zSf4j0feMqh9UbijgK/ZFfzKHuz/PBqs+ZGsMP6
         Kztg==
X-Gm-Message-State: AOAM532X7sdnUsFXfG24ygikFup0ee2gPyKtJgOOTSgbHNm4JExSCV3K
	OUiuShNreU80oKV8CX3ZS70OEE3xkSw=
X-Google-Smtp-Source: ABdhPJzFNPYznDM2peyAxW5vS9+h5JKDrtuDO0y8vho6wZpX9LNnWHfDYNj/cC6A7w/NWx6L/vqCKw==
X-Received: by 2002:a5d:414b:: with SMTP id c11mr19059715wrq.181.1600153759532;
        Tue, 15 Sep 2020 00:09:19 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-237-227.home.otenet.gr. [2.86.237.227])
        by smtp.gmail.com with ESMTPSA id x16sm24369509wrq.62.2020.09.15.00.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 00:09:18 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20200914151359.11240-1-jon.mason@arm.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <442cfca7-9e64-c161-3f7e-af858472e910@gmail.com>
Date: Tue, 15 Sep 2020 10:09:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jon,

That's not really a comment on the reorganization of compiler tunes, but 
more like "Do they actually do something meaningful?"

I posted here[1] some benchmarks and at least with the benchmarks I 
tried on the chips I tried there is no obvious impact.

i.mx6q:

TUNE_FEATURES        = "arm armv7a vfp thumb callconvention-hard"
TARGET_FPU           = "hard"

vs.

TUNE_FEATURES        = "arm vfp cortexa9 neon thumb callconvention-hard"
TARGET_FPU           = "hard"


i.m8mm:

TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
TARGET_FPU           = ""

vs.

TUNE_FEATURES        = "aarch64 armv8a crc crypto"
TARGET_FPU           = ""


[1] 
https://yoctoproject.blogspot.com/2020/09/compiler-tunes-benchmarks-with-yocto.html

Should we expect so see differences?

If so can you suggest benchmarks which show those differences?

Regards,

Robert
