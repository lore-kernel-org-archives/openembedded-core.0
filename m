Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38EC3700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:06:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5S96Exa009463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:06:14 -0700 (PDT)
Received: from soho-mhatle-m.local (147.11.119.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Jun 2017 02:06:13 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<89eb4c1de58d2de44df217a62c9cd791da16a9eb.1498577501.git-series.patrick.ohly@intel.com>
	<CABcZAN=rnbDi8qX_y3AXMMoazp=5Qt2wMg72tyvRx1h0fDWzsA@mail.gmail.com>
	<1498636205.7464.107.camel@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <37790f6f-6b64-ff77-5019-47c3ae7919a8@windriver.com>
Date: Wed, 28 Jun 2017 11:06:12 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1498636205.7464.107.camel@intel.com>
Subject: Re: [PATCH v2 1/6] yocto-compat-layer.py: avoid adding layers more than once
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
X-List-Received-Date: Wed, 28 Jun 2017 09:06:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/28/17 9:50 AM, Patrick Ohly wrote:
> On Tue, 2017-06-27 at 15:46 -0700, Christopher Larson wrote:
>>
>> On Tue, Jun 27, 2017 at 8:33 AM, Patrick Ohly <patrick.ohly@intel.com>
>> wrote:
>>         add_layer_dependencies() might get called more than once, or
>>         one of
>>         the layer dependencies might already be present. The function
>>         should
>>         not add layers again because doing so can cause warnings like:
>>         
>>           WARNING: Duplicate inclusion
>>         for .../meta-openembedded/meta-oe/conf/distro/include/meta_oe_security_flags.inc in .../meta-openembedded/meta-oe/conf/layer.conf
>>         
>>         Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>>         ---
>>
>> I’m curious about why this isn’t either just calling out to
>> `bitbake-layers add-layer` or using one of the existing functions we
>> have for modifying bblayers, rather than doing its own +=.
> 
> I don't know exactly, Mark implemented it like that. My guess is that
> more control was needed over which layers get added. For example,
> "bitbake-layers add-layer" only adds one layer, but does not recursively
> add layers it depends on. This could be improved of course.
> 

Correct.  Dependencies had to be evaluated for the layers to be added properly.
The existing add-layer does not process dependencies, it simply adds the layer.

The code was also based on the prior version which did it directly and not via
bitbake add-layer.  I did not change that behavior, but simply added the ability
to evaluate the dependency set and include the necessary combinations for the
layer to work properly.

I have no objections to using bitbake-layers add-layer.  (Note, I'm working on
general enhancements that may allow this to process dependencies, but I'm not
sure when I will have that work done.)

--Mark

