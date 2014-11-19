Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3222772108
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 17:54:27 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so801672qge.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8f9CaomMATJ+PcR/qqwuGPLVdaOOMHKSXqmErp0UySE=;
	b=rzJRTQX6wxHROkJrR/YXNqT0q57TgNOgbgRMxKEpOrhtr79BolayrR2VkAbcdhdhy6
	oirnmt/LF7wsWEIeccv2Xw5QKDV5U71zN+mJOohhWkkqRyXfF8WmafjdcyLePETRjrg5
	tnUX2NFmm4wi1ufQYGMpAcfO9vbrlqPNs+SF/PO3czJFAMDXUxU98uBf2Dyx4vraAHDI
	bQoKa4x2IzB6COOcW10EwkohxLZp+MSNlniyWML+nkhHam/lUzgY/kzMOyLJbpadZzjX
	8lcOc5UOZlU52LQVKPSb4nSADRnlGD4PjZTflDI7FMjJ8GhPQmRujjgXJzNHjjgt9P+t
	EdHQ==
MIME-Version: 1.0
X-Received: by 10.140.95.214 with SMTP id i80mr52302097qge.48.1416419668023;
	Wed, 19 Nov 2014 09:54:28 -0800 (PST)
Received: by 10.96.183.131 with HTTP; Wed, 19 Nov 2014 09:54:27 -0800 (PST)
In-Reply-To: <1415958217-16545-4-git-send-email-jian.liu@windriver.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
	<1415958217-16545-4-git-send-email-jian.liu@windriver.com>
Date: Wed, 19 Nov 2014 11:54:27 -0600
Message-ID: <CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] logrotate: files will be over written when updating using rpm
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
X-List-Received-Date: Wed, 19 Nov 2014 17:54:31 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 03:43, Jian Liu <jian.liu@windriver.com> wrote:
> If there is no %config micro before the file in the spec file,
> this file will be over-written after updating this package
> using rpm.
> This will make our settings lost.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  meta/recipes-extended/logrotate/logrotate_3.8.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> index faa8e02..8b39602 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
> @@ -54,3 +54,5 @@ do_install(){
>      install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
>      touch ${D}${localstatedir}/lib/logrotate.status
>  }
> +
> +CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"

Part of me thinks this shouldn't be an installed file at all; instead
it should be created by a post install script if it doesn't already
exist. Thoughts?

> --
> 1.8.5.2.233.g932f7e4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

