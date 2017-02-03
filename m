Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3760B6069C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 12:29:35 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:7d41:1b6a:db1a:d59c] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cZcze-0000nw-G3; Fri, 03 Feb 2017 13:29:36 +0100
Message-ID: <1486124973.13882.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2017 12:29:33 +0000
In-Reply-To: <1486120807.14144.68.camel@linuxfoundation.org>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.1-2 
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
X-List-Received-Date: Fri, 03 Feb 2017 12:29:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-03 at 11:20 +0000, Richard Purdie wrote:
> 
> It comes down to what setscene_depvalid() in sstate.bbclass returns.
> If
> that returns False a given dependency is installed, it if returns
> True,
> it is skipped and not installed.
> 
> Reading that function should give some clues as to the logic it
> applies. It operates not on a full task graph but on version
> collapsed
> only to sstate tasks.

Ah, right, thanks.  The particular piece of magic I was missing was:

            # Nothing need depend on libc-initial/gcc-cross-initial
            if "-initial" in taskdependees[task][0]:
                continue

which I think explains all the difficulties I was having.

p.


