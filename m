Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUW7R-0001Jv-Pt
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 06:45:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 May 2012 21:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141125324"
Received: from unknown (HELO [10.255.13.38]) ([10.255.13.38])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2012 21:35:46 -0700
Message-ID: <4FB32EA1.3060601@linux.intel.com>
Date: Wed, 16 May 2012 07:35:45 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
In-Reply-To: <CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 May 2012 04:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2012 11:46 PM, Manuel Bessler wrote:
> Just a few minutes ago I was wondering if such a feature did exist...
>
> I ran into a situation where I wanted to remove something from a .bbappend
> that is added to a variable using VARIABLE_append = "this and that"
>
My understanding is that a _subtract is fraught with danger, there all 
sorts of ordering implications.

For what you are trying to do in a .bbappend, can be done by using 
oe_filter_out() from utils.bbclass, it has to be done in anonymous code.

VARIABLE := "${@oe_filter_out('xxx', '${VARIABLE}', d)}"

This might be what you want.

Sau!

>
> Manuel
> On Tue, May 15, 2012 at 3:01 PM, Peter Seebach
> <peter.seebach@windriver.com>  wrote:
>> There's a few cases where something is a huge list of space-separated
>> things, and it is desireable to remove one.  The example currently
>> afflicting me is DISTRO_FEATURES_LIBC_DEFAULT; I want to end up with
>> the distro features including all but one of the words in it.
>>
>> It seems to me that a counterpart to _append would make sense.  Here
>> is my basic idea:
>>
>> FOO_subtract = "..."
>>
>> means that, when you expand FOO:
>>
>> 1. Fully expand it.
>> 2. Fully expand FOO_subtract.
>> 3. Remove any words in FOO_subtract from FOO.
>> 4. Yield the result.
>>
>> The rationale is that the semantics of things where we're using _append
>> seem to be consistently of the form "this is a space-separated set",
>> and being able to remove things from a set would be Super Handy.
>>
>> So I'm proposing the semantics for consideration, and if people like
>> them, I will go try to implement it in my Copious Free Time.
>>
>> -s
>> --
>> Listen, get this.  Nobody with a good compiler needs to be justified.
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


