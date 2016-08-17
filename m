Return-Path: <jeremy.rosen@smile.fr>
X-Greylist: delayed 327 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Aug 2016 14:17:26 UTC
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 0088273285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 86CFA1EE09DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:11:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id knANg7ePr6Va
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:11:59 +0200 (CEST)
Received: from [10.9.18.224] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id 484EA1EE0839
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 16:11:59 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <a1c7979f-5b89-44fd-f7c9-137cbb887654@smile.fr>
Date: Wed, 17 Aug 2016 16:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
Subject: Re: what means IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"?
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
X-List-Received-Date: Wed, 17 Aug 2016 14:17:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/2016 16:01, Robert P. J. Day wrote:
>    as in, what's with the "+" in that "+ 3000000" value? i've never
> seen that before, and i took a quick look under classes/ to try to
> figure out what's happening, but i'm still confused.
you're reading too much into this

"+ 3000000" will append the string "+ 3000000" to the string contained 
in the IMAGE_ROOTFS_EXTRA_SPACE variable

I am not sure who consumes that variable, but I assume it's something 
that's able to do math and will properly compute the final value.

you can always run "bitbake -e core-image-kernel-dev" in a pager an look 
at the final value to see what's happening...

>    this is all in aid of the aforementioned "+=" cleanup, and i can see
> some inconsistency as to whether there should be a leading space or
> not in the assigned value:
>
> classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 102400", "" ,d)}"
> recipes-core/images/core-image-minimal.bb:IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
> recipes-extended/images/core-image-kernel-dev.bb:IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
>
> and the YP reference manual says nothing about a possible "+":
>
> http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-IMAGE_ROOTFS_EXTRA_SPACE
>
> rday
>


