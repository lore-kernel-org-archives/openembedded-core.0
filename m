Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBBD606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 14:47:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2015 06:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="449743722"
Received: from bdrobeso-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.70])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2015 06:33:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 04 Feb 2015 14:47:42 +0000
Message-ID: <2453761.Od84ObYqIE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <a6dc870be391940e782eae4a86b0002e764a163a.1420530290.git.Qi.Chen@windriver.com>
References: <cover.1420530290.git.Qi.Chen@windriver.com>
	<a6dc870be391940e782eae4a86b0002e764a163a.1420530290.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstatesig.py: fix logic in find_siginfo
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
X-List-Received-Date: Wed, 04 Feb 2015 14:47:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Tuesday 06 January 2015 15:47:38 Chen Qi wrote:
> For now, `bitbake-diffsig -t <recipe> <task>' doesn't work. This is
> caused by a small logic mistake in find_siginfo in sstatesig.py.
> 
> The logic should be 'and' instead of 'or', otherwise, we will have
> both siginfo and sigdata files in filedates which have the same checksum.
> e.g.
> /buildarea2/chenqi/sstate-cache/fc/sstate:sysstat:armv5te-poky-linux-gnueabi
> :10.2.1:r0:armv5te:3:fc861bf371c1b843b2843a3415eb5ff3_install.tgz.siginfo
> /buildarea2/chenqi/poky/build-systemd/tmp/stamps/armv5te-poky-linux-gnueabi
> /sysstat/10.2.1-r0.do_install.sigdata.fc861bf371c1b843b2843a3415eb5ff3
> 
> So `bitbake-diffsig -t sysstat install' will output nothing even we actually
> have changed something in do_install task.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oe/sstatesig.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index af7617e..c6c85b9 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -234,7 +234,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>              except OSError:
>                  continue
> 
> -    if not taskhashlist or (len(filedates) < 2 and not foundall):
> +    if not taskhashlist and (len(filedates) < 2 and not foundall):

I don't think this is the correct fix - if taskhashlist is specified but we 
don't have enough files found in the stamps directory, we still want to look at 
the sstate cache.

It is difficult to tell what's going on in this function, because this code is 
now being used for several different purposes:

 (1) the bitbake-diffsigs -t usage which is intended to be used to find out what 
changed that caused a task to re-execute the last time (so we want the two 
newest signatures).

 (2) the bitbake -S printdiff usage which is intended to be used simply to find 
out why sstate wasn't reused (so we want the two signatures with the smallest 
difference)

 (3) Additionally, as part of (1) and (2) the same function is also called 
with specific task hashes which changes its behaviour.

I think this code should probably be refactored so it makes more sense, but 
the minimal fix for the problem you discovered would be to make the bit that 
looks in sstate-cache ignore hashes it has already found.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

