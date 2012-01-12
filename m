Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlNYI-0000hb-L4
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:30:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 08:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95749045"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2012 08:23:26 -0800
Message-ID: <4F0F08EA.3030701@linux.intel.com>
Date: Thu, 12 Jan 2012 08:23:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326216024.git.josh@linux.intel.com>
	<54448c3044e7492aa31e1c10745c33fbd9c9269a.1326216024.git.josh@linux.intel.com>
In-Reply-To: <54448c3044e7492aa31e1c10745c33fbd9c9269a.1326216024.git.josh@linux.intel.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH 2/3] alsa-state: move state files to localstatedir
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
X-List-Received-Date: Thu, 12 Jan 2012 16:30:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2012 09:39 AM, Joshua Lock wrote:
> alsactl creates the state files in /var/lib/alsa by default so switch
> alsa-state to use files in that location.
> 
> Further, update the alsa-state init script to have the location of the
> state files sed'ed into the script at do_install time (so as to remove
> hard coding of directory paths).
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-bsp/alsa-state/alsa-state.bb         |    8 +++++---
>  meta/recipes-bsp/alsa-state/alsa-state/alsa-state |    6 +++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
> index ecfa975..bc17b25 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
> @@ -26,11 +26,13 @@ INITSCRIPT_NAME = "alsa-state"
>  INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
>  
>  do_install() {
> +    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state
>      install -d ${D}${sysconfdir}/init.d
>      install -m 0755 ${WORKDIR}/alsa-state ${D}${sysconfdir}/init.d
>  
> +    install -d ${D}/${localstatedir}/lib/alsa
>      install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
> -    install -m 0644 ${WORKDIR}/*.state ${D}${sysconfdir}
> +    install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
>  }
>  
>  PACKAGES += "alsa-states"
> @@ -40,14 +42,14 @@ RRECOMMENDS_alsa-state = "alsa-states"
>  FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>  CONFFILES_${PN} = "${sysconfdir}/asound.conf"
>  
> -FILES_alsa-states = "${sysconfdir}/*.state"
> +FILES_alsa-states = "${localstatedir}/lib/alsa/*.state"
>  
>  pkg_postinst_${PN}() {
>  	if test -z "$D"
>  	then
>  		if test -x /usr/sbin/alsactl
>  		then
> -			/usr/sbin/alsactl -f ${sysconfdir}/asound.state restore
> +			/usr/sbin/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
>  		fi
>  		# INITSCRIPT_PARAMS changed, so remove the old and
>  		# install the new setting.
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
> index 84cdf03..9850791 100755
> --- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
> +++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
> @@ -9,9 +9,9 @@
>  
>  asound_restore(){
>  	echo "ALSA: Restoring mixer settings..."
> -	if test -x /usr/sbin/alsactl -a -e /etc/asound.state
> +	if test -x /usr/sbin/alsactl -a -e #STATEDIR#/asound.state
>  	then
> -		/usr/sbin/alsactl -f /etc/asound.state restore &
> +		/usr/sbin/alsactl -f #STATEDIR#/asound.state restore &
>  	fi
>  }
>  
> @@ -19,7 +19,7 @@ asound_store(){
>  	echo "ALSA: Storing mixer settings..."
>  	if test -x /usr/sbin/alsactl
>  	then
> -		/usr/sbin/alsactl -f /etc/asound.state store
> +		/usr/sbin/alsactl -f #STATEDIR#/asound.state store
>  	fi
>  }
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


