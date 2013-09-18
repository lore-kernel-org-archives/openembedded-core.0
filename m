Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4896C8FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:06:00 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so741579lab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cD9to13DF7nMkFULdEI7sD3xMbfuPg7OCsqp8MGII7A=;
	b=o1EOaz+evfJ92cwh051+ceEt0bsggcqtAy1ZGaY5EIYVA9V8o6hGO5CllMTHEgnPKw
	/ParMWz856RPl74gST+6BpMUBiDnFc2rTfZrtUdMrE8PtFH7LuU9ucOyd6acs1X4g18e
	wymTGbmjiFvnCl3Jj+FPP3enCkgwDqVw4UXY7zEKzii/Ny4M85wg6pJQ7LzvaWa3+nFd
	+HdAKOk4zqs+KRl/DWOyIfx7UsPDto4tQbgYXd9AzXgenlOWbzZZ/n5m/Ed5SPoXsDy1
	IkpRrfaxzuMIq1y+S74mKxW+d7xMWHHzBb6aDepSCn0r59kOWhlz1tLmOrNSB4S8y8uA
	o6Pg==
MIME-Version: 1.0
X-Received: by 10.152.116.7 with SMTP id js7mr35025147lab.11.1379513160954;
	Wed, 18 Sep 2013 07:06:00 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 18 Sep 2013 07:06:00 -0700 (PDT)
In-Reply-To: <1379513067.32201.158.camel@ted>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<1379513067.32201.158.camel@ted>
Date: Wed, 18 Sep 2013 10:06:00 -0400
Message-ID: <CADkTA4Pp2F3G_ooNr0WCM5yPEkfJZ1FiA4+Se_XGjWPbcjtvQQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 14:06:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 10:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-18 at 10:51 -0300, Otavio Salvador wrote:
>> The LDFLAGS is required or some old kernels fails due missing
>> symbols and this is preferred than requiring patches to every old
>> supported kernel.
>>
>> Fixes [YOCTO: #5221]
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/recipes-kernel/perf/perf.bb | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> Doesn't this reintroduce the problem you previously fixed though with
> things rebuilding because the flags changed?

I'm doing a test on just that right now, but as far as I can tell, as
long as they
are consistent between the compile and install, we should be fine. It was when
one was clobbered and one wasn't before, that the rebuilds were triggering.

Bruce

>
> Cheers,
>
> Richard
>
>
>
>
>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 4a815ff..269069f 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -60,6 +60,11 @@ B = "${WORKDIR}/${BPN}-${PV}"
>>  SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
>>  TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
>>
>> +# The LDFLAGS is required or some old kernels fails due missing
>> +# symbols and this is preferred than requiring patches to every old
>> +# supported kernel.
>> +LDFLAGS="-ldl -lutil"
>> +
>>  EXTRA_OEMAKE = \
>>               '-C ${S}/tools/perf \
>>               O=${B} \
>> @@ -88,13 +93,13 @@ PARALLEL_MAKE = ""
>>
>>  do_compile() {
>>       # Linux kernel build system is expected to do the right thing
>> -     unset CFLAGS LDFLAGS
>> +     unset CFLAGS
>>       oe_runmake all
>>  }
>>
>>  do_install() {
>>       # Linux kernel build system is expected to do the right thing
>> -     unset CFLAGS LDFLAGS
>> +     unset CFLAGS
>>       oe_runmake DESTDIR=${D} install
>>       # we are checking for this make target to be compatible with older perf versions
>>       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

