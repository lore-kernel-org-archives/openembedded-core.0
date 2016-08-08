Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7D29771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:38:57 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id t127so2358767oie.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0m4nhDxb8JhXZHR1FJ0VcckK2NzAEogTnUOqZR+DhXw=;
	b=LR08rG1cEAW2rtUKPzjCJlXJCA93+vxgDp0YsW6v5RMjJ78RCM4k6huug52ZyjjmyP
	jpQH+9LCxCsbs2bs/eYaTE+7Gxt8Yc2v22EhSH/7UBG9LKLnKjyTSkGs/ecEP5UEcaA8
	wAFsKpM/KulzHV0Rhjh9ndbBxRlktdHYvFihMD2tmDMtLLJv3Tap1xdQ41Zg68GOXBLR
	QrUuaDWWWT0lMIW5vNgqejXaMFRWN5dySAaXWrt4q91zgCIFxeDPhppJ2xKpjKG6YS5f
	C3HpzGP+kPnG49lE6ED4Tw53xQrMeTHwG0YgvPDehztpwQwQ8Csf7d/8z89epkRtqSL2
	P3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0m4nhDxb8JhXZHR1FJ0VcckK2NzAEogTnUOqZR+DhXw=;
	b=kyRAidcWMFv/LH60Y1uYrFe+/jLGmj0YvAgfDk3YVuCzgUGgYqbvY11/t9NpY+AdUq
	8AiLXs2uVjKaHKEA+kA6MUpdQ5b5OjEK1XQsEETj4h12M9ZPnOS6UNh9pS8VEHiVCY8e
	a6ySHpvQFkUzQdhTeJv4G3erD0mrWCUkJMuw/S0Ae1iml3P5kA0Xg9xdhTh8+rPuH9eW
	T7ehBverBln0SloMqlrkp0dv3PwDKLFjnXxiNAdCeYSoAXghZtrkuGUxUr73wKToC1Ql
	9S9xNNFVjObg0ZQavguiREObm/57cEHBmd9Ebq9CZ7R4ADxR0H8BLrh4UuVHxWm6lSyF
	MiBg==
X-Gm-Message-State: AEkooutjCEfeJd3jozvsKTJqyL2b1xcAmll8V+ZcC8BSf7/utxI/cvojFTOvncL75orgZA==
X-Received: by 10.157.11.93 with SMTP id p29mr1408732otd.57.1470674338148;
	Mon, 08 Aug 2016 09:38:58 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:38:57 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:52 -0500
Message-Id: <cover.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 16:38:58 -0000

Add support for building fitImages that include an initramfs and booting
on x86.

* V2
 - Include Andrew Bradford's cd to $B patch since it is now required for
   do_assemble_fitimage to work
 - Fix initramfs support patch to cd to $B in do_assemble_fitimage_initramfs
 - Remove ${B} in call to fitimage_emit_section_ramdisk per
   Denys Dmytriyenko's suggestion
 - Add patch to cd to $B in do_concat_dtb()

The following changes since commit c4dda05cb9755cb865c1d1bd142196f8a9f45d3d:

  Revert "packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput" (2016-08-04 20:54:57 +0100)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core master-fit
  https://github.com/gmccollister/openembedded-core/tree/master-fit

Andrew Bradford (1):
  kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B

George McCollister (4):
  kernel-fitimage: add initramfs support
  kernel-fitimage: Add x86 support
  uboot-sign: Handle .rom signing the same as .img
  uboot-sign: do_concat_dtb(): cd to $B

 meta/classes/kernel-fitimage.bbclass | 346 +++++++++++++++++++++++++----------
 meta/classes/uboot-sign.bbclass      |   4 +-
 2 files changed, 249 insertions(+), 101 deletions(-)

-- 
2.8.0


