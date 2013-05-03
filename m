Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYEnG-0004kj-Et for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 14:09:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43BqjpC027627; Fri, 3 May 2013 12:52:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n-oeqWAiOq2V; Fri,  3 May 2013 12:52:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43BqfKk027619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 3 May 2013 12:52:43 +0100
Message-ID: <1367581840.5379.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Fri, 03 May 2013 12:50:40 +0100
In-Reply-To: <5181804D.1010800@r-finger.com>
References: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
	<51817B44.30702@linux.intel.com> <5181804D.1010800@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: fix default location of kernel when generating elf images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 12:09:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-01 at 21:51 +0100, Tomas Frydrych wrote:
> On 01/05/13 21:29, Darren Hart wrote:
> > 
> > 
> > On 05/01/2013 01:24 PM, tf+lists.yocto@r-finger.com wrote:
> >> From: Tomas Frydrych <tomas@sleepfive.com>
> >>
> >> The kernel is now located in DEPLOY_DIR_IMAGE rather than sysroot.
> >>
> >> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
> >> ---
> >>  meta/classes/image_types.bbclass |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> >> index 98d31f5..0e1ad3a 100644
> >> --- a/meta/classes/image_types.bbclass
> >> +++ b/meta/classes/image_types.bbclass
> >> @@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
> >>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> >>  }
> >>  
> >> -ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
> >> +ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin"
> > 
> > 
> > Looks correct, how did this fail before? What was the symptom?
> 
> e.g.,
> 
> | Cannot open `...../tmp/sysroots/nuc/kernel/bzImage': (null)
> 
> Two bugs really, the location has changed, and it was using a kernel
> that is not machine-specific. I'll make a patch with better commit
> message tomorrow.

Just for reference, STAGING_DIR_HOST is machine specific these days.

This patch also changes the dependency from do_populate_sysroot (which
is encapsulated by DEPENDS) to do_deploy (which is not). Did you account
for that?

I suspect that fixing the path might be safer than this change...

Cheers,

Richard




