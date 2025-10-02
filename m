Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83306CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:57:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11315.1759417060937527463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1fucBvWv;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46b303f755aso8773185e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759417059; x=1760021859; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhTDTpeVGcWjfB541DT/SkL92PJ6UyioGtLHApPTybg=;
        b=1fucBvWvXIhx3tx1jma5i7JBtHydfjeLRIYHgjV0RlzjPrtTHT3eXhmAz6+3DRjjfN
         /oMOp0tF3lvKlDJpnO7o/SeX8PWwH1KJRu90LeW1p7tPNTXPkoase//6dlSLT/2+pxce
         hpqHt2WxboCp3Jgjhjj2mmuKUYdA0fPKF4Eatd2chKpP5QZJgETpd9LtFxHcZLiz48pX
         58z2jtcXtddfUKEaoTZGz70BHBx/6FEatMsd+lpg3E568YfWPfrA5nl+XxYdEDWZDbhl
         BYTqS+grIo7ifbJOeMPgBce8V8p6Oj93ZsE1m+EiBOEvOHNaiUyAhWMtZsDRh5XCdzFG
         bRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417059; x=1760021859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhTDTpeVGcWjfB541DT/SkL92PJ6UyioGtLHApPTybg=;
        b=kDgNX8lIMmaFztArP0KAUPf+O/cIns0bKtGN4Y3NcCIm2P0NWkkPAJ6TcgwrE6wGKg
         /vhc+7DslgNgjPDAcLeHxtQEpJE+1/zrV9/VdPw0U+5JQzjyObdPaCsofoEzvzwgtZyz
         tDpAzYva9U+tdPB+dXmvoe56HUIslhlUWB0QodFeC8FZypCAuCNbHA8T+84/hMIISpFe
         LjFqvYr2sC6lr4wHkUA1Bo7aYrKniHVyBDaO18p+R8+h0XAg3lL4Wb2IdTT4BGqG+CkO
         aFHum8HBuWoK5Lp+fxZKjOGfuHX0y/MpyGxSzsJTPtzo00kai+63QlZkqdepkGIZoa7i
         27xA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PxSinxqBIvBISUBk9ixbAVTsbUAqVMzmyQiqeG0BzzkRIJKm4oHYVfGYQKqIgg867Vaa220TbAd0LtSz1w96/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwH59K+5sulcLBoAuWmd34Gl3pSaig1UsYm25rjnbQGAdDaQY1+
	VV2Dd79BRvUfqMgrZaBh8nAmEY9Z52vPuwDPrq4WSW+JzmZb0FCSsL5GwkG9mYMwV2E=
X-Gm-Gg: ASbGncvh0Fb8El6qVcibG244DeveBE74MVV6I4KVIaA6H1jaFSDu80/EHG7jsz5MICo
	SshYUBPztN00nStlXp0UseCVusBQJN4WyZZiMfZe0zhcgPHC/KDWVa4X3+10uCCmAWpQjdLVszA
	fzHKpxP0Rlfn1iNcYCMXZoj+oVsGsoJ9r2CSLdkOV+3uAAzdXaz1XX4n/gDq5LNyEnqF14jq4N7
	qI5VddmPeqU5jFvIDudrK2F3933Ma8yiKlyXOz4H+Jlv2Hlj/pqWBY2T9n6PDwwtJL6HJJwCBXx
	4vQjIeT69QsghzCZ+WSvIBXeR+88yMswQIWiCSyvmOJ0hMFTo1rPnIXq1nDtFKpnoYgL6Ut9nlE
	JYrP9mp4HJ/H6MAO3SguBbFe1+PbeoqV78QjMDwPKu+m1zRv4ZLAkZmTcgklH4JyXmy3VftFNBA
	dHGtVT
X-Google-Smtp-Source: AGHT+IHPO5OdEL6sKJPbjyefTztfY7UkaNGxza4icEo1azb0O+P3g6PdNr5MIzF2HII//MvYua31oA==
X-Received: by 2002:a05:600c:4689:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-46e612cb810mr48550535e9.32.1759417059260;
        Thu, 02 Oct 2025 07:57:39 -0700 (PDT)
Received: from [10.1.5.150] (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619c3a58sm85033845e9.6.2025.10.02.07.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 07:57:38 -0700 (PDT)
Message-ID: <9ef1677b-9a76-4130-9fba-fd8db07ccbd2@baylibre.com>
Date: Thu, 2 Oct 2025 10:57:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] patchtest: fix failure when oe-core repo is in
 detached HEAD
To: naftaly.ralamboarivony@smile.fr, openembedded-core@lists.openembedded.org
References: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224364


On 2025-10-02 09:10, naftaly.ralamboarivony via lists.openembedded.org 
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
Thanks for this. LGTM.
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
> View/Reply Online (#224357): https://lists.openembedded.org/g/openembedded-core/message/224357
> Mute This Topic: https://lists.openembedded.org/mt/115551792/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

