Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14585C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:57:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.9030.1639151824151400408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WiEotjLi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u17so15690879wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=renWZAcuWLo+W6ZFnh2oCTfNGpIJnkapmxO5KYawiKo=;
        b=WiEotjLigCNxut12/JhxoeWhRBdynjUfil4DvYGJUZJKTVoWfrhBA/qElZWaNE5C14
         9vDNrf7yidPTov83lkWVmxtZmsNXeBe4C5Q5VecepsHQ85dytBfRBoJxpa3DojpKSAGs
         ac4tA9OkrgYPEnN2+rQOHwTUl4Dsz3bvvjWHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=renWZAcuWLo+W6ZFnh2oCTfNGpIJnkapmxO5KYawiKo=;
        b=c72zrJnYk3e2XKCzygubZz4G0G1P9k8GmQjbAPAviGQ4p504bwVn3//yCVMAJMTkx+
         qp9GH0ONnApmgiyyQYTI1KJH7++JoQ2F3lbyc+v45JfNTB05REb9r5LEuSjrl0GeIBgL
         qUXzl3cTcJmuBFpeZPG18b+kU/UmCDvpvJ/xvwmPBBcutp4dRYj0gRv6R4J2Co+m25Rl
         ylg5JMcTqcuzRQWk5a1R0Zekf4ImF2Mxe2IPq9ku/SOxNLFa7W7RaPeC5AANQFTVRpmj
         S7Y/60en/xfmofJHAfXFBxmkgcJNLx5aFd0LtAhimBAbA2wA2WjnBEKiJofiCPsDzbQj
         44zw==
X-Gm-Message-State: AOAM5313166z7g/ZWW4SC7FY7TQC9pxwWgNGzK5B309oZo39EJJXpPqV
	2eEcNEPToIv+sZtCDyebbXijpQ==
X-Google-Smtp-Source: 
 ABdhPJzVFbfyVs5f1oUPenM4KZ+7QUrvhSK3doys1gtoyTLYBw99tY/cGB79WaVNRB0bjCceRygTxg==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr14774503wrk.225.1639151822699;
        Fri, 10 Dec 2021 07:57:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1746:a8bd:1fb1:93fc?
 ([2001:8b0:aba:5f3c:1746:a8bd:1fb1:93fc])
        by smtp.gmail.com with ESMTPSA id
 x4sm11964000wmi.3.2021.12.10.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:57:02 -0800 (PST)
Message-ID: 
 <b2a5cb5f05016901b1c9d56e0d68f939c549db19.camel@linuxfoundation.org>
Subject: Re: [oe][OE-core][Patch 0/2] implement applying patches from a
 directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Date: Fri, 10 Dec 2021 15:57:00 +0000
In-Reply-To: <20211210130458.39716-1-max.krummenacher@toradex.com>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159550

On Fri, 2021-12-10 at 14:04 +0100, Max Krummenacher wrote:
> The current developer manual [1] specifies that patches that are
> part of a directory which is given in SRC_URI are applied by
> the do_patch task. However that is not implemented in the
> current code.
> 
> This patchset implements that, but deviates from what is
> documented. If the patches are applied I will send a patch
> for the documentation changing the relevant part to:
> 
> ```
> If you have a directory full of patch files and you want to
> apply them all you can add the directory to SRC_URI and add
> the "apply=yes" parameter. This will apply ALL files in the
> directiory, including files in subdirectories.
> The patches will be applied sorted by their filename. Files
> from subdirectories will be sorted into the list at the
> position given by the subdirectory name.
> 
>    SRC_URI = " \
>        git://path_to_repo/some_package \
>        file://path_to_lots_of_patch_files;apply=yes \
>        "
> 
> In the previous example all the files in the directory holding
> the patch files would be applied as a patch.
> ```
> 
> Max
> 
> [1] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch
> 
> Max Krummenacher (2):
>   lib/oe/patch.py: apply patches from src_uri specified directories
>   lib/oe/recipeutils.py: follow changed method argument list
> 

Can I ask about the motivation here? Have you a use case you needed this to work
with or are you just making the code match the docs?

I'm a little worried about adding features like this which aren't commonly used
and clearly haven't been needed for a while. Such changes really do need some
kind of test case and as Bruce mentions, ordering of patches patches in
directories is a concern, you did at least sort the listdir() output which is
good :)

In the past when I've needed something like this, dumping "ls -1" into a file
and turning it into a SRC_URI hasn't been too hard even for long lists of
patches...

Cheers,

Richard


