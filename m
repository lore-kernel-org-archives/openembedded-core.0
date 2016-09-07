Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61350776F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u879RQBp029967; Wed, 7 Sep 2016 10:27:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GPUgRGQpVsFO; Wed,  7 Sep 2016 10:27:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u879RMFJ029963
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Sep 2016 10:27:23 +0100
Message-ID: <1473240442.20226.111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Date: Wed, 07 Sep 2016 10:27:22 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: "markus.Lehtonen" <markus.Lehtonen@intel.com>
Subject: Speed regression in the 4.8 kernel?
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
X-List-Received-Date: Wed, 07 Sep 2016 09:27:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

I deliberately spaced out the merges of various things so we could get
performance measurements of the system as it happened. Unfortunately
the 4.8 kernel appears to regress the kernel build time quite
significantly:

The raw data:

ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative-1.3-414-g9428b19,1:01:32,4:21.16,1:00:32,2:10.86,0:16.19,0:11.21,0:01.20,5:34.73,26701616,6445160,1477762,5446116
ypperf02,master:9428b19a7dd1d265d9f3211004391abe33ea0224,uninative-1.3-414-g9428b19,1:04:14,4:23.82,1:00:40,2:13.70,0:16.18,0:11.28,0:01.22,5:45.48,26697516,6445724,1478048,5446490
ypperf02,master:b9d90ace005597ba35b59adcd8106a1c52e40c1a,uninative-1.3-438-gb9d90ac,1:03:16,7:22.13,1:02:46,2:16.60,0:16.32,0:11.04,0:01.21,5:42.11,30852876,10550952,1707255,5912282
ypperf02,master:f7ca989ddc6d470429b547647d3fbaad83a982d9,uninative-1.3-446-gf7ca989,1:04:42,7:29.05,1:03:04,2:19.71,0:16.21,0:11.05,0:01.24,5:52.83,30845748,10551316,1707615,5912122

which shows the time for "bitbake virtual/kernel -c cleansstate; time
bitbake virtual/kernel" goes from 4:20 to 7:22. The disk footprint of
the build went from 26GB to 30GB. The build with rm_work size went from
6.4GB to 10.5GB. The overall build time went up 2-3 minutes which looks
like the increased kernel build time. The increased time may well be
from the increased data being generated/processed.

We can't ship M3 with this much of a performance degradation and
increased space usage :(. Any idea what changed?

Cheers,

Richard

