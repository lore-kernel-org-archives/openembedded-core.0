Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QS8tQ-0000ca-8A
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 16:29:00 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QS8qL-00014u-7j from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 07:25:49 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 2 Jun 2011 07:22:11 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 2 Jun 2011 07:25:48 -0700
Message-ID: <4DE79D69.7080806@mentor.com>
Date: Thu, 2 Jun 2011 07:25:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>	<4DE69582.2090508@mentor.com>	<1306958729.3119.3.camel@lenovo.internal.reciva.com>	<4DE6A43A.3050401@mentor.com>	<1306961135.3119.13.camel@lenovo.internal.reciva.com>	<4DE6A836.3040004@mentor.com>
	<1307023591.27470.549.camel@rex>
In-Reply-To: <1307023591.27470.549.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 14:22:11.0188 (UTC)
	FILETIME=[762F9B40:01CC2130]
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2011 14:29:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/02/2011 07:06 AM, Richard Purdie wrote:
> On Wed, 2011-06-01 at 13:59 -0700, Tom Rini wrote:
>> On 06/01/2011 01:45 PM, Phil Blundell wrote:
>>> On Wed, 2011-06-01 at 13:42 -0700, Tom Rini wrote:
>>>> What falls down in this case is that  once
>>>> perl-native is built (and in our PATH), if it's a different version than
>>>> system-wide perl, stuff starts failing on version mis-match.
>>>
>>> I think that's the bit that I'm not properly understanding.  Which
>>> versions are mismatching, exactly?  
>>>
>>> Surely the local perl from the sysroot ought to be completely
>>> self-contained and shouldn't be using any bits from the host perl
>>> install at that point.
>>
>> So this jogs my memory a bit!  It's not so much perl itself but stuff
>> that uses perl that can get dirty and then no, you have stuff thats
>> built for system perl and stuff that's built with perl-native clashing.
>>
>> Relying even more on memory, I think help2man was one of the "easy"
>> culprits and since we also modify the env, we do things like have
>> help2man run with PERL5LIB and so on pointing system-wide perl at
>> perl-native's lib directory and so forth.
> 
> But with the proposed patch series either:
> 
> a) help2man depends perlnative.bbclass
> 
> In this case it can depend on perl-native being there, its in path and
> things work as per OE.dev.
> 
> b) help2man doesn't depend in perlnative.bbclass
> 
> It only sees the system perl.
> 
> So I'm still not clear where the problem is?

Well, help2man-native is (or needs to be) a dep listed in
autotools.bbclass (since so many things need it, hence why it oe-core
still just has it as a required host utility instead of building it).

But help2man is just the easy/common case.  Heck, it _may_ blow up even
with the host help2man instead of help2man-native, if a recipe uses
system-wide help2man and perlnative.bbclass.  The root problem (again,
from memory) is that since we modify PERL5LIB and so on, when we do
that, we've opened ourselves up for system-wide perl trying to use
perl-native's stuff.

-- 
Tom Rini
Mentor Graphics Corporation


