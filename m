Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1B60F6E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:09:40 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJK006K7FNMFE30@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 10 Feb 2015 11:09:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10	a=QyXUC8HyAAAA:8
	a=Q47boCabAtdJwy01N3cA:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 279CE20099; Tue,
	10 Feb 2015 12:09:21 -0500 (EST)
Date: Tue, 10 Feb 2015 12:09:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20150210170921.GD14949@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
	<CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
	<20150210162902.GC14949@denix.org>
	<CAJTo0LbFdzSv3V7vwPj0hQrE70JRu=GGh=6qzJgxrXOwobKHeg@mail.gmail.com>
	<CAJTo0LY-Jg4kTPiGZfhHFECy2KFWQ7+5dq8jAMcn+NHZBC=R5Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LY-Jg4kTPiGZfhHFECy2KFWQ7+5dq8jAMcn+NHZBC=R5Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 17:09:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 10, 2015 at 04:48:51PM +0000, Burton, Ross wrote:
> On 10 February 2015 at 16:38, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > ? Are you saying it's meta-fsl-ppc specific issue?
> >
> >
> > I just replicated with qemuarm and interestingly with zero tasks happening
> > at the same time.  I'm wondering if there's a file being written with an
> > old sysroot in that isn't being deleted. I'll dig quickly now.
> 
> 
> Passing V=1 to EXTRA_OEMAKE (should do this by default as quite logs are
> useless for debugging) shows:
> 
> |   gcc  -Wp,-MD,tools/.mkimage.o.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer   -DCONFIG_FIT_SIGNATURE -include
> ./include/libfdt_env.h -idirafterinclude -idirafter./arch/sandbox/include
> -I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC
> -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -c -o tools/mkimage.o tools/mkimage.c
> | In file included from tools/ublimage.c:17:0:
> | include/image.h:877:27: fatal error: openssl/evp.h: No such file or
> directory
> 
> It's using the host's GCC but there is no pointer to the native sysroot...
> Presumably the trigger here is that I don't have openssl-dev installed on
> the build host.

D'oh! I should have dug dipper and notice the native sysroot is not being 
used... Thanks, I'll send a fixed patch shortly.

-- 
Denys

