Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D6F2C6B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:43:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2013 10:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,896,1367996400"; d="scan'208";a="388337995"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2013 10:43:05 -0700
Message-ID: <520E64A8.2000206@linux.intel.com>
Date: Fri, 16 Aug 2013 10:43:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1375941355.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1375941355.git.Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 00/10] Make read-only rootfs work with live images
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
X-List-Received-Date: Fri, 16 Aug 2013 17:43:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2013 11:15 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Changes from V4:
> 1. Fix the error of 'read -f' in populate-volatile.sh. The '-f' should should not be there.
> 2. Fix the error of missing colon in populate-volatile.sh.
>
> Changes from V3:
> 1. Take hidden directories and files into consideration when copying before bind mounting.
> 2. Use 'cp -a' in populate-volatile.sh to avoid potential problems
>
> Change from V2:
> 1. modify the irda init script so that it doesn't necessarily need to write to /etc/sysconfig/irda
> 2. drop the lighttpd patch
> 3. modify the logic for openssh in case of a read-only rootfs
>
> Change from V1:
> 1. Disable the generating of ssh keys at rootfs time
> 2. Add a mechanism to read-only-rootfs-hook.sh to check whether a directory is on a read-only partition.
> 3. Fix a new bug#4937 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4937)
>
> The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:
>
>    subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/read-only-rootfs-in-live-images
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images
>
> Chen Qi (10):
>    init-live.sh: make $ROOT_MOUNT/media writable when necessary
>    use a uiform way to determine whether rootfs is read-only

Qi,

Richard noted in the Consolidated Pull that he did not take this patch 
along with the initscripts patch due to too many processes being spawned 
at boot time, can you find a better way to handle this?

Sau!

>    udev: remove implicit dependency on initscripts
>    populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
>    populate-volatile.sh: don't spawn background process at rootfs time
>    runqemu-internal: fix to start X correctly in live images
>    initscripts: use a uniform way to handle directories in read-only
>      rootfs
>    populate-volatile.sh: use 'cp -a' to avoid potential problem
>    irda-utils: fix for read-only rootfs
>    openssh: fix for read-only rootfs
>
>   meta/classes/image.bbclass                         |   16 +++++--
>   .../irda-utils/irda-utils-0.9.18/init              |   13 +-----
>   .../openssh/openssh-6.2p2/init                     |   22 ++++++---
>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    9 +++-
>   meta/recipes-core/initrdscripts/files/init-live.sh |    2 +
>   .../initscripts/initscripts-1.0/functions          |   14 ++++++
>   .../initscripts-1.0/populate-volatile.sh           |   15 ++++--
>   .../initscripts-1.0/read-only-rootfs-hook.sh       |   48 ++++++++++++++++++--
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 ++
>   meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 --
>   meta/recipes-core/udev/udev/init                   |   21 +++++++--
>   meta/recipes-core/udev/udev/udev-cache             |    5 ++
>   .../0001-add-is_rootfs_readonly-to-functions.patch |   37 +++++++++++++++
>   meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |    1 +
>   scripts/runqemu-internal                           |    2 +-
>   15 files changed, 172 insertions(+), 42 deletions(-)
>   create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch
>

