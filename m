Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RLUAI-0007ga-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 07:19:10 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 2 Nov 2011 08:11:59 +0200
Message-ID: <4EB0DF26.1000200@bluegiga.com>
Date: Wed, 02 Nov 2011 08:11:50 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320183757.git.sgw@linux.intel.com>
	<453f61fd0043629181379d5d3766c118bdd46dd2.1320183757.git.sgw@linux.intel.com>
In-Reply-To: <453f61fd0043629181379d5d3766c118bdd46dd2.1320183757.git.sgw@linux.intel.com>
X-OriginalArrivalTime: 02 Nov 2011 06:11:59.0135 (UTC)
	FILETIME=[54703AF0:01CC9926]
Subject: Re: [Pull v2 2/4] xserver-nodm-init: Add xuser (hardcoded)
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
X-List-Received-Date: Wed, 02 Nov 2011 06:19:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

On 11/01/2011 11:44 PM, Saul Wold wrote:
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   .../x11-common/xserver-nodm-init.bb                |   30 +++++++------------
>   1 files changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> index ea4222d..5b06bc6 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>   SECTION = "x11"
> -PR = "r26"
> +PR = "r28"
>   RDEPENDS_${PN} = "sudo"
>
>   SRC_URI = "file://xserver-nodm \
> @@ -19,27 +19,19 @@ do_install() {
>       install xserver-nodm ${D}/etc/init.d
>       if [ "${ROOTLESS_X}" = "1" ] ; then
>           install -d ${D}/etc/X11
> -        install Xusername ${D}/etc/X11
> +	install Xusername ${D}/etc/X11

Is this indentation change a typo?


Lauri


>       fi
>   }
>
> -pkg_postinst_${PN} () {
> -    if [ "x$D" != "x" ] ; then
> -        exit 1
> -    fi
> -
> -    if [ -f /etc/X11/Xusername ]; then
> -        # create the rootless X user, and add user to group tty, video, audio
> -        username=`cat /etc/X11/Xusername`
> -        adduser --disabled-password $username
> -        # FIXME: use addgroup if busybox addgroup is ready
> -        sed -i -e "s/^video:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^audio:.*/&${username}/g" /etc/group
> -    fi
> -}
> -
> -inherit update-rc.d
> +inherit update-rc.d useradd
>
>   INITSCRIPT_NAME = "xserver-nodm"
>   INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +
> +# Use fixed Xusername of xuser for now, this will need to be
> +# fixed if the Xusername changes from xuser
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "--system --no-create-home \
> +                       --shell /bin/false --groups video,tty,audio \
> +                       --user-group xuser"
> +


