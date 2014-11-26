Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBEC70A61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 17:02:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2014 09:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,463,1413270000"; d="scan'208";a="628666617"
Received: from unknown (HELO [10.255.13.44]) ([10.255.13.44])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2014 09:01:42 -0800
Message-ID: <1417021302.11024.5.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Armin Kuster <akuster808@gmail.com>
Date: Wed, 26 Nov 2014 11:01:42 -0600
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Javier Viguera <javier.viguera@digi.com>,
	Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Dizzy next #2
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
X-List-Received-Date: Wed, 26 Nov 2014 17:02:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Looks fine to me, but it's still missing this (or were you planning on
adding it to your next round?):

  commit 4c222d3a67bae265ff42b448ef4a643b0131e578 
  Author: He Zhe <zhe.he@windriver.com>
  Date:   Tue Oct 21 17:47:44 2014 +0800

      kernel.bbclass: Create modules directory even if there is no modules
install

Which fixes a problem introduced by:

  commit 3224472c68865714716305dfbc8efaa59f73958e
  Author: Nitin A Kamble <nitin.a.kamble@intel.com>
  Date:   Tue Sep 30 14:40:05 2014 -0700

      kernel.bbclass: enable a link for external module building

Which I'm now also seeing cause problems with the kernel labs.

Thanks,

Tom 

On Wed, 2014-11-26 at 08:22 -0800, Armin Kuster wrote:
> Please consider these changes for the next Dizzy.
> 
> The following changes since commit 85b8abe50482deaa1af62f265e82f53a54bbcd77:
> 
>   nss: define MP_USE_UINT_DIGIT when compile mpi_x86.s (2014-11-24 16:38:18 -0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
> 
> Andrei Gherzan (1):
>   xkeyboard-config: Inherit gettext
> 
> Aníbal Limón (1):
>   package_manager: DpkgPM fix populate_sdk
> 
> Javier Viguera (1):
>   shadow-securetty: add ttyAM[0-3] serial ports
> 
> Robert Yang (1):
>   qemu: disable the build for mips
> 
> Saul Wold (1):
>   babeltrace: Backport fix for unaligned integer
> 
> Tom Zanussi (5):
>   wic: Don't allow mkfs to fail silently in partition command
>   wic: Update the help text to include -D (--debug)
>   Revert "wic: set bootimg_dir when using image-name artifacts"
>   wic: Remove special-case bootimg_dir
>   wic: Update bootimg-partition to use bootimg_dir
> 
> Wenzong Fan (1):
>   python: Fix CVE-2014-7185
> 
>  meta/lib/oe/package_manager.py                     |   2 +-
>  .../python/python/python-2.7.3-CVE-2014-7185.patch |  75 ++++++
>  meta/recipes-devtools/python/python_2.7.3.bb       |   1 +
>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |   1 +
>  meta/recipes-devtools/qemu/qemu_git.bb             |   1 +
>  meta/recipes-extended/shadow/files/securetty       |   4 +
>  .../xorg-lib/xkeyboard-config_2.12.bb              |   2 +-
>  ...n-t-perform-unaligned-integer-read-writes.patch | 252 +++++++++++++++++++++
>  meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |   1 +
>  scripts/lib/image/engine.py                        |  42 +---
>  scripts/lib/image/help.py                          |  23 +-
>  scripts/lib/wic/imager/direct.py                   |   5 +-
>  .../lib/wic/kickstart/custom_commands/partition.py |  22 +-
>  scripts/lib/wic/plugins/imager/direct_plugin.py    |  20 +-
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |   5 +-
>  .../lib/wic/plugins/source/bootimg-partition.py    |   9 +-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   3 +-
>  scripts/wic                                        |  13 +-
>  18 files changed, 402 insertions(+), 79 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch
> 
> -- 
> 1.9.1
> 



