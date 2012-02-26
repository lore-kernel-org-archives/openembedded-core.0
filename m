Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S1TNe-0006g3-Oq
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 02:58:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2012 17:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111897561"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2012 17:49:29 -0800
Message-ID: <4F498FA9.9000707@linux.intel.com>
Date: Sat, 25 Feb 2012 17:49:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F47D9C3.6060203@linux.intel.com>
	<1330115254-11300-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1330115254-11300-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH v2] initscripts: mount and unmount cifs network filesystems
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
X-List-Received-Date: Sun, 26 Feb 2012 01:58:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 12:27 PM, Andreas Oberritter wrote:
> * Added cifs to mountnfs.sh and umountnfs.sh.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Rebased as requested
>
>   .../initscripts/initscripts-1.0/mountnfs.sh        |    8 +++++++-
>   .../initscripts/initscripts-1.0/umountnfs.sh       |    2 +-
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> index 859fc9e..82ec7f6 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
> @@ -23,6 +23,7 @@ portmap=no
>   mount_nfs=no
>   mount_smb=no
>   mount_ncp=no
> +mount_cifs=no
>   while read device mountpt fstype options
>   do
>   	case "$device" in
> @@ -56,6 +57,10 @@ do
>   	then
>   		mount_ncp=yes
>   	fi
> +	if test "$fstype" = cifs
> +	then
> +		mount_cifs=yes
> +	fi
>   done
>
>   exec 0>&1
> @@ -70,12 +75,13 @@ then
>   	fi
>   fi
>
> -if test "$mount_nfs" = yes || test "$mount_smb" = yes || test "$mount_ncp" = yes
> +if test "$mount_nfs" = yes || test "$mount_smb" = yes || test "$mount_ncp" = yes || test "$mount_cifs" = yes
>   then
>   	echo "Mounting remote filesystems..."
>   	test "$mount_nfs" = yes&&  mount -a -t nfs
>   	test "$mount_smb" = yes&&  mount -a -t smbfs
>   	test "$mount_ncp" = yes&&  mount -a -t ncpfs
> +	test "$mount_cifs" = yes&&  mount -a -t cifs
>   fi
>
>   )<  /etc/fstab
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
> index 15d1f73..af07540 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
> @@ -23,7 +23,7 @@ test -f /etc/fstab&&  (
>   #
>   while read device mountpt fstype options
>   do
> -	if test "$fstype" = nfs ||  test "$fstype" = smbfs ||  test "$fstype" = ncpfs
> +	if test "$fstype" = nfs ||  test "$fstype" = smbfs ||  test "$fstype" = ncpfs || test "$fstype" = cifs
>   	then
>   		umount -f $mountpt
>   	fi
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index b56c55c..e16f19f 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r130"
> +PR = "r131"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>

Merged into OE-core

Thanks
	Sau!


