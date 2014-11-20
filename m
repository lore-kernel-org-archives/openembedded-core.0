Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B6EF465C78
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAKK4UPv008087; Thu, 20 Nov 2014 20:04:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DhWBguzpK8dA; Thu, 20 Nov 2014 20:04:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAKK4HsP008083
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Nov 2014 20:04:29 GMT
Message-ID: <1416513894.2068.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Thu, 20 Nov 2014 20:04:54 +0000
In-Reply-To: <1273c0d32efd40dda18770de4d5e90b4@BLUPR05MB037.namprd05.prod.outlook.com>
References: <1273c0d32efd40dda18770de4d5e90b4@BLUPR05MB037.namprd05.prod.outlook.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Resetting PR for PR service
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
X-List-Received-Date: Thu, 20 Nov 2014 20:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-11-20 at 19:43 +0000, Bryan Evenson wrote:
> I am on poky/dylan and I am using the PR service for the first time.  At this time I am making some cosmetic .bbappend recipe changes (reordering and spacing with no affect on the final built package).  Of course, after rebuilding the recipe the PR service bumped the PR since it saw a change in the metadata.  I don't want this package PR to change at this time; the package would "upgrade" on the next release even though the contents are identical.  I would like to revert the PR for this package but I am having difficulty.
> 
> I had not previously used the PR service, so the old package name was foo_1.0.0-r0_arm926ejste.ipk.  After being rebuilt, the new package name was foo_1.0.0-r0.0_arm926ejste.ipk (added the .0).  I tried to revert the PR for this package as follows:
> 1. Export the current PR service data by calling "bitbake-prserv-tool export prserv_export.inc"
> 2. Moved the file cache/prserv.sqlite3 to effectively delete the PR Service database.
> 3. Opened prserv_export.inc and removed the two lines related to package foo.
> 4. Cleaned package foo by calling "bitbake -c clean foo"

This is just off the top of my head but have you tried a -c cleansstate
here?

> 5. Imported the PR service data by calling "bitbake-prserv-tool import prserv_export.inc"
> 6. Rebuilt package foo by calling "bitbake foo"
> 
> After step 6, the resulting package name was still foo_1.0.0-r0.0_arm926ejste.ipk.  Is there a step I'm missing in reverting the PR value?
> 
> On another note, I discovered that to import the prserv data the
> filename needs to end with .inc, otherwise you get an error stating
> that Bitbake does not know what to do with the file.  Or more
> specifically, the file to be imported at least can't be a .txt
> extension.  If there is a specific file extension needed for import,
> I'd suggest the info be included on the PR Service wiki.

That sounds like a good idea. You should be able to update the wiki?

Cheers,

Richard


