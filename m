Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 787266013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 17:47:35 +0000 (UTC)
Received: by labgd6 with SMTP id gd6so39134062lab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TQz67GRzpHHLq2NNfNvtADm4jTN3fBbOpJdbsRsY++g=;
	b=CARTfua4WJRw7ezZ4D/XCCUHu6jB9X+qHXDBuLmB7mM5kev5vdQhK0FGkylmilbfQ6
	R+FQdduDYFuqATVzboZLNgYvODeWruztSf09oINdvBVbu0W1bIAbFmwv6s//Vk3J2CNw
	nzY7499u8YUE2IW8rU7qTV+iv+gE3MdK8Dyu0grOjkJs8g90sQwZshQGplv63Wt9+Kba
	yyldmOrAlHBbsC9eL+8/S93iDecdmAMT+gmjda9MRN3Mk6iP+gOcTrqo1N3mIS5PzOcb
	iA2ukHqwpD+KJw47ujHRtViibSE3vYTgUasDFQfIrVfS/UNtSNtObOpEjNseVm0tIi2H
	Jemw==
MIME-Version: 1.0
X-Received: by 10.153.8.135 with SMTP id dk7mr29720476lad.93.1425404856174;
	Tue, 03 Mar 2015 09:47:36 -0800 (PST)
Received: by 10.152.111.200 with HTTP; Tue, 3 Mar 2015 09:47:36 -0800 (PST)
In-Reply-To: <1425397584-5154-3-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-3-git-send-email-naresh.bhat@linaro.org>
Date: Tue, 3 Mar 2015 18:47:36 +0100
Message-ID: <CAC1BbcQhpMtqn8vFWC2ko3DSQ3g2uNuSR9xY3aWvyWKxche74g@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 2/4] bootimg: Add support to install Image
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
X-List-Received-Date: Tue, 03 Mar 2015 17:47:37 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> Add support to install kernel image for aarch64
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/classes/bootimg.bbclass |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index b1c03ba..a8e0c19 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -66,8 +66,16 @@ populate() {
>         DEST=$1
>         install -d ${DEST}
>
> +       SRC_KERNEL_IMAGE=bzImage
> +       DEST_KERNEL_IMAGE=vmlinuz
> +
> +       if [ "${TARGET_ARCH}" = "aarch64" ]; then
> +               SRC_KERNEL_IMAGE=Image
> +               DEST_KERNEL_IMAGE=Image
> +       fi
> +
>         # Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
> -       install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
> +       install -m 0644 ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE} ${DEST}/${DEST_KERNEL_IMAGE}

while you touch this, I'd remove the -d above and instead -D, like:
install -m 0644 -D ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE}
${DEST}/${DEST_KERNEL_IMAGE}

thanks,

