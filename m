Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5E770100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:41:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P9fuqt018469
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 May 2016 02:41:56 -0700 (PDT)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:41:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andreas Oberritter
	<obi@opendreambox.org>, <openembedded-core@lists.openembedded.org>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
	<1464163536.9570.92.camel@linuxfoundation.org>
From: zhenbo <zhenbo.gao@windriver.com>
Message-ID: <5745735E.60001@windriver.com>
Date: Wed, 25 May 2016 17:41:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464163536.9570.92.camel@linuxfoundation.org>
Subject: Re: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 09:41:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年05月25日 16:05, Richard Purdie wrote:
> On Wed, 2016-05-25 at 15:11 +0800, Zhenbo Gao wrote:
>> connman get conflicts with networkmanager when building
>> the project.
>>
>> here introduce alias virtual/networkmanager for these
>> two recipes, so setting PREFERRED_PROVIDER to the proper
>> one can solve the conflicts.
>>
>> this patch is for connman recipe.
> We do not use the virtual/* namespace in package dependencies, only in
> the build time DEPENDS/PROVIDES space. This is because there is no way
> to indicate how the package manager should resolve such things amongst
> many other reasons.
Hi Richard & Andreas,

Thanks for replying this mail.

The situation on my side is: if my project include connman and 
networkmanager at the same time, the compile step will fail:
...
Computing transaction...error: Can't install 
xfce4-power-manager-1.4.4-r0.0@corei7_64: unable to install provider for 
networkmanager:
error:     networkmanager-1.0.4-r0.0@corei7_64 conflicts with 
connman-1.30-r0.0@corei7_64
...
The dependence relationship is:
xfce4-power-manager --> networkmanager
packagegroup-self-hosted --> connman

Anyway, the patch is not suitable, Koen Kooi(koen@dominion.thruhere.net) 
has suggested me to fix packagegroup-self-hosted to not specify a 
connection manager.
When i am trying to fix my issue, i was wondering why self-hosted needs 
connman ? if self-hosted really don't need connman, the way provided by 
koen is the best solution for this issue.

The draft patch looks like:
---
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -28,8 +28,6 @@ RDEPENDS_packagegroup-self-hosted = "\
      "

  RDEPENDS_packagegroup-self-hosted-host-tools = "\
-    connman \
-    connman-plugin-ethernet \
      dhcp-client \
      e2fsprogs \
      e2fsprogs-e2fsck \

What do you think? is that ok? if so, i will send an official patch for it.

Thanks,
Zhenbo

> Cheers,
>
> Richard
>


