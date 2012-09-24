Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TGAzn-0006S4-Dd
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 17:54:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2012 08:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,476,1344236400"; d="scan'208";a="226018642"
Received: from unknown (HELO [10.255.14.15]) ([10.255.14.15])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2012 08:42:06 -0700
Message-ID: <50607F4E.5040300@linux.intel.com>
Date: Mon, 24 Sep 2012 08:42:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348501103.31293.51.camel@phil-desktop>
In-Reply-To: <1348501103.31293.51.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: work-shared not being correctly shared
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 15:54:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2012 08:38 AM, Phil Blundell wrote:
> Since updating to the latest versions of bitbake and oe-core I'm
> experiencing some sort of conflict to do with the gcc sources in
> tmp/work-shared.
>
> What seems to be happening is that all the different recipes which share
> that source directory are using different stamp values for do_unpack.
> So, for example, I can do:
>
> $ bitbake -f -c unpack gcc-cross
> [ source unpacks ]
> $ ls -l tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack*
> -rw-rw-r-- 1 pb pb 0 2012-09-24 15:37
> tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack.ea6dd89ddae3dcc205848b41ce0251cd
> $ bitbake -f -c unpack gcc-cross
> [ nothing happens ]
> $ bitbake -f -c unpack gcc-cross
> [ still nothing happens ]
> $ bitbake -f -c unpack gcc-runtime
> [ source unpacks again ]
> $ ls -l tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack*
> -rw-rw-r-- 1 pb pb 0 2012-09-24 15:42
> tmp-eglibc/stamps/work-shared/gcc-4.7.2-r13.do_unpack.e677db6d46e8c0c6109b02302aa477d0
> $ bitbake -f -c unpack gcc-runtime
> [ nothing happens ]
>
> Worse, if I set BB_NUMBER_THREADS to some high number, I seem to end up
> with multiple competing tasks all trying to unpack in parallel and the
> build never makes any real forward progress.
>
> Does anybody have any insight into what is going wrong here and how I
> should debug it?
>
Yes, I am seeing something similar with do_patch happening twice on the 
work-shared area, I talked with Richard a bit ago about it, and I am 
digging into the siginfo files, you can use bitbake-sigdiff to see what 
sigs are changed causing it unpack twice (or in my case patch twice).

Sau!

> thanks
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


