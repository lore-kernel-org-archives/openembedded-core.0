Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE14B70103;
	Wed, 18 Jun 2014 08:28:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5I8Si33006642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jun 2014 01:28:44 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 18 Jun 2014 01:28:44 -0700
Message-ID: <53A14DBA.80305@windriver.com>
Date: Wed, 18 Jun 2014 16:28:42 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20140617075959.D3DE350478@opal.openembedded.org>
	<20140618080342.GF2117@jama>
In-Reply-To: <20140618080342.GF2117@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
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
X-List-Received-Date: Wed, 18 Jun 2014 08:28:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, I sent another patch to fix it.

// Robert

On 06/18/2014 04:03 PM, Martin Jansa wrote:
> On Tue, Jun 17, 2014 at 07:59:59AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 7a2d2d81d8694806060f7bccfbdba42dc356d477
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=7a2d2d81d8694806060f7bccfbdba42dc356d477
>>
>> Author: Robert Yang <liezhi.yang@windriver.com>
>> Date:   Mon May 26 21:39:46 2014 -0400
>>
>> dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
>>
>> Found this error on CentOS 5.10, other distros may also has this
>> problem, I think that we can disable the selinux for dbus-native:
>>
>> bus/selinux.c:327: error: array type has incomplete element type
>
> This actually breaks dbus-native compilation for others, because it enables docs
>
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | make[2]: *** [dbus-monitor.1] Error 3
> | make[2]: *** Waiting for unfinished jobs....
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | make[2]: *** [dbus-faq.html] Error 3
> | make[2]: *** [dbus-uuidgen.1] Error 3
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | make[2]: *** [dbus-daemon.1] Error 3
> | make[2]: *** [dbus-launch.1] Error 3
> | make[2]: *** [dbus-send.1] Error 3
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | xmlto: xmllint validation tool not found or not executable.
> | xmlto: Skipping validation...  Please make sure xmllint is installed.
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | make[2]: *** [dbus-cleanup-sockets.1] Error 3
> | make[2]: *** [dbus-run-session.1] Error 3
> | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/dbus-native/1.8.2-r0/build/doc'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/dbus-native/1.8.2-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/dbus-native/1.8.2-r0/temp/log.do_compile.2550)
> NOTE: recipe dbus-native-1.8.2-r0: task do_compile: Failed
>
>
>>
>> [YOCTO #6374]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-core/dbus/dbus.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index 5b2a056..01108c9 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -86,6 +86,8 @@ EXTRA_OECONF = "--disable-tests \
>>                   --disable-systemd \
>>                   --without-dbus-glib"
>>
>> +EXTRA_OECONF_class-native = "--disable-selinux"
>> +
>>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>>   PACKAGECONFIG_class-native = ""
>>
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

