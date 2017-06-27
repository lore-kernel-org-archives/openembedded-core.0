Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D69072F24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:41:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5R9fQsf008829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Jun 2017 10:41:28 +0100
Message-ID: <1498556486.3124.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Tue, 27 Jun 2017 10:41:26 +0100
In-Reply-To: <1498550932.7464.29.camel@intel.com>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 27 Jun 2017 10:41:28 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 09:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 10:08 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-15 at 08:48 +0200, Martin Jansa wrote:
> > 
> > This issue exists for very long time.
> > 
> > 
> > I know that when the builder runs out of disk space there are
> > multiple
> > things which might go wrong (I've seen bad archives on premirrors,
> > bad
> > sstate archives caused by this), so this issue isn't the main
> > problem,
> > but still would be nice to fail faster.
> > 
> > 
> > In last build which was running for some 9 hours, it was first
> > building for maybe 2 hours before it run out of disk space and this
> > morning there is 50MB log just from bitbake output stored on the
> > jenkins master. Repeating following message very quickly
> > 
> > 
> > # grep -c "Errno 28" consoleText.txt 
> > 42986
> > 
> > 
> > ERROR: Running command [['world'], 'build']
> > Traceback (most recent call last):
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py",
> > line
> > 211, in fire(event=<bb.event.HeartbeatEvent object at
> > 0x7fcfed3e96a0>,
> > d=<bb.data_smart.DataSmart object at 0x7fd00330b198>):
> >      
> >     >    fire_class_handlers(event, d)
> >          if worker_fire:
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py",
> > line
> > 134, in fire_class_handlers(event=<bb.event.HeartbeatEvent object
> > at
> > 0x7fcfed3e96a0>, d=<bb.data_smart.DataSmart object at
> > 0x7fd00330b198>):
> >                          continue
> >     >            execute_handler(name, handler, event, d)
> >      
> >   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py",
> > line
> > 106, in execute_handler(name='runqueue_stats', handler=<function
> > runqueue_stats at 0x7fd0020c6158>, event=<bb.event.HeartbeatEvent
> > object at 0x7fcfed3e96a0>, d=<bb.data_smart.DataSmart object at
> > 0x7fd00330b198>):
> >          try:
> >     >        ret = handler(event)
> >          except (bb.parse.SkipRecipe, bb.BBHandledException):
> >   File
> > "/home/jenkins/oe/world/shr-core/openembedded-
> > core/meta/classes/buildstats.bbclass", line 212, in
> > runqueue_stats(e=<bb.event.HeartbeatEvent object at
> > 0x7fcfed3e96a0>):
> >              done = isinstance(e, bb.event.BuildCompleted)
> >     >        system_stats.sample(e, force=done)
> >              if done:
> >   File
> > "/home/jenkins/oe/world/shr-core/openembedded-
> > core/meta/lib/buildstats.py", line 148, in
> > SystemStats.sample(event=<bb.event.HeartbeatEvent object at
> > 0x7fcfed3e96a0>, force=False):
> >                                       data +
> >     >                                 b'\n')
> >                  self.last_proc = now
> > OSError: [Errno 28] No space left on device
> > 
> > 
> > ￼It would be better to exit completely when something as bad as
> > Errno
> > 28 happens.
> Do you have BB_DISKMON_DIRS active? Probably yes.
> 
> The reason why it did not trigger here might be that the build ran
> out
> of disk space so quickly that the disk monitoring had no chance to
> detect the problem before system stat sampling itself started failing
> with the error above.
> 
> System stat sampling and disk monitoring are hooking into the same
> event, so my theory is that once the system stat sampling fails, disk
> monitoring code no longer runs.
> 
> I'm not sure what exactly the right fix is: detect uncaught OSError
> like
> 28 in the bitbake event loop and abort the build, and/or catch the
> error
> in buildstats.py and ignore it so that the normal disk monitoring can
> happen?
> 
> I know how to do the latter, but not the former.


Incidentally, looking at this trace, I think bitbake should drop the
event handler triggering exceptions in a case like this, try and avoid
looping quite so badly. We should probably have a bug for that.

Cheers,

Richard



