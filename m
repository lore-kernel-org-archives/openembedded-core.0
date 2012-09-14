Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCeKa-00060w-NB
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:25:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8EMD8Rv020555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Sep 2012 15:13:08 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 15:13:08 -0700
Message-ID: <5053ABF3.8010708@windriver.com>
Date: Fri, 14 Sep 2012 17:13:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
	<1347659456.4444.1.camel@x121e.pbcl.net>
	<5053A818.4070402@windriver.com>
	<1347660202.4444.10.camel@x121e.pbcl.net>
In-Reply-To: <1347660202.4444.10.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: remove broken RREPLACES
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
X-List-Received-Date: Fri, 14 Sep 2012 22:25:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 5:03 PM, Phil Blundell wrote:
> On Fri, 2012-09-14 at 16:56 -0500, Mark Hatle wrote:
>> On 9/14/12 4:50 PM, Phil Blundell wrote:
>>> On Fri, 2012-09-14 at 18:29 +0100, Paul Eggleton wrote:
>>>> Unfortunately with rpm at least, this results in xserver-xorg-module-exa
>>>> being installed in preference to xserver-xorg when constructing the root
>>>> filesystem, which is clearly not desirable.
>>>
>>> Surely this is a bug in the rpm packaging backend and ought to be fixed
>>> there.
>>
>> If a package "replaces" another, it has priority.  What is the desired behavior
>> in this case?
>
> The conventional behaviour has been that:
>
> - if a package RREPLACES another (without declaring any other
> dependencies) then it is allowed to overwrite files in that package
> without producing an error.  This is necessary when files move from one
> package to another but both should remain installed.
>
> - if a package wishes to entirely replace another one, it should both
> RREPLACE and RCONFLICT with the old one in order to force it off.
> Generally it would also want to RPROVIDE that package otherwise the
> replacement is liable to cause broken dependencies.

Coming from the RPM world, that behavior is entirely unexpected.  There is no 
way (by design) for an RPM package to be tagged as being allowed to replace 
files of another package.

You can either replace a package, or you can conflict with another.  Replace 
automatically creates a conflict (even though most people specify them both.)

In the RPM world, files are verified, and two packages can not write to the same 
file -- unless the md5sum of the file is the same in both packages.  The only 
exception is when a file is tagged as a configuration file or a "ghost".  (Ghost 
means a package owns a file, but doesn't actually provide the file itself.) 
Even that semantic is different.

--Mark

> p.
>



