Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3A871A8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 06:25:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9H6PQof005915
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Oct 2016 23:25:26 -0700 (PDT)
Received: from [128.224.162.209] (128.224.162.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 16 Oct 2016 23:25:25 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1476004977.git.Qi.Chen@windriver.com>
	<e7f6b2d54c90833a8c6782a95283b8849438b3a9.1476004977.git.Qi.Chen@windriver.com>
	<CAMKF1spvigWQZ_NRzMgB--0h0cfqTOWGU2Tdo=c5Tn5hXsfumA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <58046ED3.1010106@windriver.com>
Date: Mon, 17 Oct 2016 14:25:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spvigWQZ_NRzMgB--0h0cfqTOWGU2Tdo=c5Tn5hXsfumA@mail.gmail.com>
X-Originating-IP: [128.224.162.209]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid boot failures for mips64
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
X-List-Received-Date: Mon, 17 Oct 2016 06:25:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2016 07:03 AM, Khem Raj wrote:
> On Sun, Oct 9, 2016 at 2:23 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> If we start a systemd based qemumips64 target with 'pam' enabled in
>> DISTRO_FEATURES, we could not login in successfully. After you provide
>> username and password to the login prompt, the login prompt just comes up
>> again. Besides, there are other boot failures.
>>
>> Append '-O0' flag for mips64 target as a workaround to this problem.
>>
>> [YOCTO #10250]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
>> index f800f42..db588e7 100644
>> --- a/meta/recipes-core/systemd/systemd.inc
>> +++ b/meta/recipes-core/systemd/systemd.inc
>> @@ -23,3 +23,4 @@ PV = "230+git${SRCPV}"
>>   S = "${WORKDIR}/git"
>>
>>   LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
>> +CFLAGS_append_mips64 = " -O0"
> can you instead explore a bit more e.g. disabling lto etc.
> CFLAGS_append_mips64 = " -fno-lto"
>
> and also consider little endian
>

Hi Khem,

I thought of adding '-O0' to CFLAGS because when I was debugging this 
problem, I found that several 'printf' statements would make errors 
disappear. I'm not familiar with these options. I just gave a test for 
'-fno-lto', and it caused the following error.

ERROR: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_package: debugedit 
failed with exit code 1 (cmd was 
'/buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit' 
-i -l 
'/buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/debugsources.list' 
'/buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/package/usr/lib/systemd/ptest/tests/test-libsystemd-sym.o'):
/buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit: 
/buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/package/usr/lib/systemd/ptest/tests/test-libsystemd-sym.o: 
Unhandled relocation 2 in .debug_info section
ERROR: systemd-1_230+gitAUTOINC+3a74d4fc90-r0 do_package: Function 
failed: split_and_strip_files
ERROR: Logfile of failure stored in: 
/buildarea2/chenqi/poky/build-systemd/tmp/work/mips64-poky-linux/systemd/1_230+gitAUTOINC+3a74d4fc90-r0/temp/log.do_package.8462
ERROR: Task 
(/buildarea2/chenqi/poky/meta/recipes-core/systemd/systemd_230.bb:do_package) 
failed with exit code '1'

Best Regards,
Chen Qi

>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


