Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73F8060FC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TLS8VH023187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2013 14:28:08 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 14:28:06 -0700
Message-ID: <51A672E5.3060000@windriver.com>
Date: Wed, 29 May 2013 16:28:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-19-git-send-email-mark.hatle@windriver.com>
	<1369861845.14887.232.camel@ted>
In-Reply-To: <1369861845.14887.232.camel@ted>
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
X-List-Received-Date: Wed, 29 May 2013 21:28:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/13 4:10 PM, Richard Purdie wrote:
> On Wed, 2013-05-29 at 10:10 -0500, Mark Hatle wrote:
>> From: Jason Wessel <jason.wessel@windriver.com>
>>
>> The ncurses package was generating the following error as a result
>> of not specifing the PACKAGES_DYNAMIC correctly.  This error only
>> appear when using the IMAGE_INSTALL list that has been expanded by
>> the hob or from the pkgdata.
>>
>> ERROR: Nothing RPROVIDES 'ncurses-libtinfo'
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/recipes-core/ncurses/ncurses.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>> index 8a81381..584ad46 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -29,6 +29,8 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
>>   # natives don't generally look in base_libdir
>>   base_libdir_class-native = "${libdir}"
>>
>> +PACKAGES_DYNAMIC = "^${PN}-.*"
>> +
>>   # Fall back to the host termcap / terminfo for -nativesdk and -native
>>   # The reality is a work around for strange problems with things like
>>   # "bitbake -c menuconfig busybox" where it cannot find the terminfo
>
> I'm pretty sure I talked to Jason about this and we concluded this was
> fixed with some other change in master. Certainly this fix as it stands
> doesn't sound right.

The original thread included libpcre, it was libpcre side was in fact fixed 
prior to the initial patch being submitted.  ncurses however is still broken.

If I revert this commit in my tree, and add to IMAGE_INSTALL "ncurses-libtinfo", 
I get the following failure:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'ncurses-libtinfo' (but 
/msp-lpggp21/lmhatle/build-1/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'ncurses-libtinfo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ncurses-libtinfo']
ERROR: Required build target 'core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-minimal', 
'ncurses-libtinfo']

with the patch applied it completes successfully.

Reproducer:

Add to conf/local.conf

IMAGE_INSTALL_append = " ncurses-libtinfo"

bitbake core-image-minimal

> Cheers,
>
> Richard
>


