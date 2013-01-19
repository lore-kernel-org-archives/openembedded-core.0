Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwQY7-0007XE-3r
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 06:01:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Jan 2013 20:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,496,1355126400"; d="scan'208";a="249431844"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2013 20:45:31 -0800
Message-ID: <50FA24EA.5060200@linux.intel.com>
Date: Fri, 18 Jan 2013 20:45:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <cover.1358477598.git.rongqing.li@windriver.com>
	<101e3bb96160957183aaa5770f989757916edaa9.1358477598.git.rongqing.li@windriver.com>
	<20130118082611.GC3091@jama> <50FA2323.5060305@windriver.com>
In-Reply-To: <50FA2323.5060305@windriver.com>
Cc: joe.macdonald@windriver.com, Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xinetd: enable tcp-wrappers support by DISTRO_FEATURE
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
X-List-Received-Date: Sat, 19 Jan 2013 05:01:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 08:37 PM, Rongqing Li wrote:
>
>
> On 01/18/2013 04:26 PM, Martin Jansa wrote:
>> On Fri, Jan 18, 2013 at 10:56:22AM +0800, rongqing.li@windriver.com
>> wrote:
>>> From: "Roy.Li" <rongqing.li@windriver.com>
>>>
>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> ---
>>>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>>> b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>>> index 3bde512..9278cc2 100644
>>> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>>> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>>> @@ -7,7 +7,7 @@ LICENSE = "BSD"
>>>   LIC_FILES_CHKSUM =
>>> "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
>>>
>>>   DEPENDS = ""
>>> -PR = "r1"
>>> +PR = "r2"
>>>
>>>   SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>>>         file://xinetd.init \
>>> @@ -28,6 +28,9 @@ INITSCRIPT_PARAMS = "defaults"
>>>
>>>   EXTRA_OECONF="--disable-nls"
>>>
>>> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers',
>>> 'tcp-wrappers', '', d)}"
>>> +EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers',
>>> '--with-libwrap', '', d)}"
>>> +
>>
>> Why not use PACKAGECONFIG here?
>>
>
> Enabling tcp-wrapper is not a random thing for some customer,
> it is a must. So I think feature is more suitable
>
Martin's point is you can use the PACKAGECONFIG syntax here instead of 2 
base_contains.

for example:
PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'tcp_wrappers', 
'tcp_wrappers', '', d)}"
PACKAGECONFIG[tcp_wrappers] = "--with-libwrap,--without-libwrap, 
tcp_wrappers"

See docs for more information.

Sau!



> -Roy
>
>> Cheers,
>>
>>>   do_configure() {
>>>       # Looks like configure.in is broken, so we are skipping
>>>       # rebuilding configure and are just using the shipped one
>>> --
>>> 1.7.10.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


