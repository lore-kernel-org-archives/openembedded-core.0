Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 682716CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:45:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9TBjYgv005259; Tue, 29 Oct 2013 11:45:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KQEGdnfWQ4a3; Tue, 29 Oct 2013 11:45:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9TBjWlc005241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 29 Oct 2013 11:45:33 GMT
Message-ID: <1383047127.25877.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 29 Oct 2013 11:45:27 +0000
In-Reply-To: <CAAQYJAtEhOD4KCxuS17hRhdnb49NeKmXLzRL0ah2Sfv59LpsOw@mail.gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
	<5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
	<1383044469.17867.8.camel@ted>
	<CAAQYJAtEhOD4KCxuS17hRhdnb49NeKmXLzRL0ah2Sfv59LpsOw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 29 Oct 2013 11:45:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-29 at 12:17 +0100, Andrea Adami wrote:
> On Tue, Oct 29, 2013 at 12:01 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2013-10-21 at 00:34 +0200, Andrea Adami wrote:
> >> When overriding EXTRA_IMAGE_CMD_jffs2 = "--pad=foo ..."
> >> we are passing a malformed option to sumtool:
> >>
> >> sumtool: option '--pad' doesn't allow an argument
> >>
> >> Fix this by declaring a separate variable for the purpose.
> >>
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >>  meta/classes/image_types.bbclass | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> >> index b8779e0..21391e8 100644
> >> --- a/meta/classes/image_types.bbclass
> >> +++ b/meta/classes/image_types.bbclass
> >> @@ -141,8 +141,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
> >>  XZ_THREADS ?= "-T 0"
> >>
> >>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> >> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> >> -     -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
> >> +IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
> >> +     && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
> >>
> >>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> >>
> >> @@ -212,6 +212,7 @@ inherit siteinfo
> >>  JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
> >>  JFFS2_ERASEBLOCK ?= "0x40000"
> >>  EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
> >> +EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
> >>
> >>  # Change these if you want default mkfs behavior (i.e. create minimal inode number)
> >>  EXTRA_IMAGECMD_ext2 ?= "-i 8192"
> >
> > This patch is very confused. You say sumtool doesn't take a --pad
> > option, yet "EXTRA_IMAGECMD_sum.jffs" which is presumably used with
> > sumtool does have the option.
> >
> 
> After the commits you've done the creation of sum.jffs2 images is
> broken on collie.
> The error message is described clearly in the patch:
> 
> sumtool: option '--pad' doesn't allow an argument
> 
> Why that? Because collie needs to customize the padding.
> EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
> 
> This --pad=14680064 is then passed to IMAGE_CMD_sum.jffs2 and we get
> build error.
> 
> That's why we need to redefine both IMAGE_CMD_sum.jffs2 and
> EXTRA_IMAGECMD_sum.jffs2 so to pass --pad=XY only to mkfs.jffs2 and
> not to the sumtool part of IMAGE_CMD_sum.jffs2.
> 
> ---
> By the way this sum.jffs2 imagetype is used only in meta-handheld afaik.
> It would be also ok if you'd remove IMAGE_CMD_sum.jffs2 so we can
> append the whole stuff in a customized EXTRA_IMAGECMD_jffs2.

I understand your problem however:

a) Copy and pasting the entire IMAGE_CMD_jffs2 command into the second
one is rather ugly.
b) You still end up passing "--pad ${JFFS2_ENDIANNESS} --eraseblock=
${JFFS2_ERASEBLOCK} --no-cleanmarkers" as parameters to sumtool,
including a --pad option with no argument. Why/how?

You call:

sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}

and EXTRA_IMAGECMD is set to EXTRA_IMAGECMD_sum.jffs2 due to the use of
overrides in the image generation code.

So whilst collie is broken, I do not think this patch makes readable
code and I think we need to find something better.

The thing I'm confused on is whether there should be any --pad option to
sumtool or not.

Cheers,

Richard




