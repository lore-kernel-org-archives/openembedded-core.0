Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.13028.1590675194022063182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 07:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9+FV9cG;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id s69so3232129pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Y6Um3klJ7zJuraNidASbVmc/6pLvTbwwWN6ZqZddBeg=;
        b=Y9+FV9cGiz5w6UWICqKOyjPEj6xcpnJSD3pi5BLHpljAJ3caq0z6jXPDjjyWBnTH6d
         oeGoJoi/prre+UzI4x/y1JCP20meSRHxscnbnpkqUcGUALYQui4j+cpPBOpD1LkkscvE
         /vTBJaZMCuVMyAHs9GXgNLj1lLDq7+5SL3WJcgcQU10MhCtsDRbj4P7+Md0D6P5pWaSH
         1iGT1xdRxfN6CPeSRJkFQWWmDJX0lUJe/lkQjvTAelitXzQsi7b+z6kNUoZaArqU0OYe
         u52N+HMQKlvXfW9qSuVErvLx32fW4xB7DjWQvLZL0vjJl3NuAbflVjbqt5QlrgY+0Dnl
         aZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y6Um3klJ7zJuraNidASbVmc/6pLvTbwwWN6ZqZddBeg=;
        b=tf6R+JL7uIlV8GKrQY43QoyZx+uxRJWi2sKnTDVFNUsk51/nbS1S53Ui3AyEzf6i70
         RFCUkPe2u/3dDGiZBgPeje0FBBVoRznmonvFLO217sTHb7wCz1qfbfSyS0ACcCdDKtq9
         CHkHhpaN85zYYBScgj+FYTR+xf8hEymo79gkYR2sFUoTNaYdpIiuqlpfvWAJc4Y5RFaJ
         XyPBchM2Vdp6Yd1mnxcjKEjOR2am7xVXgqLmK8TsbMdeDWlOI0hu/BpGw+LyhYQW59uY
         cLBrgu97JRoR08klONF4Toum6Dwl6dVhs70HqDHiFzg4nhSAmgOBYSgS9Gra+tRVxJH0
         6Jlw==
X-Gm-Message-State: AOAM533Yv/lDRQPU22Bzds/qwx1SlRy9UULot3PulwGM2GI9xm8MHEOf
	WMZe8MMX8lgx0o3GRWvaL7E=
X-Google-Smtp-Source: ABdhPJwQQxTkyCG0Ht0GWWF2YbWC7PRKIOeeZbE7Ri7afn3ZKzbRYfrTP2QzX4EbgbvmXdy39ELupA==
X-Received: by 2002:a17:90a:688d:: with SMTP id a13mr2909231pjd.151.1590675193312;
        Thu, 28 May 2020 07:13:13 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:953c:7d66:133d:150e? ([2605:a601:ac3d:c100:953c:7d66:133d:150e])
        by smtp.gmail.com with ESMTPSA id u1sm4693681pfu.151.2020.05.28.07.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:13:12 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] checklayer: Skip layers without a collection
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <20200522220826.27434-1-JPEWhacker@gmail.com>
Message-ID: <fb6419f4-4459-4c06-da1c-a297e9972ec3@gmail.com>
Date: Thu, 28 May 2020 09:13:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522220826.27434-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Steve,

I would like to backport this to dunfell if possible.

Thanks!

On 5/22/20 5:08 PM, Joshua Watt wrote:
> As in other places in the file, skip layers that don't define a
> collection when searching for a layer to resolve a dependency. Fixes
> KeyError exceptions when attempting to access the layer collections
> later
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   scripts/lib/checklayer/__init__.py | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
> index 5aeec2f00f..1138000275 100644
> --- a/scripts/lib/checklayer/__init__.py
> +++ b/scripts/lib/checklayer/__init__.py
> @@ -143,6 +143,9 @@ def detect_layers(layer_directories, no_auto):
>   
>   def _find_layer_depends(depend, layers):
>       for layer in layers:
> +        if 'collections' not in layer:
> +            continue
> +
>           for collection in layer['collections']:
>               if depend == collection:
>                   return layer
