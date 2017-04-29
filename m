Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D6DAA77D3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Apr 2017 08:52:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3T8qsMB008672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 29 Apr 2017 09:52:55 +0100
Message-ID: <1493455974.19076.167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 29 Apr 2017 09:52:54 +0100
In-Reply-To: <cover.1493391620.git.pkj@axis.com>
References: <cover.1493391620.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 29 Apr 2017 09:52:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Handle the hossttools directory when restoring from the sstate cache
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
X-List-Received-Date: Sat, 29 Apr 2017 08:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-28 at 17:01 +0200, Peter Kjellerstedt wrote:
> After the introduction of copying host tools to the build directory
> and cleaning out $PATH, we got a problem with one of our tools. It
> turned out that its configure.ac uses AC_PATH_PROG(PERL, perl) to
> locate the perl interpreter, and uses that on the shebang line of the
> installed tool. Previously it found /usr/bin/perl and used that, but
> now it will find ${TMPDIR}/hosttools/perl and use that instead, which
> means that if the tool is restored from the sstate cache in another
> build directory than where it originated from, the path will be
> wrong.
> 
> These two patches adds a new variable (HOSTTOOLS_DIR) for the
> ${TMPDIR}/hosttools directory, and then makes sure it is handled by
> the staging code so that any references to its value are properly
> corrected when restoring from the sstate cache.

I did mention on irc that I didn't really want to do this, I only
wanted to fix this issue on a case by case basis.

The reason is that we currently have pretty clean sstate files in this
regard, we haven't needed to do this. If we add this, we'll become
reliant on the fixups. The fixups are slow and ideally we want to pass
in correct paths in the first place if/as/where we can.

So is there a way we can only do this if/as/where needed instead of
universally?

The performance overhead of fixups verses no fixups is significant.

Cheers,

Richard

