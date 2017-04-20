Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC7F172F39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:56:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3KCuc6q022545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Apr 2017 05:56:38 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Apr 2017 05:56:38 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, David Vincent
	<freesilicon@gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
	<5023360.N8L8OyXh3V@crde-port-20.cahors.local>
	<d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0e06aa5c-c46b-dd81-281f-dec04653d042@windriver.com>
Date: Thu, 20 Apr 2017 07:56:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Thu, 20 Apr 2017 12:56:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 4/20/17 7:37 AM, Alexander Kanavin wrote:
> On 04/19/2017 04:03 PM, David Vincent wrote:
>> The problem is that I must be able to manage the configuration of a machine
>> without physical intervention and only via package upgrades. A new
>> configuration can be applied simply by incrementing the PR of a configuration
>> package.
>>
>> But maybe this is a use case only needed by me and I should manage it in my
>> own specific layer ?
>>
>> Now that I think of it, I have the same kind of problem for all machine
>> specific configurations. For now, I just replace the PACKAGE_ARCH in my BSP
>> layer with a machine specific one to indicate that a package contains a
>> configuration valid only for a specific machine. Maybe, in a future release, it
>> should be desirable to create -conf packages based on the CONFFILES variable ?
>> I don't know if it's a good idea, but maybe I could bring that up on the
>> architecture mailing list ?
> 
> By all means please do so. Yocto lacks a solution for configuration 
> management, and this was discussed some time ago, although I cannot 
> anymore find where it happened. Mark, do you remember?
> 

I don't remember anything specific about the configuration management, just that
we discussed it.  Sorry.

I do know that this is an issue, and what we've said in the past was create a
.bbappend, set PACKAGE_ARCH to MACHINE_ARCH, add your machine specific
configuration to the package.

Down side of this is that if only the configuration file is different then you
now have a separate binary specific to that machine -- wasted space on a feed
server.

The other alternative I know of is to use the rootfs post scripting and replace
the conf files with the ones specific to that -build-.  This is similar to a
manufacturing step in a traditional ODM/OEM relationship.

At least with RPM, if the CONFFILES are set right, any configurations set this
way should NOT be overridden on a target upgrade.

(and any CONFFILE entries not set right are bugs IMHO...)

--Mark

> Alex
> 


