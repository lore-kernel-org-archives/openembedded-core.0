Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68BEF6079E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 06:58:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4S6uTOf031703
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 May 2018 23:57:02 -0700
Received: from [128.224.27.69] (128.224.27.69) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 27 May 2018 23:56:12 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
	<055a6008-6237-5535-61c5-60162c3e7729@linux.intel.com>
	<7253e4cc-4ef2-522a-df37-383b98cbc81d@windriver.com>
	<CANNYZj9BPkpwWb5HsKenfM0Qm7qAH8A2T1je6vPai0_izJ+dgQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7e32adb3-b538-ba6d-b2e4-8933bda9080e@windriver.com>
Date: Mon, 28 May 2018 14:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9BPkpwWb5HsKenfM0Qm7qAH8A2T1je6vPai0_izJ+dgQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/24] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Mon, 28 May 2018 06:58:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/28/2018 01:23 PM, Alexander Kanavin wrote:
> 2018-05-28 6:24 GMT+03:00 Robert Yang <liezhi.yang@windriver.com>:
> 
>> Thanks for the reply, but I'm afraid that all_multlilib_tune_values() isn't
>> suitable for this case, what need to display is something like:
>>
>> lib32:  DEFAULTTUNE       = "x86"
>> lib32:  TARGET_SYS        = "i686-pokymllib32-linux"
>> lib32:  TUNE_FEATURES     = "m32"
>>
>> But all_multlilib_tune_values() returns all values, e.g:
>>
>> DEFAULTTUNE       = "core2-64 x86"
> 
> That's right, but you should still use get_multilib_datastore()
> instead of setting up localdata manually

Thanks, make sense, updated in the repo:

+def buildcfg_multilibs(d):
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for variant in variants.split():
+        localdata = get_multilib_datastore(variant, d)
+        statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
+        for var in statusvars:
+            origvalue = d.getVar(var, True)
+            variantvalue = localdata.getVar(var, True)
+            if origvalue and variantvalue and origvalue != variantvalue:
+                yield '%-7s %-17s = "%s"' % (variant + ":", var, variantvalue)
+

// Robert

> 
> Alex
> 

