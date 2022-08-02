Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CFCC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 16:19:53 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.8376.1659457190806880257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 09:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkhMYzjk;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id y23so5823303ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0uLxEjgKy+rIyqZ6yKC80vDW2eXCyEkKCJwd3a+wDaU=;
        b=UkhMYzjkCe+9FdiYUqWQ1rdJVtSJmQHVqXW+sIXs8+gbsmwRdqFFUbcnaSs6GuTLyn
         KQAatHYBm35WQfJT8uNORVjwOFpyc0k7Xs/F+isrllFIaOyzZdQlAk1ijMYS1cflUuRd
         zruE0KR8mklD6Hou8xGa22Qp+cWwtLP3ZONi4uLQMz8cyov4duOmbL+b9EHbJi6jPI2e
         mQYTYX9/Kz0Ix6jkXjf5pr7wzR3lh/pEF7pZ0Zylhf0EOnYE5nzo5m10a4P76mp9p8D4
         jHUTMttvwv4m4trWbIO5atDJAwhOanRW7KzpnMoWAjzY+h3muYFHOBJxniv1JRooCKYR
         8U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0uLxEjgKy+rIyqZ6yKC80vDW2eXCyEkKCJwd3a+wDaU=;
        b=GAcQj7+ia5BIzRXVFa01Y7RHk4kPcQ5C/oStI9QAhir2UXbycgyaPztWAMOOISE3F1
         Rk9ivlM0YLYHVSPDsloBZp4gxSXY/+djvyLHGyg9Eg9gFA9wbN4GjtjB2/o0rBnq2OaD
         qmjk439UuEiUSlsZJp/lX4xwEIFtlUqUtMVlIY5Vc2WNxpYn3tnbHQWOZ9Y4EzHEkFH/
         JoBsS6/4QTCDQu4ZVLHEfgBHG00jJ/d2/o62r60nDSAWHRJ62R4FHeVIeHfcQv14Sskc
         hY2aWH+O95PC/Evh2g2WYdvL3d6PIctumsit4s9J84SHB2OiQLlJ9Ni+UCp9uaVPxBAe
         0trg==
X-Gm-Message-State: ACgBeo1rURQQtUXwPnXkIbn7rixsw+6yDceaJIP1rDthylA4FIeDumRq
	UzbXTB1SPiMXrCfxYP2gdcs=
X-Google-Smtp-Source: 
 AA6agR7Z8NZ5XtwL24mGQ8pyyayAHXsSvWVRlPfPw8iiQ3o4cuOQkHqiaaFAOOcTFOAPTtpYq/xOxg==
X-Received: by 2002:a2e:80d8:0:b0:25e:55c3:df20 with SMTP id
 r24-20020a2e80d8000000b0025e55c3df20mr2351263ljg.374.1659457188930;
        Tue, 02 Aug 2022 09:19:48 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 w2-20020a05651c118200b0025e01ee7229sm887866ljo.54.2022.08.02.09.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 09:19:48 -0700 (PDT)
Message-ID: <5eca86e2-e690-3547-c35a-624fe2afc6b2@gmail.com>
Date: Tue, 2 Aug 2022 18:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add shared_workdir_prepare task
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io, Jose Quaresma <jose.quaresma@foundries.io>
References: <20220720113043.196185-1-jose.quaresma@foundries.io>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220720113043.196185-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 16:19:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168794

On 7/20/22 13:30, Jose Quaresma wrote:
> The task do_compile_kernelmodules runs after the shared_workdir and
> is installing some files in STAGING_KERNEL_BUILDDIR, this can races
> in other recipes that depends on "virtual/kernel:do_shared_workdir"
> as the STAGING_KERNEL_BUILDDIR is not fully populated when the
> shared_workdir task ends.
> 
> To address this issue a new task is added in place of the previows one
> so the shared_workdir will run after the do_compile_kernelmodules and
> the new shared_workdir_prepare will replce of the old shared_workdir.
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   meta/classes/kernel.bbclass | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5d2f17c3be..5558769c92 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -504,7 +504,8 @@ do_kernel_version_sanity_check() {
>   	exit 0
>   }
>   
> -addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir_prepare after do_compile before do_compile_kernelmodules
> +addtask shared_workdir after do_compile_kernelmodules
>   addtask shared_workdir_setscene
>   
>   do_shared_workdir_setscene () {
> @@ -520,10 +521,16 @@ emit_depmod_pkgdata() {
>   
>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>   
> -do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
>   do_shared_workdir () {
>   	cd ${B}
>   
> +	kerneldir=${STAGING_KERNEL_BUILDDIR}
> +}

Does the above do anything actually useful ? I thought neither the 
current workdir or a variable set in a shell function would be preserved 
for the next task ?

> +
> +do_shared_workdir_prepare[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
> +do_shared_workdir_prepare () {
> +	cd ${B}
> +
>   	kerneldir=${STAGING_KERNEL_BUILDDIR}
>   	install -d $kerneldir
>   

Jacob

