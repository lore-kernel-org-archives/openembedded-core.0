Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 09F9661019
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:56:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2013 05:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,898,1371106800"; d="scan'208";a="401158336"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by fmsmga002.fm.intel.com with ESMTP; 13 Sep 2013 05:56:01 -0700
Message-ID: <52330B60.6000008@linux.intel.com>
Date: Fri, 13 Sep 2013 15:56:00 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
References: <1379073002-19032-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1379073002-19032-1-git-send-email-muhammad_shakeel@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Fix EXTRA_OECONF
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
X-List-Received-Date: Fri, 13 Sep 2013 12:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Muhammad,

On 13.09.2013 14:50, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> - --enable-threads and --enable-fake are obsolete, unrecognized options
> now.
> - --enable-bluetooth,wifi,ofono just build these technologies as plugins
> and these plugins need to be installed explicitly. Our intention here
> is to make these technologies available by default, if enabled. For
> this we need --enable-bluetooth,wifi,ofono=builtin.
> - If bluetooth is getting disabled then disable dundee as well, which
> is enabled by default.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 37ce3ec..71ecce2 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -21,14 +21,12 @@ EXTRA_OECONF += "\
>       ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
>       ac_cv_path_PPPD=${sbindir}/pppd \
>       --enable-debug \
> -    --enable-threads \
>       --enable-loopback \
>       --enable-ethernet \
>       --enable-tools \
>       --enable-test \
>       --disable-polkit \
>       --enable-client \
> -    --enable-fake \

Ack to this part, those options can be removed.

>       ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
>   "
>
> @@ -42,9 +40,9 @@ PACKAGECONFIG ??= "wispr \
>   # local.conf or distro config
>   # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
>
> -PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
> -PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
> +PACKAGECONFIG[wifi] = "--enable-wifi=builtin, --disable-wifi, wpa-supplicant"
> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth=builtin, --disable-bluetooth --disable-dundee, bluez4"
> +PACKAGECONFIG[3g] = "--enable-ofono=builtin, --disable-ofono, ofono"

There is no need to say builtin here as that is the default and those 
plugins are always builtin anyways.

About the dundee disabling, it would probably be better to have this 
check in upstream connman. This would mean that if bluetooth is 
disabled, then dundee would be automatically disabled (tweak 
Makefile.plugins in ConnMan).
Could you send patch for this to connman ml?


>   PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>   PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
>   PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
>


Cheers,
Jukka


