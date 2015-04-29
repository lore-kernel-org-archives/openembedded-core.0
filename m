Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBFD7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:54:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 29 Apr 2015 01:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,670,1422950400"; d="scan'208";a="563539926"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga003.jf.intel.com with ESMTP; 29 Apr 2015 01:54:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 29 Apr 2015 09:54:21 +0100
Message-ID: <1574592.uPXveHVxj5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <9798a8311486c433ae323a8c5d7fef53ce07d380.1430294879.git.Qi.Chen@windriver.com>
References: <cover.1430294879.git.Qi.Chen@windriver.com>
	<9798a8311486c433ae323a8c5d7fef53ce07d380.1430294879.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Wed, 29 Apr 2015 08:54:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Wednesday 29 April 2015 16:08:36 Chen Qi wrote:
> Copy the contents of local.conf under TOPDIR into the final generated
> local.conf. In this way, custom settings are also made into the final
> local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.
> 
> Before this change, installing extensible SDK would usually report failure
> when preparing the build system if the user has custom configuration for
> DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
> local.conf also don't get built correctly.
> 
> This patch solves the above problem.
> 
> A blacklist mechanism is also introduced so that we can blacklist variables
> that should not be copied into the final local.conf file. Currently, the
> blacklist contains 'SSTATE_DIR' and 'DL_DIR'.
> 
> [YOCTO #7616]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index dc2c58e..7925ece 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = "
> ${SDK_TARGETS}" SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
> 
>  SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
> +SDK_META_CONF_BLACKLIST ?= "DL_DIR SSTATE_DIR"

I'm not totally opposed to this approach but we are going to have to get the 
default list right if we are going to do it - e.g. you've missed the fairly 
obvious TMPDIR. There are quite a large number of other variables the user 
might set that should be blacklisted - potentially any variable that points to 
a location where the build system would write files (DEPLOY_DIR, DEPLOY_DIR_*, 
WORKDIR, T, S, B, ...). We might go a step further and use the data dictionary 
to check if the value evaluates to somewhere outside of ${TMPDIR} (if we first 
make a copy of d and set TMPDIR to a dummy value); this way we would allow 
adjustments within TMPDIR but not outside of it.

My other concern (perhaps a pet issue of mine) is that people are far too 
reliant on putting things in local.conf that they really shouldn't. On the 
other hand building a potentially broken SDK or at least one that doesn't 
match up with the image is worse, but I'm still concerned about the way 
local.conf is often abused.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

