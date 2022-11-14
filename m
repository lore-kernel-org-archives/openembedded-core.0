Return-Path: <zboszor@pr.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D4C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 09:38:08 +0000 (UTC)
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web12.3822.1668418678854970597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 01:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=VlvzJ6Wh;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <zboszor@pr.hu>)
	id 1ouVud-0001Ea-1B; Mon, 14 Nov 2022 10:37:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oOjqpiii/LrCTar1VlvtWB74izk9hVNrg/YYS3FtKYg=; b=VlvzJ6Wh1bB2ysjzyN7TTdgKwk
	jJb8r/6YPg00vM6Ky8QNBr+5P0gCpwDWfoIVzLjtd1a/NqkxVHSisHHLkOTiSgF+6Ud7i1/hBDq6o
	n/sZfm5sCqPA8AGt5ZyRCe5fprN27rPRPydhqemdBir2/6T1QcmCN+PbaIUuv2oWw3i4kRO+ZwW/+
	6heSYnHSudCCauvBIhMCWXztKxHrpdupJY8NdBL16APbmzGjT7guGJpENtsxdoLFOasJXZUmLzwRD
	eEKVWQHEladDkShYrCNGTqKJG5Lv2uU0PhA+tKzuSLwcs3w8If7iq3lPigJSXSgLN8MjXIzievgQp
	nrviLnBQ==;
Received: from host-87-242-32-154.prtelecom.hu ([87.242.32.154] helo=[192.168.1.144])
	by mail.pr.hu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <zboszor@pr.hu>)
	id 1ouVuW-0003Ij-0P; Mon, 14 Nov 2022 10:37:52 +0100
Message-ID: <4e794143-dad1-873c-76ac-b68f80091c30@pr.hu>
Date: Mon, 14 Nov 2022 10:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj873res=PuBbMB-ffy6=ek-8UFNt+QvYru1dKdU-VjuWg@mail.gmail.com>
 <OSBPR01MB1845B7BA1558188406E85D23DC379@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CANNYZj9U-KBCsC=6aNZ5LJ8sx=XqBCEVY2m75U8xZjb5k=7CCA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
In-Reply-To: <CANNYZj9U-KBCsC=6aNZ5LJ8sx=XqBCEVY2m75U8xZjb5k=7CCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 6e8e55c9b1de86adf00aae073b3499a9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 09:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173232

Hi,

I think this is not the correct approach, but here are my
use cases:

I recently discovered that the python script replacement
of the native build of systemctl mishandles services with
multiple RequiredBy= and WantedBy= clauses in the [Install]
section and only creates the symlink for the first service
or target in the list. It doesn't matter if there are multiple
RequiredBy= or WantedBy= lines, or the services/targets are
listed in a single clause line.

It also doesn't handle "systemctl set-default custom.target".
I need it for some custom images, currently I am setting the
target symlink manually in an image postprocess script.

With a cross-script setting the proper --root option for
calling the native systemctl, both would be solved.

Also, to be able to include libfprint / fprintd in Yocto,
the native build of systend is needed for the dependency list:

libfprint
->  libfprint-native (for native generator binaries)
     -> libgusb-native
        -> systemd-native (for native libudev)

Best regards,
Zoltán Böszörményi

2022. 10. 31. 9:52 keltezéssel, Alexander Kanavin írta:
> You need to explain why this is useful to the broader community. What
> is the use case? Each addition to oe-core adds to the maintenance
> costs, so it needs to be justified and explained.
> 
> Alex
> 
> On Mon, 31 Oct 2022 at 09:38, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote:
>>
>> I need to use nativesdk-systemd-systemctl.
>> I added this file in meta-oe, and the maintainers received it.
>> However, they suggested that it was better to contribute to oe-core.
>>
>>    --
>> Best Regards
>> ---------------------------------------------------
>> Wang Mingyu
>> Development Dept.I
>> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, Nanjing, 210012, China
>> TEL: +86+25-86630566-8568
>> COINS: 79988548
>> FAX: +86+25-83317685
>> MAIL: wangmy@fujitsu.com
>> http://www.fujitsu.com/cn/fnst/
>>
>>> -----Original Message-----
>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>> Sent: Monday, October 31, 2022 4:24 PM
>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
>>> Cc: openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
>>>
>>> You need to explain the use case. Why is this beneficial to have on oe-core?
>>>
>>> Alex
>>>
>>> On Mon, 31 Oct 2022 at 09:17, wangmy <wangmy@fujitsu.com> wrote:
>>>>
>>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>>
>>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>>> ---
>>>>   .../systemd/nativesdk-systemd-systemctl.bb      | 17
>>> +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>   create mode 100644
>>>> meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
>>>>
>>>> diff --git a/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
>>>> b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
>>>> new file mode 100644
>>>> index 0000000000..66b5ec5e6e
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/systemd/nativesdk-systemd-systemctl.bb
>>>> @@ -0,0 +1,17 @@
>>>> +SUMMARY = "Wrapper for enabling systemd services"
>>>> +
>>>> +LICENSE = "MIT"
>>>> +LIC_FILES_CHKSUM =
>>> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de
>>> 20420"
>>>> +
>>>> +PR = "r0"
>>>> +
>>>> +inherit nativesdk
>>>> +
>>>> +SRC_URI = "file://systemctl"
>>>> +
>>>> +S = "${WORKDIR}"
>>>> +
>>>> +do_install() {
>>>> +       install -d ${D}${bindir}
>>>> +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir} }
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#172297): https://lists.openembedded.org/g/openembedded-core/message/172297
>>>> Mute This Topic: https://lists.openembedded.org/mt/94680777/3617728
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@pr.hu]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


