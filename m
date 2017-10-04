Return-Path: <matt@madison.systems>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D54D777E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 18:22:08 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id m63so6664461pfk.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iLqV6jvaPW1TrvFswaPmWMM26zQmFf6LnTqdub7NXnU=;
	b=r7FW6moI75WHyZ0KbplOq5MzAlbWX2Bi+krLcf6ElebM8QYfIJKHQN69tjs+YYS7Zm
	HaQdzw41BVTefTMHqMBTwxEc1Le/tShAu6aJGixZSJQTAA6VouHvIhCDuMdYO8H1pR+z
	Bs+LRro1fB2VRSFHob1v8GV7RgHJ8VB1IwRGqRRrf41ahrkccH9Ry5CTaszbtEgn89YR
	M9x/or+TgW8VI04B/74NAHVd3t2tSmP9UsXam/iRT//f22T/fqAFbF/KifAnpUpyq/Qe
	pHnx9i3bMy6O7RU7FYtg28vClBh6W/h8YybfZrF3jrhUWws2iSJNSKtdvu0Ot/Xp/Dps
	oXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iLqV6jvaPW1TrvFswaPmWMM26zQmFf6LnTqdub7NXnU=;
	b=s2PzdFviGT13T6dCEkvuppbtIwbRS+hIP9xk/YaM2+XIswjojzPRjqXB/dsREDU7Np
	iJaYfr+vxozy2PyFscxy1KbRsUEaGj0PCGKL+9ieTILiG5dUmBLuWZwDcET8cfvpseGP
	BUKDtpQFAXqsAczQwDeruWKgBHhfJzutDgrN5HgOCafHhKjvfxU1RsV8bxckqvDvZuIw
	k+XS+kLvVb88/odJF/6Z+6j2cKPMmt+WHsnQ+gon+lDbS8KlAfQWsdThQ56cNqKlBp0p
	F5e+WRq7msstqbZJyeQPVD0LkFKzR4qjwVjAyHoYrjCsTpgQDaMqMnAhOViugiCMO7OF
	V+dw==
X-Gm-Message-State: AMCzsaXFsTSUoqZV10v0EenSfyfvjvHV9tlCIu8a+x8C3g+Dk8ZN8M3z
	4sutek8IHRx2WEuxpwoUE+Bc4v1M
X-Google-Smtp-Source: AOwi7QCpEqqzM95Kwk2ulRJitUYTWS60idI+0HU4mH9/SwPKogu7l4UZQjQNi9CeII/CVchaBjlaSA==
X-Received: by 10.99.37.193 with SMTP id l184mr11990265pgl.14.1507141329313;
	Wed, 04 Oct 2017 11:22:09 -0700 (PDT)
Received: from ip-172-31-5-214.us-west-2.compute.internal
	(ec2-52-39-37-57.us-west-2.compute.amazonaws.com. [52.39.37.57])
	by smtp.gmail.com with ESMTPSA id
	y72sm27778884pfa.129.2017.10.04.11.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 11:22:07 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 18:21:51 +0000
Message-Id: <1507141312-10348-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Cc: otavio@ossystems.br, saul.wold@intel.com
Subject: [PATCH v3 0/1] go-runtime: prevent host leakage into target objects
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 18:22:09 -0000

Updated patch for fixing go builds for musl with x86-64
targets.

New in v3:
 * Put back the Yocto bug number missing in v2.

New in v2:
 * Remove runtime support for go's race detector for
   musl targets.  Go includes pre-built binaries for
   this, which are built against glibc and lead to
   linker errors for the missing glibc symbols.

Matt Madison (1):
  go-runtime: prevent host leakage into target objects

 meta/recipes-devtools/go/go-runtime.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.7.4


