Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.2413.1600757858495987657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 23:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c7ecEtoo;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id l71so11175314pge.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hv+VONamNnzHNJhmWoPPdDAV6gK7StzPF4RTLvdlYd8=;
        b=c7ecEtooqFvoMezZgyrX5GjacSg85pv9N1CvblfcEaclikgTz/hZMKQD7UKzLKXtYa
         pSYbT6ILxQMLXO5hDD+Au3MPBqP+/42fBorDwi0e07YkgU9Miz2Q/VsvxHdq1Kw/r7Uy
         qkMGi/nFs6MG6EtCaYavpF9WaLZvbCF2xlQdlweA4kt7gd4+mReKGtDRMe+zeYbvaZqY
         XQ6tsYO34JpUIeJrHDPQfPsilCItgyfTxp7CVcTwL23hj2L+aswHExuwo+OjEIKn/E5d
         n5Z2opo9ONJVpNvlPbl5ZxbhS7z6HBaPYw5AnlN7yxcLL6cgb3dYhLHLq/aYQFkoQqBA
         e0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hv+VONamNnzHNJhmWoPPdDAV6gK7StzPF4RTLvdlYd8=;
        b=PZrXjWh0uSK/KlMipU0RiyWHr0/QxSAiy47j+ZseF0UvzV6PRJNusME+Nsm+PFr7DM
         OFch2JGFevVsBUVkjmgrdPJjOv2pfD0+8iac42xCBZVpX897nCzBodfE6DX1EH+E4EVN
         Egp0eLCaZhprvd9uN/1A9R0gndoYINx+9cfF0oE/ucB0Z0daQviqW3q0x57n2mmwQc1G
         ltOY9/ATo7zh0DYq32wzDQBM23GhWAJjIcJT8uhqwNHV0Ij1wX7h0U+x5OrpayA2wBPQ
         nhiL+1QoJ8Nctq9RaJHdM0otHJJ1qw9dxz9aKytXiZhYcHFhqxhum09is/EOmWAX5xel
         JiJA==
X-Gm-Message-State: AOAM5325XVqwzxR5WqHB0qMhzZ98LLSFj4tlwIFbT37ysNSKvKcqOOD1
	ppzbevj5T1nt8hKC1qjbS8pBHnCEDdjOdA==
X-Google-Smtp-Source: ABdhPJwwuEKaRqiAEkhlSss6OVw93gmntRBC+L+3TByP9RhqhLwQyAE0xoNUjo+6xKNYuTb7SZ/anQ==
X-Received: by 2002:a17:902:7d8e:b029:d1:f2df:ad4 with SMTP id a14-20020a1709027d8eb02900d1f2df0ad4mr3475980plm.44.1600757857435;
        Mon, 21 Sep 2020 23:57:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:28e0:938b:f1c2:a4a6? ([2601:646:9200:4e0:28e0:938b:f1c2:a4a6])
        by smtp.gmail.com with ESMTPSA id 194sm13105100pfy.44.2020.09.21.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:57:37 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 0/3] Import two python recipes from meta-oe/meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d8f4dfd2-7a48-6f96-bcfd-0b17989886a8@gmail.com>
Date: Mon, 21 Sep 2020 23:57:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/21/20 5:12 AM, Richard Purdie wrote:
> We have a slightly pressing situation where the performance test builds
> are failing after we cleaned up the system installs on those machines
> and tried to switch over to buildtools entirely.
> 
> The issue is the need for jinja2, complicated by the recipe's ptest
> dependencies. This series imports them with ptest not inherited, the
> idea being meta-python can bbappend and add the inherit.
> 

this seems to make this recipes inferior to what they currently are, 
IMO, while it solves the OE-Core usecase, it is ignoring wider usecase 
it has already been addressing all along. So either bring them in full
or leave some bbappends in meta-python to keep features working for 
users who are using it.


> The alternatives are either to try and solve this on the performace
> test machines using horrible hacks and revert my earlier attempted fix
> (which is correct but makes the situation worse), or import pytest
> over too which we may ultimately end up doing but probably should
> do right now?



> 
> Richard Purdie (3):
>    python3-markupsafe: Import from meta-oe/meta-python
>    python3-jinja2: Import from meta-oe/meta-python
>    buildtools-tarball: Add python3-jinja2
> 
>   meta/conf/distro/include/maintainers.inc      |  2 +
>   meta/recipes-core/meta/buildtools-tarball.bb  |  1 +
>   .../python/python3-jinja2/run-ptest           |  3 ++
>   .../python/python3-jinja2_2.11.2.bb           | 45 +++++++++++++++++++
>   .../python/python3-markupsafe/run-ptest       |  3 ++
>   .../python/python3-markupsafe_1.1.1.bb        | 28 ++++++++++++
>   6 files changed, 82 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-jinja2/run-ptest
>   create mode 100644 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
>   create mode 100644 meta/recipes-devtools/python/python3-markupsafe/run-ptest
>   create mode 100644 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> 
> 
> 
> 
> 
