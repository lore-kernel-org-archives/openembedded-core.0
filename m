Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UeSwc-0004ZK-HI
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:28:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2013 09:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="244189538"
Received: from unknown (HELO helios.localnet) ([10.255.12.168])
	by AZSMGA002.ch.intel.com with ESMTP; 20 May 2013 09:09:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Mon, 20 May 2013 17:09:55 +0100
Message-ID: <7023411.OWblAEEYiP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <87754446fd070cded9dee7bff2b18d0f080be934.1369018014.git.Qi.Chen@windriver.com>
References: <cover.1369018014.git.Qi.Chen@windriver.com>
	<87754446fd070cded9dee7bff2b18d0f080be934.1369018014.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/4] dpkg: modify the run-postinst script to enable postinst logging
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
X-List-Received-Date: Mon, 20 May 2013 16:28:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 May 2013 10:50:29 Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Enable postinst logging by checking the configuration in /etc/
> default/postinst.
> 
> In this way, the postinst logging is enabled if 'debug-tweaks' is
> in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuilt
> if IMAGE_FEATURES is changed.
> 
> [YOCTO #4262]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
> b/meta/recipes-devtools/dpkg/dpkg.inc index d773fbd..c5c8aec 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -35,10 +35,6 @@ do_configure () {
>      autotools_do_configure
>  }
> 
> -POSTLOG ?= "/var/log/postinstall.log"
> -REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks',
> '>${POSTLOG} 2>&1', '', d)}" -REDIRECT_CMD[vardepsexclude] +=
> "IMAGE_FEATURES POSTLOG"
> -
>  DPKG_INIT_POSITION ?= "98"
> 
>  do_install_append () {
> @@ -67,7 +63,12 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ];
> then
> 
>  	# this happens at S98 where our good 'ole packages script used to run
>  	echo "#!/bin/sh
> -dpkg --configure -a ${REDIRECT_CMD}
> +[ -e /etc/default/postinst ] && . /etc/default/postinst
> +if [ \"\$POSTINST_LOGGING\" = \"ENABLED\" ]; then

Can we use 1 for this instead of ENABLED? This would be more consistent with 
how variables such as this are generally used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


