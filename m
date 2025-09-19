Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB22CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:30:17 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.16722.1758288614387673344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dAdKDH1Q;
 spf=pass (domain: baylibre.com, ip: 209.85.160.193, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-4b61161c30fso17802941cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758288613; x=1758893413; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/vda/yQK0Xkc+dHcMnto/peSXcTcy5qQC4HmEM3MTo=;
        b=dAdKDH1QF4RnAoSyarsVQRtgpiEolv8phyulBpr6/iw3JkK5mwII+QNcEKmasHNwRo
         qRGx/Mx7unf3NVIRrMzAtz5cQqLV9dZZArYTog561ZQeRuabzOgATCxS4DILoz/aYzfX
         o0w9GWkYTafT+8n1LVJHGOTFxxE8GN/hFQCfjXdLTkC5jY/EjL6+6NShUb27Ul4PbB/B
         XyrTlIGB54XCqmfNR+tXFGXiJ7PB+sP1ESEI5hr/2kylYg8J/W3dJgGPeSlrnqcLa7/I
         maN6QbxpY9hD9FI80oejboKxZSJZzA5ve/AM/aeEU2DWMzQGwcEOxw3BZoidhPw5KcKx
         G0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288613; x=1758893413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/vda/yQK0Xkc+dHcMnto/peSXcTcy5qQC4HmEM3MTo=;
        b=IR3/7wfkqZQaK7EhpGkBBoybZvsHswtLy9pmAIwBTtyL6hSYYRvqy2grbtcBWDDu+u
         tsRE8Yq/gJf2RUuetSEwlpvmos9FoNuUK2bDrFAdORACGkucvLFoBQA8EGRM0EzbwNKp
         AL89TLA9aEFFOZ7iN1oK42Pa5RpB9sbTxA31FLTfRfcxaEuI8XE1TBPrsbZzzNDMgYUK
         nTzkqd+sOCHz62WDiWtkPJComhc3Rf1byAbZxWF8FAQQ4WceJccXFd7hA3hsLeSEx7Ds
         akgckvmLoW0ZC5rMPXjFM970LsVcCrIqn9S6NLqujmyyBMSX5o2GZqUaXIfEcxeGzIcP
         BIBw==
X-Forwarded-Encrypted: i=1; AJvYcCWRvx2zUNefl6rmov9ptxhDA6i+KwQVWnqtQp2eJGmxoThHAnIZJ8+kPZyWGXpufdJVlvyafOKHD9gAzoJhOFJ+yA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyYpQAYzNM/uMj78+E78j9+BnprUpAFXCefIvYlsHoIHsS24Yn
	qLv91B4G8HFDfLxzj0AwYQ0BFZKq7gbMC7bmJ6IZ3br7T02YJ1WxAqr/OaJUHWCAZ6A=
X-Gm-Gg: ASbGncvTaqaJI7C1vKYvBE9IwsZH8BI+qlgLG6HZzlfZqtUV88+5IKhhS9wL3LTH9Ew
	1IP9gCDeFGqx/TSU5VToMbTtfvcm9UpBlZcwiqFkAFQL/y7UblRrdGUj7Tvpzod/8sA4xanzntl
	LGvkShCSSk4iyuymIbRd4RJEdEim6QbWQWABonJo8nqpRI7pgdSOOQgXU80KLMT6vuqSEERBJwo
	T6hj+PQWcbFRZG8p/dIgfhVqAWZwYiB9lRHYAIiXWhW8OEohKA6UZLVdBENO6xGJH93mL7RZ/v5
	PJaUmXcL/qOilChtfU45GVja7tgFdyV8NMKZ3k7ghy1x5CigikhFhsU1KxRGL4D7BdVBV0jr9Hv
	fgHIxYbJ5dzwHFcLhOB8GrwdgSL9R7Bl44dETG46+GeG5DUmI4E2QeVhfpHkuYj4cqPY=
X-Google-Smtp-Source: AGHT+IHnsFW5gyGN4HvXh3i+K7mM0eBekle36q3Mn9UecdqlwU64uXR3RsprLJeSMVyuRsRxsi4w8A==
X-Received: by 2002:ac8:578b:0:b0:4b3:e5b:cdd0 with SMTP id d75a77b69052e-4c073f81053mr41603231cf.79.1758288613220;
        Fri, 19 Sep 2025 06:30:13 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bdaa787f07sm30010571cf.49.2025.09.19.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 06:30:12 -0700 (PDT)
Message-ID: <a8461ef5-4b62-4134-b25f-8e14d5922397@baylibre.com>
Date: Fri, 19 Sep 2025 09:30:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] patchtest: apply patch in repo root
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
References: <20250915090208.2007216-1-skandigraun@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250915090208.2007216-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223751

Hi,

Just wanted to say thanks for submitting these - I didn't catch them 
earlier.  :)

On 2025-09-15 05:02, Gyorgy Sarvari via lists.openembedded.org wrote:
> Patchtest tries to apply the received patch on the repository, without
> specifying the directory, which means that the CWD is used. In case the
> patch modifies a content in a different folder (e.g. the script is running
> in ./meta, but the patch modifies ./meta-selftest), the patch will be skipped,
> but git still returns 0, instead of complaining.
>
> To avoid such false positives, specify the working directory for applying the
> patch - the top of the repodir.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>   meta/lib/patchtest/repo.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
> index 8ec8f68a0b..2cdd6736e4 100644
> --- a/meta/lib/patchtest/repo.py
> +++ b/meta/lib/patchtest/repo.py
> @@ -52,7 +52,7 @@ class PatchTestRepo(object):
>           self._patchcanbemerged = True
>           try:
>               # Make sure to get the absolute path of the file
> -            self.repo.git.execute(['git', 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
> +            self.repo.git.execute(['git', '-C', self.repodir, 'apply', '--check', os.path.abspath(self.patch.path)], with_exceptions=True)
>           except git.exc.GitCommandError as ce:
>               self._patchcanbemerged = False
>   
> @@ -76,7 +76,7 @@ class PatchTestRepo(object):
>   
>       def merge(self):
>           if self._patchcanbemerged:
> -            self.repo.git.execute(['git', 'am', '--keep-cr', os.path.abspath(self.patch.path)])
> +            self.repo.git.execute(['git', '-C', self.repodir, 'am', '--keep-cr', os.path.abspath(self.patch.path)])
>               self._patchmerged = True
>   
>       def clean(self):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223391): https://lists.openembedded.org/g/openembedded-core/message/223391
> Mute This Topic: https://lists.openembedded.org/mt/115250666/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

