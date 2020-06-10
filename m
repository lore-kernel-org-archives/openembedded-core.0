Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.320.1591806719681199207
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HpNAiAAX;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 205so2647575qkg.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bbh0tpyrlPf6PlqWHWRNEonRFOL4isYplpp0BN5kDHs=;
        b=HpNAiAAXwL2O/Ta4bRAFXSKVU1m+0tFGBicjBqE2RadS20PCjxRDHddLCDpKAZpnkq
         dXefcsMsSiKNPBeh8Tjcydk4du8mpqEkUdF1l+hMk1+qxS4x9jpao9KIFD21zoJvBfMa
         5sxHv7n8lYaHn4lFP6nlu8vijR1mxzrtPA2S4L0jTjB7VlIQKShge8Ai8tQBXXhCOyqU
         U9eZ+idnsGMsjaGM7A70ssD7YIlDBJluAk729tneI4Bo98S3jOnhrd5Bl+ErfkGo0SIZ
         b2Lrf/Rj9ckiLthm4FIjOJeUfaVVIXqWMDmyuH9LfFOYp9tVvI2xYUuKReXUWDrvVXBT
         eu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bbh0tpyrlPf6PlqWHWRNEonRFOL4isYplpp0BN5kDHs=;
        b=dF8jlXHh5nt4Z94aqDvWccM6wJr8fq4Zwi/MUcfACiyN5hHt44KOT+clU08hsvKzsQ
         +2U90zMEq3jw6vQBaKqjxuoMcMHs5AKq7Uu/I5iedis5odTtGU0+hv7OsVLym2KkQ8n9
         t2rRkWn0s431MojVA4a3k/MiXZwj7XE/cQFPMUOjaBi9B8qrtYlJ+GfoyDle6EtwA3yj
         CFEh2Mjr/w4Zt1t4qVxbwwKTF5VMp1xfzhHEYuTo0W6Af/jMNtkO89TJpYbhn2hmJGHG
         NEjbUc0SpFELfQSN1O++QCTpMbWS4rVEGPw8Grp8380Xjjpi1cNPyadVJ48wUrrGYxK5
         bLvA==
X-Gm-Message-State: AOAM531CeMOBq1YsEK9YccwMt5AxBOn72i35IzbkojcQDI3zbvGVeItt
	cFscU2LldI39jNAlCDkUaAM=
X-Google-Smtp-Source: ABdhPJx4D9DUDgJaeDV14+1kIbFYS8ip8QoE1th/6tfj5pDR95PyuoBUIJv4qnlmPHTl0KTUdQdaRQ==
X-Received: by 2002:ae9:ef8c:: with SMTP id d134mr4023057qkg.66.1591806718815;
        Wed, 10 Jun 2020 09:31:58 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.180])
        by smtp.gmail.com with ESMTPSA id n85sm146447qkn.31.2020.06.10.09.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:31:58 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
To: Adrian Bunk <bunk@stusta.de>
Cc: Openembedded-core@lists.openembedded.org, tmark@isc.org,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
 <20200610160719.GD24380@localhost>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <15e11034-2d2b-a620-f859-450a2b7ef7de@gmail.com>
Date: Wed, 10 Jun 2020 18:31:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200610160719.GD24380@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10.06.2020 18:07, Adrian Bunk wrote:
> On Wed, Jun 10, 2020 at 04:35:20PM +0200, Vyacheslav Yurkov wrote:
>> ...
>> BIND9 libraries support a lot of options specifically geared towards
>> optimizing DNS operations, many of which do not play nicely with
>> ISC DHCP's "architecture".  It isn't necessarily practical to build
>> those libraries for both purposes.
>> ...
> Providing security support for several different copies of the BIND
> code would be a nightmare.
>
> cu
> Adrian

Right, but I don't think there's a way to build two configurations out 
of one recipe, isn't it?

Vyacheslav
