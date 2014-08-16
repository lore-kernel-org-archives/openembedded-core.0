Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2741970D90
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 01:59:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7G1xc3s010143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Aug 2014 18:59:38 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 18:59:38 -0700
Message-ID: <53EEBB08.1070403@windriver.com>
Date: Sat, 16 Aug 2014 09:59:36 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1408121722-20308-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1408121722-20308-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][V2] avahi: unset FILES_avahi to avoid packaging files there
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
X-List-Received-Date: Sat, 16 Aug 2014 01:59:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/16/2014 12:55 AM, Ross Burton wrote:
> The main avahi recipe doesn't package anything into ${PN}.  If a library is
> enabled but not put into a separate package it ends up in ${PN} and all the
> packages are renamed using it's soname - ie libdns-sd-daemon.
>
> Avoid this by clearing FILES_avahi so extra files are unpackaged instead of
> creating a new package.  Also actually remove /var as the comments claim so the
> avahi package is truly empty.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 3318f40..b97c4c5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -73,6 +73,9 @@ do_configure_prepend() {
>
>   PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
>
> +# As avahi doesn't put any files into PN, clear the files list to avoid problems
> +# if extra libraries appear.
> +FILES_avahi = ""
>   FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
>                          ${sysconfdir}/avahi/avahi-autoipd.action \
>                          ${sysconfdir}/dhcp/*/avahi-autoipd \
> @@ -122,7 +125,8 @@ do_install() {
>   	# don't install /var/run when populating rootfs. Do it through volatile
>   	# /var/run of current version is empty, so just remove it.
>   	# if /var/run become non-empty in the future, need to install it via volatile
> -	rm -rf ${D}/var/run
> +	rm -rf ${D}${localstatedir}/run
> +	rmdir --ignore-fail-on-non-empty ${D}${localstatedir}

Got a do_install error because of this:

rmdir: failed to remove `/path/to/avahi-ui/0.6.31-r11.0/image/var': No such file 
or directory

This is because there is a "rmdir ${D}${localstatedir}" in do_install_append(),
once the first one removes it successfully, the later one would cause errors.

// Robert

>   	rm -rf ${D}${datadir}/dbus-1/interfaces
>   	rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
>   	rm -rf ${D}${libdir}/avahi
>

