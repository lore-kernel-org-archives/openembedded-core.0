Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
Subject: Re: [OE-core] Git and pseudo
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Apr 2022 11:22:50 +0100
In-Reply-To: <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
References: 
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
	 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
	 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
	 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
	 <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Stefano Babic <sbabic@denx.de>, Mike Looijmans <mike.looijmans@topic.nl>, openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>

On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:
> Hi Mike, Richard,
> 
> On 26.04.22 11:08, Mike Looijmans wrote:
> > 
> > Met vriendelijke groet / kind regards,
> > 
> > Mike Looijmans
> > System Expert
> > 
> > 
> > TOPIC Embedded Products B.V.
> > Materiaalweg 4, 5681 RJ Best
> > The Netherlands
> > 
> > T: +31 (0) 499 33 69 69
> > E: mike.looijmans@topicproducts.com
> > W: www.topic.nl
> > 
> > Please consider the environment before printing this e-mail
> > On 25-04-2022 14:51, Richard Purdie wrote:
> > > On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
> > > > Recently GIT got updated with a security fix:
> > > > 
> > > > https://github.blog/2022-04-12-git-security-vulnerability-announced/
> > > > 
> > > > 
> > > > The problem is that this causes all "git" tasks that run within pseudo
> > > > (most noticably, image recipes) to fail. In many repositories, we use:
> > > > git rev-parse --verify HEAD > /etc/revision
> > > > 
> > > > Or something similar to that. After the GIT update, this now fails with
> > > > an error like:
> > > > 
> > > > '''
> > > > fatal: unsafe repository ('/home/mike/repository/path' is owned by
> > > > someone else)
> > > > To add an exception for this directory, call:
> > > > 
> > > >       git config --global --add safe.directory 
> > > > /home/mike/repository/path
> > > > '''
> > > > 
> > > > Apart from doing as it says, or even "git config --global --add
> > > > safe.directory '*'" anyone have a better idea, especially one that
> > > > prevents the system thinking I'm someone else (root in the case of 
> > > > pseudo).
> > > https://git.yoctoproject.org/poky/commit/?id=21559199516a31c7635c5f2d874eaa4a92fff0e5 
> > > 
> > > 
> > > However this isn't quite enough as some things encode the path to git 
> > > into build
> > > files so the PATH change at do_install isn't enough. igt-gpu-tools via 
> > > meson in
> > > OE-Core is an example.
> > > 
> > > Cheers,
> > > 
> > > Richard
> > > 
> > Nice, also for general usefulness.
> > 
> > 
> > For our particular case, I came up with this (works in old OE versions 
> > as well), just inserting a task since both do_image and do_rootfs run 
> > under fakeroot:
> > 
> >   # We require access to the git repository here, so we must run outside 
> > fakeroot
> > do_swumetadata() {
> >     # Hardware revision for SWUpdate
> >     echo "${SWU_BOARD_HWREVISION}" > 
> > ${IMAGE_ROOTFS}${sysconfdir}/hwrevision
> >     v=`git rev-parse --verify HEAD`
> >     echo $v > ${IMAGE_ROOTFS}${sysconfdir}/swrevision
> >     echo $v > ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}.swrevision
> > }
> > addtask do_swumetadata before do_image after do_rootfs
> > 
> 
> It looks like we have several breakages. I found yesterday that 
> buildinfo (image-buildinfo) does not work anymore.
> 
> meta-filesystems  = <unknown>:<unknown>
> 
> meta-networking   = <unknown>:<unknown>
> 
> meta-oe           = <unknown>:<unknown>
> 
> meta-perl         = <unknown>:<unknown>
> 
> meta-python       = <unknown>:<unknown>
> 
> meta-swupdate     = <unknown>:<unknown>
> 
> meta              = <unknown>:<unknown>
> 
> meta-poky         = <unknown>:<unknown>
> 
> meta-yocto-bsp    = <unknown>:<unknown>
> 
> 
> 
> And the reason is exactly this security update to git, and 
> base_get_metadata_git_revision / base_get_metadata_git_branch do not 
> work anymore (in this context, of course). So should we create 
> /etc/build in a task before do_rootfs ?
> 
> Bad is also that this affects older versions (dunfell for example), 
> because it depends on an external package (git) to OE.


https://git.yoctoproject.org/poky/commit/?id=5bca57859b280f73b23247aac7dec6b05f48fde8

is now the preferred fix and we will likely be backporting this to kirkstone,
honister and dunfell.

Cheers,

Richard


