Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E7FCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 10:57:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6922.1763377055940713246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 02:57:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkrUZczL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477770019e4so46415385e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 02:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763377054; x=1763981854; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boRpC4rk8zjJfdQNRtaGLHPxX3nHNmHX1u9/O/bdM8M=;
        b=gkrUZczLTR+D3QVS+EBCL7PBKPW5506/k9h2mD82oEkKf5eZwn60I3PTgx01RfvFqi
         bds9tXb3SwyNyZNZP1vNIJ5/HSbc7fvORV0hTTYsGInZ2IUSNDxvfW1JS8NzNp6iXiUX
         F5qGGj22EiDCfU1xuOMXfIjg3L1mwFvixnjH5GQPfahfIyDF4yJUODLCIGyR/ivTo4zg
         QQV6rlzgwrSzgSn1JiK4mHXDf+6osvYuym/68VWTycknyXe180nSyqJ008vlWr5rSD8o
         YPDYdcBGa/TfmDVTKGkkxCktUXd7iZIheXJr3f0QmDvExwV5VL2FYTutrNpQ7Oy77qjJ
         oUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763377054; x=1763981854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boRpC4rk8zjJfdQNRtaGLHPxX3nHNmHX1u9/O/bdM8M=;
        b=Fq7bifrHWrwIhfJfE7BYsbqsXCA9K/qCqyaeS3ZofcIkA8zIjP53otMVGRHqHmwXkV
         nFXjp9ZDm1Xaul2dfHN/486qOF8yGuZO5HXvyDhgGizQeF+7tcCYkNeS55D4XV5cqolG
         DDwxgbPb2gDx5Xzz/p+UHpykkTH5UAfogOKZUQF2QdcmHhVB9FrymefyCEYMSer/zEQL
         1OE2hydK/7YKEY7ddF+rDsOReIZmPevw4HRJSQ1NIlkRXqyJ6vjryIDzwTBzGorHSGf6
         FMrQXmBCfdDQyatnmLogkMYTPMBZK1p/+1RxrxsRBkybxiDOpGMdv3VaPoX99i8uU7rS
         ZjTA==
X-Forwarded-Encrypted: i=1; AJvYcCWvQm/rm4ICzuML9ezQRdHw9ArukvWvT0dqCgY7UMvuWT7watYYSpZCzATRJZGVkdPsjfwxOg5bMJFE6Fv5iT4kdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIPd2JTOzqeE7J6lWzayl0rMt5cXHUrPdMT1Pwmirr6QsmBDu4
	t3MIJl1HmRDmZvTTrSjP7pGFjHbOBIl7GIfVimIxK7TEaXiqujwrN+vr
X-Gm-Gg: ASbGncvbN70yVi//4xX7kkUiiEEJxriyZjwikpsDtXtggJjkAa4cum6AnHaUbHa9Izu
	Z2j3Z3rLH7iYn9l7UYkrHQuLjZU8fOohYgQz60eV+7nIXmaMXp+jc1C0guWFMM0wDFVfEOj5Z5H
	higsX3GrlvM5o+QzYXxEGKgh9rrAlSHL/err798cs1aK3TP+u7DkMGVxJh20fzireu2tWQkDV/f
	5iTPoluxbXDqDIc6kcd5L1iMb/XDCyj+LFW3kHD4tEezwfK8vSr7jOu9E3aoGoLEC5WZ20UwvWN
	vTOs1xKRwV+vjBdsgFrjkxz0aq3CILDSAHgUzRbK+y2F9aIDulUP9qGZP8mcAYKUoepfN9d4/5z
	ueNp0dbg/NJERw322JJ+yJTIYeduT93pQwDbU9AGpwkdt6LmKqKa5up2+QUjybT6pMf45pEdN4q
	sVLLJ/yZdEn+UleX/hDA==
X-Google-Smtp-Source: AGHT+IEiJ3ZPyjgJ+pJY69ZrQ8Xe+/sfJeny+M77SeqBuXth5r/C1Z6Az346OPbFF+Cn0bIyD/4uDg==
X-Received: by 2002:a05:600c:4707:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-4779eb89abfmr47588115e9.8.1763377054027;
        Mon, 17 Nov 2025 02:57:34 -0800 (PST)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm309650525e9.4.2025.11.17.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 02:57:33 -0800 (PST)
