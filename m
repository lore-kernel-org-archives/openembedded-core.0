Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ritnt-0000Ai-0V
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 21:20:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 12:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103941905"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2012 12:13:24 -0800
Message-ID: <4F060464.9030302@linux.intel.com>
Date: Thu, 05 Jan 2012 12:13:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325700000-7646-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1325700000-7646-1-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH] opkg-utils: use /usr/bin/env python
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
X-List-Received-Date: Thu, 05 Jan 2012 20:20:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2012 10:00 AM, Christopher Larson wrote:
> Signed-off-by: Christopher Larson<kergoth@gmail.com>
> ---
>   .../opkg-utils/opkg-utils/shebang.patch            |   46 ++++++++++++++++++++
>   meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    3 +-
>   2 files changed, 48 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>
Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
> new file mode 100644
> index 0000000..f6a2ef9
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
> @@ -0,0 +1,46 @@
> +Use python via the PATH, rather than hardcoding /usr/bin/python
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Christopher Larson<kergoth@gmail.com>
> +
> +--- opkg-utils.orig/opkg-list-fields
> ++++ opkg-utils/opkg-list-fields
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +
> + import sys, opkg
> +
> +--- opkg-utils.orig/opkg-make-index
> ++++ opkg-utils/opkg-make-index
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +
> + import sys, os, posixpath
> + from glob import glob
> +--- opkg-utils.orig/opkg-show-deps
> ++++ opkg-utils/opkg-show-deps
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +
> + import sys, os, posixpath
> + from glob import glob
> +--- opkg-utils.orig/opkg-unbuild
> ++++ opkg-utils/opkg-unbuild
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +
> + import sys, os, re
> +
> +--- opkg-utils.orig/opkg-update-index
> ++++ opkg-utils/opkg-update-index
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python2.1
> ++#!/usr/bin/env python
> +
> + import sys, os
> + from glob import glob
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> index 9b94aff..9702131 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> @@ -8,13 +8,14 @@ RDEPENDS_${PN} = "python"
>   RDEPENDS_${PN}_virtclass-native = ""
>   SRCREV = "4747"
>   PV = "0.1.8+svnr${SRCPV}"
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>              file://index-ignore-filenotfound.patch \
>              file://mtime-int.patch \
>              file://add-license-field.patch \
>              file://arfile_header_split.patch \
> +           file://shebang.patch \
>              "
>
>   S = "${WORKDIR}/opkg-utils"


