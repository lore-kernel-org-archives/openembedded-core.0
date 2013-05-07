Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UZfU3-0008Sa-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:51:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 03:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="309482779"
Received: from unknown (HELO helios.localnet) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2013 03:32:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 07 May 2013 11:32:33 +0100
Message-ID: <3028968.i58Z539hxi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <7d839cdf354d6851be9c20c391344ce21413cf45.1367921762.git.liezhi.yang@windriver.com>
References: <cover.1367921762.git.liezhi.yang@windriver.com>
	<7d839cdf354d6851be9c20c391344ce21413cf45.1367921762.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image_types.bbclass: remove the obsolete images
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
X-List-Received-Date: Tue, 07 May 2013 10:51:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 May 2013 18:26:59 Robert Yang wrote:
> Remove the obsolete image before the new one generated to save disk
> space when RM_OBSOLETE_IMAGE is set to 1, this is an easy way to keep
> the DEPLOY_DIR_IMAGE clean.
> 
> [YOCTO #4391]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/image_types.bbclass     | 6 +++++-
>  meta/conf/local.conf.sample.extended | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass index 94837ae..27f232e 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -51,7 +51,11 @@ def get_imagecmds(d):
>          types.remove("live")
> 
>      if d.getVar('IMAGE_LINK_NAME', True):
> -        cmds += "\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
> +        if d.getVar('RM_OBSOLETE_IMAGE', True) == "1":
> +            # Remove the obsolete image
> +            cmds += "\trm -f `find ${DEPLOY_DIR_IMAGE} -maxdepth 1 -type l
> -name ${IMAGE_LINK_NAME}'.*' -exec readlink -f {} \;`" +        # Remove
> the symlink
> +        cmds += "\n\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
> 
>      for type in types:
>          ccmd = []
> diff --git a/meta/conf/local.conf.sample.extended
> b/meta/conf/local.conf.sample.extended index 1d1a8ec..efe0804 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -207,3 +207,6 @@
>  #ARCHIVER_MODE[filter] ?= "no"
>  #ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE !=
> 'none' else ''}" #INHERIT += "${ARCHIVER_CLASS}"
> +
> +# Remove the obsolete image before the new one generated to save disk space
> +#RM_OBSOLETE_IMAGE = "1"

Rather than "obsolete" I would have said "old" would be the preferred 
terminology here, i.e. RM_OLD_IMAGE.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


