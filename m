Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE066AF21
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:56:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7NCu2HK028950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2013 05:56:02 -0700 (PDT)
Received: from [172.25.32.37] (172.25.32.37) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 05:56:01 -0700
Message-ID: <52175BE0.8010403@windriver.com>
Date: Fri, 23 Aug 2013 07:56:00 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1sp9sfkrRCaU6JwzN0YESyP=pd5n1oUcGz_fNj3OTTv6-g@mail.gmail.com>
In-Reply-To: <CAMKF1sp9sfkrRCaU6JwzN0YESyP=pd5n1oUcGz_fNj3OTTv6-g@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Fri, 23 Aug 2013 12:56:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 08/23/2013 01:16 AM, Khem Raj wrote:
> On Thu, Aug 22, 2013 at 4:04 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> This patch aims to fix the following two cases for the INITRAMFS generation.
>>   1) Allow an image recipe to specify a paired INITRAMFS recipe such
>>      as core-image-minimal-initramfs.  This allows building a base
>>      image which always generates the needed initramfs image in one step
>>   2) Allow building a single binary which contains a kernel and
>>      the initramfs.
> I think this could be a bit simpler. Have a full kernel image recipe (
> kernel + initramfs)
> separate. It fits into the equation nicely. The final image can bundle
> initramfs which has modules from practically same kernel build is
> staged step 1 of kernel build which
> automatically happens today for any image build.

The changes I put together are work around the circular dependency problem.  Staging and using another recipe is certainly an option.

What I really wanted to do was have just another image type not unlike cpio, ext3, etc...  But this was not possible because there was no way to get back to the point that the kernel could be re-linked and make the call to the kernel methods and get the context correct.   I had tried using the internal method for exec_task from the image recipe context but there appeared to be no direct way to get this to work.




>
> The new recipe for kernel+initramfs requires the existing kernel
> recipes and tweaks the .config to enable INITRAMFS_IMAGE
>
> You can share the sources for both stages where kernel is built like
> gcc is putting the sources under work-shared and building all gcc
> recipes out of this location.


Ideally we could use the sysroot to regenerate the combined image, but this was not low hanging fruit.  If we came up with a way to generate the combined kernel+initramfs image directly from the sysroot this could easily be controlled by just having it as an IMAGE_FEATURE as opposed to making distinct image types. 


Jason.

