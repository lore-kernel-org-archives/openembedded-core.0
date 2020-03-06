Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 21C9C6084A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 14:35:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id e26so2600880wme.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 06:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k4hzR48JVjNO1kRViZo08hQy+wXeL8UXpfJPrRzqrdY=;
	b=gUc3ajBamDVr6HoAYeFReh6MI45U3YwuNfVrX4CrV6xxqpheeA6SQMdjBYLyCeh/pg
	YiU9CBhm0f4OsBT2O7toQue5CWc5AylWYfp7UX1P0cEw2/WkjkLEHzQEsltwrezObhS5
	8to0PuHroZ1dYjiIVzfstpGthuUKk3odij1UztyCRmY1p4qf4gr0dkHe1SNN4RPCSOY/
	7yhtLKxjR/3ZoGuR0T3m9sqeOKFAqdAn59ytf+EPgLx8D4huTEHjVdBdEK4NJLgcJgo1
	j6RJjR78RJVwT43YSDd8JUWeSBEM9Suy9DkC5Xa2VNTMGLZSi5TRjQsEiVmaIGicewxj
	99OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k4hzR48JVjNO1kRViZo08hQy+wXeL8UXpfJPrRzqrdY=;
	b=uCnE8TtMUY71BHFRjjwoanC78+pchHDdC+nAzAqXi+9ZfSU0dF++qmLuyWDVLoatRs
	l0BVVaZoCMQcKhKW5DT/j5z0IOPQpktuWOOhB8PgnGqBwrjo24NZjBxqjZkOj0anI5MU
	QeHEDFOvQN/xvA93zEoE19pzSa4MCCMFI5ep/F5zoxLotum/X2IEzXhBKhOnm4O11qQq
	EHrZH5YxsEidDUBOqrmVyQV3qNH+f12vBcLFOo5newbB67A2jntbT1H5Qc+GazlB7hHh
	MXvTd1xJ0Pb6BGSyhmnY+Y8z6NXSZZCCYCjUX6o3rnSgW2FByMvfcMthriyzeg54OIiL
	3GVA==
X-Gm-Message-State: ANhLgQ0Mf16k2QX8NQ94rBVexNB/0RVUp7JKNwQEztjo7AZHoSeJ19cR
	jeuuxX1aqCp6TP73TFXO7+smCkqRzUg=
X-Google-Smtp-Source: ADFU+vuDJr1sk8divw8smQiqK/cBP6qLtgf0konDkv6Y4oyjRtzSMXS/7DTsrjXMTmHdE6NRk3wlyg==
X-Received: by 2002:a05:600c:146:: with SMTP id
	w6mr4562827wmm.180.1583505322357; 
	Fri, 06 Mar 2020 06:35:22 -0800 (PST)
Received: from localhost.localdomain ([195.89.163.130])
	by smtp.gmail.com with ESMTPSA id o17sm93652wrp.29.2020.03.06.06.35.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 06:35:21 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 14:35:18 +0000
Message-Id: <20200306143518.46121-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] linux-firmware: Fix usrmerge builds
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
X-List-Received-Date: Fri, 06 Mar 2020 14:35:22 -0000

FIRMWAREDIR defaults to /lib, failing when usrmerge is enabled:

  ERROR: linux-firmware-1_20200122-r0 do_install: Execution of '/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/linux-firmware/1_20200122-r0/temp/run.do_install.31218' failed with exit code 1:
  mkdir -p /home/akiernan/poky/build/tmp/work/core2-64-poky-linux/linux-firmware/1_20200122-r0/image/lib/firmware
  ./copy-firmware.sh /home/akiernan/poky/build/tmp/work/core2-64-poky-linux/linux-firmware/1_20200122-r0/image/lib/firmware
  cp: target '/home/akiernan/poky/build/tmp/work/core2-64-poky-linux/linux-firmware/1_20200122-r0/image/usr/lib/firmware/' is not a directory

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 6039dc9d711f..8f963f4f4224 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -208,7 +208,7 @@ do_compile() {
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' install
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.17.1


