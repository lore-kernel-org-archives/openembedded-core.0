Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D330744F5;
	Fri,  6 Apr 2018 10:37:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36Ab1Iw003573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 11:37:02 +0100
Message-ID: <1523011021.2942.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Apr 2018 11:37:01 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 10:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I finally found 5 mins to sit and look at where I'd gotten to with the
LAYERSERIES variable handling. I sent out discussion about this a while
ago but as a reminder:

We have a problem where people expect master branch of meta-X to work
with OE-Core master. If meta-X hasn't been maintained for a long time,
this may give all kinds of weird errors. This creates a large support
burden and means we struggle to spot unmaintained/un-updated layers.
We'd like to fix this.

In answer to this I added LAYERSERIES_CORENAMES to OE-Core and strongly
suggest layers then set:

LAYERSERIES_COMPAT_xxx = "sumo"

in their layer.conf where xxx is the collection name (used elsewhere in
layer.conf) to indicate which versions of OE-Core they're expected to
work against.

The code already exists to validate this with a fatal error for
mismatches. What was missing was:

a) to print a warning if LAYERSERIES_COMPAT_xxx is unset. I've a patch 
   queued for bitbake to add this.
b) add a check to yocto-check-layer and require this to be set for YP 
   Compatible v2. I've added
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12661
   to track this.

Yes, its late in the release and the warnings will be annoying but I
think its worth fixing this now so I'm pushing ahead to resolve this.

Cheers,

Richard




