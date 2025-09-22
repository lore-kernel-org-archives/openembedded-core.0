Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75648CAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 22:22:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2973.1758579744732069140
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 15:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A3x5DdXO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MMLwTV860114;
	Mon, 22 Sep 2025 17:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758579718;
	bh=B3XmtIxOopCRueUuvzW0YfRAM3DS5BrQyTxkIbffvzI=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=A3x5DdXO7yb4WNX+Cg18iN7ZlHZTZMa5ae8dyivIaTTH00Ovvi1GTPaYhgXyjg3Tx
	 HwwqamfIU+kSprFMFOpw+9GH5lY18o3cnCKKSChA8FjqVBjyOspVPHSvwnVGTjZdPQ
	 eCXqfG7DMVnlisgrbTdC1UJuxfc/QD/qMtqdoiWw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MMLwqb615448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 17:21:58 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 17:21:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 17:21:58 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MMLwHp3485992;
	Mon, 22 Sep 2025 17:21:58 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Sep 2025 17:21:58 -0500
Message-ID: <DCZOHDN5WGY6.3H0PUSO7A24XG@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918214903.341452-1-rs@ti.com>
 <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
 <1867B951D10D3F9C.23856@lists.openembedded.org>
In-Reply-To: <1867B951D10D3F9C.23856@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 22:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223859

On Mon Sep 22, 2025 at 4:51 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Sun Sep 21, 2025 at 7:25 AM CDT, Mathieu Dubois-Briand wrote:
>> On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> We've recently run into some issues with weston-init attempting to star=
t Weston
>>> prior to all drm devices being registered. There's not really a good, s=
criptable
>>> mechanism to listen in to device registration events that works with th=
e
>>> existing weston-init package. Well, at least one that doesn't involve p=
olling
>>> files or introducing more dependency on the init system being used.
>>>
>>> I also see there is also a lot of scripting around starting X11,
>>> xserver-nodm-init, that (from my limited review) should experience the =
same
>>> issue.
>>>
>>> I'd like to introduce the following display manager for oe-core, emptty=
 [1].
>>> This display manager is, as described upstream, a "Dead simple CLI Disp=
lay
>>> Manager on TTY". It supports both x11 and wayland sessions, with toggla=
ble build
>>> parameters to completely remove x11 and pam dependencies. It's licensed=
 MIT,
>>> which shouldn't be an issue for any users. (It is written in Go, if you=
 have
>>> opinions about that.)
>>>
>>> With this, both weston-init and the xserver-nodm-init packages can be r=
e-tuned
>>> to leverage this display manager and simply add a user and emptty confi=
g for an
>>> autologin session. This can resolve the current behavior across init sy=
stems
>>> without additional scripting, and move some development out of this lay=
er.
>>>
>>> This lists myself as a maintainer of emptty as well as xserver-nodm-ini=
t and
>>> xuser-account since these are currently unassigned and I've reworked th=
em
>>> significantly here.
>>>
>>> Sorry for the delay on this series. I found a few bugs in emptty that I=
 wanted
>>> to address before submitting this officially.
>>>
>>
>> Hi Randolph,
>>
>> Thanks for your patch.
>>
>> I took this series, but it looks like we have a build issue, maybe only
>> with altcfg distro:
>>
>> Traceback (most recent call last):
>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core=
/decorator/__init__.py", line 35, in wrapped_f
>>     return func(*args, **kwargs)
>>   File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runt=
ime/cases/xorg.py", line 31, in test_xorg_running
>>     self.assertEqual(status, 0, msg=3Dmsg)
>> AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER=
       VSZ STAT COMMAND
>> ...
>> 2025/09/21 11:59:34 Closing PAM auth
>> 2025/09/21 11:59:34 Failure setting user credentials
>> 2025/09/21 11:59:34 Authentication failure
>> ...
>> RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2402
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2407
>>
>> Can you have a look at it please?
>>
>> Thanks,
>> Mathieu
>
> In the past auth issues can occur if the user was created after the curre=
nt
> system time (of which the default would be the kernel build time if it is=
 unable
> to get a value from NTP).
>
> I've already tested this series with an equivalent config to poky-altcfg,=
 with
> both root and rootless x11. I reset my cache and did another local build =
to
> match that CICD failure and it still works for me.
>
> My local.conf for my test build was:
>
> MACHINE ??=3D "qemux86"
> DISTRO ??=3D "poky-altcfg"
> BBMULTICONFIG ?=3D ""
> IMAGE_CLASSES +=3D "testimage"
>
> Other variables were dictated by templateconf.cfg:
>
> meta-poky/conf/templates/default
>
> Is that automation setting anything that could possibly play with the bui=
ld time
> or system time values for the testimage? I'm not seeing anything in the l=
ogs,
> but I'm also not seeing anything that reports the current config outright=
.
>
> I guess I should add some messages for that as part of the test function
> regardless.

Whoops, I see the issue now. v10 inbound.

