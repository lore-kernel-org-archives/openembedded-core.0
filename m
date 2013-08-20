Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A675B6B5AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:44:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2013 23:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,918,1367996400"; d="scan'208";a="389976112"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2013 23:44:20 -0700
Message-ID: <52131043.40200@linux.intel.com>
Date: Mon, 19 Aug 2013 23:44:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: rongqing.li@windriver.com
References: <cover.1376976261.git.rongqing.li@windriver.com>
	<87d62a3b41ce0817786dc65682410db969e49143.1376976261.git.rongqing.li@windriver.com>
In-Reply-To: <87d62a3b41ce0817786dc65682410db969e49143.1376976261.git.rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] shadown: backport a patch to make newgrp work
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
X-List-Received-Date: Tue, 20 Aug 2013 06:44:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Do you mean Shadow?

Please correct the spelling

Thanks
	Sau!


On 08/19/2013 10:26 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../shadow/files/fix-etc-gshadow-reading.patch     |   36 ++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    1 +
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
>
> diff --git a/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
> new file mode 100644
> index 0000000..80ebdc2
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
> @@ -0,0 +1,36 @@
> +shadow: Fix parsing of gshadow entries
> +
> +Upstream-Status: Backport [http://anonscm.debian.org/viewvc/pkg-shadow?view=revision&revision=3096]
> +
> +newgrp command does not function properly.
> +Even with the valid password, it outputs: "'Invalid password'"
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +
> +2010-02-14  Michael Bunk  <mb@computer-leipzig.com>
> +
> +	* NEWS, lib/gshadow.c: Fix parsing of gshadow entries.
> +
> +diff -urpN a/lib/gshadow.c b/lib/gshadow.c
> +--- a/lib/gshadow.c	2013-07-11 10:18:15.745450428 +0800
> ++++ b/lib/gshadow.c	2013-07-11 10:17:30.465450280 +0800
> +@@ -222,6 +222,7 @@ void endsgent (void)
> + 		if (NULL == buf) {
> + 			return NULL;
> + 		}
> ++		buflen = BUFSIZ;
> + 	}
> +
> + 	if (NULL == fp) {
> +@@ -229,9 +230,9 @@ void endsgent (void)
> + 	}
> +
> + #ifdef	USE_NIS
> +-	while (fgetsx (buf, (int) sizeof buf, fp) == buf)
> ++	while (fgetsx (buf, (int) buflen, fp) == buf)
> + #else
> +-	if (fgetsx (buf, (int) sizeof buf, fp) == buf)
> ++	if (fgetsx (buf, (int) buflen, fp) == buf)
> + #endif
> + 	{
> + 		while (   ((cp = strrchr (buf, '\n')) == NULL)
> diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> index af67339..31cef20 100644
> --- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
>              file://shadow-update-pam-conf.patch \
>              file://shadow_fix_for_automake-1.12.patch \
>              file://slackware_fix_for_glib-2.17_crypt.patch \
> +           file://fix-etc-gshadow-reading.patch \
>              "
>
>   SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
>

