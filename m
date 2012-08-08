Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sz7ZJ-0004uK-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 16:49:05 +0200
Received: by eaad12 with SMTP id d12so214245eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jvRqSJwENmKNaa1WkuyS59uo8ctJ67T9CTWRyWHaSLM=;
	b=LfQ9kR/Nm6HGrWnQl0i+4RufCDL9EhUtfHwzTRAHyeVfX63eB0QEdFvO1a6hDpldtB
	lB32uOZBrj/ukDPGcHLiI1oCrfGOQeoLk8HdvnsMTXQjMSpK/B5HC7iHkbE2G550CRtX
	HDr4s+RGg8n/sW/4AZUh00z4IrYmTfZb9HpeLL3wAU/9H/WjoR10X/J9mg91I6vLwICw
	ps2EucLpSMm6H50Uur1oYHMQ8OwosqfF0IMNSweyNQa/+qpMzYl13q2GdGrZLDNgDEvl
	eZyeSbSWr6TknTPVe1tICXVdT+wYWs+Qkiwb0B/EDLj9m6UhW77Wu+UQeXYYDSlEDZr1
	BBmg==
Received: by 10.14.194.198 with SMTP id m46mr22452939een.13.1344436638522;
	Wed, 08 Aug 2012 07:37:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Wed, 8 Aug 2012 07:36:47 -0700 (PDT)
In-Reply-To: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2012 07:36:47 -0700
Message-ID: <CAMKF1sqAwXWG=TjzohiJ2c=KksMdUWv7OrHOibLsVZDTCDsamQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 14:49:05 -0000
Content-Type: text/plain; charset=UTF-8

ping

On Tue, Jul 31, 2012 at 8:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> asm/unistd.h includes asm/unistd_64.h on x86_64
> and asm/unistd_32.h on i386 but these files are
> generated files in 3.4 and when we do 'make clean' they get
> deleted and it shows up as an error when building
> external modules. May be its a 3.4 kernel bug may be not
> but make clean should have left the tree in
> a shape to build modules but it does not.
>
> Probably we should run make modules_prepare after having
> run make clean.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b19ed4c..4ac3d48 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,8 @@ kernel_do_install() {
>         if [ -f include/generated/bounds.h ]; then
>                 cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>         fi
> +       mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> +       cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
>
>         # Remove the following binaries which cause strip or arch QA errors
>         # during do_package for cross-compiled platforms
> --
> 1.7.5.4
>


