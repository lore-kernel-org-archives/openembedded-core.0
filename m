Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD3C27845A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 11:38:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w04BcYFC014567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jan 2018 03:38:34 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 4 Jan 2018 03:38:32 -0800
To: Patrick Ohly <patrick.ohly@intel.com>, =?UTF-8?Q?Jos=c3=a9_Bollo?=
	<jobol@nonadev.net>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
Date: Thu, 4 Jan 2018 19:39:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515062493.10775.21.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 04 Jan 2018 11:38:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 01/04/2018 06:41 PM, Patrick Ohly wrote:
> On Thu, 2018-01-04 at 11:18 +0100, José Bollo wrote:
>>> Do you agree to move the patch to Smack specific layer? Such as
>>> meta-security?
>>
>> I agree.
> 
> Layers like meta-security should not modify recipes from other layers,
> at least not by default. That would violate the "Yocto Compatible 2.0"
> rules.
> 
> Besides, it would be harder to maintain in a separate layer - for the
> maintainer of that layer.
> 
> I still think this patch belong into OE-core, even though it is then
> more work for the OE-core maintainer.
> 

If so, I think we should wrapper the logic with:

+#if defined(WITH_ATTR) && !defined(WITH_SELINUX)
+      attr_copy_file (def_template, user_home, NULL, NULL);
+#endif

Or just add a new condition like WITH_SMACK or something.

Thanks
Wenzong


