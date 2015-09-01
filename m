Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20C1976B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:51:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t81LpQNh017355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Sep 2015 14:51:26 -0700 (PDT)
Received: from msp-dhcp31.wrs.com (172.25.34.31) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 1 Sep 2015 14:51:26 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jian Liu
	<jian.liu@windriver.com>
References: <1440491341-29988-1-git-send-email-jian.liu@windriver.com>
	<1441141913.24871.17.camel@linuxfoundation.org>
	<55E6189D.90902@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55E61DDD.3070900@windriver.com>
Date: Tue, 1 Sep 2015 16:51:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55E6189D.90902@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sdk.py: fix conflicts of packages
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
X-List-Received-Date: Tue, 01 Sep 2015 21:51:28 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/1/15 4:29 PM, Mark Hatle wrote:
> On 9/1/15 4:11 PM, Richard Purdie wrote:
>> On Tue, 2015-08-25 at 16:29 +0800, Jian Liu wrote:
>>> If packages are conveyed to smart to install at the same time,
>>> conflicts will not happen.
>>> Try to install packages into sdk image at the same time.

I forgot to add..  If we have two packages that are conflicting, even in an
'attemptonly' install... it's likely a bug in those packages.  Two files of the
same path/name should never be written to that same location.. they either need
to be made to be identical, or we need to justify why the two packages can never
be installed at the same time.

(In the case if ncurses-dev, I'd be hard to justify why they shouldn't be
installed at the same time.)

--Mark

>> Doesn't smart have an issue where if one package fails to install for
>> some reason, others listed in the same command won't be attempted? Did
>> you test that?
> 
> I believe this was fixed in:
> 
> commit cd475aea5f5bc4b6a2dd3e576070a117ae079597
> Author: Mark Hatle <mark.hatle@windriver.com>
> Date:   Thu Jan 22 16:10:34 2015 -0600
> 
>     python-smartpm: Fix attemptonly builds when file conflicts occur
> 
>     [YOCTO #7299]
> 
>     When file conflicts occur, the RPM transaction aborts.  Instead of
>     simply accepting the failure, we now identify, capture, and remove
>     the offending package(s) from the transaction and retry.
> 
>     Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> 
> 
> 
> --Mark
> 
>> Cheers,
>>
>> Richard
>>
>>> This patch is not so perfect. For example,
>>>   IMAGE_INSTALL += "lib32-ncurses"
>>>   IMAGE_INSTALL += "ncurses-dev"
>>>  ncurses-dev and lib32-ncurses-dev will have conflicts during packages installation.
>>>
>>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>> ---
>>>  sdk.py |   45 +++++++++++++++++++++++++++++++++------------
>>>  1 file changed, 33 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
>>> index c57a441..7b43a29 100644
>>> --- a/meta/lib/oe/sdk.py
>>> +++ b/meta/lib/oe/sdk.py
>>> @@ -107,10 +107,17 @@ class RpmSdk(Sdk):
>>>          pm.dump_all_available_pkgs()
>>>          pm.update()
>>>  
>>> -        for pkg_type in self.install_order:
>>> -            if pkg_type in pkgs_to_install:
>>> -                pm.install(pkgs_to_install[pkg_type],
>>> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
>>> +        pkgs = []
>>> +        pkgs_attempt = []
>>> +        for pkg_type in pkgs_to_install:
>>> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
>>> +                pkgs_attempt += pkgs_to_install[pkg_type]
>>> +            else:
>>> +                pkgs += pkgs_to_install[pkg_type]
>>> +
>>> +        pm.install(pkgs)
>>> +
>>> +        pm.install(pkgs_attempt, True)
>>>  
>>>      def _populate(self):
>>>          bb.note("Installing TARGET packages")
>>> @@ -184,10 +191,17 @@ class OpkgSdk(Sdk):
>>>  
>>>          pm.update()
>>>  
>>> -        for pkg_type in self.install_order:
>>> -            if pkg_type in pkgs_to_install:
>>> -                pm.install(pkgs_to_install[pkg_type],
>>> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
>>> +        pkgs = []
>>> +        pkgs_attempt = []
>>> +        for pkg_type in pkgs_to_install:
>>> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
>>> +                pkgs_attempt += pkgs_to_install[pkg_type]
>>> +            else:
>>> +                pkgs += pkgs_to_install[pkg_type]
>>> +
>>> +        pm.install(pkgs)
>>> +
>>> +        pm.install(pkgs_attempt, True)
>>>  
>>>      def _populate(self):
>>>          bb.note("Installing TARGET packages")
>>> @@ -260,10 +274,17 @@ class DpkgSdk(Sdk):
>>>          pm.write_index()
>>>          pm.update()
>>>  
>>> -        for pkg_type in self.install_order:
>>> -            if pkg_type in pkgs_to_install:
>>> -                pm.install(pkgs_to_install[pkg_type],
>>> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
>>> +        pkgs = []
>>> +        pkgs_attempt = []
>>> +        for pkg_type in pkgs_to_install:
>>> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
>>> +                pkgs_attempt += pkgs_to_install[pkg_type]
>>> +            else:
>>> +                pkgs += pkgs_to_install[pkg_type]
>>> +
>>> +        pm.install(pkgs)
>>> +
>>> +        pm.install(pkgs_attempt, True)
>>>  
>>>      def _populate(self):
>>>          bb.note("Installing TARGET packages")
>>
>>
> 


