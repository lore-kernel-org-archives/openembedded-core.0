Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UIOTO-0004FQ-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 20:14:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2KIvwqq029251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2013 11:57:58 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 20 Mar 2013 11:57:58 -0700
Message-ID: <514A06B4.1080302@windriver.com>
Date: Wed, 20 Mar 2013 13:57:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1363772395-25682-1-git-send-email-zhenhua.luo@freescale.com>
	<514A0573.2060809@linux.intel.com>
In-Reply-To: <514A0573.2060809@linux.intel.com>
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: rpm: split out run-postinsts
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
X-List-Received-Date: Wed, 20 Mar 2013 19:14:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/13 1:52 PM, Saul Wold wrote:
> On 03/20/2013 02:39 AM, Zhenhua Luo wrote:
>> Split out run-postinsts script into separated package, sometimes only the
>> postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/
>> instead of the whole rpm package
>>
> So are you trying to build a system that uses RPM to install the initial
> rootfs, but you don't want RPM actually installed?

That seems reasonable to me.  I hadn't realized that it was rolled into the 
target RPM package like this.  In early implementations this script was 
installed directly by the rootfs_rpm.

--Mark

>
>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> ---
>>    meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 ++++--
>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> index 6286771..896e3a4 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>>    LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>
>>    DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
>> -PR = "r61"
>> +PR = "r62"
>>
>>    # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>>    # in order to extract the distribution SRPM into a format we can extract...
>> @@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
>>    		${libdir}/rpm/bin/wget \
>>    		/var/lib/rpm \
>>    		/var/cache/rpm \
>> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>>    		"
>>
>> +FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>> +                "
>> +
>
> This does not look right to me, you seem to be missing a PACKAGES entry
> for the postinsts package. So this really won't do anything.
>
> Sau!
>
>
>>    FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>>    		${libdir}/rpm/bin/.debug \
>>    		"
>>



