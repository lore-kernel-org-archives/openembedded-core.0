Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE2DF6AF2C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:06:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2013 08:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1020,1363158000"; d="scan'208";a="342181662"
Received: from unknown (HELO [10.255.13.85]) ([10.255.13.85])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2013 08:05:49 -0700
Message-ID: <51DAD54C.3000500@linux.intel.com>
Date: Mon, 08 Jul 2013 08:05:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com, david.borman@windriver.com
References: <cover.1373253998.git.jackie.huang@windriver.com>
	<e2fa93a52c32522d4831e3d29f87bae4c6625f27.1373253998.git.jackie.huang@windriver.com>
In-Reply-To: <e2fa93a52c32522d4831e3d29f87bae4c6625f27.1373253998.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib: fix the python script munging for cross compile
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
X-List-Received-Date: Mon, 08 Jul 2013 15:06:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2013 08:30 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Fix the munging of python scripts so that they'll work
> on the target, we don't want ${PYTHON}, because that is
> the path on the host, not the target.
>
> Signed-off-by: David Borman <david.borman@windriver.com>
> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../glib-2.0/glib-2.0/glib2-python-ref.patch       |   33 ++++++++++++++++++++
>   meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb      |    1 +
>   2 files changed, 34 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch
> new file mode 100644
> index 0000000..d2f8d44
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch
> @@ -0,0 +1,33 @@
> +glib: fix the python script munging for cross compile
> +
> +Fix the munging of python scripts so that they'll work
> +on the target, we don't want ${PYTHON}, because that is
> +the path on the host, not the target.
> +
> +Upstream-status: Inappropriate [ embedded specific ]
> +
> +Signed-off-by: David Borman <david.borman@windriver.com>
> +Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> +
> +--- glib-2.26.0/glib/Makefile.am
> ++++ glib-2.26.0/glib/Makefile.am
> +@@ -413,7 +413,7 @@
> + 	  mv -f "$(DESTDIR)$(bindir)/$$sf" "$(DESTDIR)$(bindir)/$$sf".tmp \
> + 	  && sed < "$(DESTDIR)$(bindir)/$$sf".tmp > "$(DESTDIR)$(bindir)/$$sf" \
> + 	    -e '1,24s|^ *#@PKGINSTALL_CONFIGVARS_IN24LINES@|  ${CONFIGVARS}|' \
> +-	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!${PYTHON}|' \
> ++	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!/usr/bin/python|' \
I am not sure hardcoding in /usr/bin/pyhton is correct here either, we 
typically use the "/usr/bin/env python", so why not clean up the #! to that?

Sau!

> + 	  || exit $$? ; \
> + 	  chmod a+x $(DESTDIR)$(bindir)/$$sf ; \
> + 	  rm -f "$(DESTDIR)$(bindir)/$$sf".tmp ; \
> +--- glib-2.26.0/glib/Makefile.in
> ++++ glib-2.26.0/glib/Makefile.in
> +@@ -1759,7 +1759,7 @@
> + @OS_UNIX_TRUE@	  mv -f "$(DESTDIR)$(bindir)/$$sf" "$(DESTDIR)$(bindir)/$$sf".tmp \
> + @OS_UNIX_TRUE@	  && sed < "$(DESTDIR)$(bindir)/$$sf".tmp > "$(DESTDIR)$(bindir)/$$sf" \
> + @OS_UNIX_TRUE@	    -e '1,24s|^ *#@PKGINSTALL_CONFIGVARS_IN24LINES@|  ${CONFIGVARS}|' \
> +-@OS_UNIX_TRUE@	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!${PYTHON}|' \
> ++@OS_UNIX_TRUE@	    -e '1,1s|#! /usr/bin/env python\([0-9]\+\(\.[0-9]\+\)\?\)\?|#!/usr/bin/python|' \
> + @OS_UNIX_TRUE@	  || exit $$? ; \
> + @OS_UNIX_TRUE@	  chmod a+x $(DESTDIR)$(bindir)/$$sf ; \
> + @OS_UNIX_TRUE@	  rm -f "$(DESTDIR)$(bindir)/$$sf".tmp ; \
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> index d9d8932..ffe34ac 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> @@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://fix-conflicting-rand.patch \
>              file://Makefile-ptest.patch \
>              file://add-march-i486-into-CFLAGS-automatically.patch \
> +           file://glib2-python-ref.patch \
>              file://run-ptest \
>             "
>
>

