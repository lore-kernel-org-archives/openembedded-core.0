Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UeSRj-0000Af-4Y
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:56:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2013 08:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="316659101"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2013 08:38:01 -0700
Message-ID: <519A4359.2090205@linux.intel.com>
Date: Mon, 20 May 2013 08:38:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1369018014.git.Qi.Chen@windriver.com>
	<a0237296a606069eb2987ff126be556c61f62b7b.1369018014.git.Qi.Chen@windriver.com>
In-Reply-To: <a0237296a606069eb2987ff126be556c61f62b7b.1369018014.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 4/4] rpm-postinsts.bb: enable postinst logging
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
X-List-Received-Date: Mon, 20 May 2013 15:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2013 07:50 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Enable postinst logging by checking the configuration in /etc/
> default/postinst.
>
> In this way, the postinst logging is enabled if 'debug-tweaks' is
> in IMAGE_FEATURES, and at the same time, we avoid unnecessary rebuild
> if IMAGE_FEATURES is changed.
>
> [YOCTO #4262]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-devtools/rpm/rpm-postinsts.bb |   13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
> index 3d2d05d..01d7450 100644
> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
> +++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
> @@ -11,10 +11,6 @@ inherit allarch
>   #
>   POSTINSTALL_INITPOSITION ?= "98"
>
> -POSTLOG ?= "/var/log/postinstall.log"
> -REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
> -REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
> -
>   do_fetch() {
>   	:
>   }
> @@ -36,11 +32,16 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
>   	install -d $D/${sysconfdir}/rcS.d
>   	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
>   #!/bin/sh
> -
> +[ -e /etc/default/postinst ] && . /etc/default/postinst
>   [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
>   	i=/etc/rpm-postinsts/$i
>   	echo "Running postinst $i..."
> -	if [ -f $i ] && $i ${REDIRECT_CMD}; then
> +	if [ -x $i ]; then
> +		if [ "$POSTINST_LOGGING" = "ENABLED" ]; then
> +			$i >/var/log/postinstall.log 2&>1

This will over write the results of a previous postinstall because this 
is running in a for look, you should use >> instead of >.

I also suggested that the log file be a variable and you should use the 
${localestatedir} as the base for /var.  So you would add something like 
POSTINST_LOGFILE.

Thanks
	Sau!



> +		else
> +			$i
> +		fi
>   		rm $i
>   	else
>   		echo "ERROR: postinst $i failed."
>


