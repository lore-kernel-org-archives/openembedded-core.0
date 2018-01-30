Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C64678845
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 08:30:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v123so38615920wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 00:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VEY1Bx0gr4FVTdIqxsTcJMy2ZQU/i5qEwdGI3n/htJ0=;
	b=MnupDLtLH2ZEaaC4zNqljoM9nCKuCUcf2SsqKzPCxPIFy4sHEsfy2Q4yZIXKovJlAa
	1z5xl5zsSVtfy34FA7pDVcWl55Hd8E4PH/Y33l9qkCztfle7Zowk5sM1DEBOEvBQUfDO
	sc0D6Qn2L+dYwMdZDu0eOOsElC1l9YwLWJklKzaGKpdv2TwRzFRtIrAx45uE0hv+zgnk
	6WyvZyEsoIuua+SSwf7VNzExI8y5C0VaZIjwGTZVjC7WVepX0bhmvvIWeud3Gp+i7AS2
	nDnkQG8QxGFPyPGWWtkm2TSy72OWs3mmVOeM6d4RfczRx5QHT8dTt6Tbv4hl/9I5r3lp
	t3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VEY1Bx0gr4FVTdIqxsTcJMy2ZQU/i5qEwdGI3n/htJ0=;
	b=FREIFDGN0HtE6gKALBuCM3iWAl8bQcs3/seOjkOAYl+Jxeeh6qK/fMhfN4F+Z7cRvm
	Gnu8TeD2tWBsEzuoGK3xjve3iawKIWwZE4GdNpHQiDIvny5v7B53ObyEe9wZf/uWMEMA
	LzsV+JrodF8XZWDGESrvY6B5DmB9R0SJk7BgZYdbmgzp9YJLJzJHmayqY/65j9U0t9Ah
	2cMvDM44QArMZznH2fxcNyn+tsbPeFnVztVXAMzvEu09l+dWxspQwejLpoNWjvwMHqP9
	U3/4VUSll5KBNJtC38zQ2MWBtvHHODQr4hOSvb5ZsXAawFCDj9h355R1YB0k3lE/kdwC
	OQrw==
X-Gm-Message-State: AKwxytd9k132hX+0CxcpujmOAE+qra+8csqaqcaMyWMN/3wRk809K18a
	dlw/RHaPPcVtR2lzX2Ualxh6BA==
X-Google-Smtp-Source: AH8x225VwaTx/0Yp2oBU9sigLWxoIIHbQI/Kid0j74B/yXCrFYjJro94XxkzrwDSmcLrsQIYRZ2msQ==
X-Received: by 10.28.169.200 with SMTP id s191mr20793314wme.9.1517301001990;
	Tue, 30 Jan 2018 00:30:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y204sm11233933wmg.44.2018.01.30.00.30.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jan 2018 00:30:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 08:30:03 +0000
Message-Id: <20180130083003.39-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Tue, 30 Jan 2018 08:30:01 -0000

* there are some recipes like jack and other which inherit waf-samba
which inherits waf, but they don't use waf for configure, strange isn't
it?

* fixes:
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir
support.
WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to execute waf --version, exit code 1. Assuming waf version without bindir/libdir support.
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, exit code 127. Assuming waf version without bindir/libdir support.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/waf.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c3e744e5de..eec4d9496d 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -29,6 +29,9 @@ python waf_preconfigure() {
     from distutils.version import StrictVersion
     srcsubdir = d.getVar('S')
     wafbin = os.path.join(srcsubdir, 'waf')
+    if not os.path.isfile(wafbin):
+        bb.note("%s doesn't exist, cannot check whether it supports --bindir/--libdir" % wafbin)
+        return
     status, result = oe.utils.getstatusoutput(wafbin + " --version")
     if status != 0:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
-- 
2.15.1


