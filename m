Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA5960116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so492843wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IqWAHDrKYjEQYFV/dXFvjxvgLfNXbdDtUxUuAnZ+9jU=;
	b=jwKBmFd7zlNHpivzTM3b2XYPuiH4vc7vg0XJT6EKyvjL4HuaeBfPU2nbWM3dWf+qN/
	uBMrBAxha+/o4SSkvjEAU30puB+cJnwZrC4eEs8AMf97bf0Ya6dRjBNHHlimzNM4J0Xk
	2o0NOmFBYRGUPZ6WZi2mKlHfMe3dPpTpqV7GhkezU18CJX1HankPF92Mem6nSnTh59D6
	Ui8mJjl7VP+q+P4vzM++7Cutbsg984Jcgm9SOICSLOlwgqEbQRF/v8WADjIjQJTRAjwn
	ie+wj1umeWAgTY8iMY+RnL/dviJKAUjUhc6xQ2TpOtnXMN+hGpmkJMVKTYrfJyuEwuFO
	6n8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IqWAHDrKYjEQYFV/dXFvjxvgLfNXbdDtUxUuAnZ+9jU=;
	b=CaxtFmH6suCVB7mr01R5gTs6SiRy1KAQU88TlRp+H4UWueAlN3bf7OGo4R9k1EGGsg
	pmF1aY/jdauD+cmJkFO3IQURTAjVnNyWJU+P2uzX0FexOeZGiIpb6sZH72mu9BOIBz0A
	QSfowuRljTdL+/LUkYOT29TPWbvlrCp7majUpGXyBDlzBE57nmuwa2Ux6M3bs/FC717O
	ILziX7cS9DvNxSuWGXjHkUIJQt3h7F/D7kCiv8GJ1qiuFYGPNjIq1vB9RlB4B4hNEFpO
	pg7BWd14rhvCAo8cmZyV25UIuvMye4DuK7NMPK4/AavpNzmqJqVxRcNbd9cJDfduB2Mx
	gJ5g==
X-Gm-Message-State: AD7BkJJLsiZRe/kSrO0UGf578Rdcaa53f48r3Z1BsEsbIxrgMZGFLi1RMhHKEDmKzSqIrQ==
X-Received: by 10.28.55.139 with SMTP id e133mr12106106wma.98.1458235175359;
	Thu, 17 Mar 2016 10:19:35 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:21 -0700
Message-Id: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/8] gobject introspection fixes
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:37 -0000

Main change to avoid use of DISTRO/MACHINE_FEATURES_BACKFILL for
gobject-introspection-data (it's not appropriate, since gobject
introspection was not previously enabled by default).

  http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-features-backfill

Andre McCurdy (8):
  bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
  default-distrovars.inc: add gobject-introspection-data to DISTRO_FEATURES_DEFAULT
  qemu.inc: add gobject-introspection-data to MACHINE_FEATURES
  arch-x86.inc: disable gobject introspection for x86-64 x32 builds
  qemuarm64.conf: don't clear MACHINE_FEATURES
  gobject-introspection.bbclass: wrap comments at 80 columns
  gobject-introspection.bbclass: make additional DEPENDS conditional
  gobject-introspection.bbclass: mark as machine specific due to COMBINED_FEATURES

 meta/classes/gobject-introspection.bbclass      | 29 +++++++++++++------------
 meta/conf/bitbake.conf                          |  4 ++--
 meta/conf/distro/include/default-distrovars.inc |  2 +-
 meta/conf/machine/include/qemu.inc              |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc      |  2 +-
 meta/conf/machine/qemuarm64.conf                |  2 --
 6 files changed, 20 insertions(+), 21 deletions(-)

-- 
1.9.1


