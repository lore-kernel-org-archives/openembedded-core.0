Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1C576CA61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 02:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1P2oHaF025637
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 18:50:17 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 24 Feb 2014 18:50:16 -0800
Message-ID: <530C04E2.8060400@windriver.com>
Date: Tue, 25 Feb 2014 10:50:10 +0800
From: Lu Chong <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1393048477-16896-1-git-send-email-Chong.Lu@windriver.com>
	<530B54B0.8090304@linux.intel.com>
In-Reply-To: <530B54B0.8090304@linux.intel.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH] python-native: export some environment variables
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
X-List-Received-Date: Tue, 25 Feb 2014 02:50:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/24/2014 10:18 PM, Saul Wold wrote:
> On 02/22/2014 07:54 AM, Chong Lu wrote:
>> Need to export these environment variables for python-config to work.
>>
> Can you clariy further as to what's broken?  Has this not been working 
> in the past, or is this a new test of somekine that we are failing?
>
> Sau!
>


checking for python script directory... Traceback (most recent call last):
   File "<string>", line 22, in <module>
   File 
"/yocto/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
line 22, in <module>
     PREFIX = os.path.normpath(sys.prefix).replace( 
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
TypeError: expected a character buffer object
${libdir}/python2.7/site-packages
checking for python extension module directory... Traceback (most recent 
call last):
   File "<string>", line 22, in <module>
   File 
"/yocto/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
line 22, in <module>
     PREFIX = os.path.normpath(sys.prefix).replace( 
os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
TypeError: expected a character buffer object

Above error comes from some packages' do_configure log.
This error doesn't block building.
Some packages export above env variables in bb file, but someone not.
So I think these env variables should be exported in bbclass file.

Best Regards
Chong


>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/classes/pythonnative.bbclass |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/pythonnative.bbclass 
>> b/meta/classes/pythonnative.bbclass
>> index fdd22bb..58a5b5c 100644
>> --- a/meta/classes/pythonnative.bbclass
>> +++ b/meta/classes/pythonnative.bbclass
>> @@ -4,3 +4,7 @@ inherit python-dir
>> PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
>>   EXTRANATIVEPATH += "${PYTHON_PN}-native"
>>   DEPENDS += " ${PYTHON_PN}-native "
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +export BUILD_SYS
>> +export HOST_SYS
>>
>
>


