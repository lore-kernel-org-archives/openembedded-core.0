Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A19726B1A9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 22:53:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA9MopMZ000546; Sat, 9 Nov 2013 22:52:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id arFvwzAZFUc1; Sat,  9 Nov 2013 22:52:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA9Mqk93000571
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 9 Nov 2013 22:52:47 GMT
Message-ID: <1384037562.22454.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 09 Nov 2013 22:52:42 +0000
In-Reply-To: <CAAQYJAsV5rBzNpPneh5TAh5t1RoV_EeDrKGFp2qP3q=o7XsqdA@mail.gmail.com>
References: <1383923945.2345.5.camel@ted> <527D067C.6040709@windriver.com>
	<CAAQYJAsV5rBzNpPneh5TAh5t1RoV_EeDrKGFp2qP3q=o7XsqdA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/path: Fix performance issue got copyhardlinktree()
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
X-List-Received-Date: Sat, 09 Nov 2013 22:53:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-09 at 21:43 +0100, Andrea Adami wrote:
> On Fri, Nov 8, 2013 at 4:42 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
> > On 13-11-08 10:19 AM, Richard Purdie wrote:
> >>
> >> With the directory copy was added to avoid race issues, it wasn't noticed
> >> that
> >> tar was recursing the directories and copying files too. This is
> >> completely
> >> crazy when we hardlink those files in the next command.
> >>
> >> Resolve the issue by telling tar not to recurse. This gives a significant
> >> performance boost to various parts of the system (do_package for
> >> linux-yocto
> >> 256s -> 178s for example).
> >
> >
> > Every second makes a difference in this beast .. when adding up a
> > zillion package runs a week. :)
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> ---
> >> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> >> index 1310e38..d0588ba 100644
> >> --- a/meta/lib/oe/path.py
> >> +++ b/meta/lib/oe/path.py
> >> @@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
> >>       if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> >>           # Need to copy directories only with tar first since cp will
> >> error if two
> >>           # writers try and create a directory at the same time
> >> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
> >> --files-from - | tar -xf - -C %s' % (src, src, dst)
> >> +        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
> >> --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
> >>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> >>           if os.path.isdir(src):
> >>               src = src + "/*"
> >>
> >>
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> After this patch do_populate_sysroot fails:

This should fix it:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=5237c8e2c1780983c000247ffa0c890b4bb5980a

Cheers,

Richard


