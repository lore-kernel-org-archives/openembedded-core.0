Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QBDK2-0004h6-E6
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 23:46:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2011 14:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,224,1301900400"; d="scan'208";a="734421993"
Received: from unknown (HELO [10.255.12.198]) ([10.255.12.198])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2011 14:43:58 -0700
Message-ID: <4DAA0D9E.80901@linux.intel.com>
Date: Sat, 16 Apr 2011 14:43:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Gary Thomas <gary@mlbassoc.com>
References: <cover.1302936483.git.sgw@linux.intel.com>	<4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>	<5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
	<A377F56D-F244-4BBE-8004-37CCCB477F26@dominion.thruhere.net>
In-Reply-To: <A377F56D-F244-4BBE-8004-37CCCB477F26@dominion.thruhere.net>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 47/58] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Sat, 16 Apr 2011 21:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2011 12:46 PM, Koen Kooi wrote:
> furthermore both distutils and setuptools use the classes in sysroot, so the 'some versions' part of the argument is bogus.
>
Koen,

Thanks, I guess missed your comments on this issue, thanks for pointing 
them out.

Richard: Please disregard this patch.

Sau!

> Op 16 apr. 2011 om 14:11 heeft Koen Kooi<koen@dominion.thruhere.net>  het volgende geschreven:
>
>> As I said in my other mail, the reasoning behind this patch is wrong and will lead to broken output. The '--single-version-externally-managed' is needed to stop the python egg code from doing the wrong thing. People running into problems with this need to do 'inherit distutils' instead of 'inherit setuptools'.
>>
>> Besides all that, 'DISTUTILS_INSTALL_EXTRA_ARGS' would be the correct name for such a thing.
>>
>> Op 16 apr 2011, om 08:55 heeft Saul Wold het volgende geschreven:
>>
>>> From: Gary Thomas<gary@mlbassoc.com>
>>>
>>> The setuptools class uses hard-wired options for 'setup.py' during
>>> the install step.  In particular, not all versions of setup.py
>>> support the "--single-version-externally-managed" option.  This
>>> patch allows for a recipe to easily override these options, while
>>> leaving the majority (important) setup options intact.
>>>
>>> --
>>> ------------------------------------------------------------
>>> Gary Thomas                 |  Consulting for the
>>> MLB Associates              |    Embedded world
>>> ------------------------------------------------------------
>>>
>>>>  From 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 2001
>>> From: Gary Thomas<gary@mlbassoc.com>
>>> Date: Wed, 13 Apr 2011 15:12:57 -0600
>>> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>>>
>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> meta/classes/setuptools.bbclass |    3 ++-
>>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
>>> index ced9509..cf1c224 100644
>>> --- a/meta/classes/setuptools.bbclass
>>> +++ b/meta/classes/setuptools.bbclass
>>> @@ -2,7 +2,8 @@ inherit distutils
>>>
>>> DEPENDS += "python-setuptools-native"
>>>
>>> +DISTUTILS_INSTALL_OPTS ?= "--single-version-externally-managed "
>>> DISTUTILS_INSTALL_ARGS = "--root=${D} \
>>> -    --single-version-externally-managed \
>>> +    ${DISTUTILS_INSTALL_OPTS} \
>>>     --prefix=${prefix} \
>>>     --install-data=${datadir}"
>>> --
>>> 1.7.1.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


