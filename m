Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6DA60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 12:54:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2015 05:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,385,1432623600"; d="scan'208";a="720988821"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.21.60])
	by orsmga001.jf.intel.com with ESMTP; 01 Jul 2015 05:54:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Wed, 01 Jul 2015 13:54:53 +0100
Message-ID: <1693409.84CV3Pd8dR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.5-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Check output folder is present before creating files-in-$pkg.txt
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
X-List-Received-Date: Wed, 01 Jul 2015 12:54:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leonardo,

On Tuesday 30 June 2015 11:19:40 leonardo.sandoval.gonzalez@linux.intel.com 
wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> This is just a safe check to make sure the output folder is present, before
> creating the files-in-$pkg.txt file.
> 
> Signed-off-by: Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> ---
>  meta/classes/buildhistory.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 8fc8a3a..cad5116 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -444,7 +444,13 @@ buildhistory_list_pkg_files() {
>          # Create individual files-in-package for each recipe's package
>          for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
>                  pkgname=$(basename ${pkgdir})
> -               
> outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.tx
> t" +                outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}" +    
>            outfile="${outfolder}/${file_prefix}${pkgname}.txt" +           
>     # Make sure the output folder, exist so we can create the
> files-in-$pkgname.txt file +                if [ ! -d ${outfolder} ] ; then
> +                        bbdebug 2 "Folder ${outfolder} does not exist, file
> ${outfile} not created" +                        continue

This isn't the way we normally handle this sort of situation - we should be 
simply creating the directory unconditionally before writing the file.

In any case, how is it that the directory doesn't exist at this point?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

