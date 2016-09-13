Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E90D731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 11:09:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b187so17752791wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 04:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kqNRjn7bVXaH1FBlvG+VGN9HNIy4Ohi2cYpTHQZ1pjM=;
	b=mWODdS9I3tkRH+lRqyuK+zYHvAClzLOY/P09MhGhZzi/dBSUxCDYWNx3rqrvaqw8Fs
	Amj1zVu/wKubccL88shjw4Bz7iOzDXYpTgYwEahgDK9xXfv+BMghcEldBZRTRjeqDU1j
	bfH2Ct3lT5u/mmmowxwZ1hra8Y55oDPX4YqbCnbfBnW2yrYIC2DuGvSkcS1PTI1yHSYx
	3Dfmy2ZRUya8uunG0ft9EWYGT+MnRtBiA29PajplcrVSgd5e3jKSl32oCInxMu8emjIv
	+BX08Eo6FWcISdZdQ9nLLiaEHYWyA4dT15eKtVOTnVhHvJgXvvcNNC3YDn6BVgpSjeDE
	IpTg==
X-Gm-Message-State: AE9vXwNRLR1evP9ka0cI8HDgQaaESPyQkUdqHbAp6zX639ZLqPb1zD8/TQYgUj9kCSifRw==
X-Received: by 10.194.23.39 with SMTP id j7mr19212863wjf.4.1473764986265;
	Tue, 13 Sep 2016 04:09:46 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v189sm4780630wmv.12.2016.09.13.04.09.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Sep 2016 04:09:45 -0700 (PDT)
Message-ID: <1473764984.5279.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 12:09:44 +0100
In-Reply-To: <20160913090710.22945-1-git@andred.net>
References: <20160913090710.22945-1-git@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel-yocto: remove do_shared_workdir from SRCTREECOVEREDTASKS
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
X-List-Received-Date: Tue, 13 Sep 2016 11:09:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Ignore this. This doesn't yet work as I intended I think.

On Di, 2016-09-13 at 10:07 +0100, André Draszik wrote:
> Various recipes depend on the kernel's do_shared_workdir
> task, a quick grep suggests all external kernel modules
> (via module.bbclass), but also perf, and potentially any
> additional headers as outlined in linux-libc-headers.inc
> are affected.
> 
> Having do_shared_workdir in SRCTREECOVEREDTASKS means this
> task is removed when externalsrc is enabled, making all
> those recipes fail as the task they depend on,
> virtual/kernel:do_shared_workdir, doesn't exist.
> 
> Remove do_shared_workdir from SRCTREECOVEREDTASKS so that
> all those recipes work even if externalsrc is activated.
> 
> According to the comment in here, the reason for
> do_shared_workdir to be removed as a task is because it
> modifies the source tree, but that doesn't seem to be
> case.
> 
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
> yocto.bbclass
> index 82b9210..53659f2 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -1,5 +1,5 @@
>  # remove tasks that modify the source tree in case externalsrc is
> inherited
> -SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches
> do_kernel_configcheck do_kernel_checkout do_shared_workdir do_fetch
> do_unpack do_patch"
> +SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches
> do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
>  
>  # returns local (absolute) path names for all valid patches in the
>  # src_uri

