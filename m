Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D93C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 01:05:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2891.1743642342461821242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 18:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQPED5oD;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739525d4e12so293941b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 18:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743642342; x=1744247142; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EppyBchMydfLtxPFQZdmp3oKHxnjh+573xcPlVJtGcw=;
        b=TQPED5oDe26FWgzRPrFT2m9VuTGadwO7/i58PJwK+RhVx1ll5Z4TVx4Ka9F8Yuo8f+
         bNux63TdVw1H9NDJS2oA+qzejlZDJeshJQ/z2eO01avETtgaXMJ0s8a8yRyARqlupBwF
         1mNPF+oQf1AgWjLPOlTAKW3DEjIPrTtRkxXQvjIJ5cFQyMWusHzJM5p+9iT5G52DxvX3
         DxugyKHuA1BGqSfA+B9gEZGdv0BNn5+G4gg/MjLD+ogurtJfRk9LuvMIXfuE00cajWta
         JXUxAz/WHyvp+XRuVlQF/2aH5QTnjWobCnfkVZitRXnBO95Fw1X4vxcDMnWnifcWHeQD
         VKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743642342; x=1744247142;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EppyBchMydfLtxPFQZdmp3oKHxnjh+573xcPlVJtGcw=;
        b=xGOe2zCFzzRYrHjnypD9E1F9H438hy7j+ZcGlQiOBojIDOX5O/Tu46vdggwO8PVmTq
         0J/rsO+1Jz/4SVSUbvd/wcuyX28gviD30Y6jEoOXpp+qe8zQ94ifYSpKP3BywJ5twizX
         sKVdyhn4hwnzpd//QfG7k2yYo1mmvQrR9F7XFyHCnfRDjHmVZHSA7r7OozMSNn5Lj9hf
         hC1o0ZMEeUwoUIqcvmOw8nr8Gl3HRp+8kramv2Toj9hu/T9DrBhHY0EM2ytIAh4+9kIB
         SvFYvQdxjOj0ftqh2q5tzMcnlfdf8qvjBmJZSwpjgQaJZRFhciLnHEjqb1jZ5s7GZJQC
         YnYw==
X-Forwarded-Encrypted: i=1; AJvYcCWfMc+U3OjhRubG8Hy8hEf4EwOortriDnK5uHntV9qxeuxiBzpe+pQo31Yq7Pw+q+UiXIL+fqRxq3wdM0EfliO9WQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyF+KNHLomndwJKhdcItc338jOfmGOKppFONf0IUdTjweArUBds
	Oo9FRyhOtD7/pNYigcHOXq5S8+PjaOl78WO4ZMZ4S9nu03ar35DX
X-Gm-Gg: ASbGncsbFLDNaUh2xSgXjsAdI2QkRsBYfdRXGA+NFiqNT5qQtvHxngEbxSkazBx8qiX
	AZMUcsdxFv4Qa31xjbK53np/xaJpfXrLLPBTZyj59zz0OgCNU454X81f8yuuNbJMGWCnIn/qC/H
	cGgIjROAsf04fue41fhg1G96aSCAPkNLb+A1WDGTImqB4TTSnTHBclDi7N7aSkU04ZIAVL+Q82o
	T4d6CCVFKcL24MSuXe+clDp1qlQDdv8GvCLwt3vJLogVYdq+jCRM5G27Hv7HA7IygUGnHes/P3R
	zoujfgYa5U4nHMT3hMHptZDABrxBrpeh+xrjWgqNIFZRT729twGryoTPHV20xp/rgCXHW++oIut
	xnIcQTw3n2tv3K154htTekQDkZ8Z3QJRswEj5ew==
X-Google-Smtp-Source: AGHT+IEBMO7iyq+KAjYTcnbd/JWyfmiiFeXeKbTaSSvWl9/3GG87iSNB1/4y52VJsNzgz2YP7w8sXQ==
X-Received: by 2002:a05:6a00:14ce:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739da115a02mr695732b3a.18.1743642341705;
        Wed, 02 Apr 2025 18:05:41 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:259d:91dc:bf30:aea7? ([2601:646:8201:fd20:259d:91dc:bf30:aea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3734sm184912b3a.179.2025.04.02.18.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 18:05:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5hOjj0KDUsraQ0JK2ENPL0GC"
Message-ID: <0d822e38-f7c5-4e09-87a0-508be5b400a1@gmail.com>
Date: Wed, 2 Apr 2025 18:05:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] llvm: handle libdir in llvm-config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 openembedded-core@lists.openembedded.org
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
 <20250402-mesa-25-v5-4-ab35f021a83b@oss.qualcomm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250402-mesa-25-v5-4-ab35f021a83b@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214295

This is a multi-part message in MIME format.
--------------5hOjj0KDUsraQ0JK2ENPL0GC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/2/25 8:18 AM, Dmitry Baryshkov wrote:
> The llvm-config wrapper also needs to override a --libdir switch,
> otherwise software (like mesa) end up using TMPDIR-based directory for
> Clang resource lookup (and also encoding TMPDIR into the target binary).
>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta/recipes-devtools/llvm/llvm/llvm-config | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
> index 5e4ded2da5bc95d429c6f717a2f25223bbbe210e..6cf3e7578fa96f2893f73077bece4db45f29547c 100644
> --- a/meta/recipes-devtools/llvm/llvm/llvm-config
> +++ b/meta/recipes-devtools/llvm/llvm/llvm-config
> @@ -35,6 +35,9 @@ for arg in "$@"; do
>       --libs)
>         output="${output} -lLLVM"
>         ;;
> +    --libdir)
> +      output="${output} ${libdir}"
> +      ;;


this patch is needed in meta-clang too.

>       --link-shared)
>         break
>         ;;
>
-- 
-Khem

--------------5hOjj0KDUsraQ0JK2ENPL0GC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/2/25 8:18 AM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250402-mesa-25-v5-4-ab35f021a83b@oss.qualcomm.com">
      <pre wrap="" class="moz-quote-pre">The llvm-config wrapper also needs to override a --libdir switch,
otherwise software (like mesa) end up using TMPDIR-based directory for
Clang resource lookup (and also encoding TMPDIR into the target binary).

Signed-off-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
---
 meta/recipes-devtools/llvm/llvm/llvm-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
index 5e4ded2da5bc95d429c6f717a2f25223bbbe210e..6cf3e7578fa96f2893f73077bece4db45f29547c 100644
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ b/meta/recipes-devtools/llvm/llvm/llvm-config
@@ -35,6 +35,9 @@ for arg in "$@"; do
     --libs)
       output="${output} -lLLVM"
       ;;
+    --libdir)
+      output="${output} ${libdir}"
+      ;;</pre>
    </blockquote>
    <p><br>
    </p>
    <p>this patch is needed in meta-clang too. <br>
    </p>
    <blockquote type="cite"
      cite="mid:20250402-mesa-25-v5-4-ab35f021a83b@oss.qualcomm.com">
      <pre wrap="" class="moz-quote-pre">
     --link-shared)
       break
       ;;

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-Khem</pre>
  </body>
</html>

--------------5hOjj0KDUsraQ0JK2ENPL0GC--

