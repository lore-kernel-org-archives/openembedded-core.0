Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE9E718FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 07:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H77gLv029940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 00:07:42 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 17 Oct 2014 00:07:41 -0700
Message-ID: <5440C08B.9000109@windriver.com>
Date: Fri, 17 Oct 2014 15:08:59 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Fri, 17 Oct 2014 07:07:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2014 10:27 AM, Martin Jansa wrote:
> * libgudev-1.0.la still references /usr/lib and this change was breaking gypsy (detected in navit) and
>    network-manager-applet
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_216.bb | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
> index ebf9395..2779823 100644
> --- a/meta/recipes-core/systemd/systemd_216.bb
> +++ b/meta/recipes-core/systemd/systemd_216.bb
> @@ -129,9 +129,6 @@ do_install() {
>   		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
>   	fi
>   
> -	# Move libgudev back to ${rootlibdir} to keep backward compatibility
> -	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
> -
>           # Delete journal README, as log can be symlinked inside volatile.
>           rm -f ${D}/${localstatedir}/log/README
>   
> @@ -171,10 +168,10 @@ python populate_packages_prepend (){
>       systemdlibdir = d.getVar("rootlibdir", True)
>       do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
>   }
> -PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
> +PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
>   
>   PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
> -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
>   
>   SYSTEMD_PACKAGES = "${PN}-binfmt"
>   SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> @@ -188,6 +185,8 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>   FILES_${PN}-initramfs = "/init"
>   RDEPENDS_${PN}-initramfs = "${PN}"
>   
> +FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
> +
>   # The test cases need perl and bash to run correctly.
>   RDEPENDS_${PN}-ptest += "perl bash"
>   FILES_${PN}-ptest += "${libdir}/udev/rules.d"

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>


