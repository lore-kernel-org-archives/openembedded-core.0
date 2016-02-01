Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 1E70B60621
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:59:25 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id D4zR1s0070BmcFC014zSP8; Mon, 01 Feb 2016 16:59:26 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=0j6gzRFTzJ4J-9zXneAA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>) id 1aQHoz-0001vV-12
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Feb 2016 16:59:25 +0000
Date: Mon, 1 Feb 2016 16:59:25 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160201165925.GA6886@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: sstate-cache contains many seemingly useless siginfo files
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
X-List-Received-Date: Mon, 01 Feb 2016 16:59:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Our sstate-cache cleanup script was written long before
80b3974081c4a8c604e23982a6db8fb32c616058, so it only pruned siginfo files
if the corresponding tgz file had not been accessed recently.

This worked well until siginfo files started being written for every task -
even those that didn't also generate a tgz file such as unpack, configure
and compile.

I've just cleared up over two million siginfo files from our sstate-cache!

This exercise has left me wondering why these siginfo files are being
written to the sstate-cache in the first place.
80b3974081c4a8c604e23982a6db8fb32c616058 suggests that they aren't being
used by anyone.

If writing the files is necessary, is there any reason not to just delete
these files periodically or could that confuse a build that is in progress?

Thanks.

Mike.

