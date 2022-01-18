Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7ff6b65096963db707cead4baf5737b9e3d451c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 5.15.1 -> 5.16
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Jan 2022 23:35:49 +0000
In-Reply-To: <YedOP/gu/Ie9IA9Q@piout.net>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
	 <1e222f92ac63e24af60aaa92adfbb2aebfe150ee.camel@intel.com>
	 <YedOP/gu/Ie9IA9Q@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com" <wangmy@fujitsu.com>

On Wed, 2022-01-19 at 00:33 +0100, Alexandre Belloni wrote:
> Hello,
> 
> On 17/01/2022 23:39:50+0000, Anuj Mittal wrote:
> > On Mon, 2022-01-17 at 22:30 +0800, wangmy wrote:
> > > Changelog:
> > > =========
> > >  - rescue: new subcommand clear-uuid-tree to fix failed mount due to
> > > bad uuid
> > >    subvolume keys, caught by tree-checker
> > >  - fi du: skip inaccessible files
> > >  - prop: properly resolve to symlink targets
> > >  - send, receive: fix crash after parent subvolume lookup errors
> > >  - build:
> > >    fix build on 5.12+ kernels due to changes in linux/kernel.h
> > >    fix build on musl with old kernel headers
> > >  - other:
> > >    error handling fixes, cleanups, refactoring
> > >    extent tree v2 preparatory work
> > >    lots of RST documentation updates (last release with asciidoc
> > > sources),
> > >    https://btrfs.readthedocs.io
> > > 
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...ools-include-linux-const.h-to-fix-build-with-.patch | 10 ++++----
> > > --
> > >  .../{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb}     |  2 +-
> > >  2 files changed, 5 insertions(+), 7 deletions(-)
> > >  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb =>
> > > btrfs-tools_5.16.bb} (98%)
> > > 
> > > diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-
> > > btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> > > b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > > include-linux-const.h-to-fix-build-with-.patch
> > > index be942388a5..bd69bfc9cd 100644
> > > --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > > include-linux-const.h-to-fix-build-with-.patch
> > > +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > > include-linux-const.h-to-fix-build-with-.patch
> > > @@ -1,4 +1,4 @@
> > > -From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00
> > > 2001
> > > +From 1c9cc81ec72876a5351e3083552b9985eeb6c091 Mon Sep 17 00:00:00
> > > 2001
> > >  From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >  Date: Fri, 18 Jun 2021 11:10:36 -0400
> > >  Subject: [PATCH] btrfs-progs: include linux/const.h to fix build
> > > with 5.12+
> > > @@ -21,22 +21,20 @@ exists, and is valid to include.
> > >  Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
> > >  
> > >  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > +
> > >  ---
> > >   kerncompat.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > >  
> > >  diff --git a/kerncompat.h b/kerncompat.h
> > > -index df167fe6..254235bd 100644
> > > +index 6ca1526e..15995bb4 100644
> > >  --- a/kerncompat.h
> > >  +++ b/kerncompat.h
> > >  @@ -30,6 +30,7 @@
> > >   #include <linux/types.h>
> > > - #include <linux/kernel.h>
> > > + #include <linux/const.h>
> > >   #include <stdint.h>
> > >  +#include <linux/const.h>
> > 
> > This patch should be removed.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/kerncompat.h?id=b28f7bd9bba6f65258da48955154794f466b4104
> > 
> 
> I guess we actually need to backport this one:
> https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58
> 
> It should fix the issue as reported in https://github.com/kdave/btrfs-progs/pull/433

FWIW I had tried this patch again with the patch dropped as you mentioned.

Cheers,

Richard

