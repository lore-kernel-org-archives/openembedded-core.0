Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54E816FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:21:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V9L3OP010636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Aug 2016 02:21:04 -0700 (PDT)
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 02:21:02 -0700
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>, <seebs@seebs.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
Date: Wed, 31 Aug 2016 17:21:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Wed, 31 Aug 2016 09:21:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Experts,

While I trying to build Yocto in Docker Container which using dumb-init 
as init system, I found the build always be stopped at some point and 
the container was terminated as well with below errors:

     Child process timeout after 2 seconds.
     Child process exit status 4: lock_held

Sometimes there's not any obvious error message.

After some `git bisect` testing, I believe the issue was started since 
commit:

----------------------
9df3cdf42d8c1216682f497f0b166a43ef9f4184 is the first bad commit
commit 9df3cdf42d8c1216682f497f0b166a43ef9f4184
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue Jul 5 13:18:31 2016 +0100

     pseudo: Upgrade to 1.8.1

     * Drop patches where the changes exist upstream
     * Fetch from git as no tarball is available for 1.8.1
     * Move common code to pseudo.inc
     * Update patchset in git recipe

     (From OE-Core rev: 0c36984d4c501d12fa91cf7371511641585cc256)
-----------------------

Finally I narrowed it down to pseudo commit:

------------------------
commit 77ee254a6c974aad9bcab2c58c9ee9e0880c9718
Author: Peter Seebach <peter.seebach@windriver.com>
Date: Tue Mar 1 16:21:15 2016 -0600

     Server launch reworking.

     This is the big overhaul to have the server provide meaningful exit 
status
     to clients.

     In the process, I discovered that the server was running with 
signals blocked
     if launched by a client, which is not a good thing, and prevented 
this from
     working as intended.

     Still looking to see why more than one server spawn seems to happen.
------------------------

I also created a testcase for reproducing the issue at:

     https://github.com/WenzongFan/docker-build-yocto

For dumb-init please refer to:

     https://github.com/Yelp/dumb-init

Could anyone help to fix the signal handling in pseudo?


Thanks
Wenzong

