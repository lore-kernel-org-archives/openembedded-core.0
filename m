Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.242.1619105402947822621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 08:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P6JOG1uR;
 spf=pass (domain: linaro.org, ip: 209.85.219.46, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f46.google.com with SMTP id bs7so21692887qvb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KHl/sjYBgxZ14L2evAfciiJxkAAjUMMNeLSNS48lWdc=;
        b=P6JOG1uRcQ6RACn8OVC4bAuuHDbzKmsKFsPVTtNed1wkyRNwX1khSVx8DT6X/DCQdH
         De6L6obLwckVWzPxS0chj+HwOTPIgrj3welzhpC1ceyLVWrPfMwqvOgZIZOI8dYSlMZV
         Dgem3808K6NEH4A5GodvDaMN7N1w0tSSsEbAZIWIqICchTDEzH+Ek3dMTfGpc4znwOU4
         7wsVGd0CRwrKZR1DIPitXCvE1dZM/PR1imT7teXjg6kjraDcuGfC8mn/+dFXnBF7iAeY
         +RjYR8LENNmLq7K5w2+P6Nic1m1ZUsw7Q4BY0+fQdsZMBvs2ttlcoPJlUAyzO+ShcOuL
         cQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KHl/sjYBgxZ14L2evAfciiJxkAAjUMMNeLSNS48lWdc=;
        b=IzpqcSiIPDSPybHYA0kVg64Ckz1kYIu06tPVU5S38JRqzs0iER9WDSyAucfwjaxhGd
         YUJZ7PWYfO1WO07PV0JMVf4/ZeLLb7g3ABXoSdPRQ8SpqYW7YIHmTj/U27XwNZlGs10L
         1a32cUDffoVbBccGBl0QNwQnC9ZfAH+Kz/+25zzP1WwMz1HxR1v3VeIDuKN49SaG/+JQ
         bO2TjrI5ZZjJ44KjNJsimv2IlgCqP+pPPwoCJfaj2bCoXxkmdHP5GoNtXUdNeVbUL39l
         Iob5FVLqnioMe/IODM3MRYbb9CgPiv/YsiK4i42P8wennkfPTmpY813hpnUZkxRAmQDu
         rVLQ==
X-Gm-Message-State: AOAM531/eRm/fX3Wf2RZICs1UZhZTycL8yM1LMlhbRUjNHajN68wSqTH
	S0ODe2bogoaZL9VLfRl0od9JWg==
X-Google-Smtp-Source: ABdhPJwQ4n0NneYwU3yizUcjyUGRY6Smie8CBA+Wl169ucVrlXps250f527u3dTjMaYPoUahT5x1YA==
X-Received: by 2002:a0c:e24e:: with SMTP id x14mr4176017qvl.33.1619105402021;
        Thu, 22 Apr 2021 08:30:02 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id x19sm2316817qkx.107.2021.04.22.08.30.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 08:30:01 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:30:00 -0400
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-update-db-native: skip on empty cpe23Uri
Message-ID: <20210422153000.GA16506@maple.netwinder.org>
References: <AM9PR09MB46420BB6685CA903F63B2575A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB46420BB6685CA903F63B2575A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Konrad,

On Thu, Apr 22, 2021 at 08:51:43AM +0200, Konrad Weihmann wrote:

>Recently an entry in the NVD DB appeared that looks like that
>{'vulnerable': True, 'cpe_name': []}.
>As besides all the vulnerable flag no data is present we would get
>a KeyError exception on acccess.
>Use get method on dictionary and return if no meta data is present

Thank you for this fix. With it applied, I am getting error:

Exception: AttributeError: 'NoneType' object has no attribute 'split'

I was able to make it work by adjusting the patch slightly, see below.
Note that I am a python rookie, so this may not be the proper solution.

Regards,
Ralph

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
--

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index f27ade40db..c38f16afac 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -130,7 +130,10 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 = cpe['cpe23Uri'].split(':')
+            cpe23 = cpe.get('cpe23Uri')
+            if not cpe23:
+                return
+            cpe23 = cpe23.split(':')
             vendor = cpe23[3]
             product = cpe23[4]
             version = cpe23[5]
--
2.17.1
