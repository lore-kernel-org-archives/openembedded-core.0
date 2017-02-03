Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0878471DDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 11:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13BKCMP028512; Fri, 3 Feb 2017 11:20:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e4Iil6FpJnjA; Fri,  3 Feb 2017 11:20:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13BK7EB028486
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Feb 2017 11:20:08 GMT
Message-ID: <1486120807.14144.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2017 11:20:07 +0000
In-Reply-To: <1486120259.13882.26.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: RSS difficulties
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
X-List-Received-Date: Fri, 03 Feb 2017 11:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-03 at 11:10 +0000, Phil Blundell wrote:
> I'm having a few problems adapting our build setup to work with
> recipe specific sysroots.  More specifically, I am finding it
> difficult to get the correct set of components installed into the
> recipe-sysroot in all cases.  In some cases I am getting too much
> (which causes build failures if oe attempts to stage two things that
> install the same file) and in other cases I am not getting enough.
> 
> Could somebody explain, ideally using only small words, how the set
> of things to populate in the recipe-sysroot is determined?  I assume
> it is based on the task dependency graph somehow but I'm not quite
> sure which relationships I ought to be looking at.

It comes down to what setscene_depvalid() in sstate.bbclass returns. If
that returns False a given dependency is installed, it if returns True,
it is skipped and not installed.

Reading that function should give some clues as to the logic it
applies. It operates not on a full task graph but on version collapsed
only to sstate tasks.

The logic should mirror what would get installed from sstate if that
sstate were available, hence the logic is somewhat tested and not just
new for RSS. That doesn't mean its right in all cases though!

If that doesn't help, perhaps some specific examples of what you think
should be being installed and isn't or things which are being installed
and shouldn't might help.

Cheers,

Richard



