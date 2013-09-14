Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13EFB61017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 05:11:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E5B4rl023722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 22:11:04 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 22:11:03 -0700
Message-ID: <5233EFE5.1010700@windriver.com>
Date: Sat, 14 Sep 2013 13:11:01 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1379126215.git.hongxu.jia@windriver.com>
	<f68ed559f85f1ea1be513dcea93d9b4dad6a8e3f.1379126215.git.hongxu.jia@windriver.com>
	<5233EF2B.8050505@linux.intel.com>
In-Reply-To: <5233EF2B.8050505@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
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
X-List-Received-Date: Sat, 14 Sep 2013 05:11:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2013 01:07 PM, Saul Wold wrote:
> On 09/13/2013 07:40 PM, Hongxu Jia wrote:
>> The libqt-mt is tested by lsb-dist-checker and lsb-test-desktop,
>> and it locates in meta-qt3 layer.
>> So if meta-qt3 is not added, there should be a warning to call
>> attention; if added, it will add libqt-mt to RDEPENDS.
>>
>> [YOCTO #5153]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 11 
>> +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git 
>> a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb 
>> b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> index 1c1a8d1..c0dda5a 100644
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
>> @@ -193,6 +193,16 @@ RDEPENDS_packagegroup-core-lsb-python = "\
>>       python-misc \
>>   "
>>
>> +def get_libqt3(d):
>> +    if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
>> +        return 'libqt-mt3'
>> +
> I think this might cause unexpected behavoir for people who just 
> happen to have qt3 in their bblayer, I would also wrap the 
> linuxstdbase around the above line.
>

Alright, I will let linuxstdbase move up

Thanks,
Hongxu

> Sorry for not being clear about the first time.
>
> Sau!
>
>> +    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
>> +        bb.warn('The meta-qt3 layer should be added, this layer 
>> provides Qt 3.x')
>> +        bb.warn('libraries. Its intended use is for passing LSB 
>> tests as Qt3 is')
>> +        bb.warn('a requirement for LSB')
>> +    return ''
>> +
>>   SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
>>   DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to 
>> support libraries \
>>       specified in the LSB Desktop specification"
>> @@ -221,6 +231,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
>>       atk \
>>       libasound \
>>       ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", 
>> "", d)} \
>> +    ${@get_libqt3(d)} \
>>   "
>>
>>   RDEPENDS_packagegroup-core-lsb-runtime-add = "\
>>


