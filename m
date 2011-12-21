Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdS6D-0000Uw-1q
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:45:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 11:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104766220"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2011 11:38:06 -0800
Message-ID: <4EF2359E.3030904@linux.intel.com>
Date: Wed, 21 Dec 2011 11:38:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324454963.git.edwin.zhai@intel.com>
	<bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
In-Reply-To: <bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 1/4] minix-session: Add this recipe as the session file for mini X
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
X-List-Received-Date: Wed, 21 Dec 2011 19:45:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2011 12:18 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> minix-session runs session files on behalf of file owner, so that no rootless X
> required.
>
> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
> ---
>   .../minix-session/files/minix-session              |   32 ++++++++++++++++++++
>   .../minix-session/minix-session_0.1.bb             |   24 +++++++++++++++
>   2 files changed, 56 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/minix-session/files/minix-session
>   create mode 100644 meta/recipes-graphics/minix-session/minix-session_0.1.bb
>
> diff --git a/meta/recipes-graphics/minix-session/files/minix-session b/meta/recipes-graphics/minix-session/files/minix-session
> new file mode 100644
> index 0000000..c28d537
> --- /dev/null
> +++ b/meta/recipes-graphics/minix-session/files/minix-session
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +#
> +# Very simple session manager for Mini X
> +#
> +
> +# Uncomment below to enable parsing of debian menu entrys
> +# export MB_USE_DEB_MENUS=1
> +
> +if [ -e $HOME/.minix/session ]
> +then
> +exec $HOME/.minix/session
> +fi
> +
> +if [ -e /etc/minix/session ]
> +then
> +exec /etc/minix/session
> +fi
> +
> +MINIX_SESSION_DIR=/etc/minix/session.d
> +
> +# Execute session file on behalf of file owner
> +for SESSIONFILE in $MINIX_SESSION_DIR/*; do
> +    set +e
> +    USERNAME=`stat -c %U $SESSIONFILE`
> +    sudo -b -i -u $USERNAME $SESSIONFILE&
> +    set -e
> +done
> +# Default files to run if $HOME/.minix/session or /etc/minix/session
> +# dont exist.
> +
> +matchbox-terminal&
> +exec matchbox-window-manager
> diff --git a/meta/recipes-graphics/minix-session/minix-session_0.1.bb b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
> new file mode 100644
> index 0000000..2e912c6
> --- /dev/null
> +++ b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Mini X session files for poky"
> +HOMEPAGE = "http://www.yoctoproject.org"
> +BUGTRACKER = "http://bugzilla.pokylinux.org"
> +
> +LICENSE = "GPL"
> +LIC_FILES_CHKSUM = "file://minix-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
> +
Is this really GPL?  MIT maybe?

And if it is GPL then what version?

Sau!

> +SECTION = "x11"
> +RCONFLICTS = "matchbox-common"
> +
> +SRC_URI = "file://minix-session"
> +S = "${WORKDIR}"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_NAME = "x-session-manager"
> +ALTERNATIVE_LINK = "${bindir}/x-session-manager"
> +ALTERNATIVE_PATH = "${bindir}/minix-session"
> +ALTERNATIVE_PRIORITY = "10"
> +
> +do_install() {
> +	install -d ${D}/${bindir}
> +	install -m 0755 ${S}/minix-session ${D}/${bindir}
> +}


