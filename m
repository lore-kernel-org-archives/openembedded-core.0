Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A35974AEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 09:41:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U9et3A022143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 02:40:55 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 30 Aug 2018 02:40:54 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	<raj.khem@gmail.com>, Markus Lehtonen <markus.lehtonen@linux.intel.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
	<fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
	<c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <02ee117d-3465-62e9-00da-8dedf441d0f2@windriver.com>
Date: Thu, 30 Aug 2018 17:45:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
X-Originating-IP: [128.224.162.218]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] sysklogd: Use update-alternatives
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
X-List-Received-Date: Thu, 30 Aug 2018 09:41:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2018 03:44 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 30 augusti 2018 05:56
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
>>
>> busybox also provides klogd and syslogd, this change makes it coexist
>> peacefully. Currently rootfs fails in situations where both of them are
>> providing these binaries and busybox postinsts fail
>>
>> update-alternatives: Error: not linking
>> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
>> cmdline/1.0-r0/rootfs/sbin/klogd
>> to /bin/busybox.nosuid since
>> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
>> cmdline/1.0-r0/rootfs/sbin/klogd
>> exists and is not a link
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc
>> b/meta/recipes-extended/sysklogd/sysklogd.inc
>> index fc4e67c18e..2a8bed00f3 100644
>> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>>                       file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
>>                      "
>>
>> -inherit update-rc.d systemd
>> +inherit update-rc.d systemd update-alternatives
>>
>>   SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
>>              file://no-strip-install.patch \
>> @@ -70,3 +70,9 @@ python () {
>>       if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
>>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>>   }
>> +
>> +ALTERNATIVE_PRIORITY = "100"
>> +ALTERNATIVE_${PN} = "klogd syslogd"
>> +ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>> +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
>> +
>> --
>> 2.18.0
> This is a (partial) revert of commit 988aad01b2 (sysklogd: don't use
> update-alternatives). Can you come to an agreement regarding which is
> the correct solution?
>
> //Peter
>


I think the previous commit (syslogd: don't use update-alternatives) is 
made because syslog daemon conflict with each other. I guess the author 
assumed that the 'syslogd' and 'klogd' alternatives entries are handled 
by busybox-syslog package.

On the other hand, I think the patch is trying to solve the problem of 
busybox being installed after sysklogd.
We are currently not seeing errors because busybox is likely to be 
installed before sysklogd. Even in this situation, the result is not all 
correct, because the links busybox's postinstall creates are covered by 
the real binaries from sysklogd.

I think the problem is about busybox's handling of alternatives.

Khem, I've sent out a patch to fix busybox's alternatives logic. Could 
you please help review it?

Best Regards,
Chen Qi

