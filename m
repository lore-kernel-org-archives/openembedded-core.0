Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 097DF65D19
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:42:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0KFgeNP009725
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jan 2015 07:42:40 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 07:42:40 -0800
Message-ID: <54BE775C.40407@windriver.com>
Date: Tue, 20 Jan 2015 10:42:20 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>, Patches and discussions
	about the oe-core layer <Openembedded-core@lists.openembedded.org>
References: <20150120133750.1c26e442@bottazzini-ThinkPad-T430>
In-Reply-To: <20150120133750.1c26e442@bottazzini-ThinkPad-T430>
Subject: Re: [linux-yocto] Nothing RPROVIDES dbus-native-tools-native
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
X-List-Received-Date: Tue, 20 Jan 2015 15:42:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Adding the oe-core mailing list, since this is a non-kernel question.

Anyone have ideas about the question below ?

Cheers,

Bruce

On 15-01-20 10:37 AM, Bottazzini, Bruno wrote:
> Hello,
>
> I have made some changes in dbus recipe.
>
> You can it see the attached patch file.
>
> When running this lighter version with the line code:
> RRECOMMENDS_${PN} = "${PN}-tools"
>
> I receive two errors:
> ERROR: Nothing RPROVIDES 'dbus-native-tools-native' (path RDEPENDS on
> or otherwise requires it))
> ERROR: Required build target 'core-image-minimal' has no buildable
> providers.
>
> I have looked into this error but unfortunately I couldn't find what
> the problem is.
>
> The patch code looks good and, If I remove the RRECOMMENDS it works
> normally.
>
> Can someone help me out why a RRECOMENDS causes this error ?
>
> Best Regards,
>
> Bruno Bottazzini
>
>
> 0002-dbus-split-tools-package.patch
>
>
>  From b965f97f6f71444f7158045b346e59ca27acfa13 Mon Sep 17 00:00:00 2001
> From: Gustavo Sverzut Barbieri<gustavo.barbieri@intel.com>
> Date: Thu, 25 Sep 2014 14:10:09 -0300
> Subject: [PATCH 2/4] dbus: split tools package.
>
> most tools are not required if one is launching a simple daemon, this
> will save space when doing minimal builds.
> ---
>   meta/recipes-core/dbus/dbus.inc | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index d38ba7e..8b14647 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -39,7 +39,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>
>   DEBIANNAME_${PN} = "dbus-1"
>
> -PACKAGES =+ "${PN}-lib"
> +PACKAGES =+ "${PN}-lib ${PN}-tools"
>
>   OLDPKGNAME = "dbus-x11"
>   OLDPKGNAME_class-nativesdk = ""
> @@ -49,12 +49,7 @@ RPROVIDES_${PN} = "${OLDPKGNAME}"
>   RREPLACES_${PN} += "${OLDPKGNAME}"
>
>   FILES_${PN} = "${bindir}/dbus-daemon* \
> -               ${bindir}/dbus-uuidgen \
> -               ${bindir}/dbus-cleanup-sockets \
>                  ${bindir}/dbus-send \
> -               ${bindir}/dbus-monitor \
> -               ${bindir}/dbus-launch \
> -               ${bindir}/dbus-run-session \
>                  ${libexecdir}/dbus* \
>                  ${sysconfdir} \
>                  ${localstatedir} \
> @@ -64,6 +59,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>   FILES_${PN}-lib = "${libdir}/lib*.so.*"
>   RRECOMMENDS_${PN}-lib = "${PN}"
>   FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
> +FILES_${PN}-tools += "${bindir}/dbus-uuidgen \
> +                      ${bindir}/dbus-cleanup-sockets \
> +                      ${bindir}/dbus-monitor \
> +                      ${bindir}/dbus-launch \
> +                      ${bindir}/dbus-run-session"
> +RRECOMMENDS_${PN} = "${PN}-tools"
>
>   pkg_postinst_dbus() {
>   	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
> -- 2.1.0
>
>
>
> -- _______________________________________________ linux-yocto mailing
> list linux-yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/linux-yocto
>


