Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 403 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Aug 2017 14:21:14 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAB778319
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 14:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7B4DE3220D24;
	Thu, 17 Aug 2017 16:14:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xgYVT3cPXuAe; Thu, 17 Aug 2017 16:14:30 +0200 (CEST)
Received: from t460p (p57A6132B.dip0.t-ipconnect.de [87.166.19.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B51B23220D23;
	Thu, 17 Aug 2017 16:14:29 +0200 (CEST)
Date: Thu, 17 Aug 2017 16:14:28 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20170817161428.172eb7b8@t460p>
In-Reply-To: <d19886da974978d84a0522b970503f74ad7ec382.1502965191.git.alejandro.hernandez@linux.intel.com>
References: <cover.1502965191.git.alejandro.hernandez@linux.intel.com>
	<d19886da974978d84a0522b970503f74ad7ec382.1502965191.git.alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Thu, 17 Aug 2017 14:21:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Aug 2017 03:24:23 -0700
Alejandro Hernandez <alejandro.hernandez@linux.intel.com> wrote:

>  - It creates a solution for users that want precompiled bytecode files
>    (*.pyc) INCLUDE_PYCS = "1" can be set by the user on their local.conf to
>    include such files, some argument they get faster boot time, even when the
>    files would be created on their first run?, but they also sometimes give a
>    magic number error and take up space, so we leave it to the user to
>    decide if they want them or not.

A serious problem with not shipping precompiled pyc and/or pyo files is that,
once generated on first run, package managers won't uninstall them.

This can cause many undesired effects, because python programs will still be
able to import these files, but dependencies like graphics or shared libraries
may have been deleted by the package manager.

Also, not being able to uninstall something is bad on its own.

So, if anything, I believe INCLUDE_PYCS = "1" would be the only sane default,
unless no package management was involved at all.

And no read-only filesystem, for what it's worth.

Best regards,
Andreas

P.S.: I didn't see patches 2 and 3. Is it just an incorrect subject?

