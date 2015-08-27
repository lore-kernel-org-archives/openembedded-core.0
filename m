Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6D8760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:16:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 09:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="776850623"
Received: from besquive-mobl2.zpn.intel.com (HELO
	besquive-mobl2.amr.corp.intel.com) ([10.219.17.159])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 09:16:57 -0700
Message-ID: <1440692220.15187.91.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	paul.eggleton@linux.intel.com, ross.burton@intel.com
In-Reply-To: <1440151546-22283-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1440079198-31036-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<1440151546-22283-1-git-send-email-benjamin.esquivel@linux.intel.com>
Organization: Intel Corporation
Date: Thu, 27 Aug 2015 11:17:00 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Subject: Re: [PATCH v2] bb.utils.movefile: specify dest file name
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
X-List-Received-Date: Thu, 27 Aug 2015 16:17:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hey guys, I would like to get this reviewed/integrated for closing this
bug :)

Benjamin

On Fri, 2015-08-21 at 10:05 +0000, Benjamin Esquivel wrote:
>  When moving a file via the python os.rename function it is required
>  to specify the path including the file name at the end.
>  Failure to provide this file name at the destination argument of the
>  os.rename function raises an OSError exception.
> 
>  [YOCTO#8180]
> 
> Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
> ---
>  bitbake/lib/bb/utils.py | 6 +++++-e
>  1 file changed, 5 insertions(+), 1 deletion(-)
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index 5b94432..5ed8e01 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -741,7 +741,11 @@ def movefile(src, dest, newmtime = None, sstat =
> None):
>      renamefailed = 1
>      if sstat[stat.ST_DEV] == dstat[stat.ST_DEV]:
>          try:
> -            os.rename(src, dest)
> +            # os.rename needs to know the destination path with file
> name
> +            srcfname = os.path.basename(src)
> +            destfname = os.path.join(dest, srcfname) if
> os.path.isdir(dest) \
> +                        else dest
> +            os.rename(src, destfname)
>              renamefailed = 0
>          except Exception as e:
>              if e[0] != errno.EXDEV:

