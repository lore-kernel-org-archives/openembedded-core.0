Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 456 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Mar 2016 13:04:05 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 82631601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 13:04:05 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id bowS1s0060BmcFC01owTuT; Tue, 29 Mar 2016 13:56:29 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=7OsogOcEt9IA:10 a=_KtNUsfIDAEmc9bHkb0A:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>) id 1aktC6-0003eR-IV
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2016 13:56:26 +0100
Date: Tue, 29 Mar 2016 13:56:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160329125626.GA11712@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Over-pruning the sstate cache
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
X-List-Received-Date: Tue, 29 Mar 2016 13:04:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

80b3974081c4a8c604e23982a6db8fb32c616058 implies that at least some people
are pruning the sstate cache based on file access time.

We run incremental and nightly Jenkins jobs that build images for various
targets and branches in order to keep the sstate-cache populated. Files are
pruned once they haven't been accessed for a few days. This has worked
reasonably well for a few years (and the script can be simplified now since
the above commit.)

Recently we've found that files that are still required are being pruned.
This appears to be due to a combination of improvements to oe-core to avoid
unnecessary tasks and improvements to our own recipes. These have resulted
in it being possible to build an image without requiring the
populate_sysroot.tgz files if nothing has changed that needs building.

Is there a recommended way to ensure that all the sstate cache files are
touched, even those that are not actually required to build the image
currently due to task optimisation?

The only solution I can come up with is to invent a recursive
"all_populate_sysroot" recrdeptask that depends on the individual
populate_sysroot tasks and run that task for each image.

Does anyone have any better ideas?

Mike.

