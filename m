Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B985DC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 17:18:16 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.683.1790183882836878670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 10:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=XUVYBgbt;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTPS id 68NHHxwP352678
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:17:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1790183879;
	bh=Y8XlW0/u6qk1q8Whk0YWBvwRZ6cWcQ5hvi3I3a/TjGM=; l=1285;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XUVYBgbtr2/0VC70MlFDhLy5kH/sh4ukLy/YPWm6gmvN6WIjDkDN2cLrjN1YElp0q
	 K+fIPhrRCYrDHkgbyZp9UZA81H+YPhiPos+na2jKrwqNsCa/CZY27sIWoZVjdMR1+j
	 ezu0MVlp5nP6xsI4lsyjQuDG+jcs1b7+Sw3Z34m+XuVCTGumG5UAf4yEEra1bzOMNf
	 Oc+DDOz1F7vKNghRIwKdN5C2TZZhco+txWRUPQnBm9aXX0vjAUzVvTYLO4JgcFoNhg
	 PpsCrCEGmTs0svIvkpWQs/VlnolAYqKXl9J17LEpSh9QKKvZ+SN4QldSgfYYxryNS0
	 +kLeBIBvhRsCg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTP id 68NHHqFQ868670
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 23 Sep 2026 19:17:53 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id LNWJFAAWUM; Wed, 23 Sep 2026 19:17:52 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTPS id 68NHHqp8343844
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 23 Sep 2026 19:17:52 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.99.5)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1x9QbQ-00000003Dsd-0oX4;
	Wed, 23 Sep 2026 19:17:52 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 8/9] classes/cargo-c: pass flags via
 CARGO_BUILD_FLAGS
In-Reply-To: <9921B090-ECA9-47CB-B05A-E32EF3925FB1@arm.com> (Ross Burton's
	message of "Wed, 23 Sep 2026 16:55:33 +0000")
References: <20260804165803.598030-1-ross.burton@arm.com>
	<20260804165803.598030-8-ross.burton@arm.com>
	<lytsnnzvp1.fsf@ensc-pc.intern.sigma-chemnitz.de>
	<9921B090-ECA9-47CB-B05A-E32EF3925FB1@arm.com>
Date: Wed, 23 Sep 2026 19:17:52 +0200
Message-ID: <lyjyobsx8f.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 6ab409c08721c0ca765d4580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 17:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246533

Ross Burton <Ross.Burton@arm.com> writes:

>> Most/all of these flags are not supported by cargo and will break
>> recipes which use it directly (e.g. by inheriting the ptest-cargo
>> class):
>> 
>> | ERROR: ... do_compile_ptest_cargo: Unable to compile test with cargo, '.../cargo build ... --destdir ...' failed
>> 
>> It would be better to define and use a dedicated variable
>> (e.g. CARGO_C_BUILD_FLAGS).
>
> Ah. Is there a recipe in a public layer that can be used to demonstrate this?

not that I am aware of; I find only one public user of cargo_c:
rust-c-lib-example in meta-selftest/recipes-devtools/rust

But doing

| --- a/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
| +++ b/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb
| @@ -10,5 +10,6 @@ SRC_URI = " \
|  SRCREV = "fc53c457f69aa5221ec1f8619a007e8150db5e60"
|  
|  inherit cargo_c
| +inherit ptest-cargo
|  
|  require ${BPN}-crates.inc

shows the problem.


My usecase (with non-public sources):  rust project is

| .
| |- Cargo.toml
| |- src/
| |  |- lib.rs
| |- examples/
| |- project-c
|    |- Cargo.toml

C dylib is built by

| cargo cbuild --package project-c ...

while examples (shipped as ptest) require

| cargo build --examples



Enrico

