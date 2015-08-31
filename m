Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D360476D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 16:02:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2015 09:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,442,1437462000"; d="scan'208";a="794700965"
Received: from besquive-mobl2.zpn.intel.com ([10.219.17.159])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2015 09:02:46 -0700
Message-ID: <1441036971.15187.156.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1440801244-24561-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1440801244-24561-1-git-send-email-alejandro.franco@linux.intel.com>
Organization: Intel Corporation
Date: Mon, 31 Aug 2015 11:02:51 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Subject: Re: [PATCH] Fix mode +st on TMPDIR when creating it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Aug 2015 16:02:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Looks good, would you check this via an autobuilder on-demand build?

Benjamin

On Fri, 2015-08-28 at 17:34 -0500, Alex Franco wrote:
> A sanity check fails when TMPDIR has setuid, setgid set. It was
> proposed to fix this on TMPDIR creation instead of failing with
> a sanity test only. This patch handles removal of those special
> bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
> when these directories are created.
> 
> [YOCTO #7669]
> 
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass | 5 +++++
>  scripts/oe-setup-builddir   | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass
> b/meta/classes/sanity.bbclass
> index ef90fc8..2864318 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -686,6 +686,7 @@ def check_sanity_version_change(status, d):
>      status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
>  
>  def check_sanity_everybuild(status, d):
> +    import os, stat
>      # Sanity tests which test the users environment so need to run
> at each build (or are so cheap
>      # it makes sense to always run them.
>  
> @@ -839,6 +840,10 @@ def check_sanity_everybuild(status, d):
>                  status.addresult("Error, TMPDIR has changed
> location. You need to either move it back to %s or rebuild\n" %
> saved_tmpdir)
>      else:
>          bb.utils.mkdirhier(tmpdir)
> +        # Remove setuid, setgid and sticky bits from TMPDIR
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
>          with open(checkfile, "w") as f:
>              f.write(tmpdir)
>  
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index add0b50..f5b7e4e 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -24,6 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>  fi
>  
>  mkdir -p "$BUILDDIR/conf"
> +chmod -R -st "$BUILDDIR" 
>  
>  if [ ! -d "$BUILDDIR" ]; then
>      echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"

