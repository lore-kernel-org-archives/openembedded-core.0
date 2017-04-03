Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 11A8E70018
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:42:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p52so34706362wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FerdRR2/hhKMu/QTgFjX8z08Goso7HNbUHFYOOhvXV0=;
	b=SUiy0eb+NkKgUL3+09AmKDjexcW1uwaYePGhStfd5tI3n4nKmvHGQ23N5SOpUP6HyZ
	8dcdCkxitySUH0uIcjRo6/Ba1py4kW4+5mKHakkspOozoxSGUcBSU+Xvx5/laCfL+z8G
	xiLu1xM3CQtvbDFgEgO6auaMwseRmVG/BW+02gcA11Ec/1yazXFidNEtyOmo1SXsZqFf
	XHQhS+y4pNK+D40zGytXlHXkgN1v5D3xr4FOV6Pw3O3qXDSl+Id+pUCjy/WgevX8gJU+
	rHYPO5z4ONMx3ehoxVithI7ZZfhNeI27M1epXekk+WkTE0gLG9+cwD479f09TSkSUoHm
	TdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FerdRR2/hhKMu/QTgFjX8z08Goso7HNbUHFYOOhvXV0=;
	b=t3yeYJnrD2m6do1kX6VuQfmvdgfll6ccB/hC0T5odJvsXweOXglNX+2IcKBVtwSyoS
	sH0haO72oEkiCEesTlII+J6oXZmIQWLc240aQPtFdkBODWYv77emBbQ12+W3OdAax+gC
	f+sDmvI6SkRCtgQQl9RFaj1JQFYYZsJmBco3RKt6mCm85uBNjUYgTmWg4sShU+YMMxrm
	nsAO1PQwhTJ3HnOT+dzKOuP/9APBZbNYfc2wdgObq1n2h8p1hWbPoJP+/NV+V2hWeNEA
	RTnPAyy1t3WFVqB/iKS53RkqooMvM8hcgKQ3WfncldemjNbUBVMVxYG7JuJaVV/29WAM
	zPXQ==
X-Gm-Message-State: AFeK/H1EPvTylCiDD/2LxWoAhCMpmxzzjjJuRW/zlzP1j/jiXNyxYUPgGL2IEZ9HLS0M3c633NpAPLKXDIMI8g==
X-Received: by 10.223.128.194 with SMTP id 60mr9656109wrl.175.1491234123452;
	Mon, 03 Apr 2017 08:42:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 3 Apr 2017 08:41:32 -0700 (PDT)
In-Reply-To: <68e87217-92f9-7009-800c-f5da70b3af43@phytec.de>
References: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
	<469f1f49-8d57-b43a-7aa9-950c4d6afebe@gmail.com>
	<68e87217-92f9-7009-800c-f5da70b3af43@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Apr 2017 08:41:32 -0700
Message-ID: <CAMKF1sprd=AwhXnZSEACdsdt45jwf+TeT_26w4pYxavWQQL8PQ@mail.gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH morty v2] wic: partition: Run fsck on EXT file systems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Apr 2017 15:42:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 3, 2017 at 12:47 AM, Daniel Schultz <d.schultz@phytec.de> wrote:
> Hi,
>
> Am 31.03.2017 um 19:14 schrieb Khem Raj:
>>
>>
>>
>> On 3/31/17 5:51 AM, Daniel Schultz wrote:
>>>
>>> Mkfs may create EXT file systems which can only be optimized by fsck
>>> and not by itself, e.g. directory optimization (in Pass 3A).
>>>
>>> To prevent those optimizations during runtime, it will be performed after
>>> the creation of an EXT file system.
>>>
>>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>>> ---
>>>  scripts/lib/wic/partition.py | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>>> index 3b3bd2d..152eb7b 100644
>>> --- a/scripts/lib/wic/partition.py
>>> +++ b/scripts/lib/wic/partition.py
>>> @@ -239,6 +239,9 @@ class Partition():
>>>              (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
>>>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>>>
>>> +        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>>> +        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>>> +
>>
>>
>> is this required on master too ? if yes I would suggest to propose it
>> for master and then do a backport.
>>
>
> Yes, it's already on master. If I would backport it, I also have to backport
> a patch for e2fsprogs.
> Since the new release is very close I would prefer this patch.
>

it might be fine for your internal release. For upstream release branches we
should go by backports.

