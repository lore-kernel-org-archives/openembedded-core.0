Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RE0Db-00030E-KJ for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 16:55:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CEuS1A009316 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 15:56:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AXj00Jm5NEnj
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 15:56:28 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CEuOHr009301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 15:56:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 15:49:42 +0100
In-Reply-To: <4E95A6E5.6090402@windriver.com>
References: <1318279539.23801.68.camel@ted> <1318332940.23801.90.camel@ted>
	<4E95A6E5.6090402@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318430990.23801.176.camel@ted>
Mime-Version: 1.0
Subject: Re: Some further build dependency timings
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
X-List-Received-Date: Wed, 12 Oct 2011 14:55:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 09:40 -0500, Mark Hatle wrote:
> > --- a/bitbake/lib/bb/runqueue.py
> > +++ b/bitbake/lib/bb/runqueue.py
> > @@ -1096,6 +1096,10 @@ class RunQueueExecute:
> >  
> >              logger.debug(2, 'Running %s:%s under fakeroot, fakedirs: %s' %
> >                              (fn, taskname, ', '.join(fakedirs)))
> > +        else:
> > +            envbackup["PSEUDO_RELOADED"] = os.environ.get("PSEUDO_RELOADED")
> > +            os.environ["PSEUDO_RELOADED"] = "yes"
> > +            fakeenv["PSEUDO_RELOADED"] = "yes"
> 
> PSEUDO_RELOADED was intended to only be used internally by pseudo.  Specifically
> to signify to fork/exec that we're about to run the pseudo server process and to
> remove PSEUDO from the LD_PRELOAD on the next fork/exec.

Right, I realised I was abusing it here, its good for a performance
measurement though ;-)

> The system simply checks the environment on the fork-exec and doesn't check the
> value on pseudo-load.  This is why it works.
> 
> That side effect means that any subsequent calls can NOT re-enable pseudo as
> it's no longer in memory at all.
>
> So what you are seeing at best is the time difference from avoiding the
> LD_PRELOAD and the jump table setup.  (Even when pseudo is disabled, we need to
> enable the jump table, we just pass the call to the original function.)
> 
> But more then likely because pseudo is no longer memory resident for the called
> processes and it's sub-processes.. there is likely some place in the system that
> uses pseudo functionality that is no longer functioning properly.

I'm not sure that there is in our use cases. If we need pseudo
functionality the tasks are marked as "fakeroot" with a flag. If that
flag is not set (which is when the above code triggers), its perfectly
fine to have pseudo unload at the next exec.

> It would be interesting to determine first off, if there is anywhere pseudo
> should be running that it currently isn't.  And second if this is simply due to
> LD_PRELOAD time, or if enabling the jump table is the culprit.
> 
> One potential optimization, when PSEUDO_DISABLE=1 is to only setup the jump
> table entries for fork/exec items.

Agreed, I don't know where the time is being spent exactly at this
point. I do know we execute an absolute ton of exec/fork calls so
removing any overhead from them will improve our speed though. This
change means do_configure won't run with pseudo enabled for example
which is a very exec heavy task. 

> Also if it is desired to unload pseudo, I'd suggest we add a new environment
> variable to pseudo that is specific about unloading pseudo, instead of using the
> existing PSEUDO_RELOADED.  Not only is the name confusing, but since it's an
> internal item it's behavior may change or go away in the future.
> 
> (Below is from the pseudo man page:
> 
>       PSEUDO_RELOADED
>                This purely internal variable is used to track state while try-
>                ing to re-execute to get  rid  of  the  LD_PRELOAD  value  when
>                spawning  a  server.  (The pseudo server itself cannot function
>                running in the pseudo environment.)
> )

I suspect we may need a dedicated option for this...

Cheers,

Richard



