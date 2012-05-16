Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SUg0m-0002i2-Hc
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 17:19:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4GF6sRJ025418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 08:09:34 -0700 (PDT)
Received: from msp-dhcp26.wrs.com (172.25.34.26) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 16 May 2012 08:07:56 -0700
Message-ID: <4FB3C2CC.7010204@windriver.com>
Date: Wed, 16 May 2012 10:07:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com>
In-Reply-To: <4FB32EA1.3060601@linux.intel.com>
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Wed, 16 May 2012 15:19:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/12 11:35 PM, Saul Wold wrote:
> On 05/15/2012 11:46 PM, Manuel Bessler wrote:
>> Just a few minutes ago I was wondering if such a feature did exist...
>>
>> I ran into a situation where I wanted to remove something from a .bbappend
>> that is added to a variable using VARIABLE_append = "this and that"
>>
> My understanding is that a _subtract is fraught with danger, there all
> sorts of ordering implications.
>
> For what you are trying to do in a .bbappend, can be done by using
> oe_filter_out() from utils.bbclass, it has to be done in anonymous code.
>
> VARIABLE := "${@oe_filter_out('xxx', '${VARIABLE}', d)}"
>
> This might be what you want.

There are two issues I believe Peter is having.. the first is trying to figure 
out how to filter stuff out of _append.  I'm sure sure the above will be able to 
do that.

But the real problem we keep struggling with is .conf load order.. you try to 
set some nice value in local.conf, and some later configuration file adds to it, 
or simply overwrites it.  He'd like a way to strip out things like that.

I suspect the real answer though is fix the various configuration settings to 
better allow them to be overridden, but I'm not sure exactly how.

--Mark

> Sau!
>
>>
>> Manuel
>> On Tue, May 15, 2012 at 3:01 PM, Peter Seebach
>> <peter.seebach@windriver.com>   wrote:
>>> There's a few cases where something is a huge list of space-separated
>>> things, and it is desireable to remove one.  The example currently
>>> afflicting me is DISTRO_FEATURES_LIBC_DEFAULT; I want to end up with
>>> the distro features including all but one of the words in it.
>>>
>>> It seems to me that a counterpart to _append would make sense.  Here
>>> is my basic idea:
>>>
>>> FOO_subtract = "..."
>>>
>>> means that, when you expand FOO:
>>>
>>> 1. Fully expand it.
>>> 2. Fully expand FOO_subtract.
>>> 3. Remove any words in FOO_subtract from FOO.
>>> 4. Yield the result.
>>>
>>> The rationale is that the semantics of things where we're using _append
>>> seem to be consistently of the form "this is a space-separated set",
>>> and being able to remove things from a set would be Super Handy.
>>>
>>> So I'm proposing the semantics for consideration, and if people like
>>> them, I will go try to implement it in my Copious Free Time.
>>>
>>> -s
>>> --
>>> Listen, get this.  Nobody with a good compiler needs to be justified.
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



