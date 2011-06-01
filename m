Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRsn4-0000lG-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:17:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51LEBL2019741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 14:14:11 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 14:14:10 -0700
Message-ID: <4DE6ABA2.2030605@windriver.com>
Date: Wed, 1 Jun 2011 16:14:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1306944074.2529.107.camel@phil-desktop>		<1306944235.2529.109.camel@phil-desktop>		<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>		<1306945014.2529.113.camel@phil-desktop>	<4DE66D53.30505@windriver.com>		<1306947245.2529.148.camel@phil-desktop>	<4DE66FC6.4030607@windriver.com>	<1306948134.2529.158.camel@phil-desktop>	<4DE68B24.8060503@windriver.com>
	<23B6B14F-2A30-4814-A83E-7D5EA9542C7B@dominion.thruhere.net>
In-Reply-To: <23B6B14F-2A30-4814-A83E-7D5EA9542C7B@dominion.thruhere.net>
Subject: Re: rpmdeps, was Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 21:17:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/1/11 2:00 PM, Koen Kooi wrote:
> 
> Op 1 jun 2011, om 20:55 heeft Mark Hatle het volgende geschreven:
> 
>> On 6/1/11 12:08 PM, Phil Blundell wrote:
>>> On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
>>>> On 6/1/11 11:54 AM, Phil Blundell wrote:
>>>>> On Wed, 2011-06-01 at 11:48 -0500, Mark Hatle wrote:
>>>>>> So in the above, perl and python are really the only items that could be disabled.
>>>>>
>>>>> Just to be clear, in the list you mentioned, were you talking about the
>>>>> usage of rpm-native for rpmdeps, or the usage by package_rpm.bbclass
>>>>> itself?
>>>>
>>>> I was talking about rpm-native recipe in general, and how it's used.
>>>>
>>>> rpmdeps requires a good chunk of the rpm infrastructure (even if we don't end up
>>>> using rpmbuild or rpm commands during the build..)
>>>
>>> Do you happen to have a list of what exactly rpmdeps does require?
>>> Based on the descriptions you gave before, I'm guessing that it probably
>>> doesn't need openssl (since, afaik, it doesn't do any signing) or pcre
>>> (since it isn't building any packages) or acl, attr, bzip and zlib
>>> (since it also isn't installing anything).  
>>
>> rpmdeps uses, according to ldd:
>>
>>        linux-vdso.so.1
>>        librpm-5.4.so
>>        librpmdb-5.4.so
>>        librpmio-5.4.so
>>        librpmmisc-5.4.so
>>        libm.so.6
>>        libdl.so.2
>>        libacl.so.1
>>        libattr.so.1
>>        libpcreposix.so.0
>>        libdb-5.1.so
>>        libmagic.so.1
>>        liblzma.so.5
>>        libbz2.so.0
>>        libz.so.1
>>        libpthread.so.0
>>        librt.so.1
>>        libelf.so.1
>>        libpopt.so.0
>>        libssl.so.0.9.8
>>        libcrypto.so.0.9.8
>>        libpcre.so.0
>>        libc.so.6
>>        libgcc_s.so.1
>>        /lib64/ld-linux-x86-64.so.2 (0x0000003c51800000)
>>
>> The issue is that it uses the librpm, librpmdb, librpmio, and librpmmisc
>> libraries.  These libraries provide and use all of the rest of the components.
> 
> 
> What is rpmdeps actually used for in package.bbclass when you're not using rpm as package format?

In package.bbclass:

package_do_filedeps is where rpmdeps is used.

This captures file dependencies on a per-file basis.  The dependencies captured
include interpreter information as well as ELF sonames and related.

There are/were a number of small dependencies that were being missed in the
past, this is a complete set of dependencies which are captured (again on a
per-file basis).

The reason we capture on a per-file is so that additional tooling can be
developed to allow people to view, understand and modify the rootfs images they
are working on.  One of the things people like to do is understand why perl or
python is being included on a small filesystem... the per-file dependencies can
be used to "see" this, and also allow people to skip specific files and thus
affect the dependencies within their system.  (Note, this tool does not yet
exist!  But I expect that it will at some point.)

(There are three places you can typically affect the dependencies of the end
device.  During recipe creation (i.e. manual RDEPENDS), during source
configuration, and during binary package creation...  this gives us the ability
to hook in and modify the package creation -- or re-create the packages based on
new criteria.)

(BTW besides the rpmdeps, rpm components are also used in the
split_and_strip_files function...  but this is really just debugedit)


--Mark

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



