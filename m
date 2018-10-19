Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48FC279D09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 22:05:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9JM5SSl026095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 15:05:28 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 19 Oct 2018 15:05:28 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5b788abc-abef-c5e4-b8d7-aa05bc3d4d9f@windriver.com>
Date: Fri, 19 Oct 2018 18:05:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: valgrind upgrade
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
X-List-Received-Date: Fri, 19 Oct 2018 22:05:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/16/18 10:22 PM, Randy MacLeod wrote:
> * Valgrind is now buildable with link-time optimisation (LTO).  A new
>    configure option --enable-lto=yes allows building Valgrind with LTO.  If the
>    toolchain supports it, this produces a smaller/faster Valgrind (up to 10%).
>    Note that if you are doing Valgrind development, --enable-lto=yes massively
>    slows down the build process.
> -- I haven't added support for that option yet. A 10% performance boost
>     is hard to turn down but we'd need to understand the build impact.

Building the native valgrind 3.14ish
    8b689c66d (origin/master, origin/HEAD)
       Implement VG_(apply_ExeContext)().
on my 4 core laptop with 16 GB RAM, SSD running ubuntu-18.04
outside of bitbake just for a baseline.
/usr/bin/time says:
   CPU: ~3.8x more time and :
   RAM: 348 MB vs 519 MB Max memory usage
See below for logs.

I tried to use --enable-lto in the recipe
but that configure option was ignored so for now
I'm not going to worry about it. If we get it working,
I'd want the faster build as the default with a PACKAGECONFIG for
people who want to pay at compile time for a 0-10% improvement
in runtime behaviour.

../Randy



> 
> * The new option --keep-debuginfo=no|yes (default no) can be used to retain
>    debug info for unloaded code.  This allows saved stack traces (e.g. for
>    memory leaks) to include file/line info for code that has been dlclose'd (or
>    similar).  See the user manual for more information and known limitations.
> -- sounds like it should be a default but I haven't added it yet.

This feature will have to wait until next week.

I'll send what I have later tonight or perhaps tomorrow morning.

-- 
# Randy MacLeod
# Wind River Linux


$ cat no-lto.log ;
296.20user 13.31system 5:10.29elapsed 99%CPU
   (0avgtext+0avgdata 347800maxresident)k
224inputs+1783440outputs
   (3major+5964298minor)pagefaults 0swaps

$ cat with-lto.log
1101.82user 23.79system 18:48.13elapsed 99%CPU
   (0avgtext+0avgdata 519400maxresident)k
39200inputs+4644952outputs
   (177major+9033934minor)pagefaults 0swaps

and FYI, on a 128 core server running
bitbake -c configure valgrind &&
    /usr/bin/time -o foo bitbake -c compile valgrind:

$ cat compile-vg.log
0.89user 0.14system 0:49.64elapsed 2%CPU
   (0avgtext+0avgdata 28124maxresident)k
0inputs+152outputs (0major+9873minor)pagefaults 0swaps

