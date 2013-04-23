Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UUhGm-0000HU-5p
	for Openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:45:08 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3NHR0x7024911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Apr 2013 10:27:00 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Apr 2013 10:26:59 -0700
Message-ID: <5176C461.1000307@windriver.com>
Date: Tue, 23 Apr 2013 12:26:57 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1366733299-14804-1-git-send-email-jason.wessel@windriver.com>
	<1366736437.23738.66.camel@ted>
In-Reply-To: <1366736437.23738.66.camel@ted>
X-Enigmail-Version: 1.5.1
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcre, ncurses: Fix problems expanding the IMAGE_INSTALL package groups
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
X-List-Received-Date: Tue, 23 Apr 2013 17:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 04/23/2013 12:00 PM, Richard Purdie wrote:
> On Tue, 2013-04-23 at 11:08 -0500, Jason Wessel wrote:
>> The ncurses and libpcre packages were generating the following errors
>> as a result of not specifing the PACKAGES_DYNAMIC correctly.  These
>> errors only appear when using the IMAGE_INSTALL list that has been
>> expanded by the hob or from the pkgdata.
>>
>> ERROR: Nothing RPROVIDES 'ncurses-libtinfo'
>> ERROR: Nothing RPROVIDES 'libpcreposix'
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/recipes-core/ncurses/ncurses.inc        |    2 ++
>>  meta/recipes-support/libpcre/libpcre_8.32.bb |    2 ++
>>  2 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>> index bcb9c94..78ff153 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -42,6 +42,8 @@ EXCONFIG_ARGS_virtclass-nativesdk = " \
>>  		--with-chtype='long' \
>>  		--with-mmask-t='long'"
>>  
>> +PACKAGES_DYNAMIC = "^${PN}-.*"
>> +
>>  # Fall back to the host termcap / terminfo for -nativesdk and -native
>>  # The reality is a work around for strange problems with things like
>>  # "bitbake -c menuconfig busybox" where it cannot find the terminfo
> This makes sense since its doing dynamic package splitting.
>
>> diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
>> index 4d17741..71cc119 100644
>> --- a/meta/recipes-support/libpcre/libpcre_8.32.bb
>> +++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
>> @@ -26,6 +26,8 @@ inherit autotools binconfig
>>  
>>  PARALLEL_MAKE = ""
>>  
>> +PACKAGES_DYNAMIC = "^${PN}.*"
>> +
>>  EXTRA_OECONF = "\
>>      --enable-newline-is-lf \
>>      --enable-rebuild-chartables \
> However this does not. libpcreposix is clearly listed in PACKAGES. Was
> this based on an older recipe and can someone check this is needed on
> master?


I'll double check on this and submit a new patch.   This was originally against the libpcre 8.21 from YP 1.2.

Jason.


