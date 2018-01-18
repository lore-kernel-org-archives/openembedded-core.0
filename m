Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41D926011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 13:31:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0IDV50c030134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 18 Jan 2018 05:31:06 -0800
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 18 Jan 2018 05:31:05 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
	<af2c70ff-edfa-fa06-b669-3fdce584b024@windriver.com>
	<1516274986.24502.4.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d6dc4999-8a37-d5c0-3656-8f9dde7bafd3@windriver.com>
Date: Thu, 18 Jan 2018 21:31:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1516274986.24502.4.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/12 V2] Fixes for multilib and eSDK
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
X-List-Received-Date: Thu, 18 Jan 2018 13:31:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 01/18/2018 07:29 PM, Richard Purdie wrote:
> On Thu, 2018-01-18 at 17:35 +0800, Robert Yang wrote:
>> Two of the patches have been merged, so I rebased others and put them
>> to:
>>
>>     git://git.openembedded.org/openembedded-core-contrib rbt/multilib
>>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/
>> multilib
>>
>> Robert Yang (10):
>>     staging.bbclass: fix for multilib
>>     populate_sdk_ext.bbclass: fix for multilib
>>     staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
>>     staging.bbclass: print searched manifest when not found
>>     staging.bbclass: extend_recipe_sysroot(): search multilib manifest
>>     package_manager.py: reverse archs correctly
>>     multilib.bbclass: extend allarch recipes
>>     toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
>>       image
>>     multilib.bbclass: deltask populate_sdk and populate_sdk_ext
>>     populate_sdk_ext.bbclass: remove the try...finally
> 
> Just to update, I also have a set of patches which alter the manifest
> code in staging.bbclass, I wanted to compare what we're doing and
> likely create a combination of those patches.
> 
> For the deltask commit, could you make it bb.build.deltask() only when
> image.bbclass is inherited?

Thanks, I updated it in the repo:

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 770863f..6a79d02 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -95,6 +95,8 @@ python __anonymous () {
          d.setVar("LINGUAS_INSTALL", "")
          # FIXME, we need to map this to something, not delete it!
          d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
+        bb.build.deltask('do_populate_sdk', d)
+        bb.build.deltask('do_populate_sdk_ext', d)
          return

      clsextend.map_depends_variable("DEPENDS")


But I think that there is no difference since only image recipe has
do_populate_sdk/_ext.

// Robert

> 
> Cheers,
> 
> Richard
> 

