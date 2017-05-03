Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 08F146E672
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 15:01:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 03 May 2017 08:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="1164074628"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2017 08:01:35 -0700
Message-ID: <1493824168.1761.12.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: niko.mauno@vaisala.com
Date: Wed, 03 May 2017 10:09:28 -0500
In-Reply-To: <1493807968-4697-1-git-send-email-niko.mauno@vaisala.com>
References: <1493807968-4697-1-git-send-email-niko.mauno@vaisala.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Allow overriding environment specific SPDX variables
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
X-List-Received-Date: Wed, 03 May 2017 15:01:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-03 at 10:39 +0000, niko.mauno@vaisala.com wrote:
> Change certain variable assignments from 'hard' (=) to 'soft' (?=) so that
> suitable permutations of values for these variables can be assigned eg. in
> custom meta layers. Otherwise eg. fossology server is limited to run on same
> machine as bitbake, and generated SPDX files are placed into home directory
> path of a custom luser account.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/conf/licenses.conf | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index d210a0e..fcaec1b 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -123,7 +123,9 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
>  
>  ## SPDX temporary directory
>  SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
> -SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
> +
> +## Output directory for generated SPDX files
> +SPDX_MANIFEST_DIR ?= "/home/yocto/fossology_scans"

not sure if this is right, but shouldn't be SPDX_MANIFEST_DIR ?=
"${SPDX_TEMP_DIR}/fossology_scans' so this way we do not rely on a
yocto's home folder?

Leo

>  
>  ## SPDX Format info
>  SPDX_VERSION = "SPDX-1.1"
> @@ -142,7 +144,7 @@ DATA_LICENSE = "CC0-1.0"
>  #   information.
>  #
>  
> -FOSS_NO_COPYRIGHT = "true"
> +FOSS_NO_COPYRIGHT ?= "true"
>  
>  # A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
>  # used to control if FOSSology server need recursively unpack tar.gz file which
> @@ -156,7 +158,7 @@ FOSS_NO_COPYRIGHT = "true"
>  #    FOSSology server recursively unpack components.
>  #
>  
> -FOSS_RECURSIVE_UNPACK = "false"
> +FOSS_RECURSIVE_UNPACK ?= "false"
>  
>  # An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is used to
>  # control what kind of SPDX output to get from the FOSSology server.
> @@ -171,7 +173,7 @@ FOSS_RECURSIVE_UNPACK = "false"
>  #   license tags in the report will be "NOASSERTION"
>  #
>  
> -FOSS_FULL_SPDX = "true"
> +FOSS_FULL_SPDX ?= "true"
>  
>  # FOSSologySPDX instance server. http://localhost/repo is the default
>  # installation location for FOSSology.
> @@ -180,7 +182,7 @@ FOSS_FULL_SPDX = "true"
>  #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
>  #
>  
> -FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
> +FOSS_BASE_URL ?= "http://localhost/repo/?mod=spdx_license_once"
>  FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
>  
>  FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
> -- 
> 2.1.4



