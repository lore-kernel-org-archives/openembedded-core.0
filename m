Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.842.1619111572440802420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TrMVdpLJ;
 spf=pass (domain: linaro.org, ip: 209.85.222.172, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f172.google.com with SMTP id z2so10059548qkb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iI+YgDD8DcT/YxjkKa0Nlnq58cb0lIDWUGw3+d9p4+w=;
        b=TrMVdpLJvhCwLjGk39v8tCt3qvppJTiIoxZ+exorGeaYB5FCL2RkdgM+0TWW71ZeYZ
         X1TY5yRDmkOHCsrJWS6OyeRK86CK0AxpG6MS239SunOT9PXMk8UAk5eA1/arP3055xzx
         +vHCEYmBtbc6u9QLqAH52ozJgBFsxIsi/4CP2aZwmngNA3pytviGr3oPQtPfdUauxCe9
         ga5B5G6682u9QwkegJPqDEMNzwHqIM15NKU0UUsTms5ymzcSB+kZ8ZTJrzWtHDupxAL9
         M4ugoAl7rBpT6rs4/B+A+NEm3ASvGopA5MQ6IekO8Ld+mI5aPG6UUa1eupZhCNrhBA80
         jPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iI+YgDD8DcT/YxjkKa0Nlnq58cb0lIDWUGw3+d9p4+w=;
        b=GiSugZasrsmqU8FVUVSD8q4L4OcRg0fe3Lp/5NTwQYg2j46q+lZmTYOpFeQlndToFN
         LSDUVc3fPfDqKjy2UMGwNC6HwZpTRbyTSu09WoxrbQYCQzBwoPgPEvypVZZbEelF/04g
         Ap+MFxzABU/qHx/x2aUEMTpzBEqlPMTGoj41DSZVYawGJCZaCrbNvGPwnACfvpZe6m+h
         IpZOS6kFIISUU8d0aXf9S2jTtDUWGBkDDo2SacnWNvsUMEHsymdV67fQaYy10YnZ4Hbz
         Lw8w+MDqmUTnhshaxOeiA80y9wBnfoRohdadTU6K2JRdZrntAUz0eCpZx9Ck3ryutu2e
         H53g==
X-Gm-Message-State: AOAM5336EAHCkFKVxMnbY6rxpdiEX8uzMHNsiTlEaKDN/iVn2FCfbvCh
	hvWlj5QvvcbQDAKN69zJWqBzXg==
X-Google-Smtp-Source: ABdhPJy2Dcd7baQX/vlrlY3uVgiadxtDFE52p2pN4JyFJcWMv3x5rBIrzHbBlGC2SbDoaVRZYugvLA==
X-Received: by 2002:ae9:ebd1:: with SMTP id b200mr4712174qkg.200.1619111571634;
        Thu, 22 Apr 2021 10:12:51 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id n15sm2491676qkk.109.2021.04.22.10.12.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 10:12:50 -0700 (PDT)
Date: Thu, 22 Apr 2021 13:12:49 -0400
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH v2] cve-update-db-native: skip on empty cpe23Uri
Message-ID: <20210422171249.GA926@maple.netwinder.org>
References: <AM9PR09MB464219591A09F7157448D429A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB464219591A09F7157448D429A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Apr 22, 2021 at 06:48:27PM +0200, Konrad Weihmann wrote:
>Recently an entry in the NVD DB appeared that looks like that
>{'vulnerable': True, 'cpe_name': []}.
>As besides all the vulnerable flag no data is present we would get
>a KeyError exception on acccess.
>Use get method on dictionary and return if no meta data is present
>Also quit if the length of the array after splitting is less than 6

Seems to work fine here. Thanks for the quick action.

Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

>Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>---
>v2: handle the case where key is set but value is none and
>    if resulting array is shorter than expected
>
> meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
>index 25ec6bac71..e5822cee58 100644
>--- a/meta/recipes-core/meta/cve-update-db-native.bb
>+++ b/meta/recipes-core/meta/cve-update-db-native.bb
>@@ -139,7 +139,12 @@ def parse_node_and_insert(c, node, cveId):
>         for cpe in node.get('cpe_match', ()):
>             if not cpe['vulnerable']:
>                 return
>-            cpe23 = cpe['cpe23Uri'].split(':')
>+            cpe23 = cpe.get('cpe23Uri')
>+            if not cpe23:
>+                return
>+            cpe23 = cpe23.split(':')
>+            if len(cpe23) < 6:
>+                return
>             vendor = cpe23[3]
>             product = cpe23[4]
>             version = cpe23[5]
>-- 
>2.25.1
>
