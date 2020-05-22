Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17315.1590166972338877176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 10:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TWQLzN7m;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id h21so13817313ejq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=K/2u99ANMOlNamwU1YzcJzi7ACvqOJZV3Mwhi0gCsM8=;
        b=TWQLzN7mmVSG172sLQREZQiPj9jVQhNkr/Lo2DCwmEcPBH7HVhRgKIkdtuEOx74y7I
         XMnfK4N7rpjbjY+xylMw7hyyg22u0uNkKVyP/ZAy3cGxdjlQ/07ayXbMIme86BwODX6V
         2r5KGowwPHUOpJWzICuYg63ffXTromB4A7QYblk6M3HVl+1T06HT7duSbr/4kxGV1HO6
         EU2r4WZl1fNdweFrVQvZ+r5QuMezSUDO7DurKPw4B9IlP9RQIDeGKZLO0oAHY1RDJNhQ
         xW/4jMA9NdwAGfQzcMaC7ks2E2vwlepFu23suw+VeEE+zXvYMUefPIRMceWRD2jdQr8M
         +kVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K/2u99ANMOlNamwU1YzcJzi7ACvqOJZV3Mwhi0gCsM8=;
        b=ob/vYRewIPXR3BMQaFRKr8tDrXdXSabg1+m33JDcQgURJzxWe6Hp5e6E4YD/HUupx8
         O9SvyfReV2CtvLyZ48R8O1NwEeUXhQhNWP+ddjeqy9D6CK8vmKAgECHd7WQj0+nxIN4S
         2Xtx6Vtzg+AJGuaGF8dWhWw5WBfp8JbkqUzI1MFFSSm+cwXtR9wrL0ezAk6DxzPOddL7
         DKYtU47KhDQ6xzkHO4E96Bqb+VCqMzkOi649mJsRLvr9odqxeQYQouIFnDuoTACW52X6
         YIvAw/smW3yjIzuM9/xqRlBPPLu5bhZbl6rmAuHJmP2/0Lz90bn6nrArcvDabdjlmL8g
         F6mA==
X-Gm-Message-State: AOAM5311gBA1m2C563+CkIohhxtB6V4VGaOayloaO/Fcw64GUi0cOOCH
	spPWWfXd3gImjsfOVzM5cz/nfgrh
X-Google-Smtp-Source: ABdhPJwAp7qmYqu2K7VkVT+ZbtY+jEp2zrLXHn+tBZtr2VibOhBzA/Lovokr/P59tGUtJWonlKYuvw==
X-Received: by 2002:a17:907:1002:: with SMTP id ox2mr8764528ejb.189.1590166970422;
        Fri, 22 May 2020 10:02:50 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id n11sm8394399ejh.39.2020.05.22.10.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 10:02:49 -0700 (PDT)
Subject: Re: [OE-core] rm_work causes image tasks to re-run
To: yocto@mac.mcrowe.com, openembedded-core@lists.openembedded.org
References: <20200522081359.GA1428@mcrowe.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <b1fcf4c9-9d0a-742b-fa36-1325b09457a1@gmail.com>
Date: Fri, 22 May 2020 19:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522081359.GA1428@mcrowe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mike,

On 5/22/20 10:13 AM, Mike Crowe via lists.openembedded.org wrote:
> When we have rm_work enabled all image tasks are built every time. This has
> been happening since at least warrior and is still happening as of master
> today (8fc19639f47b959a141dae231395bbababa644e1).
> 
> Steps to reproduce:
> 
>   bitbake core-image-minimal
>   bitbake core-image-minimal
>   echo 'INHERIT += "rm_work"' >> conf/local.conf
>   bitbake core-image-minimal
>   bitbake core-image-minimal
> 
> The second invocation of bitbake doesn't build anything at all (as would be
> expected.)
> 
> The fourth invocation of bitbake always builds:
> 
>   Sstate summary: Wanted 43 Found 43 Missed 0 Current 436 (100% match, 100% complete)
>   NOTE: Executing Tasks
>   NOTE: Setscene tasks completed
>   NOTE: Running noexec task 1750 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work_all)
>   NOTE: Running task 1998 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_populate_lic_deploy)
>   NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Started
>   NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Succeeded
>   NOTE: Running task 1999 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work)
>   NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Started
>   NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Succeeded
>   NOTE: Running noexec task 2000 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_build)
>   NOTE: Tasks Summary: Attempted 2000 tasks of which 1996 didn't need to be rerun and all succeeded.
> 
> If I teach rm_work.bbclass to also skip files matching
> "*do_populate_lic_deploy*" then this problem goes away. However, I have
> form for breaking things in rm_work so I suspect that this isn't the
> correct fix. Is there a better one?
> 
> Thanks.
> 
> Mike.
> 

Since I'm the last guy touching rm_work.bbclass ...

I don't see the rebuilds in my images. Although I do see

core-image-minimal.bb:do_populate_lic_deploy

being run, there is no regeneration of the rootfs images.

Do you have any more information about the setup so that I can reproduce ?

/Jacob