Message-ID: <18d3f1a8-8479-4404-b8e9-4fae20438508@gmail.com>
Date: Mon, 17 Nov 2025 10:57:32 +0000
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/1] spdx: Add software file externalRef support
To: Daniel Wagenknecht <dwagenknecht@emlix.com>,
 openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com
References: <20251110171337.754568-1-fbberton@gmail.com>
 <30a750da328e1a550743c7d818f5cf86bcf362e9.camel@emlix.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <30a750da328e1a550743c7d818f5cf86bcf362e9.camel@emlix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 10:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226491



On 11/12/25 16:59, Daniel Wagenknecht wrote:
> Hello Fabio,
> 
> thanks for your comments and patch!
> 
> On Mon, 2025-11-10 at 17:13 +0000, Fabio Berton wrote:
>> Our first idea was to use 'downloadLocation', but what I understand is
>> that this is a package property, and files fetched from the layer are
>> 'software_File' type. Looking at the SPDX spec, it appears we could use
>> the 'ExternalRef' for this purpose.
> 
> I'm not to familiar with the SPDX spec yet, but adding individual files
> entries as `ExternalRef` instead of `downloadLocation` to a recipes
> spdx sounds reasonable.
> 
> I think in the long term adding a `SPDXRef-Layer-xyz` entry per layer
> with a `downloadLocation` pointing to the subpath of the layer inside a
> git repo. I'm not quite shure if it would be possible to formulate a
> dependency on a file contained within a different SPDXRef, e.g.
> ```
> SPDXRef-Layer-xyz:recipes-core/base-files/base-files/fstab
> ```
> or if we'd have to create a SPDXRef Item for each file within a layer
> in order to reference it properly. That would make it even more
> verbose.

Hi Daniel,

Yes, we should have a way to get Git information at parser time to avoid calling for every `file://`. But I don't know exactly how to do this, because if we need to add a variable in all layers, and of course, we can't do this, we still need a fallback if the variable doesn't exist. In my case, we don't use OE-Core from https://git.openembedded.org/, we have all layers in an internal infrastructure, so we need to change all variables to point to our fork. My idea to use functions from 'oe.buildcfg' is to get Git information from the layer and not from variables, it doesn't matter if it's a fork or not. But I didn't cover the case where different remotes are used. I know that when using `repo` to manage Git repositories, it's common to use different remotes, e.g., https://github.com/Freescale/fsl-community-bsp-platform/blob/scarthgap/default.xml. Honestly, I don't know if adding a variable to set the "downloadLocation" will be better or not.

> 
> The approach of having a layer as an independent SPDXRef would mean
> getting the git revision etc. for that layer would run only once per
> build and not per `file://` entry in SRC_URI.
>>
>> The idea is to have two options to add this information: one to add the
>> full path of a file, and another to add the git information
> 
> IMO the full path to the file is unneeded information, if the file is
> solely available locally a `NOASSERTION` would be appropriate.

The 'path' option is to not use the 'Git' information, e.g., when using a tarball and not a Git repo. The 'locator' will be '/home/user/src/openembedded-core/meta/recipes-core/busybox/files/syslog' instead of 'git+[https://git.openembedded.org/openembedded-core@ac5d9579a0db63b54bbebb5015de2ae860a462bf#meta/recipes-core/busybox/files/syslog](https://git.openembedded.org/openembedded-core@ac5d9579a0db63b54bbebb5015de2ae860a462bf#meta/recipes-core/busybox/files/syslog)'

> 
>>
>> Should I add a variable like 'SPDX_FILE_LOCATION_GIT_REMOTE_<layername>
>> = "remote_name"' to set a specific remote for each layer? Would setting
>> the git remote be sufficient to cover most cases?
> In my experimentation I removed the per-layer setting again because
> tracking the `vardeps` for the `do_create_spdx` get's more complicated
> with per-layer variables.

Uhmm, good point, I didn't think about `vardeps`.

>>
> Sincerely
> Daniel Wagenknecht


