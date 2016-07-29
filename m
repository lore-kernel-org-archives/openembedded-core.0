Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 345EB607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TETWGl028145; Fri, 29 Jul 2016 15:29:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bQbNRSWCcEDj; Fri, 29 Jul 2016 15:29:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TETUaW028142
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 15:29:31 +0100
Message-ID: <1469802570.9142.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Fri, 29 Jul 2016 15:29:30 +0100
In-Reply-To: <6b6fbba91ea7ac508bc8f8c53287ac90bdcff1b7.1469799731.git.ed.bartosh@linux.intel.com>
References: <cover.1469799731.git.ed.bartosh@linux.intel.com>
	<6b6fbba91ea7ac508bc8f8c53287ac90bdcff1b7.1469799731.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v5 1/2] image creation: support converting masked types
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
X-List-Received-Date: Fri, 29 Jul 2016 14:29:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-29 at 16:44 +0300, Ed Bartosh wrote:
> From: Patrick Ohly <patrick.ohly@intel.com>
> 
> Conversion to vmdk/vdi/qcow2 is also useful for other base images
> types, not just for .hdddirect. This can be achieved by definining
> them as conversion commands and relying on the conversion chaining
> to convert arbitrary base images.
> 
> For this to work when the base image gets created by a masked image
> type, the additional conversion commands now get executed in a
> do_image_complete prefunc.
> 
> With all of that in place it becomes possible to remove the special
> purpose code for vmdk/vdi/qcow2 types from image-vm.bbclass and
> several other classes. This has (intentional!) implications on the
> valid IMAGE_FSTYPES and the file suffices: now
> "hdddirect.vmdk/vdi/qcow2" must be used as IMAGE_FSTYPES to select
> the
> former special-case types "vmdk/vdi/qcow2", and the image files and
> links will also have the extra .hdddirect suffix.
> 
> This is intentional because it makes it makes it possible to
> distinguish between virtual machine images created from .hdddirect
> and
> those created from other base images.
> 
> The new support for virtual machine images can also be combined with
> compression, thus making it possible to create image files for
> publication in compressed format, for example with:
>   IMAGE_FSTYPES = "hdddirect.vdi.xz"

I'm afraid I really don't like this. The direction this code has taken
is to separate out the different steps into clearly identifiable tasks.
This was due to strong user feedback that nobody could figure out what
was going on. This change starts to merge them all back together,
hiding them in a prefunc of a task which is just horrible.

I haven't looked in detail at the problem thats being attempted to be
solved here but this doesn't look like a good approach at all and takes
us backwards rather than forwards.

So, sorry, but no.

Cheers,

Richard


