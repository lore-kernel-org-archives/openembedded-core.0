Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvWXQ-0008Km-Vl
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 18:12:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2013 08:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="272843378"
Received: from unknown (HELO helios.localnet) ([10.252.123.117])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2013 08:56:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Jan 2013 16:56:42 +0000
Message-ID: <2889255.VosU18xJih@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20130116164038.GF3002@jama>
References: <cover.1358350661.git.paul.eggleton@linux.intel.com>
	<d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
	<20130116164038.GF3002@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] classes/image: improve debug-tweaks ssh server configuration
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
X-List-Received-Date: Wed, 16 Jan 2013 17:12:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 January 2013 17:40:38 Martin Jansa wrote:
> On Wed, Jan 16, 2013 at 03:38:13PM +0000, Paul Eggleton wrote:
> > Create a single postprocessing function that enables no-password logins
> > for both openssh and dropbear when debug-tweaks is in IMAGE_FEATURES,
> > changing its behaviour slightly:
> > * Run it regardless of whether ssh-server-* are in IMAGE_FEATURES so
> > 
> >   that it still takes effect if these are installed by adding
> >   dropbear/openssh to IMAGE_INSTALL.
> > 
> > * Enable it to be run from image.bbclass rather than core-image.bbclass
> > 
> >   so that it works for images that are using the former.
> > 
> > Second half of the fix for [YOCTO #2578].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/core-image.bbclass |    3 ---
> >  meta/classes/image.bbclass      |   10 ++++++++--
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/classes/core-image.bbclass
> > b/meta/classes/core-image.bbclass index 2e67018..e0f6dbb 100644
> > --- a/meta/classes/core-image.bbclass
> > +++ b/meta/classes/core-image.bbclass
> > @@ -76,6 +76,3 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ;
> > "> 
> >  # Zap the root password if debug-tweaks feature is not enabled
> >  ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES",
> >  "debug-tweaks", "", "zap_root_password ; ",d)}'> 
> > -# Allow openssh accept empty password login if both debug-tweaks and
> > ssh-server-openssh are enabled -ROOTFS_POSTPROCESS_COMMAND +=
> > '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh",
> > "openssh_allow_empty_password; ", "",d)}' -
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index e494689..131958d 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -167,6 +167,8 @@ inherit ${IMAGE_CLASSES}
> > 
> >  IMAGE_POSTPROCESS_COMMAND ?= ""
> >  MACHINE_POSTPROCESS_COMMAND ?= ""
> >  ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
> > 
> > +# Allow dropbear/openssh to accept logins from accounts with an empty
> > password string if debug-tweaks is enabled +ROOTFS_POSTPROCESS_COMMAND +=
> > '${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> > "ssh_allow_empty_password; ", "",d)}'> 
> >  # some default locales
> >  IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> > 
> > @@ -396,12 +398,16 @@ zap_root_password () {
> > 
> >  	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
> >  
> >  }
> > 
> > -# allow openssh accept login with empty password string
> > -openssh_allow_empty_password () {
> > +# allow dropbear/openssh to accept root logins and logins from accounts
> > with an empty password string +ssh_allow_empty_password () {
> > 
> >  	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
> >  	
> >  		sed -i 's#.*PermitRootLogin.*#PermitRootLogin yes#'
> >  		${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config sed -i
> >  		's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#'
> >  		${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config>  	
> >  	fi
> > 
> > +
> > +	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> > +		echo 'DROPBEAR_EXTRA_ARGS="-B"' >
> > ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear +	fi
> 
> Can we use >> here? In case some distro layer provides own
> default/dropbear already?
> 
> Or grep + >> if you fear of duplication of that line, probably
> should be using sed to add -B if DROPBEAR_EXTRA_ARGS line is already
> there without -B.

Slightly ahead of you :) see discussion with Chris.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


