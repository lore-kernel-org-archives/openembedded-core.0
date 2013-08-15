Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D69A26009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 16:38:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VA0Yk-0003Xc-Qk; Thu, 15 Aug 2013 18:38:02 +0200
Message-ID: <1376584682.17787.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 15 Aug 2013 17:38:02 +0100
In-Reply-To: <1376583837.22952.72.camel@ted>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama> <1376477217.22952.5.camel@ted>
	<20130814105915.GU17945@jama> <520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
	<1376583837.22952.72.camel@ted>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Thu, 15 Aug 2013 16:38:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 17:23 +0100, Richard Purdie wrote:
> Sadly this doesn't work. We block copy a set of .m4 files from the
> sysroot. We can be running do_configure of package A whilst package B is
> de-installed from the sysroot and this leads to files disappearing
> whilst they're being accessed. Its turned out to be a really awkward
> problem to fix.

Oh, I see, this is the aclocal "scan all .m4 files" thing.  I suppose
the ideal arrangement, following the earlier discussion today about
accidental library linkage, would be to provide a way to only copy
the .m4 files that were installed by recipes in DEPENDS (recursively of
course).  This would have the pleasant side effect of reducing the
number of files that aclocal needs to scan which might make it a bit
faster as well.

But, looking at aclocal itself, it doesn't seem as though it would be
very hard to patch it to cope a bit more gracefully with files which
disappear (or turn out to be unreadable) underneath it.  I wonder if
that would be a better fix and we could then just remove all this
copying altogether.

p.



