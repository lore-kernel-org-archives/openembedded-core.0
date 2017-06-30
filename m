Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 234F278240
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:17:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U9HCWd014893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Jun 2017 02:17:12 -0700 (PDT)
Received: from soho-mhatle-m.local (128.224.7.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 02:17:11 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<2312c1a18a7a4154d99028405f5f865be42fa7a5.1498577501.git-series.patrick.ohly@intel.com>
	<628a4bc1-c5cb-a1f8-9e12-4cb305f96dbb@windriver.com>
	<1498642439.7464.115.camel@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <4212cf3e-d7bb-aabc-96f1-606b2d0b411a@windriver.com>
Date: Fri, 30 Jun 2017 11:17:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498642439.7464.115.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Fri, 30 Jun 2017 09:17:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/28/17 11:33 AM, Patrick Ohly wrote:
> On Wed, 2017-06-28 at 11:08 +0200, Mark Hatle wrote:
>> On 6/27/17 5:33 PM, Patrick Ohly wrote:
>>> Software layers were previously allowed to change signatures, but
>>> that's not desired for those layers either. The rule that a layer
>>> which is "Yocto Compatible 2.0" must not change signatures unless
>>> explicitly requested holds for all kinds of layers.
>>>
>>> However, as this is something that software layers might not be able
>>> to do right away, testing for signature changes in software layers can
>>> be disabled. It's on by default, as that was Richard's
>>> recommendation. Whether that should change needs further discussion as
>>> part of finalizing "Yocto Compatible 2.0".
>>>
>>> As it might still change, the tool now has both a with/without
>>> parameter so that users of the tool can choose the desired behavior
>>> without being affected by future changes to the default.
>>
>> How would you regulate the behavior of a software layer that is doing bbappends
>> or similar to a system provided component.
> 
> By adding a PACKAGECONFIG that is off by default?
> 
> But I haven't tried this and whether it influences task signatures. Do
> you have a specific example?
> 
> Regarding these patches, is it okay to merge them as they are now?
> Without them, we cannot test software layers for signature changes, so
> won't know how much of a problem it would be.
> 
> The tool and "Yocto Compatible 2.0" are work in progress, so there's
> still time to refine it after merging. My motivation for getting them
> merged already now is a) to make the change available to others and b)
> to use the strict version of the check in refkit (where we currently
> satisfy the criteria).
> 

Yes, this was a comment about the commit message, not the technical content of
the patch.

I'm not sure that PACKAGECONFIG can be used to control this type of stuff.  Perhaps?

In many cases, the bbappends seem to add patches or change the way the
compile/install work.  Often these are integration specific for something -- so
there is no 'easy' way to use PACKAGECONFIG to control this.

The only way I can think of is using a PACKAGECONFIG to define a an override.
But as far as I know just adding the evaluation to the overrides and such will
affect the task hashes in some way.

--Mark

