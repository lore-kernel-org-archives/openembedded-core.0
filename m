Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4ED6012A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 16:57:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 09:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="120924874"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2017 09:57:38 -0700
Message-ID: <1502125572.2330.3.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 07 Aug 2017 12:06:12 -0500
In-Reply-To: <CAJTo0LY5mBjm586rFqHBofcZE3eSzY=kAaxp2P=4PBA-2nYwiA@mail.gmail.com>
References: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LY5mBjm586rFqHBofcZE3eSzY=kAaxp2P=4PBA-2nYwiA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Mon, 07 Aug 2017 16:57:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-07 at 17:32 +0100, Burton, Ross wrote:
> On 4 August 2017 at 19:57,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         +        i_sigfile, max_sigfiles_to_compare = 0, 20
>                  for k in files1.keys() | files2.keys():
>                      if k in files1 and k in files2:
>         +                i_sigfile += 1
>                          print("%s differs:" % k)
>         +                # this is an expensive computation, thus just
>         compare the first
>         +                # 'max_sigfiles_to_compare' k files
>         +                if i_sigfile > max_sigfiles_to_compare:
>         +                    continue
>                          sigdatafile1 = self.topdir +
>         "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
>                          sigdatafile2 = self.topdir +
>         "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
>                          output =
>         bb.siggen.compare_sigfiles(sigdatafile1, sigdatafile2)
> 
> 
> A neater way to do this:
> 
> 
> -for k in files1.keys() | files2.keys():
> +for k in list(files1.keys() | files2.key())[:20];
> 
> 
yes, but we this way, we are not listing those > 20 and I believe this
is important. This fix just diffsigs the first 20, and the rest are just
listed for convenience.

also, sets are not 'subscriptable' thus slicing is not possible on sets.

Leo



> (take the union of the files1 and files2 keys, turn it into a list,
> and slice off up to the first 20)
> 
> 
> Ross



