Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9716B238
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 12:34:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4CYfew011274; Mon, 4 Nov 2013 12:34:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wAJEp9PL_IPo; Mon,  4 Nov 2013 12:34:41 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA4CYbC0011259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Nov 2013 12:34:39 GMT
Message-ID: <1383568473.6271.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 04 Nov 2013 12:34:33 +0000
In-Reply-To: <2223625.X3ey4vb7tr@helios>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
	<1383557479.6271.105.camel@ted> <2223625.X3ey4vb7tr@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Mon, 04 Nov 2013 12:35:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-04 at 12:14 +0000, Paul Eggleton wrote:
> On Monday 04 November 2013 09:31:19 Richard Purdie wrote:
> The basic idea with buildhistory is to only keep the latest version of data 
> stored within it, on the assumption that you could always get previous 
> versions from the git history; this also makes comparisons to previous 
> versions straightforward.

This makes sense for absolute value data. The task build statistics are
not entirely "absolute" data though and having to traverse many
checkouts trying to build up say "average task timing" might be
problematic.

> As far as timestamps go, BUILDNAME does go into the commit message; if it 
> helps we record the metadata revisions corresponding to the build in the 
> buildhistory repo as well (in a "metadata-revs" file).

Currently the main use of the data is to say "visualise this build"
where you're building a target or set of targets. We name the build
after the first item in the list of build targets.

The logged data is useful both as part of a set which are viewed
together and individually on a task basis so see how much CPU/Disk a
given task uses and how that changes over time.

The tricky part is firstly that we should really use a true buildname,
secondly that we need both the set of data and data per target.

If we just logged data per target, we could overwrite any previous data
but that would break usage as a set.

> If we do want to keep the builds split out in separate per-build directories 
> then what are we gaining by trying to push buildstats into buildhistory in the 
> first place?

We have a need to be able to merge and store build statistic data which
build history already does well. The question is whether it makes sense
to use the same mechanism or not since there are commonalities and
differences. Having two data storage systems and repositories doesn't
make a lot of sense.

I'm not sure this makes a solution much clearer but it does hopefully
better explain the challenge.

Cheers,

Richard


