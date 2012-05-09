Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=469f43418=rich.pixley@palm.com>)
	id 1SSGKr-0008Hj-5E for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:30:21 +0200
X-IronPort-AV: E=Sophos;i="4.75,560,1330934400"; d="scan'208";a="13415080"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 09 May 2012 16:20:26 -0700
Received: from fuji-land.noir.com ([10.100.2.2])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q49NKLCi010531;
	Wed, 9 May 2012 16:20:21 -0700
Message-ID: <4FAAFBB5.10004@palm.com>
Date: Wed, 09 May 2012 16:20:21 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
	<1336595524.2494.77.camel@ted>
In-Reply-To: <1336595524.2494.77.camel@ted>
Subject: Re: SetScene tasks hang forever?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 23:30:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

My rebuild completed in 5 seconds.

Thank you very much!

I'd rather not fork bitbake locally.  Can I expect this patch to show up 
in git://git.openembedded.org/bitbake sometime soon?

--rich

On 5/9/12 13:32 , Richard Purdie wrote:
> Hi Rich,
>
> You might like to try the change below as I think it might address the problem.
>
> Cheers,
>
> Richard
>
> bitbake/runqueue: Fix 'full' stamp checking to be more efficient and cache results
>
> This should fix issues where bitbake would seemingly lock up when checking
> certain configurations of stampfiles.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index b870caf..48433be 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -875,7 +875,7 @@ class RunQueue:
>               bb.msg.fatal("RunQueue", "check_stamps fatal internal error")
>           return current
>
> -    def check_stamp_task(self, task, taskname = None, recurse = False):
> +    def check_stamp_task(self, task, taskname = None, recurse = False, cache = {}):
>           def get_timestamp(f):
>               try:
>                   if not os.access(f, os.F_OK):
> @@ -915,6 +915,9 @@ class RunQueue:
>           t1 = get_timestamp(stampfile)
>           for dep in self.rqdata.runq_depends[task]:
>               if iscurrent:
> +                if dep in cache:
> +                    iscurrent = cache[dep]
> +                    continue
>                   fn2 = self.rqdata.taskData.fn_index[self.rqdata.runq_fnid[dep]]
>                   taskname2 = self.rqdata.runq_task[dep]
>                   stampfile2 = bb.build.stampfile(taskname2, self.rqdata.dataCache, fn2)
> @@ -931,7 +934,9 @@ class RunQueue:
>                           logger.debug(2, 'Stampfile %s<  %s', stampfile, stampfile2)
>                           iscurrent = False
>                       if recurse and iscurrent:
> -                        iscurrent = self.check_stamp_task(dep, recurse=True)
> +                        iscurrent = self.check_stamp_task(dep, recurse=True, cache=cache)
> +                        cache[dep] = iscurrent
> +        cache[task] = iscurrent
>           return iscurrent
>
>       def execute_runqueue(self):
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


