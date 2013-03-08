Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UE13k-0006D6-23
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 18:26:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Mar 2013 09:09:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="301945118"
Received: from unknown (HELO envy.home) ([10.255.12.187])
	by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2013 09:09:44 -0800
Message-ID: <513A1B58.4060702@linux.intel.com>
Date: Fri, 08 Mar 2013 09:09:44 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1362747705-19277-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1362747705-19277-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: Cope with translations and modelnames with 'Disk' in it.
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
X-List-Received-Date: Fri, 08 Mar 2013 17:27:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/08/2013 05:01 AM, Koen Kooi wrote:
> The script greps for 'Disk', which doesn't work when your crazy Dutch distro has parted call it 'Schijf', so force LANG=C.

Whoopsie :-)

> 
> The second problem is that 'Disk' might be a substring in the Model entry:
> 
> [root@Angstrom-F16-vm-rpm contrib] # parted /dev/sdc  unit mb print
> Model: SanDisk SDDR-113 (scsi)
> Disk /dev/sdc: 3905MB
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  scripts/contrib/mkefidisk.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index 38e2217..44ac130 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -18,6 +18,8 @@
>  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>  #
>  
> +LANG=C
> +
>  #
>  # Defaults
>  #
> @@ -123,7 +125,7 @@ fi
>  #
>  # Partition $DEVICE
>  #
> -DEVICE_SIZE=$(parted $DEVICE unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
> +DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")

Looks like something like "^Disk /" might be better still?




-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


