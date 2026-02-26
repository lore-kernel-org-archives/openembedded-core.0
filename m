Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD6BFD9E1E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 22:45:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82834.1772145896546821283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 14:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PxAO4uqC;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43767807cf3so955641f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772145895; x=1772750695; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYuiTwO+sVTmjCWzGyzd62vvz/DFismOwNZM2mVl+k4=;
        b=PxAO4uqCO6HhONKrHfmHukeTSvGS8VmdMDZzDBI+TN7GeloyLYQVM/5aoTG4K0dDAd
         F3qx3d+agMBqItZXbaF7YzwmH60Qte1yr79udrIaqG+YSool5V6XbTWkP2tJOCatBu0P
         2f1neNndhHuYkXJiYDYYjaPbAV0Wp/iJiM+Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772145895; x=1772750695;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYuiTwO+sVTmjCWzGyzd62vvz/DFismOwNZM2mVl+k4=;
        b=YWzJQBi7IBs15ehKmbAelKIgutBiY2qr8Jhw67RtYs7/U6nyaFjhZPFwaD5Wmect78
         ixqJGwQa4PAtfMqoJHCJhCPM6M/+4BPawEZXe0Mo1+zIwlzMMRVJH6J8/l9cK/h/23OC
         tBj1CzaoyNnnIh8RUAuoUIYigRIk82j7cI5wS0xevfcetR1TQ8gmCCGy9hrhhTewA+SX
         PI7IwwpeTAh4G8ZtSDvNAWb/vDc4ENUp4FNUOkyp6XHJTDZHn3ljUdACVsmLUg3ulEKi
         1AyIv+aAgiH2FSLLQvzhX1o5PqmzpffUMgsmYQJWaTQi/fJgFy80SBHY8TX9Eegmw302
         Sh/w==
X-Forwarded-Encrypted: i=1; AJvYcCWmUfqUk82eI4i4Y+Jd3O4+2YvDGndj8Of3dAOYVr7UpBJlSJUMyOO53ZPSRxYq/AXr6KzFj7v/XLx0dbHDrIqerg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5+eztDNBcb2NoQ6tdcrApt6xZcsUUZDRV9DznKW+CU5z62oNg
	TvpGAiSHYPNptghL0M9hajLQFARcC7gIwjOyOzGqnrOCUi3wBHlrkhfmwTXIIYXBXdI=
X-Gm-Gg: ATEYQzz+m0Nb70rlXZl8J9fx1mB7wCBHhBW5v4tPjY3ZvTNHR2JLZUrevQQBHjP0DlO
	JFk8LxkJXSzGBgGQnm43QTZ4W3Nbp/DhiXSMcIdNY6X9T+tp4S9+/RxkgtrJnIGNwNTehXAh8xR
	nr74I5g9CNkj8WQjeLnEV+62W30ZNG8uWCcYJAPSyWNYvlN452tQPVZSQoRwcBV3OIsBXj5PEWJ
	MTUPnTYZ7ulec9V1VAHh8DRTCmvWE92c2LHjDMRDG5RN4x085166yxHXBzbSVfnLV0KO+L9RNf2
	4BfoAh3FCG8CqXl0j1r5P6VNqhyrHW5Cer95C7sQ1FsMzHYQ2eZg7m1TafdXiCnHIJ1m0OwjsN4
	4YbbCUTD4YkwnmK0F/AxxH/BWPV8FKisvvpOuLrTSLdYvo/dr8FpXFxNIOwQq7kkFulMRBb/x6h
	6qkLIAXMq8SrxJqutr1Lv1UTRj7bE8ynpLbolpMAPI4bVLC/zQGT2o6kCctSQsIXJ30eBLNg7Mb
	SKiG8ek2Ap0PbC1KalSbxjuMvk=
X-Received: by 2002:a5d:64c3:0:b0:439:9214:50d2 with SMTP id ffacd0b85a97d-4399ddf204emr839351f8f.18.1772145894839;
        Thu, 26 Feb 2026 14:44:54 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f5d6sm2461582f8f.5.2026.02.26.14.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 14:44:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 23:44:54 +0100
