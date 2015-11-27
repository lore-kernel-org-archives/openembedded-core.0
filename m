Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0043A60723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:25:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2015 16:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,349,1444719600"; d="scan'208";a="860169529"
Received: from rsiu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.187])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2015 16:25:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 27 Nov 2015 13:25:16 +1300
Message-ID: <1799774.iaEMQluQDb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <8da679502ac205e3ba845f69b6b37647b520f66a.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
	<8da679502ac205e3ba845f69b6b37647b520f66a.1448442869.git.patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: alexander.kanevskiy@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] buildhistory.bbclass: support extending the content of the build history
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
X-List-Received-Date: Fri, 27 Nov 2015 00:25:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 November 2015 10:30:30 Patrick Ohly wrote:
> The idea behind the implementation of Yocto #8138 was that an
> additional class can write additional files in the recipe directories,
> for example by hooking into the functions of buildhistory.bbclass or
> by implementing its own SSTATEPOSTINSTFUNCS function.
> 
> However, when these additional files get created before
> buildhistory_emit_pkghistory(), they get removed again by that
> function because it contains code which removes everything it does
> not know about. The reason for that is that these unknown items
> are probably obsolete.
> 
> This logic is the reason why the additional "kconfig" file from
> buildhistory-extra.bbclass never showed up in the final build history.
> 
> To fix this, the hard-coded list of known files in
> buildhistory_emit_pkghistory() must be turned into a variable which
> derived classes can extend.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/classes/buildhistory.bbclass | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 729dcd4..6023e5d 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -23,6 +23,16 @@ sstate_install[vardepsexclude] +=
> "buildhistory_emit_pkghistory" # then the value added to
> SSTATEPOSTINSTFUNCS:
>  SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
> 
> +# All items excepts those listed here will be removed from a recipe's
> +# build history directory by buildhistory_emit_pkghistory(). This is
> +# necessary because some of these items (package directories, files that
> +# we no longer emit) might be obsolete.
> +#
> +# When extending build history, derive your class from buildhistory.bbclass
> +# and extend this list here with the additional files created by the
> derived 
> +# class.
> +BUILDHISTORY_PRESERVE = "latest latest_srcrev"
> +
>  #
>  # Write out metadata about this package for comparison when writing future
> packages #
> @@ -165,12 +175,13 @@ python buildhistory_emit_pkghistory() {
>              raise
> 
>      packagelist = packages.split()
> +    preserve = d.getVar('BUILDHISTORY_PRESERVE', True).split()
>      if not os.path.exists(pkghistdir):
>          bb.utils.mkdirhier(pkghistdir)
>      else:
>          # Remove files for packages that no longer exist
>          for item in os.listdir(pkghistdir):
> -            if item != "latest" and item != "latest_srcrev":
> +            if item not in preserve:
>                  if item not in packagelist:
>                      itempath = os.path.join(pkghistdir, item)
>                      if os.path.isdir(itempath):

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

