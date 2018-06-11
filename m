Return-Path: <aborduno@cisco.com>
X-Greylist: delayed 565 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Jun 2018 12:30:18 UTC
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	by mail.openembedded.org (Postfix) with ESMTP id 157F578685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=6965; q=dns/txt; s=iport;
	t=1528720220; x=1529929820;
	h=subject:from:to:cc:references:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=rzdwQFb0z7aFoHlnu0jDkoUMjVRXKdEcex/0uBJS0Jg=;
	b=TyBUh4US+y/bgkVRVSkCZWrTNTWnlAnEzYcoRnr8K0fZpmg8ndyD942h
	B18IXAQB/qfrTmbwyw+aiFhbLToJtZRnT46wrfp9xDmo2LKEZ/H5iorfq
	ILE75N60uKisy1ZYZYkLUuxTpcbc3JTpoe39kFAhihDnU0fhHmkJzyXiD I=;
X-IronPort-AV: E=Sophos;i="5.49,501,1520899200"; d="scan'208";a="405490387"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 12:20:54 +0000
Received: from kbp1-dhp-f50810.synapse.com ([10.24.49.131])
	(authenticated bits=0)
	by alln-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id w5BCKoBm018001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 11 Jun 2018 12:20:52 GMT
From: Andrii Bordunov <aborduno@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Burton Ross <ross.burton@intel.com>
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
	<1479293265.28508.4.camel@linuxfoundation.org>
	<6897ef62-b48d-ca6d-dc03-41d3467bc91a@cisco.com>
	<256c9b8c-4972-f308-eb26-4c32e005a72e@cisco.com>
	<b15fed47-677b-8c53-e6a0-0f812f500812@cisco.com>
Message-ID: <55a3f6af-b807-c14b-bacd-edfe52d6ca7f@cisco.com>
Date: Mon, 11 Jun 2018 15:20:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b15fed47-677b-8c53-e6a0-0f812f500812@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: aborduno
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v3] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Mon, 11 Jun 2018 12:30:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Ping again.


Thank you,
Andrii

