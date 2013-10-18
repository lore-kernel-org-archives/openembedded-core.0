Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED8386BA14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 17:00:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IH0GNf016508
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Oct 2013 10:00:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 10:00:16 -0700
Message-ID: <5261691F.3090803@windriver.com>
Date: Fri, 18 Oct 2013 12:00:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>		<1382094700-17805-3-git-send-email-ming.liu@windriver.com>	
	<1382108376.529.6.camel@phil-desktop.brightsign>	
	<52614FD4.1030006@windriver.com>
	<1382109492.529.12.camel@phil-desktop.brightsign>
In-Reply-To: <1382109492.529.12.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] bash: add pkg_postrm to remove the entry in /etc/shells
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
X-List-Received-Date: Fri, 18 Oct 2013 17:00:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/13 10:18 AM, Phil Blundell wrote:
> On Fri, 2013-10-18 at 10:12 -0500, Mark Hatle wrote:
>> On 10/18/13 9:59 AM, Phil Blundell wrote:
>>> On Fri, 2013-10-18 at 19:11 +0800, Ming Liu wrote:
>>>>    pkg_postinst_${PN} () {
>>>> -	touch $D${sysconfdir}/shells
>>>> -	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
>>>> -	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
>>>> +	if [ ! -f $D${sysconfdir}/shells ]; then
>>
>> One note with the above check.  Whichever package is responsible for providing
>> the 'shells' file needs to be installed -first-.  So anything that manipulates
>> the 'shells' file will need an RDEPENDS on that package.
>
> Isn't the whole point of the check above that it now creates /etc/shells
> if it didn't exist already?

Situation  bash has dep on base-files:

base-files package gets install (creates basic /etc/shells)
bash gets installed (checks for /etc/shells, adds /bin/bash)

Alternative situation:

bash has no dep on base-files:

bash gets installed (checks for /etc/shells, doesn't exist)
base-files gets installed (creates basic /etc/shells)

> That said, though, I'm still not entirely convinced that having
> semi-random packages create a file that isn't mentioned in either FILES

I don't want it to create the file, that is the wrong behavior.  The -package- 
needs to depend on the package that provides the base configuration for the 
system.  -something- has to create the file, or be installed first.

> or CONFFILES is a very good thing.  I'm also not totally clear on what
> exactly the problem is that this set of patches is trying to solve: the
> original commit message says that having nonexistent files named
> in /etc/shells is "unreasonable" but doesn't provide any supporting
> evidence for that assertion.

The original problem is that /etc/shells contains too much "crap", and we've got 
customers saying "hey you are opening up potential security holes by having 
things in there that are not valid."  (Beyond the file being sloppy)

So we would prefer that a minimal file exist, and then entries for valid shells 
be added dynamically to the system, only if the packages that provide them are 
supported.

--Mark

> p.
>
>


