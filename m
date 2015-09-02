Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A137877041
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 21:47:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t82LlQwf021107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Sep 2015 14:47:26 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 2 Sep 2015 14:47:26 -0700
Date: Wed, 2 Sep 2015 16:47:25 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <20150902164725.5a011ab8@seebs-worktop>
In-Reply-To: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 21:47:34 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2015 11:36:45 -0500
Alex Franco <alejandro.franco@linux.intel.com> wrote:

> -chmod -R -st "$BUILDDIR" 
> +chmod -st "$BUILDDIR"

I was about to say! I just did an update to a version with this, and as it
happens, my build dir also contains about four full copies of tmp-glibc and
sstate-cache corresponding to different versions of pseudo I was comparing
between...

I'd say maybe both $BUILDDIR and $BUILDDIR/conf. Although it might not be a
horrible idea to think about cleaning out sticky bits, because it occurs to
me: pseudo is not stripping the set* bits when writing to the filesystem.
Which means that a build directory can end up containing files owned by the
build user, and setuid, which is maybe a Bad Thing.

... It may be that pseudo should strip those bits from the filesystem.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

