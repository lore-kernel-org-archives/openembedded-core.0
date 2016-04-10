Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Apr 2016 19:50:10 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 881F7731DD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:50:10 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5F00G28LN67380@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2016 13:49:54 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
	a=HihYlcsHAAAA:8 a=iPMOB7Hhh3BK-hqDFv0A:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 30130e08; Sun, 10 Apr 2016 18:49:54 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CAAC4161F7B; Sun,
	10 Apr 2016 14:49:53 -0400 (EDT)
Date: Sun, 10 Apr 2016 14:49:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-id: <20160410184953.GH16135@denix.org>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Sun, 10 Apr 2016 19:50:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 24, 2016 at 02:14:36PM -0700, Andre McCurdy wrote:
> On Thu, Mar 24, 2016 at 1:45 PM, Alexander Kanevskiy <kad@kad.name> wrote:
> > On Thu, Mar 24, 2016 at 10:32 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> On Thu, Mar 24, 2016 at 1:16 PM, Alexander D. Kanevskiy <kad@kad.name>
> >> wrote:
> >> > Existing compress framework for producing various compressed versions
> >> > of images is powerfull enough to be extended for other uses, e.g. to
> >> > convert types of images.
> >> >
> >> > It is possible to use it also to produce image checksums at the time
> >> > of image generation. This commit adds support for all supported
> >> > at the moment coreutils hashing algorithms: md5, sha1, sha224,
> >> > sha256, sha384 and sha512
> >> >
> >> > Usage:
> >> > IMAGE_FSTYPES_append = " hddimg.sha256sum"
> >>
> >> I guess a common requirement is for hashes of the compressed images,
> >> not only the uncompressed image.
> >
> > you can easily chain them.
> > " hddimg.sha256sum hddimg.xz hddimg.xz.sha256sum"
> 
> OK. Great. Didn't realise that was going to work!

Well, unless something has been changed/fixed recently (and I believe it was 
Richard's do_rootfs fixes), it didn't use to work as easy as you'd expect and 
it would break in do_rootfs, when trying to nest image types directly, hence 
the implementations like these:

http://cgit.openembedded.org/openembedded-core/tree/meta/classes/image_types_uboot.bbclass
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/classes/image_types_md5.bbclass;hb=HEAD

BTW, at least for md5sum (not sure about sha*), isn't the de-facto standard 
extension .md5 and not .md5sum? Can we change it?

-- 
Denys

