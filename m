Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qf3eW-0004k5-OU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 07:31:01 +0200
Received: by pwi1 with SMTP id 1so959486pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 22:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=V/LJZxQY3irs6k/QCxoz2FL5QJ1UMoi7ql1lB7DfZZU=;
	b=HsBJZjTVcxMgf1gW9E3kVXUDyPO7ogvrCjfyF5yKYt6+PSpEuxSbM/zYgMGT/t+c6L
	Nn1xDitQsBPyq4zGrX3pM6tnxxGqoCbgx4FNQXWd9THLZsXCuOePdWkM5TyaZ5Z6KB0D
	ImJzR4Bo9ICbpU6j60OdaKdED8VeUxqN1aZ18=
Received: by 10.142.4.8 with SMTP id 8mr86909wfd.300.1310102826216;
	Thu, 07 Jul 2011 22:27:06 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w24sm6544095wfd.17.2011.07.07.22.27.05
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 22:27:05 -0700 (PDT)
Message-ID: <4E169528.9080001@gmail.com>
Date: Thu, 07 Jul 2011 22:27:04 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1310081443.git.sgw@linux.intel.com>	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>	<886C3867-FF12-4B5E-90C3-9E5906BAA94F@gmail.com>
	<4E165A1C.3060604@linux.intel.com>
In-Reply-To: <4E165A1C.3060604@linux.intel.com>
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 05:31:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2011 06:15 PM, Saul Wold wrote:
> On 07/07/2011 05:59 PM, Khem Raj wrote:
>>
>>
>> On Jul 7, 2011, at 4:31 PM, Saul Wold<sgw@linux.intel.com> wrote:
>>
>>> [YOCTO #1214]
>>>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> meta/recipes-core/eglibc/eglibc-package.inc | 2 +-
>>> meta/recipes-core/eglibc/eglibc.inc | 2 +-
>>> meta/recipes-core/eglibc/eglibc_2.12.bb | 2 +-
>>> meta/recipes-core/eglibc/eglibc_2.13.bb | 2 +-
>>> 4 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc
>>> b/meta/recipes-core/eglibc/eglibc-package.inc
>>> index 1c6626c..f0fac76 100644
>>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>>> @@ -69,7 +69,7 @@ FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
>>> FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
>>> FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
>>> RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
>>> -EDEPENDS_eglibc-utils = "libsotruss"
>>> +RDEPENDS_eglibc-utils += "libsotruss bash"
>>
>> While typo fix is ok why do we need dependency on bash ?
>> If it is for ldd then there is already a fix to free it from bashism
>> We should use that
>>
> Actually it's for xtrace and tzselect which are part of eglibc-utils and
> are scripts that use /bin/bash.

hmm I see, see if it can be unbashed if not then the dep is ok.

>
> Where's the fix for ldd? I don't think its part of eglibc currently.

0a831e2cd1c27d30cd76ddada9a44a703ab60f41 in oe.dev

>
> Sau!
>
>>> FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
>>> FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
>>> RPROVIDES_eglibc-dev += "libc-dev"
>>> diff --git a/meta/recipes-core/eglibc/eglibc.inc
>>> b/meta/recipes-core/eglibc/eglibc.inc
>>> index 74afb9d..058d58e 100644
>>> --- a/meta/recipes-core/eglibc/eglibc.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc.inc
>>> @@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
>>> # nptl needs unwind support in gcc, which can't be built without glibc.
>>> DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>>> #this leads to circular deps, so lets not add it yet
>>> -#RDEPENDS_ldd += " bash"
>>> +RDEPENDS_ldd += " bash"
>>> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect
>>> this
>>> #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>>> PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>>> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb
>>> b/meta/recipes-core/eglibc/eglibc_2.12.bb
>>> index 85d58fa..fd7b485 100644
>>> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
>>> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
>>> @@ -1,7 +1,7 @@
>>> require eglibc.inc
>>>
>>> DEPENDS += "gperf-native"
>>> -PR = "r18"
>>> +PR = "r19"
>>>
>>> SRCREV = "14158"
>>>
>>> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> b/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> index 7986131..be65787 100644
>>> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
>>> @@ -4,7 +4,7 @@ SRCREV = "14157"
>>>
>>> DEPENDS += "gperf-native"
>>> FILESPATHPKG =. "eglibc-svn:"
>>> -PR = "r5"
>>> +PR = "r6"
>>> PR_append = "+svnr${SRCPV}"
>>>
>>> EGLIBC_BRANCH="eglibc-2_13"
>>> --
>>> 1.7.3.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



