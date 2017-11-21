Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 74261785D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:09:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALB9ie1009364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 11:09:46 GMT
Message-ID: <1511262584.862.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org, Armin Kuster
	<akuster808@gmail.com>, "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"Xu, Chi" <Chi.Xu@windriver.com>, "Yang,
	Liezhi" <Liezhi.Yang@windriver.com>, "WOLD, SAUL" <saul.wold@intel.com>
Date: Tue, 21 Nov 2017 11:09:44 +0000
In-Reply-To: <45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Tue, 21 Nov 2017 11:09:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-11-20 at 20:22 -0500, Randy MacLeod wrote:
> On 2017-11-20 10:36 AM, Jolley, Stephen K wrote:
> > Current Dev Position: YP 2.5 Planning and M1 development
> > Next Deadline: YP 2.5 M1 cut off of 12/4/17
> >  
> > SWAT team rotation: Juro -> Paul on Nov.17, 2017.
> > SWAT team rotation: Paul -> Todor on Nov. 24, 2017.
> > https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
> >  
> > Key Status/Updates:
> > ·        There is no real change to the status from last week. We
> > continue to suffer intermittent build failures and are continuing
> > to attempt to debug these.
> > ·        Currently open issues are:
>  
> Some US-based people may be on holiday later this week so I'm
> offering 
> help from the frozen Northland and more importantly from the team in
> Beijing. ;-)
> 
> > o   qemuppc continues to demonstrate random hangs in boot  in
> > userspace
>  
> Is we can create a defect for this and point / copy the wiki notes
> into it, that
> would help.
>    https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs
> 
> I think I had asked Chi to see if he could reproduce this a week or
> two ago.
> When the lack of entropy problem was identified and fix, many people
> thought
> this hang went away as well. Chi can you read the wiki report and see
> if you
> can add anything to them?

Good news is that the qemuppc issue has been identified as a bug in
qemu ppc locking which breaks timer interrupt handling. I've posted on
the qemu mailing list asking for help in verifying what I think is
happening.

I have a patch ready to merge which should address this one, just
cleaning up my environment and doing some further stress testing.

[There is a defect somewhere for this btw, I created the wiki as it was
a better place to dump and update information as we learnt what it
is/is not without having to follow a train of thought updating in the
bugzilla].

> > o   Issues with 4.13.10 host kernels booting kvm x86 guests on
> > Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12
> > helps)
>  
> Robert, can you test Fedora 26. It would help to have a defect open
> with steps to reproduce or
> something about the typical workflow/ build time/ day of the week/
> phase of the moon. 

FWIW we have noticed that the choice of kernel timers seems to vary in
the x86_64 boots but not with a pattern that matches the hangs.

> > o   nfs inode count for the sstate/dldir share appears to break
> > periodically causing the disk monitor to halt the builds (bug
> > 12267)
>  
> Likely specific to the AB server so no plans to do anything for this
> bug.

Agreed, this one is our infrastructure somehow :(. We have a workaround
in -next for this at least.

> > o   a perf build race (bug 12302)
>   I'll take a look to:
>  - see if I can duplicate the bug on a fast build host
>  - check upstream to see if the bug is known/fixed
>  - see if I can spot a race in the build rules.

Sounds good, thanks!

> > o   An ext filesystem creation/sizing issue (bug 12304)
>  
> Saul, Are you around this week? Do you have any additional
> information before
> leaving for Thanksgiving?
> 
> Jackie, 
> Can you look at the code around the image creation and try to
> reproduce this one?

Saul hasn't been able to reproduce. I've asked at the minimum we add
better logging so if/when this happens again, we can debug it properly
next time. I did also wonder about fuzzing the image size code, writing
some code which puts in all possible input values and checks the sanity
of the resulting image size. Its the kind of problem a computer can
probably brute force. Anyone interested in trying that?

Cheers,

Richard



