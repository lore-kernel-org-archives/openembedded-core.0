Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BC9976B39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 12:28:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMCS4rn016095; Fri, 22 Nov 2013 12:28:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zk06liOZc0WS; Fri, 22 Nov 2013 12:28:04 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMCRxnJ016088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 12:28:01 GMT
Message-ID: <1385123276.16887.163.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 22 Nov 2013 12:27:56 +0000
In-Reply-To: <528F4C55.3080106@windriver.com>
References: <cover.1384419666.git.hongxu.jia@windriver.com>
	<ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>
	<528E0D2D.4010202@windriver.com> <1385041807.16887.131.camel@ted>
	<528F4C55.3080106@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] lib32-packagegroup-core-nfs: fix qa issue - install files into a shared area when those files already exist
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
X-List-Received-Date: Fri, 22 Nov 2013 12:28:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 20:21 +0800, Hongxu Jia wrote:
> Hi Richard,
> 
> 1. What is the situation to set PACKAGE_ARCH = "${MACHINE_ARCH}"
> in packagegroup recipe?
> 
> In this case, MACHINE is qemux86-64, and the packagegroup-core-nfs's
> RDEPENDS are:
> "packagegroup-core-nfs-server" -> "nfs-utils" [style=dashed]
> "packagegroup-core-nfs-server" -> "nfs-utils-client" [style=dashed]
> 
> We check one utility in nfs-utils by invoking file:
> $ file image/usr/sbin/exportfs
> image/usr/sbin/exportfs: ELF 64-bit LSB executable, x86-64,
> version 1 (SYSV), dynamically linked (uses shared libs), for
> GNU/Linux 2.6.34, not stripped
> 
> Should we consider the nfs-utils and lib32-nfs-utils are different
> arch? If the answer is yes, the lib32-packagegroup-core-nfs's
> RDEPENDS should be:
> "lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils-client" 
> [style=dashed]
> "lib32-packagegroup-core-nfs-server" -> "lib32-nfs-utils" [style=dashed]
> 
> In this situation, I think we should set PACKAGE_ARCH with
> "${MACHINE_ARCH}" in packagegroup-core-nfs recipe.
> 
> But there are lots of packagegroup packages that didn't have set
> PACKAGE_ARCH with "${MACHINE_ARCH}" in their recipe. After a quick
> search in oe-core, 7 packagegroup recipes did set and almost 33 didn't,
> so how about use PACKAGE_ARCH = "${MACHINE_ARCH}" by default for
> packagegroup or just did not inherit allarch in packagegroup.bbclass?
> 
> 2. What shoud we do if packagegroup packages is allarch?
> 
> When the packagegroup packages is allarch and multilib is enabled,
> should we still *do the multilib work* for this allarch recipe?
> If we do, the override issue happened.
> 
> In this case, if we don't set PACKAGE_ARCH with "${MACHINE_ARCH}",
> packagegroup-core-nfs and lib32-packagegroup-core-nfs have different
> ${WORKDIR}:
> 
> WORKDIR="${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> MULTIMACH_TARGET_SYS="${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
> 
> In packagegroup-core-nfs, we have:
> TARGET_VENDOR="-poky"
> PN="packagegroup-core-nfs"
> 
> In lib32-packagegroup-core-nfs, after the multilib process we have:
> TARGET_VENDOR="-pokymllib32"
> PN="lib32-packagegroup-core-nfs"
> 
> So we had better to forbid multilib work for the allarch recipe.

Do you have
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=26559c581695f60861483691e08eee06f524287f applied to your tree?

I'm hoping this issue does not exist when that patch is applied.

Cheers,

Richard


