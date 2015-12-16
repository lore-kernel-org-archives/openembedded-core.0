Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A39CF6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 12:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBGCZmFZ018570; Wed, 16 Dec 2015 12:35:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b9STYvzN_VPh; Wed, 16 Dec 2015 12:35:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBGCZix8018567
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Dec 2015 12:35:45 GMT
Message-ID: <1450269344.13505.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 Dec 2015 12:35:44 +0000
In-Reply-To: <5671310A.1000000@topic.nl>
References: <5671310A.1000000@topic.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to move a recipe to another directory without invalidating its sstate-cache?
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
X-List-Received-Date: Wed, 16 Dec 2015 12:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-12-16 at 10:38 +0100, Mike Looijmans wrote:
> ﻿I renamed "recipes-some/foo/bar.bb" to "recipes-some/buzz/bar.bb"
> 
> Rebuilding bar and its dependencies will take about 16 hours. So I
> don't want 
> to trigger a rebuild.
> 
> running "bitbake -S printdiff bar" only reveils this:

I'm not sure I trust the output of -S printdiff, there are some cases
it doesn't seem to "guess" right. I wish I or someone one could fix but
but we can do its work manually. Can you try something like:

set TMPDIR = "x"
bitbake -S bar
rename the recipe
set TMPDIR = "y"
bitbake -S bar

then

"ls tmp-x/stamps/xxxx/bar"
"ls tmp-y/stamps/xxxx/bar"

and see which tasks change signature. Then run:

"bitbake-diffsigs <sig A> <sig B>"

and see if that makes more sense?

Cheers,

Richard

