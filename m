Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 33D0C6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 07:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2Q7fGiZ002632; Sat, 26 Mar 2016 07:41:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EGb2GW_rfaOS; Sat, 26 Mar 2016 07:41:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2Q7fAoE002629
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Mar 2016 07:41:11 GMT
Message-ID: <1458978069.3073.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cliff Brake <cliff.brake@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Mar 2016 07:41:09 +0000
In-Reply-To: <56F59D2B.2010108@gmail.com>
References: <56F59D2B.2010108@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Sat, 26 Mar 2016 07:41:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 16:18 -0400, Cliff Brake wrote:
> Hi,
> 
> In the past (say Dora era), I've used externalsrc like:
> 
> ====================
> DESCRIPTION = "MyApp"
> LICENSE = "CLOSED"
> 
> inherit externalsrc
> 
> SRCREV = "${AUTOREV}"
> PV = "1.4+gitr${SRCPV}"
> PR = "r1"
> 
> SRC_URI = "git://${FILE_DIRNAME};protocol=file;branch=HEAD"
> S = "${FILE_DIRNAME}"
> 
> ...
> ====================
> 
> This was very nice in that it set SRCPV to to the git version of the
> HEAD of my
> local workspace.  When building from a local git workspace, this
> makes sense to
> me -- I want the Git version of the workspace, not a remote version.
> 
> Now with Jethro, I get errors like:
> 
> ERROR: ExpansionError during parsing myapp.bb: Failure expanding
> variable SRCPV,
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> FetchError:
> Fetcher failure: Unable to resolve 'HEAD' in upstream git repository
> in git
> ls-remote output for /scratch/externalsrc/MyApp
> 
> Do you have any suggestions how to use externalsrc + a local git
> workspace and
> avoid the above error.  I can set branch=master, etc and bitbake will
> then parse
> it, but the remote master version is not really what I'm building.

HEAD is a revision, not a branch and the fetcher became a bit more
picky about that difference. Your local tree must have HEAD on some
branch which would usually be master so setting branch=master is likely
correct, or don't set that parameter at all? master isn't just a remote
thing.

The piece which says "use the HEAD revision" is the SRCREV =
"${AUTOREV}" line.

Cheers,

Richard




