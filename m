Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEakl-00030c-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 09:00:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2012 23:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="194867109"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 23:48:07 -0700
Message-ID: <505ABC27.9000909@linux.intel.com>
Date: Wed, 19 Sep 2012 23:48:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
References: <1348039015-27100-1-git-send-email-mertsas@cisco.com>
	<5059DE91.9060709@linux.intel.com> <505AB23E.10607@cisco.com>
In-Reply-To: <505AB23E.10607@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Thu, 20 Sep 2012 07:00:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/19/2012 11:05 PM, Martin Ertsås wrote:
> On 09/19/12 17:02, Saul Wold wrote:
>> On 09/19/2012 12:16 AM, Martin Ertsaas wrote:
>>> bash-3.2.48 did not provide the linking from sh to bash, making it
>>> unusable.
>>> Moving the license part out of the bash.inc file, and into
>>> bash_4.2.bb file makes
>>> us able to use that file also for bash_3.2.48.bb, which makes
>>> maintaining both
>>> at the same time a lot easier.
>>>
>> This is good, but I forgot to ask you to include the size change in
>> here, it's helpful for tracking, I am still considering this change,
>> but we have constantly adding little change like this adds up to bigger
>> change.
>>
>> Is there any other way to do the equivalent of what you are attempting
>> to do in the other patch without adding size to busy box?
>>
>> Thanks
>>
>> Sau!
> What size change is that? I'm not sure what you are referring to here,
> sorry. As far as I see I'm not adding any size to busybox either, but I
> might be wrong as I don't know the internals of busybox. If you could
> elaborate a bit more, I can see what I can do about your concerns.
>
Sorry, today's been a bit crazy!  I confused a change to busybox with 
your change to bash!  My bad, ignore me.

I will revisit this tomorrow.

Sau!




> - Martin
>>
>>> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
>>> ---
>>>    meta/recipes-extended/bash/bash.inc       |    3 --
>>>    meta/recipes-extended/bash/bash_3.2.48.bb |   31
>>> +---------------------------
>>>    meta/recipes-extended/bash/bash_4.2.bb    |    6 ++++-
>>>    3 files changed, 7 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/bash/bash.inc
>>> b/meta/recipes-extended/bash/bash.inc
>>> index 3684191..ae4b681 100644
>>> --- a/meta/recipes-extended/bash/bash.inc
>>> +++ b/meta/recipes-extended/bash/bash.inc
>>> @@ -2,9 +2,6 @@ DESCRIPTION = "An sh-compatible command language
>>> interpreter."
>>>    HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
>>>    SECTION = "base/shell"
>>>
>>> -# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>>> -LICENSE = "GPLv3+"
>>> -LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>    DEPENDS = "ncurses bison-native"
>>>
>>>    inherit autotools gettext update-alternatives
>>> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb
>>> b/meta/recipes-extended/bash/bash_3.2.48.bb
>>> index 509d7a0..828d629 100644
>>> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
>>> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
>>> @@ -1,12 +1,9 @@
>>> -DESCRIPTION = "An sh-compatible command language interpreter."
>>> -HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
>>> -SECTION = "base/shell"
>>> +require bash.inc
>>>
>>>    LICENSE = "GPLv2+"
>>>    LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
>>> -DEPENDS = "ncurses"
>>>
>>> -PR = "r10"
>>> +PR = "r11"
>>>
>>>    SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>>>
>>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001
>>> \
>>> @@ -24,27 +21,3 @@ SRC_URI[patch003.sha256sum] =
>>> "354886097cd95b4def77028f32ee01e2e088d58a98184fede
>>>
>>>    SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
>>>    SRC_URI[sha256sum] =
>>> "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
>>> -
>>> -inherit autotools gettext
>>> -
>>> -PARALLEL_MAKE = ""
>>> -
>>> -bindir = "/bin"
>>> -sbindir = "/sbin"
>>> -
>>> -EXTRA_OECONF = "--with-ncurses"
>>> -export CC_FOR_BUILD = "${BUILD_CC}"
>>> -
>>> -export AUTOHEADER = "true"
>>> -
>>> -do_configure_prepend () {
>>> -    if [ ! -e acinclude.m4 ]; then
>>> -        cat aclocal.m4 > acinclude.m4
>>> -    fi
>>> -}
>>> -
>>> -pkg_postinst_${PN} () {
>>> -    touch $D${sysconfdir}/shells
>>> -    grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >>
>>> $D${sysconfdir}/shells
>>> -    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >>
>>> $D${sysconfdir}/shells
>>> -}
>>> diff --git a/meta/recipes-extended/bash/bash_4.2.bb
>>> b/meta/recipes-extended/bash/bash_4.2.bb
>>> index 384eb62..5a0f015 100644
>>> --- a/meta/recipes-extended/bash/bash_4.2.bb
>>> +++ b/meta/recipes-extended/bash/bash_4.2.bb
>>> @@ -1,6 +1,10 @@
>>>    require bash.inc
>>>
>>> -PR = "r4"
>>> +# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>>> +LICENSE = "GPLv3+"
>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>> +
>>> +PR = "r5"
>>>
>>>    SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>>>
>>> ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001
>>> \
>>>
>
>
>