Message-Id: <DGP9AGRGIEU6.1WRO4ETRCGSIN@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 22:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232065

On Tue Feb 24, 2026 at 5:45 PM CET, Peter Marko wrote:
> I would have a question on future of vim upgrades, CVE patches and LTS ba=
ckports.
>
> With new LTS branch maintenance, I assume that vim upgrades are no longer=
 accepted as they introduce new features.

Yes, I would have to reject those :-/

> I think that's positive change in general but it also triggers discussion=
s on items which were accepted in the past.
> This is one of things needing the discussion.
>
> When the upgrade is now allowed anymore, I think we should stop updating =
the intermediate versions also on master and do CVE patches instead (like w=
e switched also for ncurses some time ago).
> That is also reason why I updated ot .0 instead of .0045.
> They release approx. every two years and some dates from the past show th=
at it can happen that upgrade is done after out LTS release making us to us=
e a random intermediate tag in future LTS releases.
>
> Alternatively, we could also continue updating vim in LTS like we did in =
the past.

The Yocto Project TSC would have to carve out an exception for vim to
allow me to accept the upgrades. But, since vim ought to be a leaf in
the dependency tree, I think the case can be made.

> For now, there are two active CVEs in LTS releases.
> Please let me know if I need to backport patches now or if vim upgrade wo=
uld be accepted.

As of now, only the backports are acceptable from my point of view.

> Any thoughts from the maintainers?

The number of CVE applicable to vim has decrease a lot since 2022:
https://nvd.nist.gov/vuln/search#/nvd/home?keyword=3Dvim&resultType=3Dstati=
stics
From 114 in 2022 to 27 in 2025.
So, maybe the usual CVE patches backports is back to being a possible
strategy?

If we decide that we can't keep vim stable (without enhancements) and
free of CVEs in OE-Core, then its replacement by nano sound like a good
idea to me.

Regards,

