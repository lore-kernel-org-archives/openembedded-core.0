Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVMhO-0005h4-Ld
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 15:59:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3PDfEWf001688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 06:41:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 06:41:14 -0700
Message-ID: <5179327A.9010803@windriver.com>
Date: Thu, 25 Apr 2013 08:41:14 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1366851904-1306-1-git-send-email-stefanx.stanacar@intel.com>
In-Reply-To: <1366851904-1306-1-git-send-email-stefanx.stanacar@intel.com>
Subject: Re: [PATCH] connman: replace hardcoded path in init script
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
X-List-Received-Date: Thu, 25 Apr 2013 13:59:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/13 8:05 PM, Stefan Stanacar wrote:
> Because the connman init script sources a config file from /usr/lib
> we end up with no network in multilib enabled sato images, so replace
> with the real libdir.
>
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc     | 3 ++-
>   meta/recipes-connectivity/connman/connman/connman | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 589ece8..93c9da0 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -47,7 +47,7 @@ INITSCRIPT_NAME = "connman"
>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>
>   SYSTEMD_SERVICE_${PN} = "connman.service"
> -SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
> +SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"

I don't think this is right.  The initscript and setup command should be in the 
'libexec' location, which is /usr/lib/connman.  This way the initscript from any 
duplicate multilibs installed won't cause a conflict.  And the binaries end up 
in a known location.  (The libraries on the other hand should definitely be in 
the libdir.)

So far we've tried to follow RPM/Fedora style rules for multilib work.  And 
those rules are:

* Multilib packages can all be installed at once
* Executables should be installed in the same location, so the package manager 
rules take priority as to what version is installed and runable
* Scripts and other non-executables much either be the same in all multilibs, or 
installed in a unique location.

--Mark

>
>   # IMPORTANT: because xuser is shared with rootless X, please make sure the
>   # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
> @@ -73,6 +73,7 @@ do_install_append() {
>   	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>   		install -d ${D}${sysconfdir}/init.d
>   		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
> +                sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
>   	fi
>
>   	install -d ${D}${bindir}
> diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
> index a111f60..67ba7c8 100644
> --- a/meta/recipes-connectivity/connman/connman/connman
> +++ b/meta/recipes-connectivity/connman/connman/connman
> @@ -32,8 +32,8 @@ do_start() {
>   		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
>   		EXTRA_PARAM="-I $ethn"
>   	fi
> -	if [ -f /usr/lib/connman/wired-setup ] ; then
> -		. /usr/lib/connman/wired-setup
> +	if [ -f @LIBDIR@/connman/wired-setup ] ; then
> +		. @LIBDIR@/connman/wired-setup
>   	fi
>   	$DAEMON $EXTRA_PARAM
>   }
>



