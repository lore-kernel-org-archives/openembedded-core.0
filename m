Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvnFp-0004C8-SK
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 12:03:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0HAm35a020687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2013 02:48:03 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 17 Jan 2013 02:48:03 -0800
Message-ID: <50F7D6E1.4000800@windriver.com>
Date: Thu, 17 Jan 2013 18:48:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<6b20de5260fdf8542bd214ca4c380bfe7614f56c.1358406049.git.hongxu.jia@windriver.com>
	<20130117092811.GB3067@jama>
In-Reply-To: <20130117092811.GB3067@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libnss-mdns:fix support prerm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 11:03:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2013 05:28 PM, Martin Jansa wrote:
> On Thu, Jan 17, 2013 at 03:07:21PM +0800, Hongxu Jia wrote:
>> The pkg_prerm_${PN} failed at image creation time because $D is not assigned
>> as the prefix of "/etc/nsswitch.conf"
> Again looks the same why not use $D/etc/nsswitch.conf in both cases?
I think that  test $D to explicitly make a distinction between the build 
time
and run time, it's better for others to notice the difference.

Thanks,
Hongxu
>> [YOCTO #3633]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb |   11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
>> index f7356e4..e9a4128 100644
>> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
>> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>   
>>   DEPENDS = "avahi"
>>   RDEPENDS_${PN} = "avahi-daemon"
>> -PR = "r6"
>> +PR = "r7"
>>   
>>   SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
>>   
>> @@ -30,7 +30,14 @@ pkg_postinst_${PN} () {
>>   }
>>   
>>   pkg_prerm_${PN} () {
>> +if [ "$D" != "" ]; then
>>   	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
>>   		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
>> -		-i /etc/nsswitch.conf
>> +		-i $D/etc/nsswitch.conf
>> +	exit 0
>> +fi
>> +
>> +sed -e '/^hosts:/s/\s*\<mdns4\>//' \
>> +	-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
>> +	-i /etc/nsswitch.conf
>>   }
>> -- 
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



