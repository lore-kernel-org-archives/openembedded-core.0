Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E30DC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2445.1702390154295941494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5FF8143D;
	Tue, 12 Dec 2023 06:09:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2B403F738;
	Tue, 12 Dec 2023 06:09:12 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 0/9] Let autoreconf run gtkdocize
Date: Tue, 12 Dec 2023 14:08:11 +0000
Message-Id: <20231212140820.2900963-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192194

From: Ross Burton <ross.burton@arm.com>

Hi,

This series is the result of a distraction whilst yak-shaving on autoconf=
...

Essentially: let autoreconf run gtkdocize, instead of running it by hand.=
 This
needed some small fixes but mostly removes special-cases.

There are some followup patches needed for meta-oe, which I will send whe=
n this
is merged.

Ross

Ross Burton (9):
  nativesdk: ensure features don't get backfilled
  glib-2.0: no need to depend on target gtk-doc
  autotools: append to EXTRA_AUTORECONF
  autotools: don't exclude gtkdocize
  gtk-doc: remove obsolete logic
  gtk-doc: don't use docdir set in environment in gtkdocize
  gtk-doc: don't manually call gtkdocize
  kmod: fix configure with autopoint calling gtkdocize
  util-linux: ensure gtkdocize isn't called

 meta/classes-recipe/autotools.bbclass         |  2 +-
 meta/classes-recipe/gtk-doc.bbclass           | 21 ++----------
 meta/classes-recipe/nativesdk.bbclass         |  3 ++
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 ++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb |  1 +
 meta/recipes-core/glib-2.0/glib.inc           |  2 --
 meta/recipes-core/util-linux/util-linux.inc   |  3 ++
 ...01-Don-t-use-docdir-from-environment.patch | 24 ++++++++++++++
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |  1 +
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch | 33 +++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_31.bb           |  3 +-
 11 files changed, 90 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.pat=
ch
 create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdi=
r-from-environment.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch

--=20
2.34.1


