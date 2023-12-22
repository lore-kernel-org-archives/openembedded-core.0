Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19E9C46CD8
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 09:32:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.20029.1703237557641141493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 01:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GpQkiRle;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c2308faedso18137775e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 01:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703237556; x=1703842356; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4HiV8lK4F3AyHsUXshZLxi7e9Kqo++XDPzRtjNThiY=;
        b=GpQkiRleBCKndgSGj1210qF1lKMSb7CPFuIP/y2xokNXkFZXClayawmSLNv7sf/ah1
         mDc72ctkv1RBO5revqfKgIkdn9NixCqB2kI/xY7+MxZHFjWlI7xNo8CfVDXgv02q9Suj
         1TIPR6s83N/+xWOWek94egjP02QW2W+ezSg2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703237556; x=1703842356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4HiV8lK4F3AyHsUXshZLxi7e9Kqo++XDPzRtjNThiY=;
        b=GcYiPHe6eUREzdw5SxoIiPhErtZXw8hYUKBEbgggbVpbh6VGLgZCeZydLFYAKrGYkJ
         kdfO/u22mHMx3faK8H9WkfCQ2xh4LBbdUk3pQcFuSd4rqLNdhkj+LKHywM9oKt1vZM8/
         OvhOvZT18MmyGxM5bANgz5xL2FuZjdSWhGlTbDAJpaGALWlmColWwiKwDbxttP9OLgwl
         liuj1mWYlHEBEafDGwZyRDhV5UhRTA/Ujyf+vtR/1O8hx5flcgFQAYqEOX0kbHsFWb5W
         PxKSAc+tVx8DHQPTiZci3aecKHyAv3vQ6tVnrWz2LoALs6qgqu57IkWQUnN52+oG1goO
         OPHg==
X-Gm-Message-State: AOJu0YxNvHPKCWaBUCDrzE6ioFyd0IkZe6qevHIERmKtNl6Ac8In47AQ
	zZR+t1gcCS6GhAocjXt+C0ZJJts6OACBpA==
X-Google-Smtp-Source: AGHT+IGrRoOle6kzw0RoRaFW4soOBFfyODfoBeFeeLThtTmttZJXV42VBcLeJAj9k6LatxRXKicP+g==
X-Received: by 2002:a05:600c:46c3:b0:40d:11f7:286d with SMTP id q3-20020a05600c46c300b0040d11f7286dmr618199wmo.159.1703237555918;
        Fri, 22 Dec 2023 01:32:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:70b6:ee94:fbb4:f7b? ([2001:8b0:aba:5f3c:70b6:ee94:fbb4:f7b])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b0040d18ffbeeasm6357091wmg.31.2023.12.22.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 01:32:35 -0800 (PST)
Message-ID: <ab32ec27d4d912cb5bb6311b8e8db73cbbbe6061.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: Only sign packages at the
 time of their creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2023 09:32:34 +0000
In-Reply-To: <20231222060932.1504845-2-tobias.hagelborn@axis.com>
References: <20231222060932.1504845-1-tobias.hagelborn@axis.com>
	 <20231222060932.1504845-2-tobias.hagelborn@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 09:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192866

On Fri, 2023-12-22 at 07:09 +0100, Tobias Hagelborn wrote:
> From: Tobias Hagelborn <tobiasha@axis.com>
>=20
> The purpose of the change is to never sign a package not created by
> the build itself.
>=20
> sstate_create_package is refactored into Python and re-designed
> to handle signing inside the function. Thus, the signing should never
> apply to existing sstate packages. The function is therefore renamed
> into sstate_create_and_sign_package.
> The creation of the archive remains in a separate shellscript function.
>=20
> Co-authored-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Tobias Hagelborn <tobias.hagelborn@axis.com>
> ---
>  meta/classes-global/sstate.bbclass | 128 ++++++++++++++++++++---------
>  1 file changed, 87 insertions(+), 41 deletions(-)

This code is quite critical so review on any change here needs to be
very careful and that is why I might seem to be a little hard on this
patch. The fact this completely rewrites the critical section worries
me a lot and means it isn't an easy to review change.

We tried to keep this code simple deliberately due to the number of
problems we've had with it in the past.=C2=A0You have to keep in mind it is
one of the few shared directories we have where other builds can be
reading/writing the files at the same time as us without locks.

The fact that you have the force mode of operation is setting off alarm
bells since we have seen build failures where an existing file is
changed half way though a build.

Another example of how this could re-introduce issues is that it looks
like it will make it easy to break:

https://git.yoctoproject.org/poky/commit/?id=3D47cc6288280bd38f42851d6423a5=
ffc95a46eea4

again. The code:

+    if not sstate_pkg.parent.is_dir():
+        sstate_pkg.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)

will happen to work as the previous code should have already created
the directories correctly so this line will do nothing. The fact it is
there will make it all too easy for someone to break this in future
though.

When I added that I deliberately didn't rewrite other bits in python
because I knew what the race issues were like.

The directory creation and then moving files from the directory is also
a concern as it is potentially going to be much slower. If you have
something like the sstate on the autobuilder where the directory is
NFS, creating temporary directories and moving files in/out of them is
expensive compared to just renaming files.

Another race that the force copy of the sig as written isn't as safe as
you might think as it can still race with someone else copying the file
at the same time. You probably need to move the file into place, then
check that the resulting file is the one you placed there and if it is,
only then move the sig in.

I'm also not thrilled at the need for copies of the datastore. From a
style standpoint, we haven't really used Path() in OE/bitbake so that
is a bit out of place but I guess people are going to do this
inevitably. The variable naming "verify_sig" isn't really true /clear
when you're actually signing it either.

Cheers,

Richard

