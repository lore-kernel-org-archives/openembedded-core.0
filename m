Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D17C4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 18:58:01 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4967.1784573873476208320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 11:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ITTV+IHT;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4637; q=dns/txt;
  s=iport01; t=1784573873; x=1785783473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FkZ7cmGfYCNPRmkOq9//bTOvq9cWSbCSgNrRiKZEsm4=;
  b=ITTV+IHTDAf64npqYa0rDABX+J4EU7r7OxgCoqL9iPUYVPIhLvXNYY36
   jRZ+nFiYmtSSg2Coy/+p69lreY+ThIARwbFyccP82P41Rpl6nFUvJntYZ
   3C6s0PgUDzyC6Lr9MQKQ/16WE0xZhl7kW/2JKsIfW5Xoazt5rh33wW/D3
   f7guphz3EG51VwqU7B041r3F5M4bfDQB98n2wwC7Tsr22mBWxNsrRNdpg
   F0QqxDJkbBgXuXV8ShmYdQb/33Xg846VZYO1qryRBt6ydkNQmDFCi2Emy
   U4A028/KqlVQKmKMpaL+m1GMjer2w7iZa0m631RNlXGVj8ARcBCgBLtMX
   g==;
X-CSE-ConnectionGUID: KN/envRORWCgh0KV1NQKjQ==
X-CSE-MsgGUID: YsEyL/gUSBSd3OyCT6wtyQ==
X-IPAS-Result: =?us-ascii?q?A0BbAwAfbl5q/5H/Ja1aglmDS15DSZNZAYJwnh6Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02ARgBGxIwXESDAgGCdAMRuzAaN4IsgQGDKAGBVNs6FQWBM4U/i?=
 =?us-ascii?q?CB1hHwnGxuBcoR+gmECgUgJhlQEgiJ6EoR0jH1IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEdCMfAzl/gS91SnctaQESF4EmghICg?=
 =?us-ascii?q?TsCEwMLGA1IESw3FBkEPm4HjUEjgTyBBBZlCQsrBRILNCUfFSgsEBkFEwqTJ?=
 =?us-ascii?q?5ItoQ8KKIN1jCGVOhozqmyZCI4KlTYxDF2EaYFoPIFZcBWDIglKGQ+OLRaDY?=
 =?us-ascii?q?M5aJzILMgIHAgcOAwuRai2BTwEB?=
IronPort-Data: A9a23:EbcwvK1LgxXnThsJBfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzwFm
 jNKWjuOOqyNYWv9f41zaNvn9R5SvcXWmoVrTgNp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpKg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGL2dxMIsGwMFNPkpB9
 aQ7FmkrVzOBvrfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+OW0a4CPJ4DTFa25mG6pv
 U/X2yP2PyowD9DE7iuuziyzmv72yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:wh+VXKxRmRW6f6ZwhhLXKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qBHnlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AUOMEi2hCIdd9gNN1NBUL2OZQujJuUVuawXHOGWi?=
 =?us-ascii?q?CNk1mSOW2dwa2wYBmqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1jgoeg76bc8eTy2+za/FOMmyxoxZ+Im/LAcCrK4?=
 =?us-ascii?q?sgMXfEj1bB2mCkCWOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="513225418"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 18:57:52 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 759B1180001C8;
	Mon, 20 Jul 2026 18:57:52 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 1D8DBCC12A6; Mon, 20 Jul 2026 11:57:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>
Subject: [OE-core][scarthgap][PATCH 0/8] openssh: Security fixes
Date: Mon, 20 Jul 2026 11:57:41 -0700
Message-ID: <20260720185749.4098075-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241480

From: Devansh Patel <devanshp@cisco.com>

This series backports security fixes from OpenSSH 10.4 to the OpenSSH
9.6p1 recipe in Scarthgap. The relevant upstream fixes are carried as
individual patches instead of upgrading the stable-branch recipe.

- CVE-2026-59995: Command-line SCP downloads could use a path controlled
  by the server. Fixed by retaining the client-selected destination path
  rather than allowing the server response to redirect the download.
  Upstream: https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b

- CVE-2026-59996: A remote glob could return ".." during remote-to-remote
  copies and escape the expected path handling. Fixed by rejecting the
  parent-directory result, matching the existing remote-to-local
  protection.
  Upstream: https://github.com/openssh/openssh-portable/commit/36480181fa22f98e180b4f9e10203480c0346c78

- CVE-2026-59997: The internal-sftp server silently dropped command-line
  arguments after the ninth argument. Fixed by passing the complete
  argument vector to internal-sftp.
  Upstream: https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014

- CVE-2026-59998: Some environments require special consideration when
  using GSSAPIStrictAcceptorCheck. Fixed by documenting the configuration
  caveat in the upstream manual page.
  Upstream: https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79ec926221fbe6fcc296d432

- CVE-2026-59999: DisableForwarding=yes did not override
  PermitTunnel=yes. Fixed by including tunnel permission in the
  DisableForwarding policy enforcement.
  Upstream: https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753

- CVE-2026-60000: Multiple RFC 4462 GSSAPI authentication issues caused
  different behavior for valid and invalid accounts, incomplete
  MaxAuthTries enforcement, and a moderate pre-authentication resource
  denial of service. Fixed by aligning failure handling, applying attempt
  limits consistently, and adding missing error logging.
  Upstream: https://github.com/openssh/openssh-portable/commit/5d04ca6af739b82fd30d84d2783ca802ebfa1192

- CVE-2026-60001: GSSAPI and keyboard-interactive authentication paths
  did not always enforce the minimum per-attempt delay. Fixed by applying
  the delay consistently to the affected authentication failures.
  Upstream: https://github.com/openssh/openssh-portable/commit/d43ba60c91cb323ca921049b7d43b1908c318454

- CVE-2026-60002: Several pieces of client state had incorrect ownership
  or lifetime, including a cached host key that could be freed too early
  and subsequently used. Fixed by retaining connection-scoped state for
  the full lifetime of the connection.
  Upstream: https://github.com/openssh/openssh-portable/commit/e8bdfb151a356d0171fea4194dd205fbb252be23

Each fix is kept in a separate commit for independent review and CVE
tracking. The OpenSSH recipe applies the patches in series order.

Validation:
- Built openssh successfully after applying the full series.
- Built core-image-minimal successfully with ptest packages enabled.

Devansh Patel (8):
  openssh: Fix CVE-2026-59999
  openssh: Fix CVE-2026-59997
  openssh: Fix CVE-2026-59998
  openssh: Fix CVE-2026-59996
  openssh: Fix CVE-2026-59995
  openssh: Fix CVE-2026-60001
  openssh: Fix CVE-2026-60002
  openssh: Fix CVE-2026-60000

 .../openssh/openssh/CVE-2026-59995.patch      |  42 ++++
 .../openssh/openssh/CVE-2026-59996.patch      |  37 +++
 .../openssh/openssh/CVE-2026-59997.patch      |  58 +++++
 .../openssh/openssh/CVE-2026-59998.patch      |  34 +++
 .../openssh/openssh/CVE-2026-59999.patch      |  36 +++
 .../openssh/openssh/CVE-2026-60000.patch      | 140 +++++++++++
 .../openssh/openssh/CVE-2026-60001.patch      | 130 ++++++++++
 .../openssh/openssh/CVE-2026-60002.patch      | 226 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   8 +
 9 files changed, 711 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch

-- 
2.44.4


