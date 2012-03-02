Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3RVY-0007O9-B8 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:22:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CEH00030690
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:14:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29538-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:14:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CE9Yc030684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:14:10 GMT
Message-ID: <1330690453.15224.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:14:13 +0000
In-Reply-To: <4F50201A.8050002@mlbassoc.com>
References: <4F50201A.8050002@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Image generation change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 12:22:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 18:19 -0700, Gary Thomas wrote:
> I'm having a problem after the recent change
>    commit eacedb4f2afa98dbd2f5ea7a9f52e6ea952a72d2
>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>    Date:   Wed Feb 29 16:24:26 2012 +0000
> 
>      image_types: Correctness fixes
> 
>      * Add a newline to improve the output formatting
>      * Use set() to turn the list into a set of unique items to prevnt
>        the same image code running twice (for e.g. IMAGE_FSTYPES = "tar.gz tar.bz2")
>      * Support multiple compression extensions such as ".gz.u-boot"
>      * Fix basetype/type typo and fix multiple image generation
> 
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> I build initrd-style images which can be loaded by U-Boot.  This is a multi-step
> process - first create the root image as ext3.gz, then pack it into the U-Boot
> image.  Before this change, I could use this setup:
> 
> IMAGE_FSTYPES = "ext3.gz initrd"
> IMAGE_CMD_initrd = " uboot_initrd;"
> IMAGE_ROOTFS_SIZE = "24576"
> 
> where the 'uboot_initrd' command expected the ext3.gz image to be complete and
> all it does is the U-Boot mkimage magic.
> 
> This no longer works as when uboot_initrd() runs, there is no ext3.gz image
> yet built.  I'm not sure I understand the exact reason, but if I revert just
> these lines, the process works again.
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 5b48a09..8ea170a 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -29,7 +29,7 @@ def get_imagecmds(d):
>       if d.getVar('IMAGE_LINK_NAME', True):
>           cmds += "      rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
> 
> -    for type in set(types):
> +    for type in types:
>           ccmd = []
>           subimages = []
>           localdata = bb.data.createCopy(d)
> 
> If there is another way to solve my problem, i.e. generate the wrapped
> up initrd image, that will still work with the code as is, I'd be happy
> to use it, but I'm not sure how to write such a process.
> 
> Any ideas gladly accepted, thanks

Does the patch "image_types.bbclass: We need to preserve order in the
types variable and avoid set()" fix this problem?

Cheers,

Richard





