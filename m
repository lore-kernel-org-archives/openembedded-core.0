Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D853271AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:52:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so22759724pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=DjohN/ktqs/64uraCPqXMx6F0HZrpn7VNz6EZYWQD0Q=;
	b=gnnmzEuELLK6nUuR2HHGJuZ0q2AV7LMR0YzppLQoqUCReOf2+xCSysELWcY+vXqUnT
	gpfzIznf7gEyVadCQqxkXYx6Z/UYDQUTaQeuZ6YfS/4Jn87pSC+Oe3BTBQ3stsL8dmgi
	QTh/zbKkoDnW4RZ9RMPVIuT2Zyxck7DsPPQw6Fm7cVqH7Je1wXY99TXvSl89Sl7/J/sr
	sBSUMtAssL06Vyz6zc0wRaBpyhokj6I2oUepjwi2x+WcG/KllBW7pevKocKy9sU3Ayuf
	cb++HNMOOux9/cTXTtyXl+KYfOIJDSUg1LeDI1yPMa4OJgDKeRb666evv/xX4nlxaXld
	k70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=DjohN/ktqs/64uraCPqXMx6F0HZrpn7VNz6EZYWQD0Q=;
	b=pItlQn7N1dg7oNyfR3wz0zRe+DvfAqG9bOAWqpbN0CHpAW+1CRWr78geGn+D1pT0VU
	l9nuO9gZ15pXZGeqmwqk0jrdM0IErAu8D22DrckeetLX36zC5WyzTpAGVf4DhQGofqYq
	waxGd+pU7iqWCh/lshSwsESJ0/7xqHpbCimV4m93ObAsuVOLa7m0ZJxTh19+xIGaPrw6
	7Kw/lFfe0wuQCb+JynLwH08HqgOgujmvuE3npi4LreSPQ+DmR8gnLLzOX/0hPKjHze8p
	oPlXvnnh43Ftdr57D9mdQkbhX0xwOeDeqdvfKjXHgqdVL/9m4OJQEnSeboxgMDPM11kF
	qj8A==
X-Gm-Message-State: AIkVDXJffGEtQyNmcpMVH9KojGoviMmTBbfrphXQ+eq5H0QLBgBdXcbNVxFzeiCKDJ3GCA==
X-Received: by 10.99.66.3 with SMTP id p3mr22610833pga.214.1485762732609;
	Sun, 29 Jan 2017 23:52:12 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	b75sm29673798pfb.90.2017.01.29.23.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:52:12 -0800 (PST)
Date: Mon, 30 Jan 2017 17:52:07 +1000
Message-Id: <20170130075207.2639-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 0/3] MinGW specific improvements/fixes
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
X-List-Received-Date: Mon, 30 Jan 2017 07:52:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series contains a few patches that improve/fix MinGW specific parts
that cannot be easily implemented outside of oe-core/meta.

The first patch disables update-alternatives when TARGET_OS == mingw32,
this is due to Windows not supporting symlinks in the same way as
expected by update-alternatives. This also avoids a dependency chain on
opkg-utils/python.

The second patch adds support to the package bbclass to detect shared
objects (.dll's) and executables use of shared objects. This
implementation allows for auto-detection of packages contents and their
dependencies and allows for the build to generate full sets of
executables with shared object dependencies when targeting mingw32.

The third patch fixes the libgpg-error configure task, preventing it
from clobbering the syscfg for mingw32 targets. This is not easily
overridden from a bbappend.

Nathan Rossi (3):
  update-alternatives.bbclass: Disable for mingw32 targets
  package.bbclass: Add SHLIB detection support for mingw targets
  libgpg-error_1.25.bb: Don't replace the syscfg header for mingw32

 meta/classes/package.bbclass                        | 21 +++++++++++++++++++++
 meta/classes/update-alternatives.bbclass            |  4 ++++
 .../libgpg-error/libgpg-error_1.25.bb               | 11 ++++++++---
 3 files changed, 33 insertions(+), 3 deletions(-)

-- 
2.11.0

