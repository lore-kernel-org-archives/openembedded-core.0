Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7096BD03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 23:13:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2013 16:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,978,1367996400"; d="scan'208";a="393528751"
Received: from unknown (HELO [10.255.14.210]) ([10.255.14.210])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2013 16:13:26 -0700
Message-ID: <521E8414.8060309@linux.intel.com>
Date: Wed, 28 Aug 2013 16:13:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+3: don't split immodules if we have none
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
X-List-Received-Date: Wed, 28 Aug 2013 23:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2013 09:12 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> Currently we don't enable any immodules for gtk+3, yet we unconditionally call
> do_split_packages on a nonexistent path. This results in a return value of
> None, which it then tries to join, resulting in a TypeError. Only split the
> modules if we have any modules to split.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/recipes-gnome/gtk+/gtk+3.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index f4d5254..204a425 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -94,7 +94,8 @@ python populate_packages_prepend () {
>       immodules_root = os.path.join(gtk_libdir, 'immodules')
>       printmodules_root = os.path.join(gtk_libdir, 'printbackends');
>
> -    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
> +    if os.path.exists(os.path.join(d.getVar('D', True), immodules_root)):
> +        d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
>       do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
>
>       if (d.getVar('DEBIAN_NAMES', 1)):
>

This seems to give me the following QA error:

> ERROR: QA Issue: gtk+3: Files/directories were installed but not shipped
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-viqr.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-am-et.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-xim.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-multipress.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-cedilla.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-ti-et.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-ipa.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-inuktitut.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-ti-er.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-thai.so
>   /usr/lib/gtk-3.0/3.0.0/immodules/im-cyrillic-translit.so
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/work/x86_64-poky-linux/gtk+3/3.8.2-r0/temp/log.do_package.17386
> ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb, do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn't need to be rerun and 1 failed.

Thanks
	Sau!


