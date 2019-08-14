Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18EA97ECC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 16:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7EG2iNf000601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2019 09:02:44 -0700 (PDT)
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 14 Aug 2019 09:02:43 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>, "Bystricky, Juro"
	<juro.bystricky@intel.com>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell> <20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
	<20190803092307.486e930d@seebsdell>
	<6E51916E4A1F32428260031F4C7CD2B64ED7F64C@ORSMSX116.amr.corp.intel.com>
	<CA+chaQcc2996g2xKdzJpaKJN4f4=3t6gHVvA5JREn3yHYLvKHg@mail.gmail.com>
Message-ID: <3bab2728-8ccd-d435-dee4-c92002555ae4@windriver.com>
Date: Wed, 14 Aug 2019 12:02:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcc2996g2xKdzJpaKJN4f4=3t6gHVvA5JREn3yHYLvKHg@mail.gmail.com>
X-Originating-IP: [128.224.56.214]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Wed, 14 Aug 2019 16:02:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 8/6/19 2:51 AM, Martin Jansa wrote:
> This is the same reproducer I am using in:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434
> but with this SRCREV I haven't reproduced it yet in first 500 
> iterations, so it's definitely improving for me (used to reproduce it at 
> least once in first 500 iterations)
> 
> Now I'm testing the reproducer with "qmake -install qinstall".

Any update Martin?



Using a variation of Juro's script and adding a little stress-ng load,
it _seems_ that I can make the problem happen more quickly than without
system stress but it's a shared system so _seems_ is underlined.

Using stress-ng was supposed to be a quick check to see if I could
get the reproducer down to minutes rather than around an hour.

Results are promising so I'll continue to use this approach as
I add debugging to pseudo and add an inline, immediate check in
the context of:
 
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/glibc-locale.inc?h=master#n72
to see if the UID/GID are equal to my UID/GID.

Test runs summaries are below.

../Randy



cat src/distro/yocto/b/uid-diff/glibc-locale-stress
#!/bin/bash

fname='glibc-locale_master_august13'
max=100
for (( i=1; i <= $max; i++ ))
do
     echo "$i/$max  ${fname}_$i.log"
     bitbake glibc-locale -c cleanall 2>&1 > /dev/null
     # add some stress
     stress-ng -t 1000 --switch 8 --switch-freq 50000 &
     bitbake glibc-locale 2>&1 > ${fname}_$i.log
     # Destress
     killall -9 stress-ng
     if grep -q "host-user-contaminated" ${fname}_$i.log; then
         echo "error !"
       exit 2
     #else
       #rm ${fname}_$i.log
     fi
done


On a (shared) system where lscpu shows 128 cores
and no stress:

Trial   Iteration Error
1       44
2       19


stress-ng -t 1000 --switch 8 --switch-freq 50000

50000 was just the frequency that generated a high enough
but not too high load. On this systems, each process used ~30% of a cpu.

Trial   Iteration Error
1       3
2       18


stress-ng -t 1000 --switch 16 --switch-freq 50000

Trial   Iteration Error
1       3
2       1
3       11

stress-ng -t 1000 --switch 32 --switch-freq 50000

Trial   Iteration Error
1       2
2       9
3       8


stress-ng -t 1000 --switch 64 --switch-freq 50000

Trial   Iteration Error
1       4
2       13
3       >6


stress-ng -t 1000 --mq 64
  128 processes using 98% cpu each

Trial   Iteration Error
1       14
2       NaN

Trial 2 was precluded by other users of the shared system complaining!
The idea was to cause more rapid context switches. Later, I might try
this again with say 16 workers. If anyone has a better idea, please
reply.

EOM

> 
> Regards,
> 
> On Tue, Aug 6, 2019 at 12:43 AM Bystricky, Juro 
> <juro.bystricky@intel.com <mailto:juro.bystricky@intel.com>> wrote:
> 
>     I can reproduce the problem fairly easily  (and, sadly even with the
>     latest commits as 060058bb29f70b244e685b3c704eb0641b736f73 ).
>     In my case, it seems easy to reproduce if I have 40+ threads running.
>     The reproducer script (below) fails typically within the first 10
>     iterations.
> 
> 
>     #!/bin/bash
> 
>     fname='glibc-locale_master_august8'
>     max=1000
>     for (( i=1; i <= $max; i++ ))
>     do
>          echo "$i/$max  ${fname}_$i.log"
>          bitbake glibc-locale -c cleanall 2>&1 > /dev/null
>          bitbake glibc-locale 2>&1 > ${fname}_$i.log
>           if grep -q "host-user-contaminated" ${fname}_$i.log; then
>              echo "error !"
>            exit 2
>          #else
>            #rm ${fname}_$i.log
>          fi
> 
>     done
> 
>     ________________________________________
>     From: openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>     [openembedded-core-bounces@lists.openembedded.org
>     <mailto:openembedded-core-bounces@lists.openembedded.org>] on behalf
>     of Seebs [seebs@seebs.net <mailto:seebs@seebs.net>]
>     Sent: Saturday, August 03, 2019 7:23 AM
>     To: Khem Raj
>     Cc: openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix
>     openat() with a directory symlink [NAK]
> 
>     On Sat, 3 Aug 2019 05:33:46 -0700
>     Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
> 
>      > Will this fix the file ownership issue that we see with Glibc-locale
>      > packages from time to time?
> 
>     I have no idea. Since I haven't got a reliable reproducer for it, I
>     can't test it in a sane way.
> 
>     -s
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

