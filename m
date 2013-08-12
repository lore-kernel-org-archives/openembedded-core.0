Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 123136B2C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 15:39:29 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id up14so8993249obb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sMRcM+PD23fNhHBeUEMXP+dtp2/jHuj0bedCK240gSs=;
	b=Hyi/jfQIGuRX6P/JAVSNn3zVPe3/pvTKxqMldXcEOjnSDale+8gqCU5iczd/UejsVE
	fBo7Qrzdu5nzssVDTn3YmQ9vdM1uaisey1acVemJfSmxx3u8g/JMSQVVFCNMpw6mlOeA
	PwUNRAEAsCMzaPTixryQ79gPBxoXnHGXHrb50Yw8ZXc9GYUPyOV+4HvyajUjFRsOWNkB
	+smTszM8xlodCjCj4KX4oXz1NYn/udGD4fQDI/6Ic7LVXSXrKqVF2vBeQC9Xgl8jbdrf
	djzZ/ACnGFKHyCBYvar1eU9IvczjZAY+5qq5drfAW8pO3t7z8LxFZIen8K6Y+UXYctOi
	X2Cg==
MIME-Version: 1.0
X-Received: by 10.182.230.135 with SMTP id sy7mr11119267obc.24.1376321969662; 
	Mon, 12 Aug 2013 08:39:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 12 Aug 2013 08:39:29 -0700 (PDT)
In-Reply-To: <1376321829-30658-1-git-send-email-otavio@ossystems.com.br>
References: <1376321829-30658-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 12 Aug 2013 12:39:29 -0300
X-Google-Sender-Auth: _ZKoFnvseZ21hNdcWyGTtJRJ7k8
Message-ID: <CAP9ODKp3gqZab1Cg7KM0s9yBPCLSGHhk-k6n-c-s44d4JCFapQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	Lauren Post <lauren.post@freescale.com>
Subject: Re: [PATCH] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Mon, 12 Aug 2013 15:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 12, 2013 at 12:37 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> As the Linux kernel, unconditionally, builds the dtc application and
> it is the compatible version with the DeviceTree files shipped within
> the kernel it is better to use it and the kernel build system to
> generate the dtb files.
>
> Some DeviceTree files rely on CPP and kernel headers to be able to
> generate the dtb binary contents and it is harder to replicate it
> outside of Linux kernel build system so we /use/ it.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> NOTE: This depends on 'linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/' patch
>
>  meta/recipes-kernel/linux/linux-dtb.inc | 59 +++++++++++++++------------------
>  1 file changed, 27 insertions(+), 32 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 41dd599..a65f8bd 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,44 +1,39 @@
>  # Support for device tree generation
>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
> -KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
>
>  python __anonymous () {
> -    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
> -    if devicetree:
> -        depends = d.getVar("DEPENDS", True)
> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
> -        packages = d.getVar("PACKAGES", True)
> -        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> +    d.appendVar("PACKAGES", " kernel-devicetree")
>  }
>
>  do_install_append() {
> +       bbwarn "ARRG"

Kept when testing.

I will await for more feedback before sending v2.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

