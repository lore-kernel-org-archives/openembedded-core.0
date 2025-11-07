Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FE5CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:59:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8771.1762513169803076064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VcUrudLm;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755de027eso4177125e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762513168; x=1763117968; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zy3eY/56AXvW3zOJhRc7REtEONEJ24ITysUV+nxRyY=;
        b=VcUrudLmEWUGOBH6DdL6pUl3aX10vWKM25zhqWlS/J6IdWQc7DA9jEFm/9/D6oT91a
         qmm99PffFkttQKHGaLPhI3ylzYxG+33YC0bUTECZRK2doMFxp5MycEKCfrIZxBYeR8te
         EN7iE5wXOtbiHUcdXLLkeTqkq/X9Pqwz+vA9J1cath0qoHKpCkxO4KcM0ec0/D8Waq9i
         Dw6C+mY3nzh/20TTgnEcPtptAhPDwG1a7T3EKopZjlPPLv+zUBGf8gY86sN/bc8U6wnA
         +/1Uch2yapxFgIBrPUT20h9cFUsrn8GibKM0wHXARwylL5f4gXUjUbEMHteW7BdVRMys
         7Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513168; x=1763117968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zy3eY/56AXvW3zOJhRc7REtEONEJ24ITysUV+nxRyY=;
        b=Xp1PWfgoEvQ+qpI9j8n0js6epq9LiOnQ4KgFPOSsboi5JPiHkCpN3aM68WPaIkkwjE
         n1Me2FLH28bpomuTWNnFqBtMGR8XpdCfLvv0639jaSCFVVqvLXJiYJRxKCALpjge0yMq
         HnEcnjHPR623eEySxbLsnz8VDQJ/SbzTIGR8t25Apd5szFxs6w0qiD4FA7XV/HmqGKZK
         /PohG5WJlf+L2J6DkKXVrzIvOLAfkYduuJbsqr1l7psB8ZkWQzv5H+SNCPn7SB1VD8K9
         CQBSzoHh5rvFFvPJlu/0IytIiA3C9GZzigH44G1J6Yyco5nkRXmO/C8mL0ueh9KXPtgq
         GFwg==
X-Forwarded-Encrypted: i=1; AJvYcCUWUXf+IpfHPCdD527XurQNEK5+WDMuxntRNVPlceRgLubFFn/B03Goy/+FDzEHVrTTN2tmOdrkHlfwxnKS7KRM7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyl7FZKOwNS2byYXc4ZKQ1M3uPZfKJb9IThniwPn9C2e1oqfxGv
	7MDGH60WG+IhvBbvA92E0Ahmr0wbHDBYRwvhCRUIpcxHJ2E2aJQ0XbST
X-Gm-Gg: ASbGnctEnoAH6AxeB1zvgZKcDeIkDFi6dn5ieiYp8vZnq/HSRpPZs8HQDnHz2kRUnJV
	oTTq5FO9V/kcK77yNNU7RYkJ2kEhws+i7kJnNi+0q/DgZAIWluko2ltrVNNPLw4Z/Kg2UZzelZF
	ixINpKQJHlYpdTRp9foYS4ySUXJe8DyFppDgu/fxWoum9oyRad7doKEVgAZwbyL3kJrKe27aU6H
	2Mls3m7wKXL63gnZYWyDxlWA6sH4rtKlOyzGC4zYs39leaSIJxQpE6pXBtkk7UBJY/pQILhTHau
	nGV8OQo/w3/zgKiKlPUG/PncrzW+BaByunlhl6KLaTOE9XAZIAsGl4J7D0jlrUysO4sVhUSTdSR
	iIZdvQOQXgxZjgeYNYPD/cFb2E9A43Xaxmt2c4jTDgLvttlul/PZ9alNVQjMIIY29H35VqyzM7R
	fkZTUymsaM
X-Google-Smtp-Source: AGHT+IEIQVNxBljKkY1xcBHOvxha1y+evmnR+BGGP4rDKU/b7Gea8qM6fqZLyewyUK6W25vMvo0J+g==
X-Received: by 2002:a05:600c:1381:b0:477:5486:ec73 with SMTP id 5b1f17b1804b1-4776bcc735fmr18674695e9.39.1762513168010;
        Fri, 07 Nov 2025 02:59:28 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47767749916sm78666595e9.4.2025.11.07.02.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:59:27 -0800 (PST)
Message-ID: <c383d411-7886-466e-81c5-c99da76a4068@gmail.com>
Date: Fri, 7 Nov 2025 11:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Ignore CVE-2024-43402
To: nmjain23@gmail.com, openembedded-core@lists.openembedded.org
Cc: Saquib Iltaf <saquib.iltaf@kpit.com>
References: <20251107105521.89956-1-namanj1@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251107105521.89956-1-namanj1@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226033

On 11/7/25 11:55, Naman Jain via lists.openembedded.org wrote:
> From: Saquib Iltaf <saquib.iltaf@kpit.com>
>
> Ignore CVE-2024-43402 as its not applicable.
>
> CVEs are specific to Microsoft Windows.
>
> Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
> ---
>  recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-devtools/rust/rust-cross-canadian.inc b/recipes-devtools/rust/rust-cross-canadian.inc
> index 4478a7e..8e728ef 100644
> --- a/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -15,6 +15,9 @@ SRC_URI += "file://target-rust-ccld.c"
>  LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
>  S = "${WORKDIR}"

Seeing this "S" declaration, I assume this is not for the master branch.
Don't forget to indicate in the subject which branch you intend this
patch for, so the branch maintainer will be able to find it too.

>  
> +# These CVEs are specific to Microsoft Windows
> +CVE_CHECK_IGNORE += "CVE-2024-43402"
> +
>  # Need to use our SDK's sh here, see #14878
>  create_sdk_wrapper () {
>          file="$1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226032): https://lists.openembedded.org/g/openembedded-core/message/226032
> Mute This Topic: https://lists.openembedded.org/mt/116168503/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


