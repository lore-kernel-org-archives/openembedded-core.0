Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7676012C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 14:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TEBECO030154; Tue, 29 Mar 2016 15:11:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7TCV5AXx9OaA; Tue, 29 Mar 2016 15:11:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TEBAwW030150
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Mar 2016 15:11:11 +0100
Message-ID: <1459260670.21672.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 15:11:10 +0100
In-Reply-To: <20160329125626.GA11712@mcrowe.com>
References: <20160329125626.GA11712@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Tue, 29 Mar 2016 14:11:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-29 at 13:56 +0100, Mike Crowe wrote:
> 80b3974081c4a8c604e23982a6db8fb32c616058 implies that at least some
> people
> are pruning the sstate cache based on file access time.
> 
> We run incremental and nightly Jenkins jobs that build images for
> various
> targets and branches in order to keep the sstate-cache populated.
> Files are
> pruned once they haven't been accessed for a few days. This has
> worked
> reasonably well for a few years (and the script can be simplified now
> since
> the above commit.)
> 
> Recently we've found that files that are still required are being
> pruned.
> This appears to be due to a combination of improvements to oe-core to
> avoid
> unnecessary tasks and improvements to our own recipes. These have
> resulted
> in it being possible to build an image without requiring the
> populate_sysroot.tgz files if nothing has changed that needs
> building.
> 
> Is there a recommended way to ensure that all the sstate cache files
> are
> touched, even those that are not actually required to build the image
> currently due to task optimisation?
> 
> The only solution I can come up with is to invent a recursive
> "all_populate_sysroot" recrdeptask that depends on the individual
> populate_sysroot tasks and run that task for each image.
> 
> Does anyone have any better ideas?

generate the "locked-sigs" inc file (bitbake XXX -S none) and then with
a script touch all the objects listed in that file?

Cheers,

Richard

