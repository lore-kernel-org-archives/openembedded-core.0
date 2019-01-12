Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF4B07BE17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 09:22:58 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u89-v6so15004758lje.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Hh6bu212C13cJJWQHi+/a4KIbTOKQsi99AjdUUv5184=;
	b=NVwykMX749ACVyOJgIwm8SW0JcjvMQ+bKnrpiTDXUVEljlvVdKeIgDMm+Vo3xA46Wo
	QQ0A8HswWEQ3o4ARlYK34sU7hwNGa1XGB6oRozgc5lFLvKLkmSqLmRGoNnY8dZ6EFRZy
	kFkQwA2H/5LcbRbpe0vtU4U48Hb8cZhiyHPhFe6Qyo0+2d+DreYx9KYb4lvvzkib8DnK
	79tYzuaGlbpAjzZ24I1Z63xQsqWHk+GUeQMs0ClIJqT8Q7StKp5D1nV8G+2xbFwUNdya
	EM/CpbIe5MFIPvyiPbgisADa+dhU2dFVAFhjn0ruatYjD4dmoGc53M3tdsN7/GiocHA2
	AFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Hh6bu212C13cJJWQHi+/a4KIbTOKQsi99AjdUUv5184=;
	b=q16/4zUiqS/qrtUCNeSf7cMPG0cYrt0T2xxbUPmmrglVNNTmr9RoWdlExD2eGHktEl
	busVOkCFOvPe9EwR9XWdhuelgSiL5WWY0fYLn6KeRLRXhZBdNnMZ/Smot/gSXPvlJD4g
	2mYVkLE4Ql53jyxITGSoafHQbD0o7sFuztv4C5sJltjkhYazVacZyZ6fvHcBoZuW+xug
	b3oOhswaEOJ+Ad6ozVsMJPNxDiBFoBjUx6HBxUD+BZomJgfcZXEwIOKe5Bi1461vWWWR
	0Oc6ub2IUTUI4WHGJD2IQaJTiKoHT9vL/u/+XhOofS9Sg0CJQZEXaAHWzEGQ3sw3qEU/
	nASA==
X-Gm-Message-State: AJcUukfExc9aCb5T66LeRn+RxDo9dbnnd5cvzlfA57wToTOQoTd7ixft
	ozqFA4EZTIExvsqxEIiha8tXLfEk
X-Google-Smtp-Source: ALg8bN7IqcUzqenuE60F7kpxlTLgnoKbPp7nnBqTGMg7wiq+6hE5FRHQW7SXnL32n6K3BOgHmr2JqA==
X-Received: by 2002:a2e:5054:: with SMTP id
	v20-v6mr10376066ljd.45.1547284978664; 
	Sat, 12 Jan 2019 01:22:58 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	q11sm14933726lfc.92.2019.01.12.01.22.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 01:22:58 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 11:22:46 +0200
Message-Id: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] ppc/musl: Improve support
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
X-List-Received-Date: Sat, 12 Jan 2019 09:22:59 -0000

This is followup set of improvements for recently merged musl on PowerPC
fixes. It fixes more issues discovered later after first series merged.

See individual commit message for details on each change presented.

Build tested following images with musl as libc:

  core-image-sato-dev
  core-image-full-cmdline

Boot tested using KVM-HV on IBM POWER8 and HVM-PR on old Power Mac G5.

Serhey Popovych (4):
  systemd: Correctly check ENABLE_GSHADOW with if/endif
  systemd: Use arch overrides instead of machine
  mpfr: Disable float128 when building with musl as libc
  valgrind: Mark powerpc64 with musl as incompatible

 ...user-util-properly-protect-use-of-gshadow.patch | 38 ++++++++++++++++++++++
 ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch | 29 -----------------
 ...se-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch | 28 ++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  9 ++---
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb  |  3 ++
 meta/recipes-support/mpfr/mpfr_4.0.1.bb            |  2 ++
 6 files changed, 76 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0005-basic-user-util-properly-protect-use-of-gshadow.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch

-- 
2.7.4


