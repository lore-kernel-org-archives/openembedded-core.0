Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rj8hU-0002cl-Fz
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:15:12 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rj8aM-0003hY-TE
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:07:51 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 12:07:50 +0000
In-Reply-To: <1325851561.20759.90.camel@ted>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	<lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1325848065.20759.84.camel@ted>
	<1325849632.28005.151.camel@phil-desktop>
	<1325851561.20759.90.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325851670.28005.154.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 06 Jan 2012 12:15:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 12:06 +0000, Richard Purdie wrote:
> On Fri, 2012-01-06 at 11:33 +0000, Phil Blundell wrote:
> > On Fri, 2012-01-06 at 11:07 +0000, Richard Purdie wrote:
> > > On Fri, 2012-01-06 at 11:29 +0100, Enrico Scholz wrote:
> > > > Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> > > > 
> > > > > -		f=${D}${libdir}/$i.so
> > > > > +                f=${D}${base_libdir}/$i.so
> > > > 
> > > > this breaks builds because 'ld' does not search ${base_libdir}:
> > > > 
> > > > | gcc -shared ... -ltermcap
> > > > | /usr/bin/ld: cannot find -ltermcap
> > > > | ERROR: Task 216 (virtual:native:.../readline/readline_6.2.bb, do_install) failed with exit code '1'
> > > > | ERROR: 'virtual:native:.../readline/readline_6.2.bb' failed
> > > 
> > > Note this is a -native problem, not a target library one.
> > 
> > It looks to me like the same would probably occur on the target.
> > The .so devel symlinks should be in ${libdir} not ${base_libdir} since
> > the latter is indeed not in the linker's standard search path.
> 
> Are you 100% sure about that? I was pretty sure that /lib is in the
> default linker's search path as well as /usr/lib?

Not 100%, admittedly, but I can't think of any other instances of these
things being installed in /lib.  I know that glibc, for example, puts
libc.so in /usr/lib even though the corresponding libraries are in /lib.
Admittedly that one isn't a symlink though.

> I can't find a commandline option to make ld dump its search path but
> looking at the linker scripts for various architectures, it does appear
> that /lib is listed as a search directory...

I think "ld -verbose" should do that.  Look for SEARCH_DIR or some such.

p.




