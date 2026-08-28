Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688BCC61DC6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:29:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1800.1787905765897818159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fMLYaW/V;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482db627cd8so459586f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787905764; x=1788510564; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48vDIFbxRFQTd9RrWwaqBkgRdhTZzsvI+recyNw3/3g=;
        b=fMLYaW/VlUAHta0Nt4L9nPpV6FKpdr3bL9KNttsn3k55zLK8+mtE9XsUyGrzjxo6G1
         rZkhlc7+0JhkgVYtmuEjiyLAgVSTGc4Vt8Awssh35Engmt9fcYCi6lTwbTd7tYz+A4ss
         sF6fGXZwUT3A61y12Jem1HLEKpOTChDp2Tk/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905764; x=1788510564;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48vDIFbxRFQTd9RrWwaqBkgRdhTZzsvI+recyNw3/3g=;
        b=GOR4hvOMHLUDb1kER/KJsuD7dO828w+oIfoWINatRnsTqU+cnL0F0GquwI6IeQqeL5
         +4eODjdsCILDI63Zwc1mHfgD81EBeXDWsBFwEdmnGMu561pkkrdM+cETdKITN6rwnXMx
         QVcoMw5jAutNVAzb2aks0kgApuXf1QrHx+aCgbMgTrzIjnIxhoZU5J4/tsIegBAYABCC
         +4N0yNgJOTkFW6ABh9LISplo7JLazaj0GFNMSuQEBNKBtQIc6Yo0wpgzqJ44d4ro+52A
         2emDjy5oL0+ETN8ecVnUXlUjtsIVme8uEQYgPT6d5JouYwJZ2JmVlLeP4SRdkN8fzYez
         4N0w==
X-Forwarded-Encrypted: i=1; AHgh+RrRF91xiygMCPI4I3ZsSWThi78SXdpIbikjEnJICmNzaGEk7wEEuBgrd7hVmdpCmrqXas80yh6U+ihEt4cYpJpkFA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nWT0KUTQWebHRVvJJepw5eZWfZuBnG84FE2MjveeQsiRXThZO1
	ZD5UayNY2N29gHQr29cwqyyOImrvhwQJPGXGM1xx6pvreaRJgegTOZlJeWbmchZI75Q=
X-Gm-Gg: AR+sD12AJHq+9VLAtQA6Y1KqAZ+XkFDfM752UyTL3gsaDl8S5bRnoI+NNzdskjMHwGY
	FJUS8UmxD0fFh9CPhxLSb+kOntsGstAOXTh0pUS8Xx0+xxkKhNzOkCY0JUZKdRk9yQfl8iGg2gO
	fMe4RZmUTdTp9059NdLQA98wGA7qQA7p0yMHhYtgIReLiWMHpkIgwCR23T3v0tWOnenzslg+qne
	qexDhN41LapiycOGA3Kex1kuZN3DVoIozJvCOhhCx/deNexNvV+kiIjkPbaBfj5fBthRuCEe0no
	673GTHc8hZ3PXHRcIloZLCyH4A4WKXR4hb2J5U3v1ZAChu/mipax53jakJc1bUKr1r8ZVuoSIdn
	jyO5UrUKJqa3dCLZBMYXdGnylBTEKHiPBuJmI1SUxC7tHbfXqkdCLyvDqHl83LWzifrhyIjKVkH
	cPLdanHKYdoa8JOGXA/fkC+4fXz4KbKJ+YKr06v2V7k6RSv6Ti3BfiOxu3gnSpAKxokYrd5J5h3
	SufGYIfgIiWALPVWre9lcr1lgz8TMB61bxJmiDAJzB7ROEf5jMQ
X-Received: by 2002:a05:6000:2583:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482f7a1cb9cmr6592371f8f.17.1787905764085;
        Fri, 28 Aug 2026 01:29:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28276sm2521417f8f.29.2026.08.28.01.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 01:29:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 10:29:23 +0200
Message-Id: <DL0FP4SKU5PH.VPMJPVH85T40@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <peter.marko@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260815190824.2980891-1-peter.marko@siemens.com>
 <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
In-Reply-To: <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244523

On Fri Aug 28, 2026 at 10:25 AM CEST, Yoann Congal wrote:
> On Sat Aug 15, 2026 at 9:08 PM CEST, Peter Marko via lists.openembedded.o=
rg wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> Pick patch mentioned in NVD CVE description.
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>  meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
>>  .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++++++++++++
>>  2 files changed, 211 insertions(+)
>>  create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patc=
h
>
> Hello,
>
> It looks like this series triggers ptests issues:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4362
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4378
>
> https://valkyrie.yocto.io/pub/non-release/20260824-88/testresults/qemux86=
-64-ptest/core-image-ptest-cpio/log.do_testimage.311338.20260824214940
> | FAIL: CVE-2019-14866 (tar header size overflow)
>
> Can you look into this?
>
> Thanks!

FYI, with this series removed, the ptests succeded here:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4382
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4365

Regards,
--=20
Yoann Congal
Smile ECS


