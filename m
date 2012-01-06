Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj8u0-0003ig-8e for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:28:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06CKguo020155
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:20:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18968-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 12:20:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06CKX6R020148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 12:20:34 GMT
Message-ID: <1325852434.20759.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 12:20:34 +0000
In-Reply-To: <1325851670.28005.154.camel@phil-desktop>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	<lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1325848065.20759.84.camel@ted>
	<1325849632.28005.151.camel@phil-desktop>
	<1325851561.20759.90.camel@ted>
	<1325851670.28005.154.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 04/28] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Fri, 06 Jan 2012 12:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 12:07 +0000, Phil Blundell wrote:
> On Fri, 2012-01-06 at 12:06 +0000, Richard Purdie wrote:
> > On Fri, 2012-01-06 at 11:33 +0000, Phil Blundell wrote:
> > > On Fri, 2012-01-06 at 11:07 +0000, Richard Purdie wrote:
> > > > On Fri, 2012-01-06 at 11:29 +0100, Enrico Scholz wrote:
> > > > > Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> > > > > 
> > > > > > -		f=${D}${libdir}/$i.so
> > > > > > +                f=${D}${base_libdir}/$i.so
> > > > > 
> > > > > this breaks builds because 'ld' does not search ${base_libdir}:
> > > > > 
> > > > > | gcc -shared ... -ltermcap
> > > > > | /usr/bin/ld: cannot find -ltermcap
> > > > > | ERROR: Task 216 (virtual:native:.../readline/readline_6.2.bb, do_install) failed with exit code '1'
> > > > > | ERROR: 'virtual:native:.../readline/readline_6.2.bb' failed
> > > > 
> > > > Note this is a -native problem, not a target library one.
> > > 
> > > It looks to me like the same would probably occur on the target.
> > > The .so devel symlinks should be in ${libdir} not ${base_libdir} since
> > > the latter is indeed not in the linker's standard search path.
> > 
> > Are you 100% sure about that? I was pretty sure that /lib is in the
> > default linker's search path as well as /usr/lib?
> 
> Not 100%, admittedly, but I can't think of any other instances of these
> things being installed in /lib.  I know that glibc, for example, puts
> libc.so in /usr/lib even though the corresponding libraries are in /lib.
> Admittedly that one isn't a symlink though.
> 
> > I can't find a commandline option to make ld dump its search path but
> > looking at the linker scripts for various architectures, it does appear
> > that /lib is listed as a search directory...
> 
> I think "ld -verbose" should do that.  Look for SEARCH_DIR or some such.

$ ./i586-poky-linux-ld --verbose | grep SEARCH
SEARCH_DIR("/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/i586-poky-linux/lib32"); SEARCH_DIR("=/usr/local/lib32"); SEARCH_DIR("=/lib32"); SEARCH_DIR("=/usr/lib32"); SEARCH_DIR("=/usr/local/lib"); SEARCH_DIR("=/lib"); SEARCH_DIR("=/usr/lib");

which makes sense since the builds are all still working...

Cheers,

Richard



