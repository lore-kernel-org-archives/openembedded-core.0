Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id D560177032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:43 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17211394igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hFifYHU4yEtX4JxXMObgPpkkU40KkY90X+Q42gjB0po=;
	b=aGqxBliVlmnJnq9gignb+q4hRcFrWQr9EV6XtbIcmtHcUpPIqN/Kff3yfPHp7Y/06y
	Dr1BM+9daMBgPt9dWIqJMICAg6sXH0VgTel8nrvGY8GRtjwG8fOLg/RZbKXgTszA6+b0
	1i10qP+9Ko6CpEERFqybdRlPXyoTUpivIP7hgL+lc8rMWU5IjJ+hSkSsbEPgV/nCwpeV
	oXcujKJh/IzdQDcdbSDC0It5WL/zSGkTdjLNsVuoyALQ5JX08vTIjLgRKkw7rWWch7KL
	6CXOpPFPnQCtVPOur6Z8wGzhE9YjBHkhALYDSKX8kZ9ENkBMcYacRT31P8I/rqFTd1bA
	qcVg==
X-Gm-Message-State: ALoCoQkus4j2JDt+HWtiNauKAvPXtq8pvyLP8HbGHzk1RUfVvs3GVGLg3Aw7MgcLfaOnAShZ5pfM
X-Received: by 10.50.43.227 with SMTP id z3mr3668518igl.22.1441208923899;
	Wed, 02 Sep 2015 08:48:43 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:43 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:46 +0200
Message-Id: <8536bdb4d01fa140bde6da2c5e3a8665f5d1f2a9.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 10/10] boot-directdisk.bbclass: use rootfs UUID by default
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:44 -0000

This changes the default SYSLINUX_ROOTFS such that the rootfs is no
longer expected under a fixed device path. Instead, the UUID is used
to find it. This makes the resulting .hdddirect (and thus also the
vdi/vdmk/qcow2 images derived from that) more flexible.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 600e21a..7cb0ab0 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -60,7 +60,7 @@ inherit ${EFI_CLASS}
 
 AUTO_SYSLINUXCFG = "1"
 DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
-SYSLINUX_ROOT ?= "root=/dev/sda2"
+SYSLINUX_ROOT ?= "root=UUID=<<uuid-of-rootfs>>"
 SYSLINUX_TIMEOUT ?= "10"
 
 IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "true", "false", d)}'
-- 
2.1.4


