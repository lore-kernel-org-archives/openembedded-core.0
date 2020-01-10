Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 94EFB7FD69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 17:29:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i23so1458690pfo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sj77i8neMeVu5I4SHHX8+PGU77gKyIlpCoG/elRFGHs=;
	b=d4CH9lw3EzBeF9VVwlhsKpxyIkhmhMv6WCXOk+0bjGIMdHA5HrwU+YBEprwGaB68DQ
	5GH7mIC4PSwNk79nQqapFOH8d3DXC2PbO1sD/zG7EMhdyyddkHQ8SdPa88h4Xx3/1f6K
	T22IIf9yrsrqYqlzoQRxipr7sJznaRYmtXnChUc0oRs/++3KAbh6m2NWkjFhle5PRBUQ
	6MJWRc2irLfYtPDkvPtBUsBiRCXSZ6ZAdn1SjJ2oXpCgYCBBTQJxQP1mXbhPBAISvPXe
	B/1KZMgWIgNpeG2valZCF+vArtBMd/P61x2Hq/u+dETqc3pYbMc8FN+WU9YVdPC5Oj18
	Ybog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sj77i8neMeVu5I4SHHX8+PGU77gKyIlpCoG/elRFGHs=;
	b=scxMwk6anbfM90rbTAPhVOGUc1wXdgrGdH8eqohV6T1Q1nIUWJ2QIZETegf5KpRYyX
	J8fFMj2PKFulKDeQFBmoPTXNvhlB9hpKMuN4OeIC1CklbrWvTY2m7BEPZ9+vPFoNZsp5
	LYr37wlwu+kGsAF5HuXVt+maKQse/fqv5IQi9U5AhH7duQi3s2feQDCCoYmBsgpyXfFj
	3fiEDe3B2s9DyI7vj+NPD7FQepufG1DAUHMoCBxyI12nB2JOgTwCNz0ZJzZBMdxeeeh6
	t+pCYMSbKAjT6E7ULHylfHyLY3+Er6xnPMzl0f/rDX62cK0GZOP1n9a6oSnoUuIHdh9z
	7sbA==
X-Gm-Message-State: APjAAAWoUDm2RpFMXF6qnJrWL0mDwUwF/f9wJ71RyriMfy+XXy6Gn+sz
	bIFM6Ov81YtUtonX0vX7+OxS/853j84=
X-Google-Smtp-Source: APXvYqzq8ttu/hKzmwZZb/X1dbXyw2aI3TAs+wrEhjspufh8vJe2GnaQZAdlSJ11BgQAZxy7t3wc9Q==
X-Received: by 2002:a05:6a00:45:: with SMTP id
	i5mr5276805pfk.252.1578677386127; 
	Fri, 10 Jan 2020 09:29:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6f71])
	by smtp.gmail.com with ESMTPSA id 2sm3506119pjh.19.2020.01.10.09.29.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 09:29:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 09:29:37 -0800
Message-Id: <20200110172938.3060002-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/2] qemuboot-mips: Enable VGA device
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
X-List-Received-Date: Fri, 10 Jan 2020 17:29:45 -0000
Content-Transfer-Encoding: 8bit

This helps in booting weston images ( core-image-weston ) with fbdev
backend, without this westons initialization of fbdev backend fails
because it does not get correct frame buffer settings and exits
pre-maturely

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 978820a2e0..52cb28a5d2 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
+QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+
-- 
2.24.1


