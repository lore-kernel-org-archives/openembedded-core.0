Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89400C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 10:32:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10083.1678357953051079081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 02:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bsnXhS4u;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q16so1364385wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678357951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MKKfQsh9Hc2Wwai9OepuZvDljP7WixFs56zJmHcLTdA=;
        b=bsnXhS4uMt/I48APwKuLSvRyVhZEVQIktImTsT/nPIsngYd+E3HyqsfmKN+bx9m84r
         ZijE0YKqNX/kn87/Ar33N5OeT3vl09pivSfJeYDPoEP2mAhvmqhTrXXTyxsa+W6uPgm9
         5dy9UuJGjAi3Ov+VE4q8CRkRs9fe90NEQeXmtWQnWFgf6h2HSkXibEbHoHgI5vmXfX5q
         3bThYZL7+tkginIL3OvTOyrWfo+ZFG0ZXYH+M3X4qp08OzIQRsp6o9hm/sxpE4ZaW047
         yo04SQXFJqSJ/ra7/Q853tIGOM038o2h0ssz309iBXwheBm0U56S3OLuL8JwQY9b64yV
         SNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678357951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKKfQsh9Hc2Wwai9OepuZvDljP7WixFs56zJmHcLTdA=;
        b=GuAtpUekxlkmaa2W1jhnPvWt4FAkfg8MvGn5Qe2SPHIgUpLTjqcrDXHM+pMKZqCjp4
         bwTSY7aZyciupYfiIChWbHMZeghQOMmIN9iQ88yu2ojHbSiQD7lDCAubndQANyxMtbAh
         K7aN1p/02vBxxIW24YAYZTWrMXcH09emUIB7S8ZUBpwHQ0xkvM2qnxscX91FeRvacdxE
         XgQZyVZiuIyjfcGEO0swaY/IqNg+JshTTO/hLCtoGihn51EKf+fGjbd3gzgNXIdL2nUb
         XLREdaSrFIG4wgLqyxxbRKwKgFNTXGtl5eCwddHw6qkVl4z1hpCwJBGx6HBgC2Ze9nHh
         IjTw==
X-Gm-Message-State: AO0yUKWltLK2mu5Wnb1HCJxIAYCawFPYK8i3wCzuvauGVJS9rmWofcrP
	WzWtVQAgdrxhT7V0VtaGoD1k4N53gxE=
X-Google-Smtp-Source: AK7set+EpRGV4MwH1m9IO91DvFuPTROcUilItJMEdR+hda6gnmtOaXp7umIv/9HqJD64aq+JpOCyJg==
X-Received: by 2002:adf:edc8:0:b0:2c7:adb:db9 with SMTP id v8-20020adfedc8000000b002c70adb0db9mr13357901wro.63.1678357951164;
        Thu, 09 Mar 2023 02:32:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d408e000000b002bfd524255esm17410627wrp.43.2023.03.09.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:32:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] staging.bbclass: run prepare_recipe_sysroot after unpack, not fetch
Date: Thu,  9 Mar 2023 11:32:25 +0100
Message-Id: <20230309103225.3110783-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178217

Otherwise nasty races between unpack and prepare_recipe_sysroot can occur:

ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISAB=
LED=3D1; export PATH=3D"/srv/work/alex/poky/scripts/native-intercept:/srv/s=
torage/alex/yocto/build-64-alt/tmp/sysroots-uninative/x86_64-linux/usr/bin:=
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/=
4.7.0-r0/recipe-sysroot-native/usr/bin/python3-native:/srv/work/alex/poky/s=
cripts:/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-=
native/4.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-linux:/srv/storage/ale=
x/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/recipe-=
sysroot-native/usr/bin:/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64=
-linux/libslirp-native/4.7.0-r0/recipe-sysroot-native/usr/sbin:/srv/storage=
/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/rec=
ipe-sysroot-native/usr/bin:/srv/storage/alex/yocto/build-64-alt/tmp/work/x8=
6_64-linux/libslirp-native/4.7.0-r0/recipe-sysroot-native/sbin:/srv/storage=
/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/rec=
ipe-sysroot-native/bin:/srv/work/alex/poky/bitbake/bin:/srv/storage/alex/yo=
cto/build-64-alt/tmp/hosttools"; export HOME=3D"/home/alex"; git -c gc.auto=
Detach=3Dfalse -c core.pager=3Dcat checkout -B master 3ad1710a96678fe79066b=
1469cead4058713a1d9 failed with exit code 127, output:\npython3: error whil=
e loading shared libraries: libpython3.11.so.1.0: cannot open shared object=
 file: No such file or directory\n', None)
DEBUG: Python function base_do_unpack finished

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/stag=
ing.bbclass
index e6d0d1d55c..ade5c03cd9 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -647,7 +647,7 @@ do_prepare_recipe_sysroot[deptask] =3D "do_populate_sys=
root"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
-addtask do_prepare_recipe_sysroot before do_configure after do_fetch
+addtask do_prepare_recipe_sysroot before do_configure after do_unpack
=20
 python staging_taskhandler() {
     bbtasks =3D e.tasklist
--=20
2.30.2


