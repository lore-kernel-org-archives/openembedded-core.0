Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73385CD12A3
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.130847.1712646636313859235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RQwpx8cQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646642; x=1744182642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0mTm5WwwcW2gkkBh7Xdwku0fV4BcvFCK5EZoDB5wtrw=;
  b=RQwpx8cQPc/ZNARu9GJxN/ALH4kne3L4IMfL/fvmXQL4jxOrqf7hrxV8
   TcRQE/6QBJ4Pi0qCz6gi3COgZUS2q7zk4xASAw/wnM+rgsAu0hBQ6Odpc
   WvNzMCsn/0UEZxHNYbo5LCzKiRrfY0dSZzzGE/zTZQJP9vEhWx0Z0+VNt
   2k6+upLUECx4WcTxuVqxXzqw5HIsFzoW6XaMbGtrEYLExc0sH+BctPS9X
   ihFjZGm8OV0vRnWU3WK8fjane6XfHVwA9pobHUIuW7PsYrVK85XWGGZJu
   a584kx13clbv9iKEEJKERbJKFe7xTh/fkvaTyBiTuDwQUXtTIvD7YBKw0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="133820344"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="133820344"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B61DF2A2359
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ED3C2E6781
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CF524018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0C3951A0002;
	Tue,  9 Apr 2024 15:10:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/33] ffmpeg: upgrade 6.1.1 -> 7.0
Date: Tue,  9 Apr 2024 15:09:56 +0800
Message-Id: <1712646620-16608-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--2.441100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTFQnI+epPIbir9ZdeIDkfH0n
	A7bbhJ+dsOkqiHn42ajUqA+C93oBWqzeCylgU2zUEhGH3CRdKUUzH9fKfKqyu5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspX4Ju5UjuFVssrod
	Cze/6mo1OIGpHp3GAOtqAfZ9rgr9qtYv/FAmebjp4CIKY/Hg3AaZGo0EeYG954UhBPLRlvhjgGs
	BPCbyGiJ0RPnyOnrZJ3/3o8/0bXcea8eYG3uppoE3cggMZP/4mUSamZKbUfnXZqV0VzWYFLl6Vc
	1YqxDc79j2N/DAAQ5Cg/kaqoPCgzcP1W9wXcs/VLv5Eyr/YIrqsDhztRXZ9Cm+LY9A78UVCLPa6
	Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- enable gdigrab device to grab a window using the hwnd=HANDLER syntax
- qrencode filter and qrencodesrc source
- lavu/eval: introduce randomi() function in expressions
- Change the default bitrate control method from VBR to CQP for QSV encoders.
- removed deprecated ffmpeg CLI options -psnr and -map_channel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_7.0.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb => ffmpeg_7.0.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.bb
index aa59755034..633f32bff0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
+SRC_URI[sha256sum] = "4426a94dd2c814945456600c8adfc402bee65ec14a70e8c531ec9a2cd651da7b"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.34.1


