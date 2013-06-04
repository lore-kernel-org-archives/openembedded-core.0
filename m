Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 449D1601AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 11:39:37 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id fn20so91709lab.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1d0gFJ11dCdIH+HOUF+Y/MtSyUGjC45rTbAtoRxbxvo=;
	b=vijrK4M3P+IUEgG2FE1bnxY1aWA5MI8r3KfR0dYUGzxqmDNhl8hHyChMd1pQSSTBvx
	NWXd1M1ePGcBJp+7YZSwtaS0ofsnnzCadrhoDTtlvYk/hy6f+yH70d1vGWIcpqtf4Z3U
	cUSbqIF02ZBDgtfS75CkViK2GbZ9KI5A2UIspeliMDszg7kc/FhUDuw8+Q7vCgLalUgJ
	28ACBeSlbLy38mO1yO8fsQB6lXolXTWB2Gw4x54DW3wiICl0uPjZnhmcbwXEv53KXven
	Ae7r5q+56aPyX6AWZKKpTabAxcDR+8DYPRP+SMNMosiqKM/uPrnqD4phllFBM4nDoEUH
	fTnA==
MIME-Version: 1.0
X-Received: by 10.112.13.72 with SMTP id f8mr9027360lbc.51.1370345976518; Tue,
	04 Jun 2013 04:39:36 -0700 (PDT)
Received: by 10.112.147.233 with HTTP; Tue, 4 Jun 2013 04:39:36 -0700 (PDT)
In-Reply-To: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
References: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
Date: Tue, 4 Jun 2013 13:39:36 +0200
Message-ID: <CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cramfs: import recipe from meta-oe
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
X-List-Received-Date: Tue, 04 Jun 2013 11:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

ping

Recipe is rather stable (tarball of v.1.1 dated 2002) and cramfs can
be handy for read-only images on legacy devices.

All the needed infrastructure is already present in
image_types.bbclass so I'd say this recipe has been mistakenly
forgotten when splitting out oe-core


Andrea

On Sun, May 26, 2013 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> * though listed in IMAGE_FSTYPES the helper is missing so
> * make oe-core autosufficient importing the recipe.
> * Fix PN -> BPN to avoid fetch errors with cramfs-native
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/recipes-support/cramfs/cramfs_1.1.bb | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
>
> diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb b/meta/recipes-support/cramfs/cramfs_1.1.bb
> new file mode 100644
> index 0000000..0bca0e1
> --- /dev/null
> +++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Builds cramfs filesystems for embedded systems"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> +DEPENDS = "zlib"
> +
> +PE = "1"
> +
> +SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
> +SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
> +
> +EXTRA_OEMAKE = "\
> +    'CC=${CC}' \
> +    'CFLAGS=${CFLAGS}' \
> +    'LDFLAGS=${LDFLAGS}' \
> +"
> +
> +do_compile_prepend() {
> +    ln -sf GNUmakefile Makefile
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install mkcramfs ${D}${bindir}
> +    install cramfsck ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 1.8.1.5
>

