Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpA8s-0003Ir-Ar
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 04:28:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 19:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="36035300"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 19:23:40 -0700
Message-ID: <4E3B542C.1070306@linux.intel.com>
Date: Thu, 04 Aug 2011 19:23:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime	dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 02:28:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 04:08 AM, Koen Kooi wrote:
> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>
But you did not test it against anything in oe-core, it has broken the 
build for connman-gnome and oprofileui, which use this bbclass.

The oe-core gnome-icon-theme does not include this class.

Please correct this.

   Processing task-base-extended...
| error: Failed dependencies:
| 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
| 	hicolor-icon-theme is needed by connman-gnome-0.5-r6.armv5te
| 	hicolor-icon-theme is needed by 
oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.armv5te

Thanks
	Sau!


> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   meta/classes/gtk-icon-cache.bbclass |    8 ++++++--
>   1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index dcabaf5..d9b5d1b 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,5 +1,4 @@
>   FILES_${PN} += "${datadir}/icons/hicolor"
> -RDEPENDS += "hicolor-icon-theme"
>
>   # This could run on the host as icon cache files are architecture independent,
>   # but there is no gtk-update-icon-cache built natively.
> @@ -34,7 +33,12 @@ python populate_packages_append () {
>   		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', d, 1))
>   		if not os.path.exists(icon_dir):
>   			continue
> -		
> +
> +		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
> +		rdepends = bb.data.getVar('RDEPENDS', d, 1)
> +		rdepends += "hicolor-icon-theme"
> +		bb.data.setVar('RDEPENDS', rdepends, d)
> +	
>   		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
>   		
>   		postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)



