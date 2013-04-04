Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNna8-0007ME-53 for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 19:04:12 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34GvcoF031686; Thu, 4 Apr 2013 17:57:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id riyOdytO3rC1; Thu,  4 Apr 2013 17:57:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34GvXD2031681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 17:57:36 +0100
Message-ID: <1365094008.6526.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 04 Apr 2013 17:46:48 +0100
In-Reply-To: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365093733-31674-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: set INHIBIT_UPDATERCD_BBCLASS without sysvinit in features
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
X-List-Received-Date: Thu, 04 Apr 2013 17:04:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-04 at 18:42 +0200, Martin Jansa wrote:
> * fixes udev configure in run-postinsts failing with:
>   update-rc.d: /etc/init.d/systemd-udev: file does not exist
>   because systemd-udev is installed only with sysvinit in features
>   but update-rc.d was always called from PN postinst
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_199.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
> index ba1d133..e574548 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -239,6 +239,12 @@ INITSCRIPT_PACKAGES = "udev"
>  INITSCRIPT_NAME_udev = "systemd-udevd"
>  INITSCRIPT_PARAMS_udev = "start 03 S ."
>  
> +python __anonymous() {
> +    features = d.getVar("DISTRO_FEATURES", True).split()
> +    if "sysvinit" not in features:
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
> +
>  # TODO:
>  # u-a for runlevel and telinit

Would this make sense to be in systemd.bbclass?

Cheers,

Richard





