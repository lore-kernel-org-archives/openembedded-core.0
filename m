Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbTu4-0000Ge-Jb
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:21:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2012 02:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,299,1352102400"; d="scan'208";a="245750042"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2012 02:06:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 22 Nov 2012 10:06:55 +0000
Message-ID: <1424745.oM7gvEqakJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1353575950-7484-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353575950-7484-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: DISTRO is not required variable so deal with it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 10:21:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 November 2012 10:19:10 Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/classes/archiver.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 160a3aa..ac6e401 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -8,7 +8,6 @@
> 
>  ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
>  ARCHIVE_TYPE ?= "tar srpm"
> -DISTRO ?= "poky"
>  PATCHES_ARCHIVE_WITH_SERIES = 'yes'
>  SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE',
> 'log_type') \ if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else
> 'logs_with_scripts'}' @@ -492,6 +491,8 @@ def create_diff_gz(d):
> 
>      s=d.getVar('S', True)
>      distro = d.getVar('DISTRO',True)
> +    if not distro:
> +        distro = ""
>      dest = s + '/' + distro + '/files'
>      if not os.path.exists(dest):
>          bb.mkdirhier(dest)

A more pythonic way to deal with this (as used elsewhere) would be:

distro = d.getVar('DISTRO',True) or ""

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


