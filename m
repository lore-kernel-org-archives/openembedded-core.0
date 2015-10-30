Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 36D7875D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 21:42:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9ULgh7B006295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 30 Oct 2015 14:42:44 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 30 Oct 2015 14:42:43 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5633E452.9040500@windriver.com>
Date: Fri, 30 Oct 2015 16:42:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
Subject: PowerPC / gcc / prelink
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
X-List-Received-Date: Fri, 30 Oct 2015 21:42:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I finally chased down the PowerPC prelink problem.  It appears to be within GCC.

On most systems GCC (for PPC) is configured with --enable-secureplt.  However,
the OE-Core version is not.  The prelinker assumes that for certain types of
relocations that the PPC_GOT table will exist, otherwise it gives up.  (It
doesn't know how to do the relocations in the old style .bss-got table.)

I'm wondering if there is a reason that PPC is defaulting to the old style
.bss-got (other then the secureplt was not enabled by default).

Is this something we should do in all cases, or should this become a
DISTRO_FEATURE like the mips 'mplt' setting?


I'm still building systems and running tests, but adding --enable-secureplt to
both the gcc-cross-initial, and gcc-cross appear to have resolved the prelinking
issues.

--Mark

