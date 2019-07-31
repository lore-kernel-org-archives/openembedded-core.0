Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0A97F7F37E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 11:13:49 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id smYFhCGc46ogssmYGh4hH8; Wed, 31 Jul 2019 12:13:50 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=0o9FgrsRnhwA:10
	a=Q4-j1AaZAAAA:8 a=wCfO-aNCzqGrcds3OhMA:9 a=CjuIK1q_8ugA:10
	a=37i-4DpEtJMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>) id 1hsmYF-0007nf-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Jul 2019 12:13:47 +0100
Date: Wed, 31 Jul 2019 12:13:47 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190731111347.GA27256@mcrowe.com>
References: <20190730110111.5143-1-mac@mcrowe.com>
	<adacdf23-1d66-a1e0-fa19-521b0d5f2861@windriver.com>
	<20190730134917.GA30833@mcrowe.com>
	<6b194922-8aa4-f2c1-645b-ace8331ae532@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6b194922-8aa4-f2c1-645b-ace8331ae532@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfNiyC53qEFIoDw5i6PUyvC+kXPdqsUDdoQuVHBQruWGUmri/7sNwst2PyUUOVlZX3cqThsUFab0SYVlJBXpQHhdxMVdFLyPgmcMrRk7fyoB2Wzds/3gF
	lA0+4L6X6GivLbDwG+4tK/l2XMIbJgKNzKyFgG2CaK4F+RZDUPUEZvAs
Subject: Re: [PATCH] sstate: Truncate PV in sstate filenames that are too long
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
X-List-Received-Date: Wed, 31 Jul 2019 11:13:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 30 July 2019 at 09:14:01 -0500, Mark Hatle wrote:
> Richard mentioned in the bitbake-devel thread that there may be external tools
> using some of the components.  I'm not sure how to even identify what those
> tools are at this time, but a new sstate version entry may be enough to start to
> deal with them.

We have a couple of tools that know the format of sstate cache files:

The first tool[1] processes locked-sigs.inc to update the atime of any
files that would be necessary for the build. (We discovered that relying on
actually building to update atime was insufficient since it skipped sstate
files that were only necessary in order to build others.)

The second tool is simpler and just expires sstate files that haven't been
accessed in a while. We have a handful of different expiry policies by PN,
so we need to understand where that is in the filename. This tool needs to
cope with a cache populated by a mixture of oe-core versions, so any change
in format risks complicating it.

Mike.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120227.html

