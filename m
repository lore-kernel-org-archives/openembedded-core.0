Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3FD61EF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 23:36:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2013 16:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1022,1371106800"; d="scan'208";a="410664580"
Received: from unknown (HELO [10.255.15.228]) ([10.255.15.228])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2013 16:36:32 -0700
Message-ID: <524CAE00.4030004@linux.intel.com>
Date: Wed, 02 Oct 2013 16:36:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: eu@felipetonello.com
References: <1380647958-5424-1-git-send-email-eu@felipetonello.com>
In-Reply-To: <1380647958-5424-1-git-send-email-eu@felipetonello.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc: Stop and remove service if updating package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Oct 2013 23:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2013 10:19 AM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> Since when updating packages packages managers do not remove the previous package,
> it just replaces new files and run pre/post install scripts. This causes not
> to update update-rc scripts if they were changed.
>
> This patch is useful in case the newer package version updated the update-rc
> script.
>

I think this patch might be responsible for some failures I am seeing on 
the master_under_test build.

Check out this error log: 
http://autobuilder.yoctoproject.org:8011/builders/minnow/builds/169/steps/Building%20Images/logs/stdio
Sau!

> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>   meta/classes/update-rc.d.bbclass | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index 5588569..773ca60 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -13,7 +13,23 @@ INITSCRIPT_PARAMS ?= "defaults"
>   INIT_D_DIR = "${sysconfdir}/init.d"
>
>   updatercd_postinst() {
> -if test "x$D" != "x"; then
> +IN_TARGET=`test "x$D" = "x"`
> +
> +# test if there is a previous init script there, ie, we are updating the package
> +# if so, we stop the service and remove it before we install from the new package
> +if type update-rc.d >/dev/null 2>/dev/null; then
> +	if [ $IN_TARGET -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
> +		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +	fi
> +	if [ $IN_TARGET ]; then
> +		OPT="-f -r $D"
> +	else
> +		OPT="-f"
> +	fi
> +	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +fi
> +
> +if [ $IN_TARGET ]; then
>   	OPT="-r $D"
>   else
>   	OPT="-s"
>

