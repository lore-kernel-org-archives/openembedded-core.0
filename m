Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2202CCA0FE4
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 16:34:26 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.199.1693586055751498828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 09:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=m9ET6GSG;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 381GYBde851800
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 18:34:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1693586051;
	bh=7+20EpBKJIMocJdmpdqovhapZa6jOlZ8HZEFqfQ6Gkc=; l=1204;
	h=From:To:Subject:Date;
	b=m9ET6GSGLg8M65VW/xrW5wOllXZulPNgnMBfoJcHLw9XIk4JgaDma6+nv4C0uS5+p
	 YQPW48SVddJAglxJwVK6WvswkeidF6Ct3To1Rz3nzALY2PFUc8XIFqsdOHJqri8bWA
	 ZVdAvqmeucZCOVwWEdS7fwfTWMFzngH2RgLeeGyCkyCqBS30YGUl41Y0FrpmxDWefE
	 MoRzGITc1he9L/Td8hYhQxpCb/ZiCmDXaanCP69Yco+q2/d8oZYGhoNGnTivpwKXzM
	 pGz6KmQG9J8WuTzWj7OVNGEOtETrbegamd3dStwJo2ifLmstLFiO0LjHHn1vuYeVds
	 LJswS3oXVZoXg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 381GY8oU062655
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 1 Sep 2023 18:34:09 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id F0MK31OWBZ; Fri, 01 Sep 2023 18:34:08 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 381GY8m5043955
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de; Fri, 1 Sep 2023 18:34:08 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qc75z-00D49x-34
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Sep 2023 18:34:07 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: rust: why is it built in do_install()
Date: Fri, 01 Sep 2023 18:34:07 +0200
Message-ID: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64f212806f17ba9ca2857b62
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 16:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187012

Hello,

rust recipe does

| do_compile () {
| }
|  
| rust_do_install() {
|     rust_runx install
| }
| 
| rust_do_install:class-nativesdk() {
|     export PSEUDO_UNLOAD=1
|     rust_runx install
|     rust_runx install clippy
|     rust_runx install rustfmt


What is the reason to run the expensive "rust_runx" in do_install() and
not in do_compile().

This:

- is unexpected... do_install is usually expected to run fast

- might interfere with different ${PARALLEL_MAKE} and ${PARALLEL_MAKEINST}
  setup

- might slow down the build process because the 'class-native' variant
  seems to run with active 'pseudo'


I guess it is done in this way because of

|    config.set("install", "prefix",  e(d.getVar("D") + d.getVar("prefix")))

where '${D}' is cleared by do_install.


Wouldn't it be better to replace this by

|    config.set("install", "prefix",  e(d.getVar("B") + '/_install' + d.getVar("prefix")))


| do_compile () {
|     rust_runx install
|     rust_runx install clippy
|     rust_runx install rustfmt
| }
|
| rust_do_install() {
|     cp -a ${B}/_install ${D}

?


[adding 'rustfmt' to 'class-native' would be nice because e.g. 'bindgen'
 users might expect it]



Enrico

