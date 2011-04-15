Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAnlO-0005I5-CJ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 20:29:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 11:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,220,1301900400"; d="scan'208";a="733973918"
Received: from unknown (HELO [10.255.12.232]) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 11:26:44 -0700
Message-ID: <4DA88DE3.2050702@linux.intel.com>
Date: Fri, 15 Apr 2011 11:26:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
In-Reply-To: <72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on	beagleboard
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
X-List-Received-Date: Fri, 15 Apr 2011 18:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2011 10:00 AM, Paul Eggleton wrote:
> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>
> Avoids manual configuration of the BeagleBoard xM's ethernet port (which
> shows up as usb0).
>
> Fixes [YOCTO #930]
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
>   1 files changed, 27 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>
I know this time would come!

So this is up for discussion in a big way!

There was some initial discussion at ELC this last week about what goes 
where and how layers are going to work moving forward.  I know that we 
are committed to the qemu* machines in oe-core (meta), and that 
currently meta-yocto contains a set of core HW (beagleboard among them), 
so the question then is should the HW specific stuff, such as this patch 
move to meta-yocto or some other layer?  There are a couple other 
recipes such as x-load and formfactor that contain HW specific files.

I believe and others will have to confirm this, that some distros may 
want to use these core files, but not via meta-yocto as a layer, or do 
those distros have these files modified differently (ie, not just 
copies, which would be bad).

This is all food for thought.

Sau!


> diff --git a/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
> new file mode 100644
> index 0000000..b6935c1
> --- /dev/null
> +++ b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
> @@ -0,0 +1,27 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wireless interfaces
> +iface wlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +	wpa-driver wext
> +	wpa-conf /etc/wpa_supplicant.conf
> +
> +iface atml0 inet dhcp
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet dhcp
> +iface eth1 inet dhcp
> +
> +# Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
> +auto usb0
> +iface usb0 inet dhcp
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +



