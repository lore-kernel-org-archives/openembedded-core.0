Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87779106ACE1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:01 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.890.1773343075387820066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InQW6dmR;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899f5d337f7so18603066d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773343074; cv=none;
        d=google.com; s=arc-20240605;
        b=BdSIYADaV/TujBjBiUJEUie3iuNHohR+hlJPPgBnpl+7jlzqL6+0M/VHnsEQjHLezt
         rHMyrdm9qk05k5rsm+KfMstcg8E+a5lZ7G2wGSWiAXwE/r0FEak2T5Q/T0sA4yl2sWbE
         i9DTOUgL2FLdBueWu9IuKEsyrhwZ6vXy5P4KEEiWGkzZQU+mn3ExsRy7bg3//cen3kos
         qPiMIAy/pxitBCvXl4VzHq2ER79b8gHrCgFzMPab4kAmclVqsVXqvukpnoJgZ8k5NvRZ
         DQ+GRS0vhEyUIIfsRPfOfjt294L+q3fvYWMKqi9M/zgiKj456RDL6BAOuj+bQHtQhAMN
         oOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXgQbQZz7mXdwX8aX3/9afrAQWN1KaUjyfHDYQ410KI=;
        fh=jy5O40tKqQBIJDrTmLq/BNY6voC+bUHP02kFbWI9X+E=;
        b=a4ywZ5ULr3GC1vudMc7OldtaEeJ47rlMNpWROhWO4GMQI4j+kREiDwjHjel4JutZad
         LegbYbWIrzyc0n67wB5hH/2SOujnMHepIYCnkuedW4cb05CKWnQZ0bOMoIPmR5A2mqxJ
         gD+YOyjuWhMiqpEA/VQrocehas+EopclbbPr9pJTpMM7pM9aMAjg0wQmwSBitJKoQIbZ
         3AimYoNXh4rylFlOD8PnoJFzBsb55nW8JKrkSSHnP5kBNI8elsEZmCxsTiK23VVLrGpd
         PSnOGsAJBU3fMkyj6NNyrcvN2vvVJd/XyK+aHl87uifx7vX1aFk3U/Z9zS4/RGQSXJg4
         0vRQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343074; x=1773947874; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXgQbQZz7mXdwX8aX3/9afrAQWN1KaUjyfHDYQ410KI=;
        b=InQW6dmRYjyGByDl9G+WRurLapbUxdtrfJtJNjeb66+jbiLOSMQ++ZPos/hocVAZWu
         Ti5opjBfssSPgqaQcw/bf4BJ4Mpyx0cY/ZTJi5eHC9X5JIZqELYQjpybibYl9Z2Xv2He
         VHL3MWaZWrgoYCsKtNRIGGRR9g1hqb/1VQ/ChbITzdpM5t4/fujCZGNzTMpZNN39Mw+0
         tHyXHEst37fmDU/W/TF5xLimhyoKXBOCqJgcj5IcUuid/cyhnbqeGP9Obeq49NepaHrs
         in7Zz5LWsVWLM8tWWKFEg6doFiHRjBzH3Fd1hL2SZxSx5laDThSjVaIG7+Sx6RrVK2fR
         2f1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343074; x=1773947874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXgQbQZz7mXdwX8aX3/9afrAQWN1KaUjyfHDYQ410KI=;
        b=cYt7earYTZdN2IRX4UFWfZEEM7aDl5wL5Aouf4PZIZsRGSet5jTpj8mQzBxcJw8U4d
         1RKqIgdzO816JZyDVMr/Jmd/I2KFG/ubN/UkQbiwG6zTGWoku0iDAOcrzK3HduRXhHfV
         CPTQ/nbA+4VL8T3GvQAyAd8wSzTZ4bDTtaa0Pw64wwx5Gb5hTLBVuqWoVgGUrRIj9cm2
         hdxdsmgSwLJXQ4bZbWVy9kj307+wt+zrvW3BCOH3dn1u4XnpwJOPAdjfdN67JM2f+AhJ
         PDjN2R+uSUbs5RAoEkHCPg2xSwo40BsgSrik9UYT2ojLPvB7xQ97ytvcZHjnWB5CP3IM
         eUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2TIbnyFMY/LMGclfgvB9AAhO5A6CX5OkagwCe0IvIjQ4yrYCpNMlxZHlilyKACJTrS6O439477honqdZVj7QS4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDN33s/X0j2/mjP1RfrTCwU43YWwc6xdbz1KT+GV476eGUoWnq
	JsOmepXKdbYpk16oDhgXHvGg39mZs+JwvbJIb5qr4j4bulv6Ulq0IBccsvEFNX9zf70bmFFu3ee
	wk+VgpfrdQZBBaGdW6CN4AcKYUO/uPzanaQ==
X-Gm-Gg: ATEYQzycyhoFYOszd0hdq8QrrbIvnHZlrHH00r6F1TyKHvgYbycLqgTN/zONmzpcOE4
	dkdCLtPuN9B0S5Sr7kK6XUFPHZaUlSkWPZ51T+tiXAHJvCw8DsGRWl+xtk/WBMIlwC5kVogHO9m
	yjssYubPtdFRMCVMnA62szc50SxjUYoch5JGd10ys8n/Tlqgprjq4RtsKdGph8/SOAMZLRpkus+
	WZNdfhU0iLasoDXigFn5ouy/i0n+XSyA8ZpmEHmmKNn4hg9LLDRXT9eIDjDTJi6j38vVwwo8r5c
	F4Pcs3vxwCUL9FS2v49R4v1sUZOTfypgDbiiCtuck4gk5zLdmxaO
X-Received: by 2002:a05:6214:2629:b0:896:fb99:f692 with SMTP id
 6a1803df08f44-89a819a7f6bmr15880466d6.0.1773343074314; Thu, 12 Mar 2026
 12:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com> <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
 <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com>
In-Reply-To: <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 20:17:43 +0100
X-Gm-Features: AaiRm52yXeHrc1UrZoj_mrtHv0nBHOymJjIrT-g0TWgX5cUKTDHD99Rt0WfRMhM
Message-ID: <CANNYZj-UY4DVgPbs9RtnCo3g9mxNu6Vh7WbhzXjLeN67J3qHaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 19:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233002

On Thu, 12 Mar 2026 at 20:07, Randy MacLeod <randy.macleod@windriver.com> wrote:

> Hemanth meant to reply saying:
>
> Hi Alex,
>
> Sure, I'll do that but since we're in a hurry to get the glibc-2.43 merged,
> I'll keep the existing status and follow-up with a status change next week,
> once I've had time to submit a patch to upstream barebox:
>   https://github.com/barebox/barebox?tab=readme-ov-file#contributing
>
> Right Hemanth ?   :-)

No problem :) Note that v4 also does not address a Pending patch in
ltp. I made a comment to v3.

Alex

