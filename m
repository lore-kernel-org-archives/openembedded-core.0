Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TTCdy-0001cs-1S
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 15:18:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9UE4ZrB008533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2012 07:04:35 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 30 Oct 2012 07:04:33 -0700
Message-ID: <508FDE70.5010405@windriver.com>
Date: Tue, 30 Oct 2012 22:04:32 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
	<8757dbc0cba44d712d24bea43a3ed78c37b0f991.1351496696.git.liezhi.yang@windriver.com>
	<1351590871.2828.62.camel@ted>
In-Reply-To: <1351590871.2828.62.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] multilib.bbclass: add class-multilib to override
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 14:18:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Richard,

I've pushed the new patches again (removed the old branch, and create
a new one):

git://git.pokylinux.org/poky-contrib robert/virtclass

Now only change the native/nativesdk values. I think that the virtclass-cross
should be changed to class-cross, too, but I didn't do it in these patches,
I will send another pull request for the virtclass-cross if it is fine.

// Robert

On 10/30/2012 05:54 PM, Richard Purdie wrote:
> On Tue, 2012-10-30 at 17:33 +0800, Robert Yang wrote:
>> Add the new override way CLASSOVERRIDE = "class-multilib" to
>> multilib.bbclass, and add the check code to sanity.bbclass, we keep both
>> the old and new way, which means, both of the following are supported:
>>
>> virtclass-multilib
>> class-multilib
>>
>> [YOCTO #3297]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/multilib.bbclass | 2 ++
>>   meta/classes/sanity.bbclass   | 3 ++-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
>> index 77ccce4..2dd2f85 100644
>> --- a/meta/classes/multilib.bbclass
>> +++ b/meta/classes/multilib.bbclass
>> @@ -1,3 +1,5 @@
>> +CLASSOVERRIDE = "class-multilib"
>> +
>>   python multilib_virtclass_handler () {
>>       if not isinstance(e, bb.event.RecipePreFinalise):
>>           return
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index 3806bc5..ba1cd6d 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -122,7 +122,8 @@ def check_toolchain(data):
>>                   tune_error_set.append("The multilib '%s' appears more than once." % lib)
>>               else:
>>                   seen_libs.append(lib)
>> -            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
>> +            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True) or \
>> +                   data.getVar("DEFAULTTUNE_class-multilib-%s" % lib, True)
>>               if tune in seen_tunes:
>>                   tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
>>               else:
>
> Sorry but this isn't right. The multilib case is special since it sets
> "class-multilib-xxx", not "class-multilib" without the suffix. The above
> changes are just going to confuse people and depending on what you do in
> other patches, may or may not work.
>
> Can you resend the patch set just changing the native/nativesdk values
> please? We can then look at multilib specifically as a follow up.
>
> Cheers,
>
> Richard
>
>
>


