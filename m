Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E45E71AB7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 11:13:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Sep 2017 04:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,457,1498546800"; d="scan'208";a="1213416011"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2017 04:13:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 01 Sep 2017 23:13:17 +1200
Message-ID: <7235010.gxTCniSH6X@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1504219258.27472.330.camel@linux.intel.com>
References: <1504219258.27472.330.camel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][resend] insane.bbclass: Warn if ${COREBASE}/LICENSE is used
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
X-List-Received-Date: Fri, 01 Sep 2017 11:13:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul

On Friday, 1 September 2017 10:40:58 AM NZST Saul Wold wrote:
> The top level LICENSE file is not actually a license, it refers
> other licenses that are used by Bitbake and Meta-data. Relying
> on this file could cause problems for recipes when this file
> changes, which it is about to.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 479d39c..6d20eb6 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -659,7 +659,7 @@ python populate_lic_qa_checksum() {
>          sane = package_qa_handle_error("license-checksum", pn + ":
> Recipe file fetches files and does not have license file information
> (LIC_FILES_CHKSUM)", d)
>  
>      srcdir = d.getVar('S')
> -
> +    corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
>      for url in lic_files.split():
>          try:
>              (type, host, path, user, pswd, parm) =
> bb.fetch.decodeurl(url)
> @@ -670,6 +670,10 @@ python populate_lic_qa_checksum() {
>          if not os.path.isfile(srclicfile):
>              package_qa_handle_error("license-checksum", pn + ":
> LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
>              continue
> +        
> +        if (srclicfile == corebase_licensefile):
> +            bb.warn("${COREBASE}/LICENSE is not a valid license file,
> please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in
> LIC_FILES_CHKSUM")
> +            bb.warn("This will become an error in the next release")

Can this be one bb.warn() call? Otherwise it's considered to be two warnings 
by the UI. Also, it's rare for us to even make such a comment in a warning, 
but I think we would say "in future" rather than "in the next release".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

