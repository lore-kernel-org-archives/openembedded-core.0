Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRqcv-0005uy-Hu
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 20:58:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51ItXxO023908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jun 2011 11:55:33 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 11:55:32 -0700
Message-ID: <4DE68B24.8060503@windriver.com>
Date: Wed, 1 Jun 2011 13:55:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1306944074.2529.107.camel@phil-desktop>	
	<1306944235.2529.109.camel@phil-desktop>	
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	
	<1306945014.2529.113.camel@phil-desktop>
	<4DE66D53.30505@windriver.com>	
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
	<1306948134.2529.158.camel@phil-desktop>
In-Reply-To: <1306948134.2529.158.camel@phil-desktop>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: rpmdeps, was Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 18:58:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/1/11 12:08 PM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
>> On 6/1/11 11:54 AM, Phil Blundell wrote:
>>> On Wed, 2011-06-01 at 11:48 -0500, Mark Hatle wrote:
>>>> So in the above, perl and python are really the only items that could be disabled.
>>>
>>> Just to be clear, in the list you mentioned, were you talking about the
>>> usage of rpm-native for rpmdeps, or the usage by package_rpm.bbclass
>>> itself?
>>
>> I was talking about rpm-native recipe in general, and how it's used.
>>
>> rpmdeps requires a good chunk of the rpm infrastructure (even if we don't end up
>> using rpmbuild or rpm commands during the build..)
> 
> Do you happen to have a list of what exactly rpmdeps does require?
> Based on the descriptions you gave before, I'm guessing that it probably
> doesn't need openssl (since, afaik, it doesn't do any signing) or pcre
> (since it isn't building any packages) or acl, attr, bzip and zlib
> (since it also isn't installing anything).  

rpmdeps uses, according to ldd:

        linux-vdso.so.1
        librpm-5.4.so
        librpmdb-5.4.so
        librpmio-5.4.so
        librpmmisc-5.4.so
        libm.so.6
        libdl.so.2
        libacl.so.1
        libattr.so.1
        libpcreposix.so.0
        libdb-5.1.so
        libmagic.so.1
        liblzma.so.5
        libbz2.so.0
        libz.so.1
        libpthread.so.0
        librt.so.1
        libelf.so.1
        libpopt.so.0
        libssl.so.0.9.8
        libcrypto.so.0.9.8
        libpcre.so.0
        libc.so.6
        libgcc_s.so.1
        /lib64/ld-linux-x86-64.so.2 (0x0000003c51800000)

The issue is that it uses the librpm, librpmdb, librpmio, and librpmmisc
libraries.  These libraries provide and use all of the rest of the components.

> It presumably does still need pcre, and I have no idea whether it needs
> db or expat.

pcre is used to handle the file lists and any patterns to generate the lists, or
dependent informtion.  So that is needed.  expat may be needed in the future, I
don't see that it is today.

>> It "should" be as simple and adding --without-perl and --without-python to the
>> configuration line...  but I haven't tried it.
> 
> Righto.  I'll give that a try later and see what happens.
> 
> p.
> 
> 



