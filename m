Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D21A6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:44:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u96Ghw44009633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 6 Oct 2016 09:43:58 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 09:43:57 -0700
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	<openembedded-core@lists.openembedded.org>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9c3c5cc4-02e0-4a95-c6f6-9a282701c240@windriver.com>
Date: Thu, 6 Oct 2016 11:43:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH 0/9] Add MIPS release 6 ISA support
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
X-List-Received-Date: Thu, 06 Oct 2016 16:44:02 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

A few general comments.  I don't see an n32 variant implemented.  I'd suggest a
follow on patch (vs a new version) to add n32.

It looks like it's missing in the files modified by patches 6-9.

Otherwise I don't see any issues with adding the support for this new ISA.

--Mark

On 10/4/16 6:31 AM, Zubair Lutfullah Kakakhel wrote:
> Hi,
> 
> This patch series adds support for MIPS Release 6 ISA.
> 
> A few key points to note are:
> 
> 1 - The tuples have changed for Multiarch. For details, check 
>     https://wiki.debian.org/Multiarch/Tuples
> 
> 2 - Dynamic linker loader name has changed.
>     ld.so.1 -> ld-linux-mipsn8.so.1
>     For details, check
>     https://sourceware.org/glibc/wiki/ABIList#mips
> 
> I tested this using poky, krogoth-15.0.1, yocto-2.1.1 + various patches.
> Most notable patches were adding support for Linux kernel 4.8 and using
> 4.8 headers. Preferred using 4.8 as there was a quirk in glibc + nan2008
> that preferred 4.5+.
> https://sourceware.org/ml/libc-alpha/2016-01/msg00240.html
> 
> Build + qemu boot tested for little endian variations.
> 
> Regards,
> ZubairLK
> 
> Zubair Lutfullah Kakakhel (9):
>   insane.bbclass: Add mipsisa{32,64}r6{el,}
>   kernel-arch.bbclass: Add mipsisa{32,64}r6{el,} support
>   libc-package.bbclass: Add mipsisa{32,64}r6{el,} support
>   linuxloader.bbclass: Add mipsisa{32,64}r6{el,} support
>   siteinfo.bbclass: Add mipsisa{32,64}r6{el,} support
>   bitbake.conf: Add mipsisa{32,64}r6{el,} support
>   glibc: Add mipsisa{32,64}r6{el,} support
>   gcc-configure: Add mipsisa{32,64}r6{el,} support
>   arch-mips: Add mipsisa{32,64}r6{el,} tunes
> 
>  meta/classes/insane.bbclass                        |  4 ++
>  meta/classes/kernel-arch.bbclass                   |  2 +-
>  meta/classes/libc-package.bbclass                  |  4 ++
>  meta/classes/linuxloader.bbclass                   |  3 +
>  meta/classes/siteinfo.bbclass                      |  4 ++
>  meta/conf/bitbake.conf                             |  5 ++
>  meta/conf/machine/include/mips/README              | 19 ++++-
>  meta/conf/machine/include/mips/arch-mips.inc       | 10 ++-
>  meta/conf/machine/include/tune-mips32r6.inc        | 29 ++++++++
>  meta/conf/machine/include/tune-mips64r6.inc        | 32 +++++++++
>  meta/recipes-core/glibc/glibc-ld.inc               |  4 ++
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |  4 ++
>  meta/recipes-devtools/gcc/gcc-runtime.inc          |  4 ++
>  meta/site/mipsisa32r6-linux                        | 79 ++++++++++++++++++++
>  meta/site/mipsisa32r6el-linux                      | 79 ++++++++++++++++++++
>  meta/site/mipsisa64r6-linux                        | 83 ++++++++++++++++++++++
>  meta/site/mipsisa64r6el-linux                      | 83 ++++++++++++++++++++++
>  17 files changed, 445 insertions(+), 3 deletions(-)
>  create mode 100644 meta/conf/machine/include/tune-mips32r6.inc
>  create mode 100644 meta/conf/machine/include/tune-mips64r6.inc
>  create mode 100644 meta/site/mipsisa32r6-linux
>  create mode 100644 meta/site/mipsisa32r6el-linux
>  create mode 100644 meta/site/mipsisa64r6-linux
>  create mode 100644 meta/site/mipsisa64r6el-linux
> 


