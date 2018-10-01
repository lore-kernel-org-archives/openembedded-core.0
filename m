Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EA5B77A2EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 12:03:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w91C30C6017584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 1 Oct 2018 13:03:01 +0100
Message-ID: <ef30e9f17c0bef54dab54d024f2fb2bf0a36be27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Oct 2018 13:03:00 +0100
In-Reply-To: <20181001111233.29181-1-Martin.Jansa@gmail.com>
References: <20181001111233.29181-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: move IMAGE_NAME_SUFFIX variable from image_types.bbclass
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
X-List-Received-Date: Mon, 01 Oct 2018 12:03:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-01 at 11:12 +0000, Martin Jansa wrote:
> * currently it's used only by image.bbclass, image_types.bbclass and
>   meta/recipes-core/images/build-appliance-image_15.0.0.bb
>   but if it's needed by some recipe which isn't itself an image, then
>   it's useful in bitbake.conf, e.g. we have a recipe for creating
>   VirtualBox appliances which combines .wic.vmdk with .ovf file to
>   create .zip with appliance, but for that we need the filename of
>   .wic.vmdk which now contains IMAGE_NAME_SUFFIX
>   https://github.com/webOS-ports/meta-webos-ports/blob/4980ce52a43ac6
> 897657602810313af359f0b839/meta-luneos/recipes-core/images/luneos-
> emulator-appliance.inc#L24
> 
> * we were hardcoding .rootfs suffix where needed, but for quite long
>   time it's configurable with IMAGE_NAME_SUFFIX and might not match:
> 
>   commit 380ee36811939d947024bf78de907e3c071b834f
>   Author: Patrick Ohly <patrick.ohly@intel.com>
>   Date:   Mon Mar 7 18:07:52 2016 +0100
> 
>     image creation: allow overriding .rootfs suffix
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 6 ------
>  meta/conf/bitbake.conf           | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)

You could make this argument for many of the class variables, with
other code needing some small piece and we end up importing a ton of
stuff into bitbake.conf and global scope. My worry is this isn't
scalable and leads to code which is hard to disentangle.

How about we create imagevars.conf which the class could include, or
other users could include without pulling in the main class?

Cheers,

Richard



