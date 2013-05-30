Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADB4660825
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4UCMPvp008587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 05:22:25 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 05:22:24 -0700
Message-ID: <51A74480.6080102@windriver.com>
Date: Thu, 30 May 2013 07:22:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-19-git-send-email-mark.hatle@windriver.com>
	<1369861845.14887.232.camel@ted> <51A672E5.3060000@windriver.com>
	<1369864751.14887.258.camel@ted>
	<1369910774.8846.26.camel@phil-desktop.brightsign>
In-Reply-To: <1369910774.8846.26.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/21] Fix problems expanding the IMAGE_INSTALL package groups
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
X-List-Received-Date: Thu, 30 May 2013 12:22:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/13 5:46 AM, Phil Blundell wrote:
> On Wed, 2013-05-29 at 22:59 +0100, Richard Purdie wrote:
>> Fair enough. Can we at least match the pattern do_split_packages uses,
>> i.e.:
>>
>> PACKAGES_DYNAMIC = "^${PN}-lib.*"
>>
>> I'm a little paranoid about adding wildcards like ${PN}-* as the
>> potential for namespace problems is not insignificant, particularly if
>> you know the horrible things bitbake does with this behind the
>> scenes :/.
>
> Does it really need to be dynamic at all?  I don't think the list of
> libraries installed by ncurses varies all that much (apart from WIDEC
> on/off), and nor is it overwhelmingly large.  It doesn't seem like it
> would be all that hard to arrange for the right stuff to be added to
> PACKAGES at parse time, in which case this whole problem would just go
> away.

Certainly possible.  That's not the tactic we took on resolving the issue.  One 
line change vs significantly modifying the package.   The following is the chunk 
that handles the dynamic generation (from ncurses.inc)

python populate_packages_prepend () {
     libdir = d.expand("${libdir}")
     base_libdir = d.expand("${base_libdir}")
     pnbase = d.expand("${PN}-lib%s")
     do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s 
library', prepend=True, extra_depends = '', allow_links=True)
     if libdir is not base_libdir:
         do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses 
%s library', prepend=True, extra_depends = '', allow_links=True)
}

Beyond this even, the package has a number of dynamic configurations that should 
probably be done based on libc and/or distro flags as well.

So this is probably a job for a janitor task.

I still think as a minimal change the PACKAGES_DYNAMIC is the correct change, 
but as you said -- during a cleanup -- the need for PACKAGES_DYNAMIC can be 
diminished or removed.

--Mark

> p.
>
>


