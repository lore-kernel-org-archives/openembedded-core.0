Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFE3C6D159
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 15:11:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 08:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426515790"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 08:11:38 -0700
Message-ID: <526FD029.3080800@linux.intel.com>
Date: Tue, 29 Oct 2013 08:11:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1380221559-25585-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1380221559-25585-1-git-send-email-jslater@windriver.com>
Subject: Re: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Tue, 29 Oct 2013 15:11:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2013 11:52 AM, Joe Slater wrote:
> This class points the inheritor, if it is a target,
> to directories in the target sysroot, so we want to
> be sure the .vapi files are there.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/classes/vala.bbclass |    8 +++++---
>   1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
> index c7db08c..3b70a04 100644
> --- a/meta/classes/vala.bbclass
> +++ b/meta/classes/vala.bbclass
> @@ -1,9 +1,11 @@
>   # Vala has problems with multiple concurrent invocations
>   PARALLEL_MAKE = ""
>
> -# Vala needs vala-native
> -DEPENDS += "vala-native"
> -DEPENDS_virtclass-native += "vala-native"
> +# Everyone needs vala-native and targets need vala, too,
> +# because that is where target builds look for .vapi files.
> +#
> +VALADEPENDS_class-target = "vala"
> +DEPENDS_append = " vala-native ${VALADEPENDS}"
You should really have a default value for VALADEPENDS = "", the above 
class override relies on bitbake behaviour which could change.

Thanks

Sau!

>
>   # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
>   export STAGING_DATADIR
>

