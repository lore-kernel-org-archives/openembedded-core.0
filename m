Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rk1ty-0004Na-S3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 00:11:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2012 15:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="95865753"
Received: from unknown (HELO helios.localnet) ([10.252.122.80])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2012 15:04:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 Jan 2012 23:04:14 +0000
Message-ID: <1533230.LvVeP63quA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <225B79C8-8CC0-429B-B4B8-95360FD4B07E@dominion.thruhere.net>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
	<225B79C8-8CC0-429B-B4B8-95360FD4B07E@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] classes/buildhistory: add new output history collection class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jan 2012 23:11:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 December 2011 09:50:51 Koen Kooi wrote:
> Op 2 dec. 2011, om 00:56 heeft Paul Eggleton het volgende geschreven:
> > +buildhistory_commit() {
> > +	( cd ${BUILDHISTORY_DIR}/
> > +		git add ${BUILDHISTORY_DIR}/*
> > +		git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} for machine
> > ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" --author
> > "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null +		if [
> > "${BUILDHISTORY_PUSH_REPO}" != "" ] ; then
> > +			git push -q ${BUILDHISTORY_PUSH_REPO}
> > +		fi) || true
> > +}
> 
> One of the big problems with the old testlab code was that using multiple
> buildslaves created a huge mess for the git repo. What do you think about
> doing this the following before the 'git add'?
> 
> git pull -q -s recursive -X theirs ${BUILDHISTORY_PULL_REPO}
> 
> I'm not sure what the right incantation is to ensure git updates the current
> branch, but the point is mainly about using the 'theirs' strategy.

So this pulls into the current branch by default, that's not an issue. What is 
a problem is that if untracked files exist that would be overwritten by the 
merge (and it's not hard to imagine that coming up fairly regularly) then it 
will error out. We probably need to come up with a better way to handle this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


