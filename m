Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TySBt-0001wF-FO
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 20:10:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2013 10:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,530,1355126400"; d="scan'208";a="281787759"
Received: from unknown (HELO [10.255.15.69]) ([10.255.15.69])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2013 10:54:31 -0800
Message-ID: <51018367.10704@linux.intel.com>
Date: Thu, 24 Jan 2013 10:54:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
	<1358512909-14714-3-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1358512909-14714-3-git-send-email-schnitzeltony@googlemail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/2] package.bbclass: remove RRECOMMENDS on base packages for locale packages
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
X-List-Received-Date: Thu, 24 Jan 2013 19:10:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/18/2013 04:41 AM, Andreas Müller wrote:
> As long as we support only one locale package per recipe this leads to unwanted
> packages in images. This patch was motivated by samba (meta-oe): only wanting
> libsmbclient one gets full samba server into the image. For my standard image
> the follwing package were removed by this patch:
>
> -acl_2.2.51-r3_armv7a-vfp-neon.ipk
> -alsa-states_0.2.0-r3_armv7a-vfp-neon.ipk
> -alsa-utils_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-aconnect_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-alsaconf_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-alsactl_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-alsaloop_1.0.25-r3_armv7a-vfp-neon.ipk
>   alsa-utils-alsamixer_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-alsaucm_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-amixer_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-aplay_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-aseqdump_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-aseqnet_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-iecset_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-midi_1.0.25-r3_armv7a-vfp-neon.ipk
> -alsa-utils-speakertest_1.0.25-r3_armv7a-vfp-neon.ipk
> -attr_2.4.46-r4_armv7a-vfp-neon.ipk
> -avahi_0.6.31-r7.1_armv7a-vfp-neon.ipk
> -gtk-engines_2.20.2-r3_armv7a-vfp-neon.ipk
> -pulseaudio_2.1-r15_armv7a-vfp-neon.ipk
> -samba_3.6.8-r6_armv7a-vfp-neon.ipk
> -vte_0.28.2-r5_armv7a-vfp-neon.ipk
> -xz_5.1.2alpha-r0_armv7a-vfp-neon.ipk
>
So what affect does it have on the oe-core images such as 
core-image-minimal and core-image-sato?


> Strange effect: For samba buildhistory's depends.dot says:
> -samba -> libc6;
> -samba -> libgcc1;
> -samba -> libreadline6;
> -samba -> libtalloc2;
> -samba -> libtdb1;
> -samba -> libwbclient0;
> -samba -> libz1;
> -samba -> update_rc_d;
> -samba_locale_de -> samba [style=dotted];
>   samba_locale_de -> virtual_locale_de [style=dotted];
> -samba_locale_fr -> samba [style=dotted];
> -samba_locale_fr -> samba [style=dotted];
>
> This is conflicts to buildhistory's result on samba package not mentioning
> any changes for samba package.
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   meta/classes/package.bbclass |    3 +--
>   1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index b06cca5..73e8de8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -455,13 +455,12 @@ python package_do_split_locales() {
>       description = d.getVar('DESCRIPTION', True) or ""
>       locale_section = d.getVar('LOCALE_SECTION', True)
>       mlprefix = d.getVar('MLPREFIX', True) or ""
> -    pndep = base_contains('PACKAGES', pn, '%s ' % pn, '', d)
>       for l in sorted(locales):
>           ln = legitimize_package_name(l)
>           pkg = pn + '-locale-' + ln
>           packages.append(pkg)
>           d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
> -        d.setVar('RRECOMMENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
> +        d.setVar('RRECOMMENDS_' + pkg, '%svirtual-locale-%s' % (mlprefix, ln))
>           d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
>           d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
>           d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
>