On 04/12/2018 05:42 PM, Andrii Bordunov wrote:
> Another ping.
> 
> Any comments? Or could it be just applied as is?
> 
> 
> Thank you,
> Andrii
> 
> On 03/13/2018 07:25 PM, Andrii Bordunov wrote:
>> Ping
>>
>> Rebased patch to latest master.
>>
>> Regarding special value for the variable, it could be done with 
>> PRIVATE_LIBS to mean all libraries, I think. PRIVATE_LIBS could be set 
>> per-package already.
>> Would it be a better option?
>> However, EXCLUDE_FROM_SHLIBS seems to be a more proper thing to use.
>>
>>
>> Thank you,
>> Andrii
>>
>> On 03/16/2017 05:07 PM, Andrii Bordunov wrote:
>>> Hi Richard,
>>>
>>> Sorry, my Python knowledge is quite basic. I'm sure it's possible to 
>>> have a (global?) EXCLUDE_FROM_SHLIBS list holding subpackage names, 
>>> but how it could lead to performance improvement? It would also need 
>>> some check for every subpackage.
>>> Could you please give more details?
>>> And what do you mean under "all packages"? The intent is like 
>>> opposite, to split package operations, not to gather.
>>>
>>> As for False parameter to getVar, OK, I just used existing 
>>> EXCLUDE_FROM_SHLIBS example (seems fixed now).
>>>
>>> In the meantime tried to make a quick and dirty profiling like 
>>> following:
>>>
>>>    bitbake -c package glibc
>>>    bitbake -c clean glibc
>>>    python -m cProfile -s cumtime 
>>> /mnt/src/oe/distro/bitbake/bin/bitbake -c package glibc > result.txt
>>>
>>> Result is below. If got it right, there are 3833 getVar calls with 
>>> total time 0.025 second (including subcalls).
>>> This gives ~6.5 microsecond duration of one call (incl subcalls). Not 
>>> a lot.
>>> This is only a partial rebuild of one package of course.
>>> Also tried to do all of this with and without my patch, but getVar 
>>> calls number stays exactly the same (w/o modifying glibc recipe, but 
>>> anyway).
>>>
>>>    NOTE: Tasks Summary: Attempted 314 tasks of which 314 didn't need 
>>> to be rerun and all succeeded.
>>>             672869 function calls (667640 primitive calls) in 12.912 
>>> seconds
>>>       Ordered by: cumulative time
>>>       ncalls  tottime  percall  cumtime  percall 
>>> filename:lineno(function)
>>>            1    0.001    0.001   12.913   12.913 bitbake:25(<module>)
>>>            1    0.001    0.001   12.082   12.082 
>>> main.py:320(bitbake_main)
>>>            1    0.005    0.005   11.494   11.494 knotty.py:253(main)
>>>          250   11.476    0.046   11.476    0.046 {method 'poll' of 
>>> '_multiprocessing.Connection' objects}
>>>    ...
>>>    4481/4046    0.007    0.000    0.026    0.000 
>>> data_smart.py:666(getVarFlag)
>>>    ...
>>>    3833/3719    0.002    0.000    0.025    0.000 
>>> data_smart.py:569(getVar)
>>>    ...
>>>         1338    0.002    0.000    0.003    0.000 
>>> data_smart.py:805(getVarFlags)
>>>
>>>
>>>
>>> Thank you,
>>> Andrii
>>>
>>> On 16.11.16 12:47, Richard Purdie wrote:
>>>> On Mon, 2016-10-10 at 20:02 +0300, Andrii Bordunov wrote:
>>>>> Some packages containing shared libraries might be registered
>>>>> as shlib providers when they shouldn't (for example, the lib is for
>>>>> their private use and must not generate any dependency).
>>>>>
>>>>> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
>>>>> for entire recipe only.
>>>>>
>>>>> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
>>>>> to set it in a style similar with RDEPENDS. For example:
>>>>>  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
>>>>>
>>>>> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
>>>>> ---
>>>>>  meta/classes/package.bbclass | 12 ++++++++++--
>>>>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> My main concern here is actually performance. For a package with many
>>>> sub packages you just added many calls to getVar when that getVar is
>>>> extremely unlikely to find any value. Whilst not hugely slow, that
>>>> operation isn't trivial and hard to fix later.
>>>>
>>>> I'm wondering if we could support the syntax
>>>>
>>>> EXCLUDE_FROM_SHLIBS = "${PN}-ptest"
>>>>
>>>> and then have "1", used in a couple of places as the special value to
>>>> mean all packages?
>>>>
>>>> Also please use False, not 0 as the parameter to getVar.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
> 
> -- 
> 
>  From 4a33d384a72a351bad5a98e46a7c9c1c9755635e Mon Sep 17 00:00:00 2001
> From: Andrii Bordunov <aborduno@cisco.com>
> Date: Mon, 12 Mar 2018 08:13:44 -0700
> Subject: [PATCH v3] Allow EXCLUDE_FROM_SHLIBS to be specified for
> subpackages
> 
> Some subpackages containing shared libraries might be registered
> as shlib providers when they shouldn't (the lib is for their private use
> and must not generate any dependency).
> 
> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
> for entire recipe only.
> 
> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
> to set it like following:
> EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
> 
> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> ---
>    meta/classes/package.bbclass | 11 +++++++++--
>    1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 317c775..5d49d41 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1571,6 +1571,13 @@ python package_do_shlibs() {
> 
>        workdir = d.getVar('WORKDIR')
> 
> +    shlib_pkgs = []
> +    for pkg in packages.split():
> +        if d.getVar('EXCLUDE_FROM_SHLIBS_' + pkg, False):
> +            bb.note("not generating shlibs for %s" % pkg)
> +        else:
> +            shlib_pkgs.append(pkg)
> +
>        ver = d.getVar('PKGV')
>        if not ver:
>            msg = "PKGV not defined"
> @@ -1698,7 +1705,7 @@ python package_do_shlibs() {
>        needed = {}
>        shlib_provider = oe.package.read_shlib_providers(d)
> 
> -    for pkg in packages.split():
> +    for pkg in shlib_pkgs:
>            private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or
> d.getVar('PRIVATE_LIBS') or ""
>            private_libs = private_libs.split()
>            needs_ldconfig = False
> @@ -1770,7 +1777,7 @@ python package_do_shlibs() {
> 
>        libsearchpath = [d.getVar('libdir'), d.getVar('base_libdir')]
> 
> -    for pkg in packages.split():
> +    for pkg in shlib_pkgs:
>            bb.debug(2, "calculating shlib requirements for %s" % pkg)
> 
>            private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or
> d.getVar('PRIVATE_LIBS') or ""

