Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0E56AD44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:03:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5KB3P65023190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:03:26 -0700 (PDT)
Received: from [128.224.163.179] (128.224.163.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 20 Jun 2013 04:03:23 -0700
Message-ID: <51C2E17A.1070204@windriver.com>
Date: Thu, 20 Jun 2013 19:03:22 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<226763569aa069ac26b177edf674b1d695016d2c.1371724384.git.jackie.huang@windriver.com>
In-Reply-To: <226763569aa069ac26b177edf674b1d695016d2c.1371724384.git.jackie.huang@windriver.com>
Subject: Re: [PATCH 1/2] consolekit: move libck-connector to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 11:03:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry I accidently sent the not working one, drop it and I will re-send.

Thanks,
Jackie

On 6/20/2013 6:36 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> move libck-connector.so.* to base_libdir and move
> pam_ck_connector.la to libdir to kill two warnings:
>
>      WARNING: QA Issue: consolekit: /lib64/security/pam_ck_connector.so,
>      installed in the base_prefix, requires a shared library under
>      exec_prefix (/usr): libck-connector.so.0 => /usr/lib64/
>      libck-connector.so.0 (0x00000000dead300
>
>      WARNING: QA Issue: lib32-consolekit: Found a reference to /usr/ in
>       /buildarea1/jhuang0/t_multilib/p_x64_0217/bitbake_build/tmp/work/
>      x86-wrsmllib32-linux/lib32-consolekit-0.4.5-r10/packages-split/i
>      lib32-consolekit/lib/security/pam_ck_connector.la
>      WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir
>      should not reference anything in exec_prefix
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../recipes-support/consolekit/consolekit_0.4.5.bb |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> index 7d66b39..095cb51 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
>   HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
>   BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
>
> -PR = "r10"
> +PR = "r11"
>
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> @@ -41,4 +41,15 @@ RDEPENDS_pam-plugin-ck-connector += "${PN}"
>   do_install_append() {
>   	# Remove /var/run from package as console-kit-daemon will populate it on startup
>   	rm -fr "${D}${localstatedir}/run"
> +	# Moving libck-connector to base_libdir
> +	# and moving pam_ck_connector.la to libdir
> +	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +	        mkdir -p ${D}/${base_libdir}/
> +	        mv -f ${D}${libdir}/libck-connector.so.0* ${D}${base_libdir}/
> +	        rel_lib_prefix=${@os.path.relpath(d.getVar('base_libdir', True), d.getVar('libdir', True))}
> +	        ln -sf ${rel_lib_prefix}${base_libdir}/libck-connector.so.0.0.0 ${D}${libdir}/libck-connector.so
> +	        if [ -f ${D}${base_libdir}/security/pam_ck_connector.la ]; then
> +	                mv -f ${D}${base_libdir}/security/pam_ck_connector.la ${D}${libdir}/
> +	        fi
> +	fi
>   }
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

