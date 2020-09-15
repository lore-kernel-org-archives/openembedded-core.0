Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.250.1600185250821537769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 08:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOshrBez;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id f18so2165512pfa.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IRuQNC2lsV+chlAt8ylrTX/4pM3wfSWX8ddy2TmZ9Gg=;
        b=fOshrBezNu4KI0V7+2tGUtx8rZCo98FM1JAeo74ImlM0kVmKVSko/7W/8h15XhwM0r
         xGvfzBmxChqEpHD8eK0CwKE2Fc2P872e68bdQzx5QK9MSdmcF0wteWVQIhhwDZ/7J1g6
         4ddy//Q9VgNb5x8hO0Gn6ap8XTzca0ge0RWLXCWB2rBCBQXq4X1MH5AUYFUGxyPXvaoF
         bZ3ubMpl3yJzduxYnJtiDz4U7wTvYn+wlmfiKrN6Cl5fEHpUp+mJVhA7k8WinTJDdj6c
         2bRWzW1cpwAuoExT+0ccDJB8pbmTAxCndT1/h4LQ0/MR+AIZyvKy8fgZ5zL0q0qUmREC
         FCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IRuQNC2lsV+chlAt8ylrTX/4pM3wfSWX8ddy2TmZ9Gg=;
        b=czkvI88dylHkq79+Nztg8y2KA/Nnx0GGx/3hyH4z6SIfe+zGOb3MCBA2e6j3jTx/uW
         7arcVfusc8JW4y71VogEWKD5/vp1SkddqS/1G1DlffLCXH1WV1oYNtt2NdTQuah854V7
         Tb7CbVN3pmVmKWDS5xUDPEtq1z+ZjX4D4PYcYGrqBjgDS04rZ/WgrVxrK/b916fUfQgs
         XwUQGK7lNVKAdh+6VpDnPcUdpc4K/EBRdJgDhucMEJ5t5dWTL7x32qyugUsuFRD/Va82
         N4lUnNoO4FE9XikxVXQYSc5wSFgRijC1OG8JaKnFu9fhSCV4geerGX9CWjkFz6pLI4qp
         td0w==
X-Gm-Message-State: AOAM533OL9riZmEUzS2oGR4C77dbpRJ1eQ58v9R2QIy8YIqfJud/bQml
	WNf87bZSzzX8VuW59JzKm/rlRfJX7alGBw==
X-Google-Smtp-Source: ABdhPJyMyj0a/eenAsiwyAoBJIE4JH5H8S95m/IKNc797p3V/Ai0/HToLC/DhptChDxC35lnk7frBg==
X-Received: by 2002:a63:28c:: with SMTP id 134mr15047139pgc.385.1600185249931;
        Tue, 15 Sep 2020 08:54:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:65be:52e2:459a:b2e1? ([2601:646:9200:4e0:65be:52e2:459a:b2e1])
        by smtp.gmail.com with ESMTPSA id x7sm13709pjv.16.2020.09.15.08.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 08:54:09 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/4] weston: plane_add_prop() calls break musl atomic modesetting
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200912210406.3328090-1-raj.khem@gmail.com>
 <20200912210406.3328090-2-raj.khem@gmail.com>
 <CAAnfSTvfQ=oEnN0H3R6K7NrFFpE3_qfq5PUb=ZVStF5DjGYjhw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <11b3b330-ea48-1605-9406-ce37adbc29a5@gmail.com>
Date: Tue, 15 Sep 2020 08:54:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTvfQ=oEnN0H3R6K7NrFFpE3_qfq5PUb=ZVStF5DjGYjhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/15/20 3:30 AM, Ross Burton wrote:
> On Sat, 12 Sep 2020 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
> 
> But that issue is closed so Rejected is a better status...
> 
> Very much a workaround.  Do you plan on debugging this?
> 

Yes, it use to only happen with drm backend and musl and now its 
happening all the time.

> Ross
> 
