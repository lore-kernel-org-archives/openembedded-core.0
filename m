Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 658CF6C373
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 09:15:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2019 01:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,434,1539673200"; d="scan'208";a="105175319"
Received: from ytan47-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.180.65])
	by orsmga006.jf.intel.com with ESMTP; 03 Jan 2019 01:15:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Jan 2019 22:15:08 +1300
Message-ID: <7640044.3Nx6CshWmK@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <20181221090500.7699-1-jacob.kroon@gmail.com>
References: <20181221090500.7699-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] classes/buildhistory: avoid git diff churn by sorting more dictionaries
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
X-List-Received-Date: Thu, 03 Jan 2019 09:15:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 21 December 2018 10:05:00 PM NZDT Jacob Kroon wrote:
> Sort 'srcrevs' and 'tag_srcrevs' before iterating over them in order
> to avoid unnecessary changes in the build history.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 40b292b139..d1f3e6aa82 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -896,7 +896,7 @@ def write_latest_srcrev(d, pkghistdir):
>              if orig_srcrev != 'INVALID':
>                  f.write('# SRCREV = "%s"\n' % orig_srcrev)
>              if len(srcrevs) > 1:
> -                for name, srcrev in srcrevs.items():
> +                for name, srcrev in sorted(srcrevs.items()):
>                      orig_srcrev = d.getVar('SRCREV_%s' % name, False)
>                      if orig_srcrev:
>                          f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
> @@ -904,7 +904,7 @@ def write_latest_srcrev(d, pkghistdir):
>              else:
>                  f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
>              if len(tag_srcrevs) > 0:
> -                for name, srcrev in tag_srcrevs.items():
> +                for name, srcrev in sorted(tag_srcrevs.items()):
>                      f.write('# tag_%s = "%s"\n' % (name, srcrev))
>                      if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
>                          pkg = d.getVar('PN')
> 

This is OK. An alternative would be to create the original dictionaries as OrderedDicts, but on the other hand I'm not sure if the original order (i.e. as specified in SRC_URI) is particularly important in this context. Any other opinions?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



