Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0A56CF0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 10:26:06 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id eo20so6140791lab.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iNjDXqMShOxXs+eLiWcbmbnnia2bcJUhSI3aG4M8EuA=;
	b=ANqw/5B/R0oKkgNTtY4B+GL+O2+zYVoihp/VwM8h2GYLLWSiVkrPHT4+26eDfOZeSC
	nGsOoO2COQ4MeaClT5Ue+A9RDiq++yaBGzw3lHzpdyie2uxUw8lHeFXmob7XUfQ8DrUa
	oNphxLYpV12dwWbIl1R6Bgig/8vTtZnCV0c7X2GAqvqwJu7IyGAaMvz7Wb4o5b+yAh8w
	aGqUVFJmxtT/cE1pXq+0hDpCClSNs5NuyVU9ckineknv1BqkxYw+K2i6R6cPZriM+uvg
	h5GhgAXnxHeYskCj8dZ/bOWu7AghteOP59gncaGYY6Pknrvm9JboW2sLRYMqNZ5dLoiO
	0QEg==
MIME-Version: 1.0
X-Received: by 10.152.1.70 with SMTP id 6mr449669lak.60.1383042367303; Tue, 29
	Oct 2013 03:26:07 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Tue, 29 Oct 2013 03:26:07 -0700 (PDT)
In-Reply-To: <5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
	<5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
Date: Tue, 29 Oct 2013 11:26:07 +0100
Message-ID: <CAAQYJAsOE=uCDEpZqi2Pbg4AmkEhcJA7-yVG75v6R0Jak7rhoQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] image_types.bbclass: fix EXTRA_IMAGECMD_sum.jffs2
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
X-List-Received-Date: Tue, 29 Oct 2013 10:26:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

BUMP

I've seen the first two bugfixes have been applied and now it is
possible to override EXTRA_IMAGECMD_jffs2.

This patch fixes the case of sum.jffs2 when a padding value is
specified because sumtool won't swallow it.

Thx

Andrea


On Mon, Oct 21, 2013 at 12:34 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> When overriding EXTRA_IMAGE_CMD_jffs2 = "--pad=foo ..."
> we are passing a malformed option to sumtool:
>
> sumtool: option '--pad' doesn't allow an argument
>
> Fix this by declaring a separate variable for the purpose.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index b8779e0..21391e8 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -141,8 +141,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>  XZ_THREADS ?= "-T 0"
>
>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> -       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
> +       && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>
>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>
> @@ -212,6 +212,7 @@ inherit siteinfo
>  JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
>  JFFS2_ERASEBLOCK ?= "0x40000"
>  EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
> +EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
>
>  # Change these if you want default mkfs behavior (i.e. create minimal inode number)
>  EXTRA_IMAGECMD_ext2 ?= "-i 8192"
> --
> 1.8.1.5
>

