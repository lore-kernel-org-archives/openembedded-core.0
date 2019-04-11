Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 07ED47D598
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:38:12 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r24so5388093ljg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9whnmC/WbtEk/azRnDCXqg2t9RTpZuCZuHTOkAcRc8M=;
	b=bBnmJ6HS10EU9qOe3DfXGltd4HX0m3YBMsLQ0SuC5EgBuwi0cy0ByCPvHRgHMLT5bH
	dsXCpRO3iwTNRe3hxiVwA196jc5krfbxcjSv6JhmGW2Ro0kKgTdGeQSHYG09iND0QHPb
	hQoP7SsniE6OorW+srfd/pOjEX/Y5Pfhriu2BAvXn1nZ2/Ckbl8XszGr2crsdGImv/1v
	wfHZ73nMztqKhNtV59fRN5Wli+DuRpkakxZjN6DADhh/BF+uiM9qDIZOcp578nKlJp+I
	nMauviKW+j3y4pPRdU5SqKpkGMgGvp7CbPK8613BQknVJJr0BbNmjxq9q8mdAllllF+S
	Y7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9whnmC/WbtEk/azRnDCXqg2t9RTpZuCZuHTOkAcRc8M=;
	b=BqAmZDicNPqY/UCDBXmd53nvsJJYUW3+XzRDIwrDLWJpmtuk2YPdS7x7gTOFBP72Ex
	puQyZ1ns3QqrhKNSc79+RSnXlK7Nm86Y+gyUIq7qgcP1M00u8Qa/oI9+dtOmrTkxHupV
	BNhXMkptu86imrA6mNBSbX/wQZY3JtgKf/ija72EP7m9DlZG9cx/WkFriClMADnxgwSM
	Y3NxKcUWa6MMOincbaFQCF51EcCsCJuZoDpXHVOzO+ljbLS8uc/YLqPdU7Gj1geSc6ez
	mu9qG86+PEOwJ6JXVxvGlEXbTBuC8ANfDlDOCnVWGlUyYTPTk0i9WV0++v+Sc1Q/VC7t
	vUnw==
X-Gm-Message-State: APjAAAXI3oR4fFds4480tU2sScx6RQA5GLy7LF9FbwS60hwFzSa+8/ii
	XM9zllmxJJ7wdmkDug49k0WRqzj+iNIBl+eY9Oc=
X-Google-Smtp-Source: APXvYqxGUmfYq+Ese6eKjl2NZ2NkXBioQkf1d92xI7NZ//0topMcq1Jj7f6hu7CaL20fe0ZvXOJoBOHppbKV+mODQiU=
X-Received: by 2002:a2e:1311:: with SMTP id 17mr15336981ljt.75.1554986293423; 
	Thu, 11 Apr 2019 05:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190411072854.31885-1-beniamin.sandu@gmail.com>
In-Reply-To: <20190411072854.31885-1-beniamin.sandu@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Apr 2019 08:38:02 -0400
Message-ID: <CADkTA4PQm-kcEh_XzrWxNeHo5OFXn0B2pt8af39PT1PZJ=0_Pw@mail.gmail.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH v2] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Thu, 11 Apr 2019 12:38:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 3:29 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> The kernel-devsrc rework doesn't take into account localversion
> files in the kernel source tree. This might result in modules with an
> incomplete version magic when building out-of-tree using the SDK.
>
> Before:
> root@qemux86:~# insmod hello.ko
> [   42.000212] hello: version magic '5.0.3-yocto-standard SMP preempt
> mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
> SMP preempt mod_unload PENTIUMM '
> [   42.008200] hello: version magic '5.0.3-yocto-standard SMP preempt
> mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
> SMP preempt mod_unload PENTIUMM '
> insmod: can't insert 'hello.ko': invalid module format
>
> After:
> root@qemux86:~# insmod hello.ko
> [   39.094288] hello: loading out-of-tree module taints kernel.
> [   39.108044] Hello World!
>
> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>

Looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard, I assume you'll pick this up directly and don't want to wait
for me to queue and send it along with my next pull request.

Bruce

> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 69a8eaef81..5ec5929735 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -228,6 +228,9 @@ do_install() {
>
>          # required to build scripts/selinux/genheaders/genheaders
>          cp -a --parents security/selinux/include/* $kerneldir/build/
> +
> +       # copy any localversion files
> +       cp -a localversion* $kerneldir/build/ 2>/dev/null || :
>      )
>
>      # Make sure the Makefile and version.h have a matching timestamp so that
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

