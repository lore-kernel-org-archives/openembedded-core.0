Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60C110F284F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 16:49:46 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77239.1774630177980690758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 09:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=PUvSJZ0m;
 dkim=pass header.i=@valla.it header.s=default header.b=J1kjExCf;
 spf=pass (domain: valla.it, ip: 185.56.87.12, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1g6z.prod.antispam.mailspamprotection.com; s=arckey; t=1774630178;
	 b=IpSdVJn10UYREVtmGix+ADX7AHCq+1kRLyRAIKNOSUAuJB/LYxKppCuZ1ElPB7wmCz6Ejejzxq
	  f7zfWW9judx3kYTm+hdEOCxhvihbWeTCOEpZvtS6ndnIUWopGlK1FRXr66RVWadGKNF/K6D6Ii
	  homkDIsQ1b1jPfIVv9nLhLjboxK4RN4efzb5/wM1IdFYb6smUjG+Cd61SterrPavjasL/91+pI
	  PLjWIlQ6oCCREPCr8fjlmlpI9TBKLQX1Fv/f1zJNrVmxRpSQN2A6doevLk4JOio6vFI4x8aH9v
	  ROiEYDC5kQbcu7LVoI0Bqg9QRMFr5kdJhK+IHjImWf0Qjg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1g6z.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1g6z.prod.antispam.mailspamprotection.com; s=arckey; t=1774630178;
	bh=44hoAR1nK9rR/Zul0GLkYkqIM1Mq0Kg14gisEqEtzY8=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=IY2Wq18EM+6+gaB/i12u2BVgd4sDu1neJgPDHIjOuDYD5fHzOBhb9qsBdy5AdaT9KbpsDyaV5S
	  dJOgWc88Yjzmb+YJCw7O9DYvqSU0GVXuMyV8OCgL4iCmh8Cy8VUoW3Ko5Gl9i77niBKOdiQY9N
	  m1qy1d0wlqvH1zCX6oXonzzbhp36i8RvEdKLS1O4EReUIEkxxwLCeiuGivCAuN0gG+ZTPMB+rZ
	  d0kJt+VjvhZdI/Z+zNBNcjGAHh7NCSW1sT73pohnPm+xfDeRvJJsWVohX+R31NwgS9JbCDChln
	  9jNChTmv+JYdIV6wB6ngmwYh9m0bqImzDy89eaGb0Y6pUA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=AnKxatXdlDIN0qWItFCkLJe2eivHM+DLzBkAzJe9Cf4=; b=PUvSJZ0m3eS4+13xBl5e6YGbmd
	LNYMlyIqq1Jnu8f0eKd5AWJjWsQ0U0NyRb2QQik0pRSzuH0gHRHQB0z0SLBkE4OcjpA/1kcwbWGng
	cwJEyZ9HUgB8wCWdB9um98fDmzTwxN6R647oeK+Udw6t6jv6Vfr3jsu6SeZmbrGfF/2A=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1g6z.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANJ-000000090jw-2cdi
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Mar 2026 16:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=AnKxatXdlDIN0qWItFCkLJe2eivHM+DLzBkAzJe9Cf4=; b=J1kjExCfVoovv42OD0qUCdK6BU
	Z+D+2YOHkX9XL3F/aXoT2GWJVFzTPZBilo+Q+oBL09FhmgWSI9xrgboqEs52fJepjbO52UTsakw0L
	muKc7j/i8F5528sQLzQ9C4WsxEo+sj46E6+KsCEjqAwek9bdTJnQ8D3xa+aK8h4wU/2A=;
Received: from [95.248.129.24] (port=61428 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANC-000000007CG-49TO;
	Fri, 27 Mar 2026 16:49:27 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v2 0/4] Add support for bootconfig on initramfs and FIT
 images
Date: Fri, 27 Mar 2026 17:49:12 +0100
Message-Id: <20260327-bootconfig-v2-0-891975014056@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NywrCMBREf6XctZG8bLUrQfAD3EoXSXrTXiiNJ
 CUopf9uKC5cnhnmzAoJI2GCtlohYqZEYS4gDxW40cwDMuoLg+Sy5kqcmQ1hcWH2NDDdoHVcKiF
 OCsrgFdHTe5c94XG/QVfCkdIS4mc/yGKvfq7LvysLxpnRva4bpzy35prNNJkjLdBt2/YFrDMBn
 agAAAA=
X-Change-ID: 20260318-bootconfig-47ebc0231153
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4824; i=francesco@valla.it;
 h=from:subject:message-id; bh=44hoAR1nK9rR/Zul0GLkYkqIM1Mq0Kg14gisEqEtzY8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnHtgrEdCatlyhIPL9PLtra8XEOq9pfyxOdD3M6JJw50
 z58MDrSUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAEwkYREjw4fww4ET3oqfeFsq
 6JXG3LnFtFKE03jrevabAv+fcZWU5TD8Dzp9+/v1s/yWt7RvJ62ZukHxVWejjMK03lvy/ZpLWPj
 OcQMA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f652ba39cfe609fc097bd5d2d8a43938
X-AntiAbuse: ID - f652ba39cfe609fc097bd5d2d8a43938
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w6ANJ-000000090jw-2cdi-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1g6z.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234096

Hello,

this patchset introduces support for attaching a bootconfig block both
to plain initramfs images and inside FIT images. The bootconfig is
built from one or more source files, that can be configured globally or
per-image.

If multiple bootconfig source files are specified, they are combined
before attaching the bootconfig block to the image (or FIT). Combination
is done through a simple "cat" operation (and the bootconfig tool will
then do the magic).

== Introduction to bootconfig ==

A bootconfig is a small footer that can be added to an initramfs image
and is read by the kernel at startup if the CONFIG_BOOT_CONFIG option is
set. Its content can be used to expand the kernel command line even
beyond its canonical size limit.

An interesting point about the bootconfig mechanism is that the
initramfs image does *not* need to be there for the bootconfig to be
read, as its presence is always checked starting from the bottom of the
declared initramfs area.

More details on the bootconfig concept can be found at [0]. 

== Patchset walkthrough == 

Patch 1 adds a new recipe to compile the tool used for bootconfig
management; being this part of the Linux kernel source code, it is
compiled from the kernel shared workdir.

Patch 2 adds a new image conversion type to add the bootconfig to an
image. While today only a cpio (plain or compressed) or an ext2 image
would make sense here as a base for such operation, this is not strictly
enforced as new usecases may arise in the future. A new bbclass
containing the relevant configuration variables for this operation is
also introduced in this patch.

Patche 3 adds a test recipe containing a bootconfig that can be used for
tests; this recipe will then be used by patch 4.

Patch 4 adds support for adding a bootconfig inside a FIT image. Since
the bootconfig is always read from the end of an initramfs memory area
(even if the initramfs isn´t really there!), two forms of support are
added here, both enabled by the FIT_INCLUDE_BOOTCONFIG variable:

 - if INITRAMFS_IMAGE is set, the .bootconfig image is searched to be
   included as ramdisk section;
 - if INITRAMFS_IMAGE is not set, a dummy/empty initramfs artifact is
   created and the bootconfig block is added there; the resulting binary
   is then added as ramdisk section.

It should be noted that if INITRAMFS_IMAGE_BUNDLE is set the bootconfig
will NOT be included inside the FIT image and a warning will be
displayed.

== Usecases ==

The main usecases I can think of are:

 - (the one driving the work) initramfs-less dm-verity setup starting
   from a bootconfig included inside the FIT image and verified as part
   of the FIT verification;
 - complex tracing setups where the classic kernel command line is not
   sufficient (bootconfig is e.g. indicated as boot-time tracing
   mechanism [1]);
 - debug flexibility: no need to modify the kernel nor the bootloader
   setup to pass debug arguments to the kernel.

== New dependencies == 

New dependencies are introduced only explicitly through the
BOOTCONFIG_TASKS variable; tasks specified there become dependencies
either for the initramfs image (if INITRAMFS_IMAGE is set) or the FIT
image (if INITRAMFS_IMAGE is not set but FIT_INCLUDE_BOOTCONFIG is).
 

Thank you in advance for any feedback on this!

Best regards,
Francesco

[0] https://docs.kernel.org/admin-guide/bootconfig.html
[1] https://docs.kernel.org/trace/boottime-trace.html

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
- Support for multiple bootconfigs
- The bootconfig recipe has been renamed to linux-bootconfig-native;
  this tool is no more buildable for the target.
- Link to v1: https://lore.kernel.org/r/20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it

---
Francesco Valla (4):
      linux-bootconfig-native: add recipe
      image_types: add bootconfig conversion type
      recipes-test: add bootconfig-test recipe
      kernel-fit-image: add bootconfig support

 .../recipes-test/bootconfig/bootconfig-test.bb     | 20 +++++++
 .../bootconfig/bootconfig-test/bootconfig-test.txt |  6 +++
 meta/classes-recipe/bootconfig-config.bbclass      | 12 +++++
 meta/classes-recipe/image_types.bbclass            | 28 +++++++++-
 meta/classes-recipe/kernel-fit-image.bbclass       | 48 +++++++++++++++--
 meta/conf/image-fitimage.conf                      |  3 ++
 meta/lib/oeqa/selftest/cases/fitimage.py           | 63 +++++++++++++++++++---
 .../linux-bootconfig/linux-bootconfig-native.bb    | 31 +++++++++++
 8 files changed, 197 insertions(+), 14 deletions(-)
---
base-commit: acf86cc2af1d08fdf191209f1462b2eafb53d3bb
change-id: 20260318-bootconfig-47ebc0231153

Best regards,
-- 
Francesco Valla <francesco@valla.it>


