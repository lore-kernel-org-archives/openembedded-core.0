Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE480C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 08:47:29 +0000 (UTC)
Subject: Re: [PATCH v6 03/12] devtool: new ide plugin
To: openembedded-core@lists.openembedded.org
From: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Originating-Location: FR (80.15.101.118)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Nov 2023 00:47:28 -0800
References: <186EDB03-6E99-4675-BDAA-A19FD95EC95F@arm.com>
In-Reply-To: <186EDB03-6E99-4675-BDAA-A19FD95EC95F@arm.com>
Message-ID: <3856.1699951648610019974@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 08:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190490

On Thu, Oct 12, 2023 at 02:53 PM, Ross Burton wrote:

>
> I=E2=80=99d not noticed image-combined-dbg existed and do wonder if that =
shoud be
> the behaviour of the debug rootfs. Is there actually a use-case for a tar=
ball
> which is _just_ the symbols?
>

The use for a rootfs containing just the debug tarballs is explicited in th=
e documentation here: https://docs.yoctoproject.org/4.0.4/singleindex.html#=
using-the-gdbserver-method

$ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image.rootfs.tar.bz2
$ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image-dbg.rootfs.tar.b=
z2

This debug-rootfs is "combined" with the rootfs image which already contain=
s the binaries. It could also be done at runtime on a live target (through =
tar, overlayfs, ...).

The later patch-set makes image-combined-dbg the default which makes the de=
bug-rootfs already containing the image rootfs. This would not produce an e=
rror with those tar commands because they silently overwrite existing files=
. However, it would break some users setups with these conditions:
 a. The user has another way for combining the rootfs and dbg rootfs which =
produces an error if files exist in both archives
 b. The user has storage limitations for the dbg rootfs which would be exce=
eded when adding the binaries to it
 c. The user customizes the original rootfs output. These customizations wo=
uld be lost when combining.
 d. The user is extracting the debug rootfs on a runtime rootfs with runtim=
e modifications

An example for C is wic fstab customization, or any modifications which hap=
pen at the do_rootfs step:

     do_rootfs_postprocess() {
         echo "Customized issue" >> ${IMAGE_ROOTFS}/etc/issue
     }

     addtask do_rootfs_postprocess after do_rootfs before do_image

When extracting the debug-rootfs with image-combined-dbg, this customizatio=
n gets lost because the debug-rootfs contains the original files from the p=
ackage.

That's why I suggest keeping the debug-rootfs as it is and keep image-combi=
ned-debug as a separate option.

