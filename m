Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A92F565CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 20:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CKouOa002741; Tue, 12 Apr 2016 21:50:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bpLU6uHlO4Pg; Tue, 12 Apr 2016 21:50:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CKormk002736
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Apr 2016 21:50:54 +0100
Message-ID: <1460494253.9308.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Tue, 12 Apr 2016 21:50:53 +0100
In-Reply-To: <20160412185126.GA14627@mcrowe.com>
References: <20160329125626.GA11712@mcrowe.com>
	<1459260670.21672.25.camel@linuxfoundation.org>
	<20160412185126.GA14627@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 12 Apr 2016 20:51:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-12 at 19:51 +0100, Mike Crowe wrote:
> On Tuesday 29 March 2016 at 15:11:10 +0100, Richard Purdie wrote:
> > On Tue, 2016-03-29 at 13:56 +0100, Mike Crowe wrote:
> > > 80b3974081c4a8c604e23982a6db8fb32c616058 implies that at least
> > > some
> > > people
> > > are pruning the sstate cache based on file access time.
> > > 
> > > Is there a recommended way to ensure that all the sstate cache
> > > files
> > > are
> > > touched, even those that are not actually required to build the
> > > image
> > > currently due to task optimisation?
> > > 
> > > Does anyone have any better ideas?
> > 
> > generate the "locked-sigs" inc file (bitbake XXX -S none) and then
> > with
> > a script touch all the objects listed in that file?
> 
> I'm most of the way through writing a script to do this. I've
> discovered
> that the sstate filenames contain bits that aren't in the locked-sigs
> file
> such as ${PV}, ${PR}, ${TARGET_VENDOR}, ${TARGET_OS},
> ${SSTATE_VERSION}.
> The hash is the important bit for identifying the file uniquely so
> these
> bits can either be hard coded or wildcarded as appropriate.
> 
> There's also the need to apply native OS name prefix for native
> packages.
> 
> Is there a a way of getting hold of those bits so I can avoid the
> wildcards?

In theory the key part is the hash, all the other pieces are there just
to make human understandable filenames/layout (and would be encoded
into the hash in most cases). Whilst we could generate that info, I'm
not sure it would help much since the hashes should uniquely identify
the files?

Cheers,

Richard





