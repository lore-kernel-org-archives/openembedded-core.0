Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8086025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 01:57:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v511vHNV001392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 May 2017 18:57:17 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 18:57:17 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Zheng Ruoqin
	<zhengrq.fnst@cn.fujitsu.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6d5ae07d-880f-388f-432e-5da89aa07e24@windriver.com>
Date: Wed, 31 May 2017 21:57:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 08/11] libunwind: update to 1.2
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
X-List-Received-Date: Thu, 01 Jun 2017 01:57:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-04-21 08:39 AM, Alexander Kanavin wrote:
> Switch to using tarballs as git is unreliable (not responding right now).
> 
> LICENSE file is gone; COPYING has an additional line on top with
> copyright attribution, the license text that follows has not changed.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-support/libunwind/libunwind.inc                     | 2 +-
>   .../libunwind/{libunwind_git.bb => libunwind_1.2.bb}             | 9 +++------
>   2 files changed, 4 insertions(+), 7 deletions(-)
>   rename meta/recipes-support/libunwind/{libunwind_git.bb => libunwind_1.2.bb} (81%)
...
> -SRCREV = "bc8698fd7ed13a629a8ec3cb2a89bd74f9d8b5c0"
> -
> -SRC_URI = "git://git.sv.gnu.org/libunwind.git \
> +SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
...


This 'update' breaks qemumips, qemumips64:

    mips-wrs-linux-libtool: compile:  mips-wrs-linux-gcc -meb -mabi=32 \
    -mhard-float -march=mips32r2 \
    --sysroot=\
    /.../tmp/work/mips32r2-wrs-linux/libunwind/1.2-r0/recipe-sysroot \
    -DHAVE_CONFIG_H -I. -I../../libunwind-1.2/src -I../include \
    -I../../libunwind-1.2/include \
    -I../../libunwind-1.2/include/tdep-mips -I. \
    -D_GNU_SOURCE -DNDEBUG -O2 -pipe -g \
    -fno-omit-frame-pointer -fvisibility=default -fexceptions \
    -Wall -Wsign-compare -c ../../libunwind-1.2/src/mi/Lget_reg.c \
    -o mi/Lget_reg.o >/dev/null 2>&1
    In file included from \
    ../../libunwind-1.2/src/mips/Lcreate_addr_space.c:4:0:
    ../../libunwind-1.2/src/mips/Gcreate_addr_space.c:27:22:
    fatal error: unwind_i.h: No such file or directory
     #include "unwind_i.h"
                         ^
    ERROR: oe_runmake failed
    compilation terminated.


Are those machines not even built before master-next is becomes master?

The 1.2 tarball content isn't the same as the v1.2-stable git repo
branch. It's different in non-obvious ways...
I've written to the upstream team to figure out what went wrong:
 
http://lists.nongnu.org/archive/html/libunwind-devel/2017-05/msg00000.html
Note that my first email has not yet been archived. :-/

It's not just a missed commit or two as far as I can tell.
Hopefully they can release a 1.2.1 or 1.3 tarball.


We could use the tarball from the git repo:
 
http://git.savannah.nongnu.org/cgit/libunwind.git/snapshot/libunwind-v1.2-stable.tar.gz
since it has all the mips* support but there was some concern
about the git server going offline periodically, iirc..

For now, I'd like to go back to _git and update the recipe
as Zheng has done in his email:

[OE-core]  [PATCH] libunwind: 1.1 -> 1.2

-PV = "1.1+git${SRCPV}"
+PV = "1.2+git${SRCPV}"

-SRCREV = "bc8698fd7ed13a629a8ec3cb2a89bd74f9d8b5c0"
+SRCREV = "0326f1048a0d75ea9498360f60a0c711cd190b7b"

I'll send that change tomorrow unless there's new from upstream
or someone has a better idea.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


