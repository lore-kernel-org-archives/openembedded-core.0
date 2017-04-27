Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 35DFF77DA7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 18:55:42 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id w50so4779883wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E8yeL5yMXD53xyI80Ij1JXsq+Yd6Z+n9gV5laxwpi8c=;
	b=thmlpWsYB8iftfxsZK14Cdtl4EYzqZQStomkoN74xTbjd6MuyfmpqDola7h5QFU1Py
	i5tZDTryPFLprRpsfe5GfFxwwZ8pGZBFbsRi1oaAYOBcB59pqi4J2B+H+FnmTxcwG2YN
	P4PPQOxSeepx9eVzlKwmndg2GUihFsvKeyQ743hPdEx4rtutWWEngnNC36bb8QCPaN8W
	5Ii5eTyGht+LXCZIpa7E5dgaj0ASJnhyvTQPgTagcXfgLJpSlRBbqePqhvxe3dFJHx8o
	riQX3vDQXkTHflAYznZ4Mq9Yo/vIe3ZrWCgSzLXZEpKyRGR58KHu8e6hJUDyAVzUq1p3
	8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E8yeL5yMXD53xyI80Ij1JXsq+Yd6Z+n9gV5laxwpi8c=;
	b=oDF5ti0nPzfShgjR6mvCN1encdi/K23Fm5aWTgGYAVVBO5osWPlmOB7NkkX3jqw7LP
	ApJdKBrDcUYkzp+1K9UL4zLzWfGrChEPbqB/SccG5x1UTzADX9qxwTvJfhGt4ERHRH08
	2sAzai0H/euoAS67ZanAoo2DGDawd2Ra34S5qRirMvRxBQSM3FBAB9q/bAv83odTkvcB
	ewSxQpRjq3HjMUyDtTw74SaxXFSr88oEEA9uxZnXp2tbkPU4MyPiauPbQydm3W9OtS7F
	2SMy+wpzWu+B8Tlt08mt3ZC85KKB4jSjWLp/98mYbYclUjazVGE+hUEVJXDK9DRHxk/M
	EBrw==
X-Gm-Message-State: AN3rC/7BlzJ2L7HlGtLUgSA7QoOq+DBDBsW1LGwSZWiZ3hXwFNKyQWJs
	uXwt0m9WCLqa34vP1lrRQz5Cad0Oeg==
X-Received: by 10.223.165.138 with SMTP id g10mr5390372wrc.19.1493319343215;
	Thu, 27 Apr 2017 11:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Thu, 27 Apr 2017 11:55:42 -0700 (PDT)
In-Reply-To: <1493312178-8328-1-git-send-email-panagiotis.tamtamis@unify.com>
References: <1493312178-8328-1-git-send-email-panagiotis.tamtamis@unify.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 27 Apr 2017 11:55:42 -0700
Message-ID: <CAJ86T=U-qYiiafs4_+iJj4ibnmdd24A1ZZcw34ZeEWHTkgsb4w@mail.gmail.com>
To: Panagiotis Tamtamis <panagiotis.tamtamis@unify.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Check if /etc/fstab exists
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
X-List-Received-Date: Thu, 27 Apr 2017 18:55:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 27, 2017 at 9:56 AM, Panagiotis Tamtamis
<panagiotis.tamtamis@unify.com> wrote:
> Using "read-only-rootfs" feature in minimal or special
> purpose images (eg mounted images) makes build to fail
> because ${IMAGE_ROOTFS}/etc/fstab file does not exist.
>
> Signed-off-by: Panagiotis Tamtamis <panagiotis.tamtamis@unify.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index 0c7ceea..4709369 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -64,7 +64,8 @@ systemd_create_users () {
>  #
>  read_only_rootfs_hook () {
>         # Tweak the mount option and fs_passno for rootfs in fstab
> -       sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
> +       if [ -f ${IMAGE_ROOTFS}/etc/fstab ]; then
> +               sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab

Missing "fi" ?

>
>         # If we're using openssh and the /etc/ssh directory has no pre-generated keys,
>         # we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

