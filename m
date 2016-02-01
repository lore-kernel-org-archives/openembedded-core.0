Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02A687665F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11HqFkC018586; Mon, 1 Feb 2016 17:52:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2L0x2wMHjAhq; Mon,  1 Feb 2016 17:52:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u11HqVSp018614
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Feb 2016 17:52:32 GMT
Message-ID: <1454349151.27087.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Mon, 01 Feb 2016 17:52:31 +0000
In-Reply-To: <20160201165925.GA6886@mcrowe.com>
References: <20160201165925.GA6886@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: sstate-cache contains many seemingly useless siginfo files
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
X-List-Received-Date: Mon, 01 Feb 2016 17:52:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 16:59 +0000, Mike Crowe wrote:
> Our sstate-cache cleanup script was written long before
> 80b3974081c4a8c604e23982a6db8fb32c616058, so it only pruned siginfo
> files
> if the corresponding tgz file had not been accessed recently.
> 
> This worked well until siginfo files started being written for every
> task -
> even those that didn't also generate a tgz file such as unpack,
> configure
> and compile.
> 
> I've just cleared up over two million siginfo files from our sstate
> -cache!
> 
> This exercise has left me wondering why these siginfo files are being
> written to the sstate-cache in the first place.
> 80b3974081c4a8c604e23982a6db8fb32c616058 suggests that they aren't
> being
> used by anyone.

These are used by things like "bitbake -S printdiff" in order to debug
why things are being rebuilt. Without them, there are gaps in the
dependency chains and the tools can't figure out how things changed.

So they're not used by main builds but are useful for debug.

> If writing the files is necessary, is there any reason not to just
> delete
> these files periodically or could that confuse a build that is in
> progress?

I doubt it would cause a problem, other than meaning printdiff wouldn't
work well. Not that it works brilliantly right now, but I do hope to
fix that at some point.

Cheers,

Richard

