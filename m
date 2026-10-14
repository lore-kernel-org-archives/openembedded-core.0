Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C458CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:31:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1791988297220056546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bMJlJlJ8;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso39530765e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791988295; x=1792593095; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mv144Ir156sa4VRv0fy4OXfdas1FgDZx9SreN0Vxn5Y=;
        b=bMJlJlJ8ed1icDqflLyN8l5zDWxTnBCSwameoOV1KCMQ7VNPurgARp70XYeUvtxxvC
         MtAH7yXVYMKu55H4PsOGJIvWcQKC1QeZXTCVThbiPg6hVUhJqLAseE9K4B5OwTqHaxBk
         DeY/8TiYaKblCnXXK1ecNsRCDBl0F6xnd+vds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988295; x=1792593095;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mv144Ir156sa4VRv0fy4OXfdas1FgDZx9SreN0Vxn5Y=;
        b=iww0nCMKHdI1Wh1LR1V+r4H3HZFWvfPfP81LYVX6820c13yrC9R8pcAASNjZK+p+ur
         cwMLZUvhN+5LC10LuYWbYcjDEM4X2PTWpCdMbCZaukwA3OP482CS/EPipysTw3xbUhwx
         Ze0dTlUPyh2L1t6QR++3nQWRv3m0S0Jqf6nCfOZx18UM8gRMbPgoADvJeRnAofb6hR3I
         8XSDDEUbg75JvhoNa31fKw2FoT2Is7BnaFnYHVYBijQ1sL31Eaiyf5q79BinVp3BgOvj
         4cVU1cIbOjlhxajUwpOo8KZfEFGl4GnMtqdar8Z5Y5NH/Ipg5KURUwnhaC0WMO0XMBmj
         XEGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKc6xrx922rYinZdZ9Eh5BVvr0oIz+mcyqtbUOu93UbbC7TF0y8NRM4zHHQcZ/DrDUYnDbiyJR5wqGc9LsLfviXw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLk76Nk+pikRCbW2gK1K0JTIEqK2Eane+vpKvhNJ7EFJkpT3V9b
	HMa7vFFhUal9dwFqKCdHpLqSIo2wWsM1sX4EgNEO/3BUKibMBeAvq7WJJaKjpKP2BE8=
X-Gm-Gg: AYBFou0V9BM3EEOSYC+Cz1yovwQEEUIS3nbtB1KCD/pnI95FFsRUa/jKRobN/5yl82S
	Ev/6/WC+aVi+EVs1r+N/R7bQBfzzrgRG0fKNkfiN4IYpLcXgBZHWFpK3KLunUuRahoGcqqh4l2w
	/XGuuduhqhQtnPjX9/fS9aYKD2E/v1XxPcwgNYsi1OnLV7sqYA7759Kn/ONN49TT+NrjtGfGmYm
	JCVbAHOhK3Ji6u7T8/vc+snRGzIpngvCWbJXlBHcas6vs3cG1iHynYsMgFog2+QEzU7GI/78I7a
	B0+4xGXxjd2MmVU2FIvR2goXHKJPXtexHF9epI7kKe7DUV3enNng1DmaYMImZQUTPk2wTeWjc1x
	SeV+ivWSZze1tYU3EAHzv9uCIARLI7dYDkFbfHyzwS9BDeZkcbdLwOyOQ0BmgLNVJazHcKd/l2x
	75lKlEAEyx7+bbWr4c+LXKGM3eZkI7/i+AKOkM26eW6wMpb9gAdhDrpAoxqjE4yeSlJBnqcPBvb
	CRt3sM72tDRxhEqDP8L/GbqeNIjGR4UnTcnhrCz0ADH4YPrFuIIOb2ZB2c=
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a18e3ef23cmr319601595e9.0.1791988295340;
        Wed, 14 Oct 2026 07:31:35 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0acb1ebsm12686354f8f.44.2026.10.14.07.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:31:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 16:31:34 +0200
Message-Id: <DM4MU1O808QU.3D1G1PPSLRL5V@smile.fr>
Subject: Re: [OE-core][scarthgap] linux-yocto/6.6: update to v6.6.157
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <bruce.ashfield@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260917051600.1472502-1-bruce.ashfield@gmail.com>
 <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr>
