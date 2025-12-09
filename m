Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB90CD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 14:24:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8794.1765290276455133400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 06:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=tzdy5NgV;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42f9ed40b8fso449192f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 06:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765290275; x=1765895075; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/Zqm6ixTMeyBwI2+EI43NwiiCSRR4vATGi3lDIM9O0=;
        b=tzdy5NgV1yqrv/t4L5ZroNu4NQ7cTAFIlMRKYkByApk/hq6KboKoAxoHaQ07rNnzHI
         qcJ0TcazEU4yGlfseUtVz9ChMIp2Vx61L8NmpJr65E3nDrfenc7ytFDtlEFIMnGDrwDr
         FNoz9jY/KkkE8re1ZsqIBf2nDW8YW/lhyInEGafL0mx0SUdYynsxy4Sy15ZIybqDlTuE
         C3dUSn2yEDUj+DEHJjAd4EBrbhsO8DTgAaCq+xrKMsDO1/QGfLjRBvyLKmsJ2h0aOi9e
         oeW++ZJnlLIWi6IpNKaSsrsfNDtQ9Y6zFsO2vN/X06S6OV+YS6bmRjvmYVXDRxalofZy
         fnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290275; x=1765895075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/Zqm6ixTMeyBwI2+EI43NwiiCSRR4vATGi3lDIM9O0=;
        b=AoWZxZvD45bSCNP7JlH8bYfyeHDtEumnYDWcQbM3F6zldrbunEC5uHDUDNJBFikrIx
         nWEhEBY9nvstXBgR1itXzfZA3iVLCDL9vvqVKYCjm/PO0+pODrjyNJp/eRChjCk0LrcA
         yLaLZ4h/dC6xOqE59KiWgvES1lCMPx8CXTs93MtJVz2zFlJhYmBn+25BgUCmhpRr0jN9
         0YxCHGXqBRUM23czi4sj4kAeUqV2Zy2GRtx20Ht+G/ZFHo9wO264eb2JLpohyRkgVc6m
         L4SYhECRT2Y+4AK9NvNMeyGT5Ms6HtZcushJ3bUuUhpsXN/vSqhvjeIc+ZR5khSPh3cQ
         39Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV2qztP/9bmlNWDIjANnpDSFBHnYsTrp2M2+JD9RAXjj/XJOsjJNCWIzGTTNtvq8Q9pvPrSFSw7SNDlVJKy7bHLIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwW1YLXMuctVVT+Q073b28fyL3LqQBRGzreIzRE+L2EMp5/TLa2
	7FtbpePb6/Au3XzX7sSmYa0tvnlUfUjGZ1jeQMQRCdpI747a372mDBw2s4icrPpUSzLnQr+ZvvS
	UgJf0Sr0=
X-Gm-Gg: AY/fxX7TVBvDhwihTtFcV92qDmALOjlTNn4bUS20LfyvDzLlxmP8A5TbEhnAyC8ib7e
	zEyPra7eNIL24E/BKhabSaAYC7tEF+D4JSb1WBcaYVhPTty63UAui3tMr2wYHBOfCjjz1GAS1ZU
	UZD2mzQrRwz8/lsPIiyb4ztZAVoijzuUGiBRMtaGvjsp7Fiq3D3UsodeF00G50UNXCerLwGjTjt
	z+eqBCOif1wUQfsdQu9/M6SjahGtmcemLcrlD2oR7+ndp6DZiHIpP99rhWCpAnZbjVVFQgNJbK7
	VFBmMrk5DaIEPJ6EhoK2KLUHkbWitT028X0LOEo2kcgS68VXmbS5nW73QjKUsGlrTE3Tk9oOMOp
	wXnRC/TdcUdzgiDxFoQg/qnn1OgWUGG4Vx+vBXceOX7lzBKKUs4TOf5Qf9Z87TD7qJwM0Fe/uBD
	F5pEesprdYsCMp+2Hftn/vIAVriTaZRp35yIL4H9c3G1aZRDKc6yxJKOEe/oRpwBYW
X-Google-Smtp-Source: AGHT+IGCgEv8+HYVu411/RHCq4pS2vxODNV0KtDaurDf1HkLcJHk1j6kW571v9FUkqTpv1WU9qTtWg==
X-Received: by 2002:a05:6000:2008:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42f89f0abd4mr12153754f8f.3.1765290274709;
        Tue, 09 Dec 2025 06:24:34 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm31827408f8f.35.2025.12.09.06.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 06:24:34 -0800 (PST)
Message-ID: <1a2c0b49-5070-4ded-b647-e77e3b8a0de0@baylibre.com>
Date: Tue, 9 Dec 2025 09:24:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3 1/6] patchtest: fix failure when oe-core repo
 is in detached HEAD
To: naftaly.ralamboarivony@smile.fr, openembedded-core@lists.openembedded.org
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 14:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227441

Hi,

Patch series LGTM. Thanks for making the changes.

- Trevor

On 2025-12-09 05:55, naftaly.ralamboarivony via lists.openembedded.org 
wrote:
> From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
>
> Patchtest fails when oe-core git repo is in a "detached HEAD" state:
>
> Error log:
>
>> File "/usr/lib/python3/dist-packages/git/repo/base.py", line 881, in
> active_branch return self.head.reference ^^^^^^^^^^^^^^^^^^^
>
>> File "/usr/lib/python3/dist-packages/git/refs/symbolic.py", line 311, in
> _get_reference raise TypeError("%s is a detached symbolic reference as it
> points to %r" % (self, sha)) TypeError: HEAD is a detached symbolic reference
> as it points to '3dd31d3b29730fa1130645d76bb71914ac036335' None
>
> In this case, no current branch is available for the clean operation.
>
> To fix this, updates the checkout logic:
> - if a current branch is available, use it,
> - otherwise, fall back to the commit pointed to by HEAD.
>
> This ensures that the script works correctly even when HEAD is detached.
>
> Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
> ---
>   meta/lib/patchtest/repo.py | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
> index 2cdd6736e4..6a7d7d2d3b 100644
> --- a/meta/lib/patchtest/repo.py
> +++ b/meta/lib/patchtest/repo.py
> @@ -21,7 +21,12 @@ class PatchTestRepo(object):
>           self.repodir = repodir
>           self.repo = git.Repo.init(repodir)
>           self.patch = mbox.PatchSeries(patch)
> -        self.current_branch = self.repo.active_branch.name
> +
> +        if self.repo.head.is_detached:
> +            self.current_commit = self.repo.head.commit.hexsha
> +            self.current_branch = None
> +        else:
> +            self.current_branch = self.repo.active_branch.name
>   
>           # targeted branch defined on the patch may be invalid, so make sure there
>           # is a corresponding remote branch
> @@ -80,6 +85,6 @@ class PatchTestRepo(object):
>               self._patchmerged = True
>   
>       def clean(self):
> -        self.repo.git.execute(['git', 'checkout', self.current_branch])
> +        self.repo.git.execute(['git', 'checkout', self.current_branch if self.current_branch else self.current_commit])
>           self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
>           self._patchmerged = False
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227425): https://lists.openembedded.org/g/openembedded-core/message/227425
> Mute This Topic: https://lists.openembedded.org/mt/116691873/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

