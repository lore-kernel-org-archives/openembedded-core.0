Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QBS2U-0005XB-3b
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Apr 2011 15:29:22 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 73566166025C; Sun, 17 Apr 2011 07:27:00 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id CA2721660183;
	Sun, 17 Apr 2011 07:26:58 -0600 (MDT)
Message-ID: <4DAAEAA2.6040103@mlbassoc.com>
Date: Sun, 17 Apr 2011 07:26:58 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>	<4f60a8f2b1b3f935ea029e6b780151015ea31c18.1302936483.git.sgw@linux.intel.com>	<5098B0B9-2B87-4BC4-AE7E-34900FAEEFD8@dominion.thruhere.net>
	<A377F56D-F244-4BBE-8004-37CCCB477F26@dominion.thruhere.net>
	<4DAA0D9E.80901@linux.intel.com>
In-Reply-To: <4DAA0D9E.80901@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
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
X-List-Received-Date: Sun, 17 Apr 2011 13:29:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2011 03:43 PM, Saul Wold wrote:
> On 04/16/2011 12:46 PM, Koen Kooi wrote:
>> furthermore both distutils and setuptools use the classes in sysroot, so the 'some versions' part of the argument is bogus.
>>
> Koen,
>
> Thanks, I guess missed your comments on this issue, thanks for pointing them out.
>
> Richard: Please disregard this patch.

Fair enough & indeed, using distutils does work for this package.  My follow up question would
be why are there two seemingly identical classes?  Just looking at a Python package which has
a 'setup.py' file, how can one one which to use and why??

>> Op 16 apr. 2011 om 14:11 heeft Koen Kooi<koen@dominion.thruhere.net> het volgende geschreven:
>>
>>> As I said in my other mail, the reasoning behind this patch is wrong and will lead to broken output. The '--single-version-externally-managed' is needed to stop the python egg
>>> code from doing the wrong thing. People running into problems with this need to do 'inherit distutils' instead of 'inherit setuptools'.
>>>
>>> Besides all that, 'DISTUTILS_INSTALL_EXTRA_ARGS' would be the correct name for such a thing.
>>>
>>> Op 16 apr 2011, om 08:55 heeft Saul Wold het volgende geschreven:
>>>
>>>> From: Gary Thomas<gary@mlbassoc.com>
>>>>
>>>> The setuptools class uses hard-wired options for 'setup.py' during
>>>> the install step. In particular, not all versions of setup.py
>>>> support the "--single-version-externally-managed" option. This
>>>> patch allows for a recipe to easily override these options, while
>>>> leaving the majority (important) setup options intact.
>>>>
>>>> --
>>>> ------------------------------------------------------------
>>>> Gary Thomas | Consulting for the
>>>> MLB Associates | Embedded world
>>>> ------------------------------------------------------------
>>>>
>>>>> From 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 2001
>>>> From: Gary Thomas<gary@mlbassoc.com>
>>>> Date: Wed, 13 Apr 2011 15:12:57 -0600
>>>> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>>>>
>>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>> meta/classes/setuptools.bbclass | 3 ++-
>>>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
>>>> index ced9509..cf1c224 100644
>>>> --- a/meta/classes/setuptools.bbclass
>>>> +++ b/meta/classes/setuptools.bbclass
>>>> @@ -2,7 +2,8 @@ inherit distutils
>>>>
>>>> DEPENDS += "python-setuptools-native"
>>>>
>>>> +DISTUTILS_INSTALL_OPTS ?= "--single-version-externally-managed "
>>>> DISTUTILS_INSTALL_ARGS = "--root=${D} \
>>>> - --single-version-externally-managed \
>>>> + ${DISTUTILS_INSTALL_OPTS} \
>>>> --prefix=${prefix} \
>>>> --install-data=${datadir}"
>>>> --
>>>> 1.7.1.1
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


