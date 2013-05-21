Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7D55960657
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 08:41:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.87,713,1363132800"; d="scan'208";a="14994533"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 21 May 2013 09:41:13 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1Uei7y-0008Eq-L2; Tue, 21 May 2013 09:41:02 +0100
Date: Tue, 21 May 2013 09:41:02 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130521084102.GA31419@mcrowe.com>
References: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
	<B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
	<1369088718.11013.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1369088718.11013.3.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH] kernel.bbclass: Add dependency on binutils
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
X-List-Received-Date: Tue, 21 May 2013 08:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2013 at 11:25:18PM +0100, Richard Purdie wrote:
> On Mon, 2013-05-20 at 10:37 -0700, Khem Raj wrote:
> > On May 20, 2013, at 5:22 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > 
> > > Compiling the Linux kernel requires binutils; kernel.bbclass uses
> > > INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.
> > > 
> > > (The lack of this dependency isn't always a problem because binutils
> > > is required to build gcc-cross but if gcc-cross is reconstructed from
> > > the sstate cache then gcc-cross's dependency on binutils-cross is
> > > ignored due to being in the safe dependency list in
> > > setscene_depvalid.)
> > 
> > what good is cross-gcc without cross-binutils. Could it be fixed in gcc recipes instead so
> > it pulls binutils-cross 
> 
> This needs fixing in the logic in sstate.bbclass.

The most straightforward fix there (with thanks to Phil Blundell) is to
just remove binutils-cross from the safe dependency list:

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1f85c54..be08a66 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -648,7 +648,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     def isNativeCross(x):
         return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
     def isSafeDep(x):
-        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
+        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "gcc-cross-initial"]:
             return True
         return False
     def isPostInstDep(x):

Is this the sort of fix you mean?

Thanks.

Mike.

