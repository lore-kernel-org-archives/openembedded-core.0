Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.9116.1617206419247526530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 09:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z0BiGYJ9;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 11so14856643pfn.9
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MNZiGiHttxkrvjBbaAYV80OJ260f9uhmFcQvTkhEbbs=;
        b=Z0BiGYJ9SCukTrHc9kfABbNIQZ+e9XQm8SLm+LJq9OwLmS+NXlnTUgqp2LyDa3DPpb
         6RMBavfTEXbu2mG4edR7OogOG7WGyU29aqFmhizF3+aHDTrHiRs31CzoQ21c0ldWnNgQ
         RCZdV+uy6rwK1ayxhoFDvol5wUIV+1w1JEgr4OfRs4OSWlgnx6cF/5HbD4KCrJF7gv7Z
         Joqcw5W+8TydVpQkPtpH2FmwpBp8Pe3VjYasgFZ4v9hfICJPbJG7qqtL7MucjFg3ZPAY
         C00+I6cLyoFzd2hayWpwXGEQThHnDWpyJxZ1cAS2vSPhzDM8xv+EV/ljFhXGfI5eYqYH
         hBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MNZiGiHttxkrvjBbaAYV80OJ260f9uhmFcQvTkhEbbs=;
        b=bpEBKYTlFV6dFsvtdybWCWxDDIhFdPrjmncHYuZDZCI01Car7184y52T5sp8fGXaGI
         S9CvTROmpq3Ho/IiWS7gQ9M2vNpGzZ5CCMn21yajdsaUqay/VtHckJYN0zfcxuY+bgMu
         Mjh8mNcHp4TjdfoFaxC6mWEnmD1yGW7uG0M1ueDcmzJDSePgqyJ2/68iM56hc+FbaIz1
         WjXOc/Un9PC/tppUC5jOsVuJMUq66zBCxVtp5RlrSQvB6S44kE61xwOeyatcQjsWn28c
         9unaLfBGBH4V9s/syvcUtzwIV6ZUQngJHrrXYZMHSDdnpcPxcO2NpsmtW9DiF+7elo86
         mKbA==
X-Gm-Message-State: AOAM531hkRIfEJqUn5ALFm5s/Cw/f+ILHQmGYG/n1GA/xgc5vNe/kQsD
	uPEgBH2LGLuHC2EHGPcOf1sttnq81homag==
X-Google-Smtp-Source: ABdhPJysvmL5Rzc8OxRXpQ4SHOsbwAm/0oUYkVud1lORe/eP923CRvn1P5KWHh8aXPXNam6QSJnnxA==
X-Received: by 2002:aa7:82cc:0:b029:213:db69:18d9 with SMTP id f12-20020aa782cc0000b0290213db6918d9mr3651019pfn.36.1617206418305;
        Wed, 31 Mar 2021 09:00:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9042:8df6:cee8:da6a? ([2601:646:9200:a0f0:9042:8df6:cee8:da6a])
        by smtp.gmail.com with ESMTPSA id k27sm2445303pfg.95.2021.03.31.09.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 09:00:17 -0700 (PDT)
Subject: Re: [OE-core][PATCH] apt: Fix do_compile error when enable ccache
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20210331104608.7047-1-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cecb5490-9149-5663-32d1-a1d1ae65507d@gmail.com>
Date: Wed, 31 Mar 2021 09:00:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331104608.7047-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/31/21 3:46 AM, Chen Qi wrote:
> When apt was upgraded, the '-DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True'
> was dropped. However, it was there to fix do_compile error when ccache is
> enabled. See details in the following commit.
> 
> """
> commit 0aa7d612b8b7e5f14b4ed38f2a32b3f7eefca31c
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Jan 19 01:23:45 2021 -0800
> 
>      apt: Fix do_compile error when enable ccache
> 
>      Fixed:
>          apt-pkg/libapt-pkg.so.5.0.2: undefined reference to `ZSTD_endStream'
> 	    collect2: error: ld returned 1 exit status
> 
>      This is because ccache-native depends on zstd-native which makes apt wronly
>          find it. Disable zstd for apt to fix the problem.
> """

should this only be disabled for apt-native then ? and perhaps it could 
be turned into a packageconfig knob as well
> 
> Now we are meeting do_compile failure again when enabling ccache, so add it
> back to solve the problem.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
> index d1aa5de8df..7d1bce558d 100644
> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
> @@ -44,6 +44,7 @@ DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
>   EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
>       -DDPKG_DATADIR=${datadir}/dpkg \
>       -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
> +    -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
>       -DWITH_TESTS=False \
>   "
>   
> 
> 
> 
> 
> 