In-Reply-To: <DLLOWJJZP939.377A2ZRET8LZ1@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247762

On Tue Sep 22, 2026 at 10:08 AM CEST, Yoann Congal wrote:
> On Thu Sep 17, 2026 at 7:16 AM CEST, Bruce Ashfield via lists.openembedde=
d.org wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Updating linux-yocto/6.6 to the latest korg -stable release that compris=
es
>> the following commits:
>>
>>     79643295eba17 Linux 6.6.157
>>     32e598324edc3 nvmet-rdma: fix queue leak when connect backlog is exc=
eeded
>>     [...]
>>     73b7a11814838 Revert "arm64: mm: Don't remap pgtables for allocate v=
s populate"
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
>>  3 files changed, 20 insertions(+), 20 deletions(-)
>
> Hello Bruce,
>
> I think either this 6.6.157 upgrade or the 6.6.156 one triggers a
> lttng ptest failure:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
> qemux86-64-ptest debian11-vk-3 scarthgap completed at 2026-09-21 11:38:31=
+00:00
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
> qemuarm64-ptest ubuntu2404-vk-arm2 scarthgap completed at 2026-09-21 14:5=
7:16+00:00
>
> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86=
-64-ptest/core-image-ptest-lttng-tools/log.do_testimage.311077.202609211108=
38:
> (only one of each message):
> |FAIL: kernel/test_userspace_probe 91 - Load command with opts: --input-p=
ath=3D/tmp/tmp.test_userspace_probe_save_load_elf_trace_path.zSA9mh
> |FAIL: tools/base-path/test_ust 35 - Load command with opts: -i ./tools/b=
ase-path//load-stream-extra-path.lttng
> |FAIL: tools/save-load/test_load 2 - Load command with opts: -i ./tools/s=
ave-load//load-42.lttng
> |FAIL: tools/rotation/test_ust 101 - App is un-registered
> |FAIL: tools/save-load/test_autoload 2 - Lttng-tool list command with opt=
ion load-42
> |FAIL: tools/rotation/test_save_load_mi 17 - Lttng-tool list command with=
 option yTVkM2lxbFoDS7Nu
> |FAIL: tools/rotation/test_save_load_mi 8 - Valid lttng enable-rotation s=
ize XML
> |FAIL: tools/rotation/test_save_load_mi 5 - Valid lttng enable-rotation t=
imer XML
> |FAIL: tools/relayd-grouping/test_ust 120 - Valid lttng list XML
> |FAIL: tools/rotation/test_save_load_mi 18 - Valid lttng list XML after l=
oad
> |FAIL: tools/base-path/test_ust 37 - Stop lttng tracing for session load-=
stream-extra-path
> |FAIL: tools/trigger/test_add_trigger_cli 293 - add-trigger mi is valid
> |FAIL: tools/trigger/test_remove_trigger_cli 20 - remove-trigger mi is va=
lid
> |FAIL: tools/base-path/test_ust 39 - UST per-uid network trace path is va=
lid
> |FAIL: tools/save-load/test_autoload 1 - Start session daemon
> |FAIL: tools/save-load/test_autoload 3 - No session daemon to kill
> |FAIL: tools/save-load/test_load 3 - Destroy session load-42
> |FAIL: tools/base-path/test_ust 38 - Destroy session load-stream-extra-pa=
th
> |FAIL: tools/rotation/test_save_load_mi 21 - Destroy session yTVkM2lxbFoD=
S7Nu
> |FAIL: tools/mi/test_mi 3 - MI test: Version xsd validation
> |FAIL: tools/rotation/test_save_load_mi 20 - Found the right rotation siz=
e value in list XML after load
> |FAIL: tools/base-path/test_ust 40 - Validate trace for event tp:tptest
> |FAIL: tools/base-path/test_ust 36 - Start tracing for session load-strea=
m-extra-path
> |FAIL: kernel/test_userspace_probe 92 - Validate userspace probe listing
>
> Any ideas?
>
> Thanks!

Hello Bruce,

Gentle ping on the above upgrade failure.

Do you have time to look at this? If you don't, we'll have organize to
find other resources, we can't not update the kernel.

Regards,
--=20
Yoann Congal
Smile ECS


