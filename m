Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D480AD116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:33:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28773.1764613990832229020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 10:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XLVaPy5w;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e5da5fcso1217979f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 10:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764613989; x=1765218789; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYJgfgZWodIReryqge7+fsKVzWK8+8XO+FNKKBfqW7o=;
        b=XLVaPy5w5GpI3zlFR2LbhxFlNMu/OkDXhWZw6t3FOy1lSckYpzVBMeudD1EL64FTaN
         7ZxD8MovMRRTZbIHFfj4pUcFeb7CIpLDKprlisXl/Mm+2NcfcFWpLuvZ5B1yJg92sqEZ
         VQXrEbZdnm+quBCIxbCqcJhS7sDj7SXN0pJWbnbzfWP8sG3WY7BS7UAu+hB/PITFvIH/
         eOYKs+hiXaCE25OjejrPq+j0uWAxOkcEB/fxFmVOhoChg7/hLMd4AoAqV7cZ8Zw2tN+f
         AlaxyzeBGB2yUIscVPh0iKnfq5rzqpwhNL3x/5Yb5jiu0yXVN+YoKIA1YZh8y2EuwYyC
         uRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764613989; x=1765218789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYJgfgZWodIReryqge7+fsKVzWK8+8XO+FNKKBfqW7o=;
        b=SioUNvt28YeQab0CMOcNzGleJ2CL5ws4xNyGD/B4OAuMu9BX8x3dU5DgNcLnSwyXNW
         20Oo9XEBWEqxDsFUQbY1eQft/xOrGC93i/pzUsb8NQm7whYnuQsKr9VAsnOeWdQ30Ms0
         3TM3QFfgaMoiiyzQGucVe+jHk5X7OxsiXXcaz4KDOkpJIMqpaDL7bPsyPg4eprBb32z6
         Ll12DFoASOkrNWw6csGzFMyZF5Ff/aiJcXOTSZPDIm7XVzbpHVzLmxEMdCawbiaYh5dW
         NZbCl4YcaQ3WUbX7RY/v62sQ95B8rNrSFM+ufISpU+iInIC/F2mfjJFuqBpJu3G7P9L5
         QrBw==
X-Forwarded-Encrypted: i=1; AJvYcCVYeN2gKbmaoEqeucGisJboqfrHxxcrlBITgX07q9x7Yi4fr7HRwWb5JLqeoEVYqQjfxrfb8LZGrXvIIlvg2TtiRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyn4dNbHzh3HeN+UfXD54gfNzn79NfSbdJqyHNMRnDgcPQBGlHB
	tgMXQ2BzMrgEEoUFm9Blo/lqVhqvzQwviKZtbFt6BCI0phFwzJkDM68T4qGhCX4QcQs=
X-Gm-Gg: ASbGnctFcqQSLZi6iPTCJrm7+bWIrl136C7FZ3N1lLgnvLXtw4ofC4HuHltZ5QfLqxY
	aOTXwOX1hAeU3/a+YhE9uRcFbs4FQtS6CinQICWS/SxgrlBAT0MNTowNnfEIq5TzcwghnADdX54
	dK0kbTyrlQnC6DtooBzPRvMhNY0JoblXzDkbUZIViNhFV7kgmZKgl9jONRLMHCuEn+zKJvaxYoa
	CnVkSQAMsBR/bLA7x76EQMhngUdOSdlj0fqPuurVIFD7z49roT/WjNvGx/inaWH0DJsiKDhODue
	namR16aoeJ3ZgsZITRTSvbNoNvBbF85JIHcSk0Q2hMApQOi3yNc64En3Lb4MP+V+smZsd+Hqbsu
	a3AHA+yhhne26Al9StVOF5M5xlhiXccAlMntjid71YaWkhSjEBk4FwN5VP0pfwGAXXIGj88SAM3
	5pXfXuqI4IBrugaza+ONXcEIp8EXhOtZGebl1u97h9Emew+JvyKrjDq7VXQd/qwogNeow6cyN9F
	VM=
X-Google-Smtp-Source: AGHT+IEjsPgy6UTwTVnRRAV9XMGrAZx4C9YyL2OwyeG2Y3V2HPs7yg4XyWjAEX+6wgzsbEn/GaL+ig==
X-Received: by 2002:a05:6000:2891:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42e0f356945mr29503278f8f.40.1764613989064;
        Mon, 01 Dec 2025 10:33:09 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:84f2:c6ad:afd9:6725? ([2001:1970:3847:e000:84f2:c6ad:afd9:6725])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c302esm27254747f8f.5.2025.12.01.10.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 10:33:08 -0800 (PST)
Message-ID: <a0d7f6ac-25da-4ac3-8a0d-46a2354c1da4@baylibre.com>
Date: Mon, 1 Dec 2025 13:33:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/6] patchtest: fix failure when oe-core repo
 is in detached HEAD
To: naftaly.ralamboarivony@smile.fr, openembedded-core@lists.openembedded.org
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 18:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227138


On 2025-12-01 11:30, naftaly.ralamboarivony via lists.openembedded.org 
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

Hi,

This is a really nice improvement to the patchtest code, thank you for 
submitting it. I have two general comments:

1. There are a few places where the new printouts are confusing, 
particularly in test_head_detached, e.g.:

|Test '%s' failed with git in detach HEAD repository state changed after 
detached HEAD test

I think this could be simpler, like

|Test '%s' failed with git in detached HEAD mode: state changed after test

2. The bigger issue, IMO is the way the test output has changed. Here's 
a result from my local selftest with your patches applied:

|(venv) tgamblin@megalith ~/workspace/yocto/openembedded-core (master)$ 
./meta/lib/patchtest/selftest/selftest
|XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.fail)
|XPASS: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.pass)
|...
|
|XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.fail)
|Test 'TestMbox.test_author_valid' passed, with git in detach HEAD 
repository state remained identical after detached HEAD test.
|============================================================================
|Testsuite summary for patchtest
|============================================================================
|# TOTAL: 37
|# XPASS: 17
|# XFAIL: 18
|# XSKIP: 2
|# PASS: 0
|# FAIL: 0
|# SKIP: 0
|# ERROR: 0
|============================================================================

My thought is that the selftests shouldn't have the else: part of 
test_head_detached(), since it's not tracking that pass in the totals.

If we're going to include it, then maybe the code could be adjusted so 
that the output looks like:

|(venv) tgamblin@megalith ~/workspace/yocto/openembedded-core (master)$ 
./meta/lib/patchtest/selftest/selftest
|XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.fail)
|XPASS: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.pass)
|...
|
|XFAIL: TestMbox.test_author_valid (file: TestMbox.test_author_valid.1.fail)
|XPASS: selftest.test_head_detached

And the xpass part of counts could be incremented. What do you think?

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
> View/Reply Online (#227129): https://lists.openembedded.org/g/openembedded-core/message/227129
> Mute This Topic: https://lists.openembedded.org/mt/116559758/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

