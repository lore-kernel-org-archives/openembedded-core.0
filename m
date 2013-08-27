Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6853261F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:16:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2013 08:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="394172491"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2013 08:16:46 -0700
Message-ID: <521CC2DD.7020109@linux.intel.com>
Date: Tue, 27 Aug 2013 08:16:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <011401cea2f4$92481300$b6d83900$@cn.fujitsu.com>
In-Reply-To: <011401cea2f4$92481300$b6d83900$@cn.fujitsu.com>
Subject: Re: [PATCH 1/1] consolekit_0.4.6.bb: Fix QA error when --enable-udev-acl
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
X-List-Received-Date: Tue, 27 Aug 2013 15:16:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 08/27/2013 12:10 AM, leimaohui wrote:
> Add EXTRA_OECONF += "--enable-udev-acl" to
>
> consolekit_0.4.6.bb whill causea package_qa error.
>
> The error message looks like:
>
> |ERROR: QA Issue: non debug package contains .debug directory:
>
> | consolekit path consolekit/0.4.6-r0/packages-split/consolekit/lib/u
>
> | dev/.debug/udev-acl
>
> There is a need to add udev-acl file to package instead of “${base_libdir}”
>
> Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com
> <mailto:leimaohui@cn.fujitsu.com>>
>
> ---
>
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
>
> b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
>
> index 63da028..4133f4d 100644
>
> --- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
>
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
>
> @@ -28,9 +28,10 @@ PACKAGECONFIG[policykit] = ",,polkit"
>
> PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=
>
> ${systemd_unitdir}/system/,--with-systemdsystemunitdir="
>
> FILES_${PN} += "${localstatedir}/log/ConsoleKit
> ${exec_prefix}/lib/ConsoleKit \
>
> -                ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
>
> -                ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>
> -FILES_${PN}-dbg += "${base_libdir}/security/.debug"
>
> +                ${libdir}/ConsoleKit  ${systemd_unitdir}
> ${base_libdir}/udev/rules.d \
>
> +               ${base_libdir}/udev/udev-acl ${datadir}/dbus-1
> ${datadir}/PolicyKit \
>
> +               ${datadir}/polkit*"
>
> +FILES_${PN}-dbg += "${base_libdir}/security/.debug /lib/udev/.debug"
>
Please use ${base_libdir} instead of /lib here.

Thanks
	Sau!

> PACKAGES =+ "pam-plugin-ck-connector"
>
> FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
>
> --
>
> 1.7.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

