Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DE2D577D80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 21:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70A7520B86;
	Tue, 16 May 2017 21:50:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gigmOp7_9UnM; Tue, 16 May 2017 21:50:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4ABE720756;
	Tue, 16 May 2017 21:50:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 08E521624C2; Tue, 16 May 2017 17:50:22 -0400 (EDT)
Date: Tue, 16 May 2017 17:50:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170516215021.GO28053@denix.org>
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
	<0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Tue, 16 May 2017 21:50:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:
> On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:
> >Ping. It's been over a month now...
> its in my stagging since 4/1.  The AB has been failing with my
> current changes.

Is morty now dead?


> >On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
> >>From: Ed Bartosh <ed.bartosh@linux.intel.com>
> >>
> >>.siginfo files are not being accessed from local or NFS-mounted
> >>sstate mirrors when sstate package is installed, so their atime
> >>is not updated. If sstate mirror is cleaned based on access time,
> >>they get deleted, even though they are still being used.
> >>
> >>Updated atime of .siginfo symlinks with 'touch -a'. This command
> >>dereferences symlinks pointing to the local mirror and updates
> >>atime of the .siginfo file on the mirror.
> >>
> >>[YOCTO #10857]
> >>
> >>Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >>Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>---
> >>  meta/classes/sstate.bbclass | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >>diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> >>index 8643f3d..4fdfcc8 100644
> >>--- a/meta/classes/sstate.bbclass
> >>+++ b/meta/classes/sstate.bbclass
> >>@@ -724,6 +724,8 @@ python sstate_sign_package () {
> >>  #
> >>  sstate_unpack_package () {
> >>  	tar -xvzf ${SSTATE_PKG}
> >>+	# update .siginfo atime on local/NFS mirror
> >>+	[ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> >>  	# Use "! -w ||" to return true for read only files
> >>  	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
> >>  	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
> >>-- 
> >>2.7.4
> >>
> >>-- 
> >>_______________________________________________
> >>Openembedded-core mailing list
> >>Openembedded-core@lists.openembedded.org
> >>http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

