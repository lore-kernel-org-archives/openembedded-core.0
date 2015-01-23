Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E41446AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 21:24:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0NLOnG3021025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 13:24:49 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 23 Jan 2015 13:24:49 -0800
Message-ID: <54C2BC20.4020802@windriver.com>
Date: Fri, 23 Jan 2015 15:24:48 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1422048001-34023-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1422048001-34023-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH] arch-mips.inc: Change definition of TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 23 Jan 2015 21:24:52 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Note, I tested this by building a world build for MACHINE qemumips64 with
DEFAULTTUNE set to mips64-n32.

It and the other recent patches I've sent are available at

git://git.yoctoproject.org/poky-contrib mhatle/oe-core

--Mark

On 1/23/15 3:20 PM, Mark Hatle wrote:
> [YOCTO #7230]
> 
> In certain system configurations TRANSLATED_TARGET_ARCH will not
> expand in the right order for gcc-cross-candian-mips64n32 to be
> generated properly.
> 
> This will cause SDKs to fail to generate properly.
> 
> Changing the global definition of TRANSLATED_TARGET_ARCH always
> expands the ABIEXTENSION, which causes the OVERRIDES to pick it up
> as well.  This effectively defines a new class of overrides for the 'n32'.
> 
> The side effect is that we need to duplicate some mips64 overrides, and
> redefine others that were previously 'n32' or 'mips64' exclusive to have
> the correct semantics.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/bitbake.conf                             |   2 +
>  meta/conf/machine/include/mips/arch-mips.inc       |   4 +-
>  .../packagegroups/packagegroup-core-sdk.bb         |   1 +
>  .../packagegroup-core-tools-profile.bb             |   2 +
>  .../packagegroups/packagegroup-self-hosted.bb      |   1 +
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +
>  meta/recipes-devtools/gdb/gdb-common.inc           |   2 +
>  .../python/python-numpy/mips64n32/_numpyconfig.h   |  30 +++++
>  .../python/python-numpy/mips64n32/config.h         | 139 +++++++++++++++++++++
>  meta/recipes-devtools/python/python-numpy_1.7.0.bb |   4 +
>  .../ghostscript/ghostscript/mips64eln32/objarch.h  |  40 ++++++
>  .../ghostscript/ghostscript/mips64n32/objarch.h    |  40 ++++++
>  meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |   1 +
>  .../packagegroups/packagegroup-core-lsb.bb         |   1 +
>  meta/recipes-kernel/sysprof/sysprof_git.bb         |   1 +
>  .../packagegroups/packagegroup-core-qt.bb          |   2 +-
>  .../packagegroups/packagegroup-core-qt4e.bb        |   2 +-
>  .../packagegroup-qt-toolchain-target.inc           |   2 +-
>  meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   2 +-
>  meta/recipes-sato/images/core-image-sato-sdk.bb    |   1 +
>  meta/recipes-sato/midori/midori_0.5.8.bb           |   2 +-
>  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   2 +-
>  22 files changed, 276 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
>  create mode 100644 meta/recipes-devtools/python/python-numpy/mips64n32/config.h
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h


