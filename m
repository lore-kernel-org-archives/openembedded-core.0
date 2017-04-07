Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56E7877DE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 14:12:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v37ECgqh023976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 07:12:42 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 07:12:41 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c7fe22f4-6837-fc9f-3497-23ae4238971e@windriver.com>
Date: Fri, 7 Apr 2017 09:12:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
Subject: scripts/rpm2cpio.sh -- master version
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
X-List-Received-Date: Fri, 07 Apr 2017 14:12:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The change to the rpm4 version of rpm2cpio.sh has triggered a problem on a few
of our older build machines.  Specifically:

dd: invalid input flag: `skip_bytes'
Try `dd --help' for more information.

I was doing some investigation, and the line causing the issue is:

    dd if="$pkg" skip="$o" iflag=skip_bytes status=none $*

The old code did the same thing using:

    dd if=$pkg ibs=$o skip=1" 2>/dev/null


It appears that 'iflag' is GNU specific.  Generally not a big deal, but the
specific flag 'skip_bytes' is new with in the last couple years.  The code is
almost not supported on non-GNU systems, so could pose problems on non-Linux
hosts [not a problem today].

I'm wondering if we should look at modifying this script to use the older style
for better compatibility with older hosts?

--Mark

