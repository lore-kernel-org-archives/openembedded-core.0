Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0337E65E78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 14:45:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,834,1389744000"; d="scan'208";a="66904947"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 10 Apr 2014 15:45:41 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WYGEW-0008ED-Qz; Thu, 10 Apr 2014 15:45:40 +0100
Date: Thu, 10 Apr 2014 15:45:40 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20140410144540.GA30915@mcrowe.com>
References: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
	<1396965083-15863-2-git-send-email-mac@mcrowe.com>
	<CABcZANnp_AN2Tjnsc=UGougBJ511cy+K52d++h6Y12nts0vBCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnp_AN2Tjnsc=UGougBJ511cy+K52d++h6Y12nts0vBCw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cmake: Avoid accidentally including libacl.h
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
X-List-Received-Date: Thu, 10 Apr 2014 14:45:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 08 April 2014 at 09:37:32 -0700, Chris Larson wrote:
> On Tue, Apr 8, 2014 at 6:51 AM, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > The cmake recipe doesn't depend on libacl yet cmake will detect libacl.h
> > and use it by default. This risks build failures if libacl.h is unstaged
> > during the build and it also means that the build cmake will sometimes
> > support ACLs and sometimes not.
> >
> 
> Is this not also a concern for the non-native recipe? And wouldn't it be
> better yet to use PACKAGECONFIG, rather than hardcoding the disable of acl
> support?

libacl is used by cmake's internal libarchive implementation. The
cmake-native recipe makes use of that but the non-native cmake recipe
depends on the real libarchive so cmake doesn't use libacl itself.

If DISTRO_FEATURES makes sense for native packages then I can try and work
out how to use PACKAGECONFIG for this.

It looks like the cmake-native not setting the CMAKE_USE_SYSTEM_LIBRARIES
option stops cmake searching around for libarchive, curl, etc. and causing
problems with those libraries too.

I'm afraid that I know very little about cmake - I was just trying to fix
some build problems we were seeing with it. Someone with more cmake
knowledge may well know of a better way to solve this.

Thanks.

Mike.