>   Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Peter Marko via
>> lists.openembedded.org
>> Sent: Tuesday, February 24, 2026 17:27
>> To: openembedded-core@lists.openembedded.org
>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Subject: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
>>=20
>> From: Peter Marko <peter.marko@siemens.com>
>>=20
>> Solves 9.1.2148 (in 9.1.2148), see [1].
>> Drop patch merged upstream.
>>=20
>> Release notes for 9.2, see [2].
>> Note that almost all changes were already present in our 9.1 updates.
>>=20
>> [1] https://github.com/vim/vim/security/advisories/GHSA-9w5c-hwr9-hc68
>> [2] https://www.vim.org/vim-9.2-released.php
>>=20
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>  ...001-translation-sv-add-missing-mkdir.patch | 52 -------------------
>>  .../vim/{vim-tiny_9.1.bb =3D> vim-tiny_9.2.bb}  |  0
>>  meta/recipes-support/vim/vim.inc              |  5 +-
>>  .../vim/{vim_9.1.bb =3D> vim_9.2.bb}            |  0
>>  4 files changed, 2 insertions(+), 55 deletions(-)
>>  delete mode 100644 meta/recipes-support/vim/files/0001-translation-sv-a=
dd-
>> missing-mkdir.patch
>>  rename meta/recipes-support/vim/{vim-tiny_9.1.bb =3D> vim-tiny_9.2.bb} =
(100%)
>>  rename meta/recipes-support/vim/{vim_9.1.bb =3D> vim_9.2.bb} (100%)
>>=20
>> diff --git a/meta/recipes-support/vim/files/0001-translation-sv-add-miss=
ing-
>> mkdir.patch b/meta/recipes-support/vim/files/0001-translation-sv-add-mis=
sing-
>> mkdir.patch
>> deleted file mode 100644
>> index 37337c3d9d..0000000000
>> --- a/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkd=
ir.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From 2dd7e39942f4f7740c3a645148521d3b6b443c41 Mon Sep 17 00:00:00 2001
>> -From: Ross Burton <ross.burton@arm.com>
>> -Date: Wed, 11 Feb 2026 14:39:06 +0000
>> -Subject: [PATCH] translation(sv): add missing mkdir
>> -
>> -The installtutor target doesn't explicitly create the Swedish directory
>> -that it is going to put files into:
>> -
>> -  make[1]: Entering directory 'vim-9.1.2128/src'
>> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91
>> -  chmod 755 DESTDIR/usr/share/vim/vim91
>> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/en
>> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/en
>> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/sr
>> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/sr
>> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/it
>> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/it
>> -  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/ru
>> -  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/ru
>> -  cp ../runtime/tutor/README* ../runtime/tutor/tutor*
>> DESTDIR/usr/share/vim/vim91/tutor
>> -  cp ../runtime/tutor/en/* DESTDIR/usr/share/vim/vim91/tutor/en/
>> -  cp ../runtime/tutor/it/* DESTDIR/usr/share/vim/vim91/tutor/it/
>> -  cp ../runtime/tutor/ru/* DESTDIR/usr/share/vim/vim91/tutor/ru/
>> -  cp ../runtime/tutor/sr/* DESTDIR/usr/share/vim/vim91/tutor/sr/
>> -  cp ../runtime/tutor/sv/* DESTDIR/usr/share/vim/vim91/tutor/sv/
>> -  cp: target 'DESTDIR/usr/share/vim/vim91/tutor/sv/': No such file or d=
irectory
>> -
>> -Add the missing dependency on $(DEST_TUTOR)/sv to ensure this directory
>> -is created.
>> -
>> -Upstream-Status: Submitted [https://github.com/vim/vim/pull/19385]
>> -Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ----
>> - src/Makefile | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/src/Makefile b/src/Makefile
>> -index 75d8ff6c1c..b4c31bed60 100644
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -2487,7 +2487,7 @@ installgtutorbin: $(DEST_BIN)
>> - 	$(INSTALL_DATA) gvimtutor $(DEST_BIN)/$(GVIMNAME)tutor
>> - 	chmod $(SCRIPTMOD) $(DEST_BIN)/$(GVIMNAME)tutor
>> -
>> --installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it
>> $(DEST_TUTOR)/sr $(DEST_TUTOR)/ru
>> -+installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it
>> $(DEST_TUTOR)/sr $(DEST_TUTOR)/sv $(DEST_TUTOR)/ru
>> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/README*
>> $(TUTORSOURCE)/tutor* $(DEST_TUTOR)
>> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/en/* $(DEST_TUTOR)/en/
>> - 	-$(INSTALL_DATA) $(TUTORSOURCE)/it/* $(DEST_TUTOR)/it/
>> ---
>> -2.43.0
>> -
>> diff --git a/meta/recipes-support/vim/vim-tiny_9.1.bb b/meta/recipes-
>> support/vim/vim-tiny_9.2.bb
>> similarity index 100%
>> rename from meta/recipes-support/vim/vim-tiny_9.1.bb
>> rename to meta/recipes-support/vim/vim-tiny_9.2.bb
>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim=
/vim.inc
>> index 7cc122fe4a..73991ef2a8 100644
>> --- a/meta/recipes-support/vim/vim.inc
>> +++ b/meta/recipes-support/vim/vim.inc
>> @@ -16,11 +16,10 @@ SRC_URI =3D
>> "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${=
PV}
>>             file://disable_acl_header_check.patch \
>>             file://0001-src-Makefile-improve-reproducibility.patch \
>>             file://no-path-adjust.patch \
>> -           file://0001-translation-sv-add-missing-mkdir.patch \
>>             "
>>=20
>> -PV .=3D ".2144"
>> -SRCREV =3D "55c12373f073bacfc97d757e8f4da3daf472e4ac"
>> +PV .=3D ".0"
>> +SRCREV =3D "e7e21018fc0b60c153c8e668f696d95e574cc5a4"
>>=20
>>  # Do not consider .z in x.y.z, as that is updated with every commit
>>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
>> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-
>> support/vim/vim_9.2.bb
>> similarity index 100%
>> rename from meta/recipes-support/vim/vim_9.1.bb
>> rename to meta/recipes-support/vim/vim_9.2.bb


--=20
Yoann Congal
Smile ECS


