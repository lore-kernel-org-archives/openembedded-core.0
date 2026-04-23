Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466F1F99360
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 09:23:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15614.1776936175465463703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 02:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn.de header.s=google header.b=ISyGHwaI;
 spf=pass (domain: bisdn.de, ip: 209.85.128.47, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a525dd2b5so4001235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn.de; s=google; t=1776936173; x=1777540973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NrpCds5xs7+qk1qLLUpzfOONj6EMciE6Uz7q7YgXV6o=;
        b=ISyGHwaIg/1VjEbUw/J8o4hHbNh+NchuCvMZ5q7yT4hfSLQUalY4wPCEXUkSybY+dh
         dMaM7DSxU2FuYfp0w5mzayXoKZuhQWGAZIAfcNoGSZFYkAsgAyv+V/tZ4RbeVWiJzO+2
         z0Fewbc9F/UbrHoTtK4boKtIpYAgEI5rr4qq6YvGN0QGKF1aPiP5342FTtU1GjsIi2RT
         8Vhx32qkPBeoVMfw1y2yqor8/PqDsaewU5JUsbqFIFwZjhmytNzBwqrahTA8FaAjjvhD
         bVh3op/SPkRhXMdcC2UomarrV3aNoHaoA0509EgHkrDYRB76Obk1od+cQOSJxk9XNlJq
         LI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936173; x=1777540973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrpCds5xs7+qk1qLLUpzfOONj6EMciE6Uz7q7YgXV6o=;
        b=lMyK/g23gFTs+giLz/NjKUFI8QD96zdfqM1dZHZZyFuRB7qpzIlGhr2uQy99ITyZHv
         XwYXMyde63Ks31YWufdrHfel80dC7s2trXswf1AllR9W8i00Wn1OtvINKJqQlS7WZsoq
         hZ1SwHKgT6dDWGkWzBv6kxAUHje7vok4+ruJD7Zy1q+ZsS9zTb+Sl7byq1xvfi0+UfV5
         ZjPqzRRnzEVSMaMQefF2vqDUNkSQZMXrSMFkBYsGU/ve1kxk6glGAZEoz6z+zhtuypVB
         YU2Wn5x+yzTV3skyS5X22mY9A8aEa+tMYqm2si83XiI5/UscNkxh8hgCzQnrjhB4/dwl
         BnMw==
X-Gm-Message-State: AOJu0YxRoWG4Or/wa813Uj1LFhiNE4XF2RoIQHNWCAqJjLDzlmkCYX/f
	sA1hqTRKI8sG6zuzoZau9dz9Ntn/0Ws43N3iATQL5KWi+FURZr3pRo60+2pfsZ5X0vrhq/eX0Mq
	2YCT66aGm3wjwEJ0+srkExPl8ivUoYqAklbWxnT2bbw7kk8wtzhi9eGiCX6c53hAeahHo10P4Q/
	5ucrvnz0m7PuUP
X-Gm-Gg: AeBDies9xF9zowa4b+431qqpjuc4znP8y2u5ynD6zfwtfS2VQXOerZmaN9JczQ6tNs1
	iZLK9MompATJDfvLxopCPKhTzd6bMLmmLWpthvyUeEgn49wE06TZdkAGQGE/ZRFZbqW4MKp7m+W
	9jjNufP1tu9kcEgEug9UBeQIVzMO12HPadd9EF/BBUAZKyk6eGDt7zt2prP3RCjbfpNkLm3O5Jh
	2lzmWdVQGxOfSNU0HIfqN96tVEPg39VfDhuFQAL1SCfPWsWZ/NwL3qEIpeP0jkWcqd5Uv4MI40L
	T9W6HEOYUqjhbbabRldFSGSTmC0XSydyvla2t7+jYsl5T2EH6BfUGqZgYRfsqgNrkhrLpPPPCQM
	jr+CT0vHsOUJVYf1ubNR/xxOUVTWEMbY6DmEYdkKDxp3DuyeQRrELJ6cjXGhsd9i3/Ye0soGxIz
	/nockbB0ToGlQLv9wg4jPZ4MgomGHq/2UYAN4RWg/ssPlegd8JSpt2LDuz2g7Z8/BMvZT03m8nE
	Ec91/qVtcMaNScuGo0aHNZveA==
X-Received: by 2002:a05:600c:4fc7:b0:486:f634:f2e with SMTP id 5b1f17b1804b1-488fb7864f4mr195226665e9.4.1776936173179;
        Thu, 23 Apr 2026 02:22:53 -0700 (PDT)
Received: from localhost (dslb-002-205-019-021.002.205.pools.vodafone-ip.de. [2.205.19.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7bf696sm157128585e9.32.2026.04.23.02.22.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 02:22:52 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel.bbclass: copy scripts/mod/modpost to STAGING_KERNEL_BUILDDIR
Date: Thu, 23 Apr 2026 11:22:42 +0200
Message-ID: <20260423092242.324644-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 09:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235752

Copy the scripts/mod/modpost binary required for creating Module.symvers
as well to STAGING_KERNEL_BUILDDIR.

Without this, external modules will fail with the following error:

| make -C .../kernel-source M=3D.../selftest-kmodule/1.0/sources
| make[1]: Entering directory '.../kernel-source'
| make[2]: Entering directory '.../kernel-build-artifacts'
|   CC [M]  .../selftest-kmodule/1.0/sources/selftest-kmodule.o
| make[4]: *** No rule to make target 'scripts/mod/modpost', needed by '...=
/selftest-kmodule/1.0/sources/Module.symvers'.  Stop.
| make[3]: *** [.../kernel-source/Makefile:1906: modpost] Error 2
| make[2]: *** [.../kernel-source/Makefile:224: __sub-make] Error 2
| make[2]: Leaving directory '.../kernel-build-artifacts'

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
I encountered this on master with a custom kernel (at 6.12), for
context, which is mostly vanilla except for some additional platform
support.

 meta/classes-recipe/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 2d8565bd5541..4714206aad59 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -612,6 +612,8 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
=20
+	mkdir -p ${kerneldir}/scripts/mod
+	cp scripts/mod/modpost ${kerneldir}/scripts/mod
 }
=20
 # We don't need to stage anything, not the modules/firmware since those wo=
uld clash with linux-firmware
--=20
2.53.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294 <http://goog_1008408251>
=20
<https://angacom.de/en/visitors/tickets>




