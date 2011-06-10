Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QV2fu-0006Ru-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:27:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QV2ce-0005IF-0H from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 07:23:40 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 10 Jun 2011 07:23:39 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 10 Jun 2011 07:23:39 -0700
Message-ID: <4DF228E4.9070305@mentor.com>
Date: Fri, 10 Jun 2011 07:23:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>	<4DE69582.2090508@mentor.com>	<1306958729.3119.3.camel@lenovo.internal.reciva.com>	<4DE6A43A.3050401@mentor.com>	<1306961135.3119.13.camel@lenovo.internal.reciva.com>	<4DE6A836.3040004@mentor.com>
	<1307023591.27470.549.camel@rex>	<4DE79D69.7080806@mentor.com>
	<1307025426.2529.209.camel@phil-desktop>	<4DE7BA3F.4060600@mentor.com>
	<1307032545.27470.580.camel@rex>	<4DE7C09F.9000104@mentor.com>
	<1307606678.15712.130.camel@rex> <1307606884.15712.132.camel@rex>
In-Reply-To: <1307606884.15712.132.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 Jun 2011 14:23:39.0830 (UTC)
	FILETIME=[FE534D60:01CC2779]
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
X-List-Received-Date: Fri, 10 Jun 2011 14:27:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/09/2011 01:08 AM, Richard Purdie wrote:
> On Thu, 2011-06-09 at 09:04 +0100, Richard Purdie wrote:
>> On Thu, 2011-06-02 at 09:55 -0700, Tom Rini wrote:
>>> On 06/02/2011 09:35 AM, Richard Purdie wrote:
>>>> On Thu, 2011-06-02 at 09:28 -0700, Tom Rini wrote:
>>>>>   Even if we're using the sstate
>>>>> cache from /foo/oecore/tmp over in /bar/oecore/tmp (and /foo/oecore/tmp
>>>>> is rm -rf'd) ?  Since we've got a create_wrapper around perl and
>>>>> perl${PV} it should be I suppose (or is easily added there), but I'd
>>>>> feel a lot better with some testing of the above case (and the updates
>>>>> to cpan*bbclass).
>>>>
>>>> I only took the perl-native DEPENDS patch on the condition this gets
>>>> fixed properly. The patches that are there look to do that, at least for
>>>> OE-Core. If there are further issues we're going to have to take them as
>>>> they arise as I have an objection to crippling the build dependencies
>>>> because perl is broken. Really this could use some TLC from someone with
>>>> experience in the area...
>>>
>>> Well, I guess I'd boil down what I said above into a request like this
>>> for v3:
>>> - Modify cpan.bbclass to NOT set PERL_INC / PERL_LIB / PERL_ARCHLIB /
>>> PERLHOSTLIB.
>>
>> The first three of these are all about the *target* perl location and I
>> think we still need them due the mess that perl's build system is. With
>> the patch series in question they won't actually point at perl-native in
>> the target case and they are only really used for cross compiling
>> purposes.
>>
>> PERLHOSTLIB is used by the target perl when cross compiling to find
>> native .so files. perl-native will always be present at this point and
>> again, it seems like a valid use case.
>>
>> Summary is that I don't think perl-native is broken in any way but we do
>> need those variables.
>>
>>> - In /scratch/oecore/tmp0 build the images that were built for v1
>>> - In /scratch/oecore/tmp1 build perl-native's full sstate cache.
>>> - Keep the sstate cache from tmp1 and otherwise rm -rf tmp1.
>>> - In /scratch/oecore/tmp2 using the sstate from tmp1, build the same
>>> images that were built for tmp0.
>>
>> I'm confused by this test cycle. What do you mean by "build
>> perl-native's full sstate cache"?
>>
>> I suspect you've asking for some partial sstate cache to be shared
>> between two builds?
>>
>> Put simpler, you probably want:
>>
>> in tmp0 "bitbake perl-native"
>> in tmp1, different location to tmp0, "bitbake core-image-sato" but
>> sharing the same sstate cache
> 
> I meant to add that tmp0 should be renamed before this second step so if
> there are hardcoded references in any of the sstate packages they
> couldn't find anything in tmp0 as it would no longer exist.

Yes, this is what I'm asking for.

-- 
Tom Rini
Mentor Graphics Corporation


