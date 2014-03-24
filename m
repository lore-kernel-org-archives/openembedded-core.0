Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE1166B4F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 06:45:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O6jWf3025707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Mar 2014 23:45:32 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Sun, 23 Mar 2014 23:45:31 -0700
Message-ID: <532FD488.8030903@windriver.com>
Date: Mon, 24 Mar 2014 14:45:28 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Lu Chong <Chong.Lu@windriver.com>, Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1393048477-16896-1-git-send-email-Chong.Lu@windriver.com>	<530B54B0.8090304@linux.intel.com>
	<530C04E2.8060400@windriver.com>
In-Reply-To: <530C04E2.8060400@windriver.com>
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
X-List-Received-Date: Mon, 24 Mar 2014 06:45:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 02/25/2014 10:50 AM, Lu Chong wrote:
>
> On 02/24/2014 10:18 PM, Saul Wold wrote:
>> On 02/22/2014 07:54 AM, Chong Lu wrote:
>>> Need to export these environment variables for python-config to work.
>>>
>> Can you clariy further as to what's broken?  Has this not been 
>> working in the past, or is this a new test of somekine that we are 
>> failing?
>>
>> Sau!
>>
>
>
> checking for python script directory... Traceback (most recent call 
> last):
>   File "<string>", line 22, in <module>
>   File 
> "/yocto/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
> line 22, in <module>
>     PREFIX = os.path.normpath(sys.prefix).replace( 
> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> TypeError: expected a character buffer object
> ${libdir}/python2.7/site-packages
> checking for python extension module directory... Traceback (most 
> recent call last):
>   File "<string>", line 22, in <module>
>   File 
> "/yocto/build/qemux86-64/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
> line 22, in <module>
>     PREFIX = os.path.normpath(sys.prefix).replace( 
> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> TypeError: expected a character buffer object
>
> Above error comes from some packages' do_configure log.
> This error doesn't block building.
> Some packages export above env variables in bb file, but someone not.
> So I think these env variables should be exported in bbclass file.
>
> Best Regards
> Chong
>
>
>>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>>> ---
>>>   meta/classes/pythonnative.bbclass |    4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/classes/pythonnative.bbclass 
>>> b/meta/classes/pythonnative.bbclass
>>> index fdd22bb..58a5b5c 100644
>>> --- a/meta/classes/pythonnative.bbclass
>>> +++ b/meta/classes/pythonnative.bbclass
>>> @@ -4,3 +4,7 @@ inherit python-dir
>>> PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
>>>   EXTRANATIVEPATH += "${PYTHON_PN}-native"
>>>   DEPENDS += " ${PYTHON_PN}-native "
>>> +export STAGING_INCDIR
>>> +export STAGING_LIBDIR
>>> +export BUILD_SYS
>>> +export HOST_SYS
>>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


