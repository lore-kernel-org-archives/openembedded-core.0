Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B61E560D4B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2013 09:01:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBL91bJk002427; Sat, 21 Dec 2013 09:01:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y12hsggU6HxT; Sat, 21 Dec 2013 09:01:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBL91VlA002420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 21 Dec 2013 09:01:32 GMT
Message-ID: <1387616486.6402.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 21 Dec 2013 09:01:26 +0000
In-Reply-To: <CANyK_8eHa5N-W6t07mGuyyuLgHj0CdUw8n9ivA14+h5VpLR0rA@mail.gmail.com>
References: <1387366203.6402.34.camel@ted>
	<CANyK_8eHa5N-W6t07mGuyyuLgHj0CdUw8n9ivA14+h5VpLR0rA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc: Use deltask API
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
X-List-Received-Date: Sat, 21 Dec 2013 09:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-20 at 18:24 +0000, Paul Barker wrote:
> On 18 December 2013 11:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Now we have deltask API, stop poking around bitbake internal variables.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> > index c759289..53c71cb 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -26,21 +26,6 @@
> >
> >  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
> >
> > -def remove_tasks(tasks, deltasks, d):
> > -    for task in tasks:
> > -        deps = d.getVarFlag(task, "deps")
> > -        for preptask in deltasks:
> > -            if preptask in deps:
> > -                deps.remove(preptask)
> > -        d.setVarFlag(task, "deps", deps)
> > -    # Poking around bitbake internal variables is evil but there appears to be no better way :(
> > -    tasklist = d.getVar('__BBTASKS') or []
> > -    for task in deltasks:
> > -        d.delVarFlag(task, "task")
> > -        if task in tasklist:
> > -            tasklist.remove(task)
> > -    d.setVar('__BBTASKS', tasklist)
> > -
> >  python () {
> >      externalsrc = d.getVar('EXTERNALSRC', True)
> >      if externalsrc:
> > @@ -53,16 +38,16 @@ python () {
> >          d.setVar('SRC_URI', '')
> >
> >          tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> > -        covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
> >
> >          for task in tasks:
> >              if task.endswith("_setscene"):
> >                  # sstate is never going to work for external source trees, disable it
> > -                covered.append(task)
> > +                bb.build.deltask(task, d)
> >              else:
> >                  # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
> >                  d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
> >
> > -        remove_tasks(tasks, covered, d)
> > +        for task in covered:
> > +            bb.build.deltask(task, d)
> >  }
> >
> 
> I've just updated oe-core whilst trying to test my in-development
> version of opkg using externalsrc and I'm getting:
> 
>  *** 0022:        for task in covered:
>      0023:            bb.build.deltask(task, d)
>      0024:
> Exception: NameError: global name 'covered' is not defined
> 
> I don't really know the code in question well so I don't know whether
> the solution is to remove that last for loop or to add back in the
> declaration of 'covered'.

Sorry about that, I think I've mixed up some patches. I've pushed
something which should fix it.

Cheers,

Richard



