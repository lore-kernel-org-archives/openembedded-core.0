Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9036B6AC85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 09:29:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s829SeFK019770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 02:28:40 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 02:28:40 -0700
Message-ID: <54058DC6.4020503@windriver.com>
Date: Tue, 2 Sep 2014 17:28:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1407836032.git.liezhi.yang@windriver.com>	
	<cf27f471a5feb7deaaa24694028d7b4dc34fea02.1407836032.git.liezhi.yang@windriver.com>
	<1409646504.29296.268.camel@ted>
In-Reply-To: <1409646504.29296.268.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perf.bb: fix multilib build
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
X-List-Received-Date: Tue, 02 Sep 2014 09:29:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 04:28 PM, Richard Purdie wrote:
> On Tue, 2014-08-12 at 04:10 -0700, Robert Yang wrote:
>> Fixed:
>> $ bitbake perf lib32-perf
>> ERROR: QA Issue: lib32-perf: Files/directories were installed but not shipped
>>    /usr/lib64
>>    /usr/lib64/traceevent
>>    /usr/lib64/traceevent/plugins
>>    /usr/lib64/traceevent/plugins/plugin_function.so
>>    /usr/lib64/traceevent/plugins/plugin_scsi.so
>>    /usr/lib64/traceevent/plugins/plugin_hrtimer.so
>>    /usr/lib64/traceevent/plugins/plugin_kmem.so
>>    /usr/lib64/traceevent/plugins/plugin_jbd2.so
>>    /usr/lib64/traceevent/plugins/plugin_xen.so
>>    /usr/lib64/traceevent/plugins/plugin_mac80211.so
>>    /usr/lib64/traceevent/plugins/plugin_cfg80211.so
>>    /usr/lib64/traceevent/plugins/plugin_sched_switch.so
>>    /usr/lib64/traceevent/plugins/plugin_kvm.so [installed-vs-shipped]
>>
>> The perf.do_configure edits kernel's
>> ${STAGING_KERNEL_DIR}/tools/perf/config/Makefile, there would be
>> problems since kernel doesn't have multilib, and the build result is
>> undetermined.
>>
>> Previously, the sed command changed libdir to /usr/lib64 (or 32) in the
>> Makefile, so the build result was different if we build perf (64) first
>> or lib32-perf first.
>>
>> Use the weak assignment "libdir ?=" to instead of "libdir =" will fix
>> the problem since the multilib builds are in different processes, and
>> they won't affect each other any more.
>>
>> The sed command will match both $(prefix)/$(lib) and $(prefix)/lib since
>> the Makefile may has been modified before this patch.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb |    8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index bfd210c..ebfedb9 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -121,10 +121,12 @@ do_configure_prepend () {
>>       # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
>>       # build, with a 64 bit multilib, the arch won't match and the detection of a
>>       # 64 bit build (and library) are not exected. To ensure that libraries are
>> -    # installed to the correct location, we can make the substitution in the
>> -    # config/Makefile. For non multilib builds, this has no impact.
>> +    # installed to the correct location, we can use the weak assignment in the
>> +    # config/Makefile.
>>       if [ -e "${S}/tools/perf/config/Makefile" ]; then
>> -        sed -i 's,libdir = $(prefix)/$(lib),libdir = $(prefix)/${baselib},' ${S}/tools/perf/config/Makefile
>> +        # Match $(prefix)/$(lib) and $(prefix)/lib
>> +        sed -i 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
>> +            ${S}/tools/perf/config/Makefile
>>       fi
>>       # We need to ensure the --sysroot option in CC is preserved
>>       if [ -e "${S}/tools/perf/Makefile.perf" ]; then
>
> What happens if both lib32-perf and lib64-perf are being built at the
> same time?
>

Thanks for the reply, I tested "bitbake lib32-perf lib64-perf" just now:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"

$ bitbake lib32-perf lib64-perf
$ bitbake lib32-perf lib64-perf -ccleansstate && bitbake lib32-perf lib64-perf

It worked well, and built 3 of them:

$ bitbake lib32-perf lib64-perf perf
$ bitbake lib32-perf lib64-perf perf -ccleansstate && bitbake lib32-perf 
lib64-perf perf

It worked well, too. And it didn't work without the patch, we would get
the installed-vs-shipped error as showed in the commit message.

The patch changes "libdir =" to "libdir ?=" in the Makefile so that different
processes have different libdir, then it works.

// Robert



> ${S} is shared here so we should not be making changes to it. Your patch
> doesn't make things worse I guess but there is still a horribly big race
> here :(
>
> Cheers,
>
> Richard
>
>
>
>
>

