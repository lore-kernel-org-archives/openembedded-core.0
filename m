Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A88976C921
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 08:59:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2014 00:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,735,1384329600"; d="scan'208";a="445694529"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.226])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2014 00:59:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 Jan 2014 08:59:47 +0000
Message-ID: <1413594.S4HepKQVoQ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <52E6D52D.4070908@windriver.com>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
	<52E6D52D.4070908@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Tue, 28 Jan 2014 08:59:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 January 2014 16:52:45 Randy MacLeod wrote:
> On 14-01-23 07:11 AM, Otavio Salvador wrote:
> > The filenames sometimes may have strange names. With the 'awk' script
> > it handled a limited number of spaces in the filename and a package
> > installing a file named "test file with spaces" would have its name
> > truncated.
> > 
> > This patch uses the find's printf formating to simplify the code and
> > proper handle this case. From a testing image, the only diff produced
> 
> s/proper/properly/
>    Yes, I'm with the grammar police; we're here to be helpful.
> 
> > is:
> > 
> > ,----[ files-in-image.txt diff ]
> > 
> > | --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
> > | +-rwxr-xr-x root       root                0 ./usr/bin/test file with
> > | spaces> 
> > `----
> > 
> > The options used are available since findutils 4.2.5, released in 19
> > Nov 2004, making it available in all supported host distributions.
> 
> Acked-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> 
> Works for me, even on CentOS/RHEL-5.9/10 which does indeed have
> findutils > 4.2.5:
> 
> $ rpm -qf `which find`
> findutils-4.2.27-6.el5
> 
> and the find command seems to work as intended:
> 
>   $ find jj -printf "%M %-10u %-10g %10s %p -> %l\n"  | cut -c 44-
>   jj ->
>   jj/usr ->
>   jj/usr/bin ->
>   jj/usr/bin/test file with spaces ->

So I think this is mostly a good change, however, we don't want those -> if 
the file isn't a symlink. Otavio, can you fix that?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

