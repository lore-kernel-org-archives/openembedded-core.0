Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 087796D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:27:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICQSlq029825; Mon, 18 Nov 2013 12:26:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4lZ6-5-jUFK5; Mon, 18 Nov 2013 12:26:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICQqBN029863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 12:26:53 GMT
Message-ID: <1384777609.6460.224.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 18 Nov 2013 12:26:49 +0000
In-Reply-To: <1384625383.3814.34.camel@x121e.pbcl.net>
References: <1384520708.23724.12.camel@phil-desktop.brightsign>
	<CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
	<1384625383.3814.34.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Tolerate empty INITRAMFS_IMAGE when INITRAMFS_TASK is set
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
X-List-Received-Date: Mon, 18 Nov 2013 12:27:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-16 at 18:09 +0000, Phil Blundell wrote:
> On Fri, 2013-11-15 at 11:26 -0200, Otavio Salvador wrote:
> > Hello Phil,
> > 
> > On Fri, Nov 15, 2013 at 11:05 AM, Phil Blundell <pb@pbcl.net> wrote:
> > > The idiomatic way to reinstate the old-style initramfs handling appears to be to
> > > set:
> > >
> > > INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
> > 
> > What problems are you having with the 'new-style'?
> 
> Good question.  When I first merged the version of kernel.bbclass that
> implemented the "new-style" system I was having a bunch of problems
> which seemed to be due to the new code.  However, after a bit of further
> debugging it now appears that most of them are issues with the
> implementation rather than with the concept and selecting INITRAMFS_TASK
> doesn't actually help very much because the code that was causing my
> problems is shared between the two paths.
> 
> The main difficulty I was having was that kernel.bbclass was looking for
> the initramfs image with slightly the wrong filename.  After a certain
> amount of sleuthing and some clues from Andrea it eventually became
> apparent that kernel.bbclass relies on the initramfs image recipe
> leaving ${IMAGE_LINK_NAME} at its default value and will fail if it's
> set to anything else.  This seems slightly fragile and it seems as
> though it would be better for kernel.bbclass to look for the initramfs
> image at its primary location rather than relying on the symlink.
> 
> I also discovered that the new code in kernel.bbclass uncompresses the
> initramfs image before embedding it in the kernel.  I can guess why this
> seemed like a good plan, but it's slightly surprising behaviour and it
> seems like anybody who wanted to embed the initramfs in uncompressed
> form would just select IMAGE_TYPE = "cpio" for it in the first place.
> Also, Andrea reports that he does actually get worse compression overall
> with this approach in at least some circumstances.
> 
> Anyway, with those things fixed I can now at least build images again
> and it's entirely possible that the "new style" system would also work
> for me.  However, it doesn't seem as though the new technology would
> bring me any particular benefits, and as far as I can tell it would
> introduce an extra kernel compile step that I don't particularly want,
> so I am inclined to stick with INITRAMFS_TASK for the moment.

FWIW I would *love* to simplify this code and have one good/efficient
codepath everyone uses. The initramfs decompression code looks nasty to
me for example and I agree with your thoughts on that.

Cheers,

Richard


