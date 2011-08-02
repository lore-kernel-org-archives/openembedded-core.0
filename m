Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoA1G-0005Xj-7E
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 10:08:06 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qo9x4-0002Lo-Cs
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 10:03:46 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E372E0A.1020504@mentor.com>
References: <cover.1311758282.git.kai.kang@windriver.com>
	<d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
	<2070961.C8JsuWrOh5@perseus> <4E3728A7.1050707@linux.intel.com>
	<4E372E0A.1020504@mentor.com>
Date: Tue, 02 Aug 2011 09:03:38 +0100
Message-ID: <1312272218.3223.15.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/1] ghostscript: fix parallel build issue
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
X-List-Received-Date: Tue, 02 Aug 2011 08:08:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 15:51 -0700, Tom Rini wrote:
> On 08/01/2011 03:28 PM, Saul Wold wrote:
> > On 07/30/2011 11:20 AM, Khem Raj wrote:
> >> On Wednesday, July 27, 2011 05:34:45 PM Kang Kai wrote:
> >>> From: Kang Kai<kai.kang@windriver.com>
> >>>
> >>> ghostscript fails some time on autobuilder, it seems a parallel build
> >>> issue.
> >>> Add patch to fix it.
> >>>
> >>> Fixes [Yocto #1202]
> >>>
> >>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> >>> ---
> >>>   .../ghostscript-9.02-parallel-make.patch           |   17
> >>> +++++++++++++++++
> >>> .../ghostscript/ghostscript_9.02.bb                |    3 ++-
> >>>   2 files changed, 19 insertions(+), 1 deletions(-)
> >>>   create mode 100644
> >>> meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-mak
> >>>
> >>> e.patch
> >>>
> >>> diff --git
> >>> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> >>>
> >>> ake.patch
> >>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> >>>
> >>> ake.patch new file mode 100644
> >>> index 0000000..76d1676
> >>> --- /dev/null
> >>> +++
> >>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-m
> >>>
> >>> ake.patch @@ -0,0 +1,17 @@
> >>> +When parallel make it will fail with multi copy, see
> >>> +http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
> >>> +
> >>> +Upstream-Status: Pending
> >>> +
> >>> +Signed-off-by: Kang Kai<kai.kang@windriver.com>
> >>> +--- ghostscript-9.02/base/unixhead.mak.orig    2011-07-27
> >>> 17:06:17.749456100
> >>> +0800 ++++ ghostscript-9.02/base/unixhead.mak    2011-07-27
> >>> 17:06:37.449456100
> >>> +0800 +@@ -54,7 +54,7 @@
> >>> +
> >>> + # Define generic commands.
> >>> +
> >>> +-CP_=cp
> >>> ++CP_=cp -f
> >>
> >> It means it will first delete the target if it exists. Did you check
> >> if this
> >> is correct behavior ?
> >>
> > Khem,
> > 
> > As far as I know the file is that is being copied to is the same file
> > and the CP is only used in that case, the 2 files are copied to the same
> > location due to the Parallel make.
> 
> Er, that sounds like we're just changing the race around.  Now we could
> get an incomplete file?

I don't think you would get an incomplete file, but using "cp -f" just
makes the race less likely rather than eliminating it.  You can still
get:

cp 1			cp 2
open(foo) = -EACCESS
unlink(foo)
			open(foo) = 0
open(foo) = -EACCESS
exit(1)
			write()
			exit(0)

if the two copies of cp end up running at the same time.

It seems pretty clear that the right fix is to figure out why this race
is happening in the first place and adjust the make rules to avoid it,
rather than trying to paper over it by making the conflict harmless.  If
that's hard/impossible for any reason then "cp -n" might possibly be
acceptable since then the copy of cp that loses the race will just do
nothing harmlessly.  I don't think -n is POSIX though so this is
definitely a less-good workaround.

p.




