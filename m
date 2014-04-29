Return-Path: <sgw@linux.intel.com>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Apr 2014 23:15:41 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0D860808
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 23:15:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Apr 2014 16:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,953,1389772800"; d="scan'208";a="503342129"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 29 Apr 2014 16:04:50 -0700
Message-ID: <53603012.9060408@linux.intel.com>
Date: Tue, 29 Apr 2014 16:04:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, 
	openembedded-core@lists.openembedded.org
References: <1398749875-32207-1-git-send-email-koen@dominion.thruhere.net>
	<1398749875-32207-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1398749875-32207-2-git-send-email-koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] xinput-calibrator: fix XDG launch
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
X-List-Received-Date: Tue, 29 Apr 2014 23:15:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/28/2014 10:37 PM, Koen Kooi wrote:
> In the move from meta-oe to OE-core XDG based launched was dropped
> without noting it in the commit message, so fix that regression.
>
> Gnome-session will now launch the calibrator again.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index 3f97e19..f942c55 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -25,7 +25,11 @@ do_install_append() {
>
>       install -d ${D}${sysconfdir}/X11/Xsession.d/
>       install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
> +
> +    install -d ${D}${sysconfdir}/xdg/autostart
> +    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop

This sed line is not quite right:
> | sed: can't read scripts/xinput_calibrator.desktop: No such file or directory
> | WARNING: /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+gitAUTOINC+c01c5af807-r6/temp/run.do_install.23227:1 exit 2 from
> |   sed -e 's,^Exec=.*,Exec=/usr/bin/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop > /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+gitAUTOINC+c01c5af807-r6/image/etc/xdg/autostart/xinput_calibrator.desktop
> | ERROR: Function failed: do_install (log file is located at /srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/xinput-calibrator/0.7.5+gitAUTOINC+c01c5af807-r6/temp/log.do_install.23227)
> ERROR: Task 2 (/srv/hdd/poky/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb, do_install) failed with exit code '1'


Sau!


>   }
>
> +FILES_${PN} += "${sysconfdir}/xdg/autostart"
>   RDEPENDS_${PN} = "xinput formfactor"
>   RRECOMMENDS_${PN} = "pointercal-xinput"
>

