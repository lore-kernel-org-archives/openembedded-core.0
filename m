Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8xqv-0002A6-2r
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 19:23:25 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 10:17:46 -0700
Received: by wyh11 with SMTP id 11so230407wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 10:17:45 -0700 (PDT)
Received: by 10.216.220.162 with SMTP id o34mr2601250wep.70.1317230265319;
	Wed, 28 Sep 2011 10:17:45 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o7sm41397718wbh.8.2011.09.28.10.17.43
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 10:17:44 -0700 (PDT)
Message-ID: <4E8356B5.7000901@intel.com>
Date: Wed, 28 Sep 2011 10:17:41 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
	<1316971012.8185.30.camel@ted>
	<CAMKF1sphSpMstEoqqQmhF9NeHnAuJBvc3F5vcewB3ALwSA7o2w@mail.gmail.com>
In-Reply-To: <CAMKF1sphSpMstEoqqQmhF9NeHnAuJBvc3F5vcewB3ALwSA7o2w@mail.gmail.com>
Subject: Re: [PATCH] intltool: inherit gettext to add missing dependency on gettext
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
X-List-Received-Date: Wed, 28 Sep 2011 17:23:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2011 05:22 PM, Khem Raj wrote:
> On Sun, Sep 25, 2011 at 10:16 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Sat, 2011-09-24 at 17:11 -0700, Khem Raj wrote:
>>> Fixes the error like below
>>>
>>> | configure: error: GNU gettext tools not found; required for intltool
>>> | + bbfatal 'oe_runconf failed'
>>> | + echo 'ERROR: oe_runconf failed'
>>> | ERROR: oe_runconf failed
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   meta/recipes-devtools/intltool/intltool.inc       |    2 +-
>>>   meta/recipes-devtools/intltool/intltool_0.40.6.bb |    2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
>>> index 23a1ee9..1e54feb 100644
>>> --- a/meta/recipes-devtools/intltool/intltool.inc
>>> +++ b/meta/recipes-devtools/intltool/intltool.inc
>>> @@ -12,7 +12,7 @@ DEPENDS_virtclass-native = "libxml-parser-perl-native"
>>>   RRECOMMENDS_${PN} = "perl-modules"
>>>   RRECOMMENDS_${PN}_virtclass-native = ""
>>>
>>> -inherit autotools pkgconfig perlnative
>>> +inherit autotools pkgconfig perlnative gettext
>>>
>>>   export PERL = "${bindir}/env perl"
>>>   PERL_virtclass-native = "/usr/bin/env nativeperl"
>>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> index e9871fc..eae2b85 100644
>>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> +++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>>> @@ -1,7 +1,7 @@
>>>   require intltool.inc
>>>   LICENSE="GPLv2"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>> -PR = "r5"
>>> +PR = "r6"
>>>
>>>   SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>>>                      ${NATIVEPATCHES} \
>>
>> I investigated this one and intltool requires gettext at runtime, not
>> build time. Which package did you see the above error from as I suspect
>> it wasn't intltool itself but something using it?
>
> It was intltool itself. The situation happens during rebuild when
> intltool and gettext-native both are to be rebuilt
> and other deps are already there. it doesnt usually happen since we
> build gettext-native pretty early.

Khem,

I verified this, and I also noted that if I did a cleansstate on 
intltool and gettext-native, that gettext-native would be rebuilt, but I 
also checked bitbake -b intltool and it completed successfully with no 
errors, so the dependency is buried in one of intltool's dependencies, 
thus getting built.

So there is no direct dependency on gettext-native by intltool.


Sau!

>>
>> Cheers,
>>
>> Richard
>>
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



