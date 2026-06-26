Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D6ECD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:44:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30791.1782463457990425835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 01:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XTLjoh3I;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so6598425e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782463456; x=1783068256; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J837ilcH0qvCh7I09GVQD6d2M96tdICynyrR4r8vORM=;
        b=XTLjoh3I7go5xLe4evuny8h4vawoaSvuTjL9m3aNd3K9+r9R5R+uf/LgmJ6/pn4ci8
         xrIGN8UEoqbM3AaWWxl3xC+e/JGJnLTAX+ZrY3n9Hn2buqjrcOhel0XL2NFDKD/09JAt
         4v10X07sBsdq4MRXJcaCSZWLBuUQQH7AHYO50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463456; x=1783068256;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J837ilcH0qvCh7I09GVQD6d2M96tdICynyrR4r8vORM=;
        b=hnmc7+cDnwViAguxHvTnox4NZAGM5k4V89OsPamuZBGQACDS5dYXO5TQwahObljOIM
         2U2Fd0l/4S5SmWDg0hr3jim+Rmy8sj2hkWDbCzMLy0uR72CHg1dWr6Hjso6iDRn0kvRY
         rXAzDk62XXsKpezA28CKMhj+uvILHzm9eOxaq9JrnExJWUJiA8+JLCiQWIPe/edT/tJp
         vzuK5GXsbYvRDwKff/7WDoa+vDF8PfxKfzg137gGif0WQm8Aub8wlyf1LPM3ye+IwjwC
         MOZhbh9bW3z5I7FeRLW/3x3J17/a1Di0+PKlr+b20TSbxyF13I3tRw6w4xIradX1lowm
         yutg==
X-Forwarded-Encrypted: i=1; AFNElJ/tsPlIBC6xXuxrTHEjP6pCJcybQbhQ9szTgroP1DitmFmQVRiismtL4FKIw8HWQ4wS5ckVZD+bjy/Zf35/PCV/7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz027DuednAEBd3Ev/EIwS9dimX3sf9ENSvwqhaeAh9k3ElGUEz
	gjHDnhwZQe32OHFqlxwWxUW8CD1MRBF6HGhWBYdlaf1RezcJ9SJNfqJH9iMbw9Bse/E=
X-Gm-Gg: AfdE7cnQ9VfKgUnNHGYuHGA0/DXHg6gjBdla0BbhJV1gPlSZm5ATw/22PizxdBBmPHE
	uaOSl43h1vkHfiri6tvgpwD4Gj69xZflDBrTpd35wNfWilY8R/xN+UAYVwXtDd8Y/4olqlxbrYf
	3pxDaL9kS1fNuoR4R0gxsSB9ZOkBrp85u3lvWpX6Nw4FNksJmomN/DbL/PvT/WJAgOl1Z2qei9C
	2zIkmmd2WgVmLL2K2NrnJipzWI4UHRHeS3rsAMPv2uQ6T38xk9zMcYMEmbovMNBFpL4zn00SzK3
	16/omahy5N7+L+GVCSkuCnALunAuweGS6pvmt3TihIFg31+6ui09NtFDxrHO6DeizHOeu4PZwfJ
	jO/cPofMjgLwukWszfDTLaf7F4+3ihniEdC9xeXNrmrr+zJZHcH+228kvSCfB2AwAfMsLH1yvFY
	TvnF10OuNTmkBPh5NSASFWeOjWJIdbq6Op431MXsOL2NUb0eveDlO9ijW41jDgv7n7K8QvaOXcm
	rL+tw==
X-Received: by 2002:a05:600c:1d04:b0:492:4714:2d7e with SMTP id 5b1f17b1804b1-492668b76f4mr89307645e9.36.1782463456167;
        Fri, 26 Jun 2026 01:44:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c2954efsm25328315e9.2.2026.06.26.01.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:44:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:44:15 +0200
Message-Id: <DJIUK72QSN15.27HN2SXNQJ1GH@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <Kris.Gavvala@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
X-Mailer: aerc 0.20.0
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
 <DJIUG2YB576E.2A3V5VHSARVBR@smile.fr>
In-Reply-To: <DJIUG2YB576E.2A3V5VHSARVBR@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239617

On Fri Jun 26, 2026 at 10:38 AM CEST, Yoann Congal wrote:
> On Thu Jun 25, 2026 at 12:33 AM CEST, Kris via lists.openembedded.org Gav=
vala wrote:
>> In python3 ptests for whinlatter, tracemalloc_track_race fails with a se=
gfault.
>> To avoid ptest failures for now, skip test_tracemalloc_track_race in pte=
sts if using glibc or musl.
>> Making the change on master to backport to whinlatter.
>>
>> Fixes [YOCTO #16182]
>> Upstream Issue: https://github.com/python/cpython/issues/143143
>>
>> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>> ---
>>  meta/recipes-devtools/python/python3_3.14.6.bb | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recip=
es-devtools/python/python3_3.14.6.bb
>> index 291bde70f6..0fd1831b86 100644
>> --- a/meta/recipes-devtools/python/python3_3.14.6.bb
>> +++ b/meta/recipes-devtools/python/python3_3.14.6.bb
>> @@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D " \
>>      --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsy=
m \
>>  "
>> =20
>> +# Fails due to potential race condition so remove it for glibc and musl
>> +# Bugzilla YP 16182 (test_tracemalloc)
>> +SKIPPED_TESTS:append:libc-glibc =3D " \
>> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race=
 \
>> +"
>> +SKIPPED_TESTS:append:libc-musl =3D " \
>> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race=
 \
>> +"
>
> Hello,
>
> I'm not sure we need to specify glibc and musl (do we support anything
> else?). Most likely, we can unconditionnaly skip the test without
> override.

Also, Alex's remark is important: I won't be able to merge this fix to
either of the stable branch before it is merged on master. So, please:
* start by sending a master patch (my above review about glib/musl
  override does apply),
* get it merged,
* and then, send a backport request to wrynose and scarthgap

Thanks!

>
> Regards,
>
>> =20
>>  do_install_ptest:append () {
>>      sed -i -e "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|=
" ${D}${PTEST_PATH}/run-ptest


--=20
Yoann Congal
Smile ECS


