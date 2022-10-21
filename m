Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99168FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:48:48 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web08.11658.1666367323864076665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CzXtKzq0;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1364357a691so4019493fac.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D1yEY2sVwn2kYe1YqGof57nFYRmxCNfBsYoVgPvam7w=;
        b=CzXtKzq0jRgcUeId0k8l5ISPGzkfEnxZrAyUeQM1lBrCxgP/LV/GxJM8bm3d0xUqgL
         7vCLFaPhY5Dfh5UOVg3LDRw1k6CcucIk/wXeZNyNTLPLq3MNFdC9xJywROm07q/E+FZF
         8vC991cpPFtSmDPtdpzohwSTvhgMeFZ8zZtn23+Zbl8gBaqNQZJF31Ftfi1QSVM17AjO
         km/O3Y6fZx5URsTUiWwHrF4VOZc1wwzvrDiwz/0Gu+OsAe7NWOiHeq9YNkoTPpg1XQvw
         S0qvRqvl3OmUanq39Of2keXRBVK4jQydE6Q+fBnj7dlLRf0DXAbOVmKFjlPvnDfI+FNt
         rl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1yEY2sVwn2kYe1YqGof57nFYRmxCNfBsYoVgPvam7w=;
        b=8NszOWNThXRWgRjMbGf2U4a+URAa3xX/o+Seqg0URbdLL8/6djMTAy7bVQ/HTbmU1S
         Op7Gj/akTXj2+dwv/EuWZs9QDNGYwHWUoVxltROAkJIrpuiiXQzk5HE97U1bFC9wxl/q
         tuDCY0DLamQjyNyi1TKqQsrKMY0f1IWMOjEbdT91Rln5ihwjkor99smJ41x/CK2iQ/Ye
         o3+FTa3KCkhaCHI2rsUwHGbz8Gdg51PEWpVUOU633S23b7K+8tI+SKCJV0e9BuIOmGGq
         IwHNRbt67Rv7okTY6HyKU4zB5nv5qGG5W9nenqP554TzXI7Do+EG52WOC9JWJpSssylj
         gmpw==
X-Gm-Message-State: ACrzQf1iOlRizGD1WHcNOuKQuMOAlNHMVZiXvlRok7t2DigndThm+IuP
	FLRuOPzR+nDZMO8LMvbrrGE=
X-Google-Smtp-Source: AMsMyM5JzlUWk4mKf/KyW+qD5q4kaPLzl7baWE8lBxyqftMio8elvQmR9GpXu2tpDKmaJ/k81VGSsw==
X-Received: by 2002:a05:6870:c349:b0:13b:154e:5559 with SMTP id e9-20020a056870c34900b0013b154e5559mr4350309oak.31.1666367323141;
        Fri, 21 Oct 2022 08:48:43 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id d6-20020aca3606000000b0034d14c6ce3dsm1235061oia.16.2022.10.21.08.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 08:48:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <86f1e768-11ee-a693-d41e-9416ffa3fb04@gmail.com>
Date: Fri, 21 Oct 2022 10:48:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH] runqemu: preload uninative libraries when host
 gl drivers are in use
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20220204204027.2323845-1-alex@linutronix.de>
 <CAJdd5GZtMysfzY_Rz2vv_JwG_f=TvaFenS3X6iM0_p6cAQaEAg@mail.gmail.com>
 <CANNYZj9oxuvB3J0pF+iZQnKxENos8jKS9qvjKkPUFA986q-FEw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANNYZj9oxuvB3J0pF+iZQnKxENos8jKS9qvjKkPUFA986q-FEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172028

Ya I've tracked it down to when qemu invokes the qemu-oe-bridge-helper 
to setup network bridging. This is a shell script that uses /bin/sh, and 
as the log indicates, /bin/sh can't find the required symbols to start 
up (and qemu fails).

I also see it when runqemu attempt so to invoke the stty program to 
cleanup the console after qemu runs for the same reason. This one is a 
little easier to fix; I have a prototype patch that only passes the 
munged environment that sets LD_PRELOAD when runqemu actually invokes 
qemu by passing env= to subprocess. The other process invocations with 
subprcess are not passed this environment, so they don't see the 
LD_PRELOAD. This doesn't fix the bridge problem however because in that 
case, qemu is invoking the script so the script inherits qemu's environment.

On 10/21/22 10:43, Alexander Kanavin wrote:
> This is the first time I hear about this - can you find out what is
> expecting the symbol, and where it's supposed to come from?
>
> Alex
>
> On Fri, 21 Oct 2022 at 17:27, Joshua Watt <jpewhacker@gmail.com> wrote:
>> This patch broke runqemu for me when I moved to kirkstone. I get this error:
>>
>>   /bin/sh: symbol lookup error:
>> /grmn/prj/mrn/alchemy/build/tmp/eng/kirkstone/tetra/sysroots-uninative/x86_64-linux/lib/librt.so.1:
>> undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
>>
>> And I'm not sure how to fix it. Reverting this change does resolve the problem.
>>
>> My host is Ubuntu 20.04
>>
>>
>>
>> On Fri, Feb 4, 2022 at 2:40 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>> Some of the host distributions build the drivers in a way (RPATH/RUNPATH)
>>> that tricks uninative loader into loading pieces of the host libc, if
>>> the same pieces haven't been previously loaded by native binaries. Mixing
>>> the two libc versions leads to failures.
>>>
>>> This change ensures that the correct (uninative) versions are always in use.
>>>
>>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> ---
>>>   meta/classes/qemuboot.bbclass | 2 +-
>>>   scripts/runqemu               | 4 ++++
>>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
>>> index cc1cbce69d..229bd88527 100644
>>> --- a/meta/classes/qemuboot.bbclass
>>> +++ b/meta/classes/qemuboot.bbclass
>>> @@ -109,7 +109,7 @@ def qemuboot_vars(d):
>>>       build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>>>                   'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>>>                   'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
>>> -                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
>>> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
>>>       return build_vars + [k for k in d.keys() if k.startswith('QB_')]
>>>
>>>   do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 4e05c1bb15..7d1f85f357 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -460,6 +460,10 @@ class BaseConfig(object):
>>>           except subprocess.CalledProcessError as e:
>>>               raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
>>>           os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
>>> +        uninative_path = os.path.dirname(self.get("UNINATIVE_LOADER"))
>>> +        preload_items = ['libdl.so.2', 'librt.so.1', 'libpthread.so.0']
>>> +        preload_paths = [os.path.join(uninative_path, i) for i in preload_items]
>>> +        os.environ['LD_PRELOAD'] = " ".join(preload_paths)
>>>
>>>       def check_args(self):
>>>           for debug in ("-d", "--debug"):
>>> --
>>> 2.20.1
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#161382): https://lists.openembedded.org/g/openembedded-core/message/161382
>>> Mute This Topic: https://lists.openembedded.org/mt/88916306/3616693
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

