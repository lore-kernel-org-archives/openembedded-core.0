Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TStZZ-00053m-IZ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:56:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9THgnQQ014478
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 10:42:49 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (147.11.116.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 29 Oct 2012 10:42:48 -0700
Message-ID: <508EC020.80808@windriver.com>
Date: Mon, 29 Oct 2012 12:42:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1351517628.13864.4.camel@phil-desktop>
	<1351525416.2828.12.camel@ted>
	<CABcZANmzfXiXA5rdNQpqo33wXyFPz518dCkLe0x7rZGjOZ=Ucw@mail.gmail.com>
In-Reply-To: <CABcZANmzfXiXA5rdNQpqo33wXyFPz518dCkLe0x7rZGjOZ=Ucw@mail.gmail.com>
Subject: Re: What is TOOLCHAIN_NEED_CONFIGSITE_CACHE for?
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
X-List-Received-Date: Mon, 29 Oct 2012 17:56:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/12 12:33 PM, Chris Larson wrote:
> On Mon, Oct 29, 2012 at 8:43 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2012-10-29 at 13:33 +0000, Phil Blundell wrote:
>>> This morning I happened to notice that some/all of my images had a
>>> dependency on ncurses for no obviously good reason.  (Following an
>>> earlier small crusade these are now the only remaining dependencies on
>>> ncurses in my build, so I would quite like to get rid of them.)
>>>
>>> It turns out that the dependency in question is due to the code in
>>> toolchain-scripts.bbclass (which is inherited from
>>> populate_sdk_base.bbclass, from image.bbclass) which does:
>>>
>>> TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
>>>
>>> [...]
>>>
>>> python __anonymous () {
>>>      deps = ""
>>>      for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>>>          deps += " %s:do_populate_sysroot" % dep
>>>      d.appendVarFlag('do_configure', 'depends', deps)
>>> }
>>>
>>> The code in question was added in:
>>>
>>> commit 9e87f1347788beed181476dc4563085db14a4729
>>> Author: Lianhao Lu <lianhao.lu@intel.com>
>>> Date:   Tue Aug 16 11:15:36 2011 +0800
>>>
>>>      toolchain-script.bbclass: Collected cached site config in runtime.
>>>
>>>      [YOCTO #892]
>>>      Modify the function toolchain_create_sdk_siteconfig to collect the
>>>      cached site config files which are specified by
>>>      TOOLCHAIN_NEED_CONFIGSITE_CACHE in runtime.
>>>
>>>      Also added task dependency to ensure the cached site config files are
>>>      generated.
>>>
>>>      Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>>>
>>> ... but I don't entirely understand from that commentary what exactly is
>>> special about ncurses that means it needs to be handled this way.  Can
>>> anybody clarify?
>>
>> We ship the "site" cache files with the toolchain. We decided to include
>> the generated cache files as well as the static ones. We currently
>> generate "site" files for libc and ncurses.
>>
>> You can almost certainly just set:
>>
>> TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC}"
>>
>> and be happy since this just lists which generated cache site files to
>> include.
>
> Shouldn't it be pulled in via depends from the populate_sdk bits,
> rather than a task that's used both for image builds and toolchain
> builds, though?
>

Ya, this seems like a design issue.  The site cache files require the package to 
be built, but I was under the impression they were included with the dev items 
within that package.  If this isn't how it works, maybe this is a change we 
should consider.

--Mark


