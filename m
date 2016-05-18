Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1AE877042
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 06:09:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4I69iK8023547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 23:09:44 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 17 May 2016 23:09:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Message-ID: <573C0726.3040402@windriver.com>
Date: Wed, 18 May 2016 14:09:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
Subject: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 06:09:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

The PRServer bumps PR according to do_package's task hash, that
causes it bumps *all* packages' PR when recipes like pseudo-native
and rpm-native is changed. It is a very bad user experience when we
run "smart/opkg upgrade" on running target, for example, when we apply
a CVE patch to pseudo-native or rpm-native, or do some slight changes
in their do_compile, "smart/opkg upgrade" will download/install *all*
the packages since all of the packages' PR are bumped.

Here are some rough suggestions to fix this problem, and please feel
free to give your suggestions.
1) Do not use do_package's task for bumping PR, the easiest way
    is simulate manually bump PR -- only bump PR when the recipe
    itself's checksum is changed.

2) Add a new task for PRServer, redefine its task hash for bumping
    PR, for example, this task hash only considers RDEPENDS (no
    DEPENDS), and drop any native dependencies.

I prefer the first way, and an alternative way maybe add a var so that
the user can configure it:
PR_CHECKSUM = "${BB_TASKHASH}" (current way)
Or
PR_CHECKSUM = "<recipe checksum>"

-- 
Thanks

Robert

