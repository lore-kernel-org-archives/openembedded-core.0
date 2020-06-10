Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.1410.1591814411945759092
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 11:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p6/JXsod;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id z2so2990481ilq.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Rj6fyYuXK4Roezollq31ls0Ekhr1Ea4zfRCxAutwuMA=;
        b=p6/JXsodiQX0QdpwC+jBW8xEdiccKACjB4orvuQ/oO5W40gaC+NAeh9XeY+vcnhW/3
         PsqVLFeirlXekX/hlNuRg3134NbFUXlvwj0W/43spjgPQZ8YDROx6yMGpELMwTfIVJnS
         8bML7xhl0oSE68JcD2jhbNIOuMMF6iv8KNr4zyvVUodJP61Ypr6OJGJybyCXI3oQsqPn
         djHRgzsiEt+F33Y6cZWN+H6oaSsyu43ktpKkTgOi02rw+vUjJIsLA0wChcdbfLbyNR9a
         vJXxXpJCoWxAGC5dnqR7tTVW2fS4JOOr/7Dhm6RdnvYf4d6iwF9/DEk5kzTf0Wku7Eb1
         LwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Rj6fyYuXK4Roezollq31ls0Ekhr1Ea4zfRCxAutwuMA=;
        b=FZgJp96+RmoofbQSoA3KtzomMv65utnPM35n8S+qJSKZVBFTSBpEyGGJqjWK5ceJ/P
         N8wCU3MMOWoZXfCaFvLvPdDQlyTlBqMW+PdpbCWpNT1yvVhL3enkGMdXd5thgE398YyV
         H6v6PSH7YJoL0SDmos7v7XzPXWLIoYoiZW0XAxy4AJ5oeZh0L23g6/rkx7El2pu4JdXv
         C6r01RpLjKhlOSdMqRFYUxJwz9w4LB8bTglBk2Jod2yQoej0xjfyvlGpw2EdklwoY3BB
         HIcA0jGEOA1ewzj6jwtxUcPJ7Ws0QMpcdqZY+aAuSqFYvw0L0jpr9VpLoci+/9JcaAzd
         8/og==
X-Gm-Message-State: AOAM533lSHMe1eF25AUBWzdxwjboRFC3yS5VaLQ/NKXuN7BZnAk6hRp+
	uNDirM2GQjY7ce1y0WLt7oo=
X-Google-Smtp-Source: ABdhPJxJaG+4wbZ8/OGfLrH9ydwtcNIK4EY6f+4QKL9FnxP0I155RvMp/EIcS3dWW1ZQJmT202BNLg==
X-Received: by 2002:a92:508:: with SMTP id q8mr4199639ile.298.1591814411252;
        Wed, 10 Jun 2020 11:40:11 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.180])
        by smtp.gmail.com with ESMTPSA id b13sm317637ilq.20.2020.06.10.11.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 11:40:10 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
To: Adrian Bunk <bunk@stusta.de>
Cc: Openembedded-core@lists.openembedded.org, tmark@isc.org,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
 <20200610160719.GD24380@localhost>
 <15e11034-2d2b-a620-f859-450a2b7ef7de@gmail.com>
 <20200610174220.GE24380@localhost>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <4db17157-4663-cdc9-2177-c85b17edfe60@gmail.com>
Date: Wed, 10 Jun 2020 20:40:07 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200610174220.GE24380@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 10.06.2020 19:42, Adrian Bunk wrote:
>> Right, but I don't think there's a way to build two configurations out of
>> one recipe, isn't it?
> It is possible.
> More common is sharing the sources between two (or more) recipes
> with an .inc file.
That's not really what I had in mind. That would result in two set of 
recipes anyway, perhaps with the same SRC_URI.
>
> Unrelated to that, I am a bit suprised why the current Yocto setup
> is suddenly a problem. Other distributions like Debian/Ubuntu are
> also sharing one build of the BIND libraries between BIND and dhcpd.
>
The thing is, they don't. This is the 'depends' output from my Ubuntu 
20.04 installation:
% sudo apt-cache depends isc-dhcp-server
...
   Depends: libdns-export1109
   Depends: libirs-export161
   Depends: libisc-export1105

% sudo apt-cache depends bind9
bind9
...
   Depends: bind9-libs

bind9-libs is bind-9.16.1, but export libraries are bind-9.11.16.

So answering Richard's question, having shared linking is also possible, 
but that would result in two sets of bind libraries.

> cu
> Adrian

Regards,
Vyacheslav
