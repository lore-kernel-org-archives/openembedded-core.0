Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDECC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 11:08:55 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.13213.1739358525948514367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 03:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aAA+FDh9;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e45af17a2eso1806556d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739358525; x=1739963325; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+qArZiQN6wj7P9IogGQ1xMnJnJloQZ37wNU3MeVGqD0=;
        b=aAA+FDh9x6Z5ubjC9RotOd87fqht3VcxAY7C3LxI25Xkl5fTmEfLG1yuiNmMloDk29
         ONcK5bbvERiPqKZ6xDn0eqSi+lArvz0ZadzcKG+ZSOBfvdyVqsME40C9ZW5D48L+RSJ9
         +315tUMzywZbHO2lTB53KKSakvv9pC0xxF1O29eME7SY/HLRf+WsDypP2syEQpHbH5Uh
         8lMiMiKVggVe/PAOJiQ+9hHe6IsBfCv0khSGloAuYIYU9X0SkiwY0Wpb5AB3ij9KREyV
         CiGB3jiNvOlAk+1JIbaJj4O0sS4lRgYmWvqIdDdGZTvveFUaQ7OoEL0R4Bgw+wIMh34H
         ja6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358525; x=1739963325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qArZiQN6wj7P9IogGQ1xMnJnJloQZ37wNU3MeVGqD0=;
        b=kSZkTHlcrwSvCnfruia21+YwZ/Mqo4M9axI5ojEJrCSuZiiRKBVDGLOuE+LWxMAHn2
         gChMx34I4B9AMQUN7tobi+5Z7WBnIYREAd5R/bAZxe70J2/XH8NTBNrbkmS8plOi6bAh
         XOBfmvpHwVyMZ8Y/qI64Dm/Lq4NwNNq3aNJfXVPrcGvbOrg2SggHexRENZP0qfAXc6y7
         okdxlh/XzAzsxf0nde41fM7RueRQhgYC45WF5Gqb2Jdyw97M9K5Xk/D/SN0dCm3qYwX9
         5bPMwp5McjgUN05XparifBoXydRRotNmSK29pf+84JAj8LEB+lvtiohNNPhK+V8G2AzB
         ciYg==
X-Gm-Message-State: AOJu0YzYNgVY971Jayk1KduOBrZBhBCxrBRVdzmZy/fDUcIJ3VHzK+VR
	QMk2kP04WCnfq3R0s2cCKUyZZBIMNfBjBjPfipOfS6jQ9c96KlBImfosa4LeSYJWUx8umzLZhz4
	UCCcATqhz9wRaTS/7RC5E9U+nH8SNBQ==
X-Gm-Gg: ASbGncs+gmOHK3dg2L5xKhy3zj0s5YsEddefDwwYJWZFxgDgHfpI9M44fs64tpP1SCR
	MtTU3d7k/G52j7I4gmYSLx89G92me4ZHU+/xPaDJ3dPD0zA/PyfLvzoqKGvxMypo2sZkcduo51Y
	L1rv4iS5roPX9ivoX/c+Riwme5259lHSU=
X-Google-Smtp-Source: AGHT+IHuJ8f7rqRllbx/3vOYW10TvouqCt/6OTMqyVOqK4Uev4aj6KxexeK0ATvAW3zFk2UIEqozehOMtAAikQ64/K8=
X-Received: by 2002:a05:6214:21ae:b0:6e4:442c:2888 with SMTP id
 6a1803df08f44-6e46edb5199mr39064046d6.39.1739358525083; Wed, 12 Feb 2025
 03:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 12:08:34 +0100
X-Gm-Features: AWEUYZlfopx5vUJnbFwpmJcgy713s3LP2WzL-qslXl1CpgZ0-n3TSwsZeXf8sL8
Message-ID: <CANNYZj_NRnwCXUm3zA4QX9pTdF_d9xOi=x8CVW=1XCtSSWo4ug@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211225

On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
lists.openembedded.org
<stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
wrote:
> Add support for early fetch, unpack and patches task which run before
> normal patch task. This feature is useful to fetch additional
> dependencies based on a patched source before the normal unpack and
> patch tasks. The patch are marked as early via an early=1 parameter. An
> example use case is a patch for a package manager lock file (Cargo.lock,
> go.sum, package-lock.json).

Why there is a need for additional tasks running before regular tasks?
Can't we do regular fetch/unpack/patch for the root item, then run
fetch_vendor_dependencies, unpack_vendor_dependencies,
patch_vendor_dependencies?

I see that others expressed dislike for any additional tasks in
principle, but I don't think that can be avoided? You can't know what
else needs to be fetched until the root item is unpacked and
inspected. I'm ok with that if the additional tasks are clearly named,
and implementations are short, sweet and obvious.

Alex

