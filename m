Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 95F327889F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:04:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n17-v6so2212423wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KmuSQY2Muzs1YcL0rmDm3MqbS00CZ0FRGQ4KqrDwpq4=;
	b=IJaM9GNfNmXlppgL8d3Am4wEziKF41zYogA2h8bOsXU83AwWQvry5W5H1sGVAf86yY
	mbpp7dBCQHa6lPe5lrTDkYtod9tM2DCk0yjyL3TtzVEDY3Rq60qzuRg6WqpUuvrNhEEs
	nWXA6H6cVspckgXTVc4WAgL0VqHJfRWSfA85OrDcXy2nvD7I78WGHBdslGpCR7stQZ4B
	2brdlJrjzu/20w4KElbHIDs2j3uBqBnMKMsME+chbegYNUFd2idtv5bEyjPLrs4jgLgG
	ae3qDlE5ktqu667tB0ndqH9kGlRqTZaPb0VeOAHsoPyA/2ONkxlMXtNbW0EgaMZLyfBq
	BzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KmuSQY2Muzs1YcL0rmDm3MqbS00CZ0FRGQ4KqrDwpq4=;
	b=ZVaGlx3bVh0cX39fdd87bYgvMyraYdN1zKBY0HAKW4IWdgayzNebNsM24IpNzKRgZJ
	rLc+DhpUhMmJtvpjJKCHNOB7hKjvf8Epb6RwMvuxn+z85dxRVVmRUsVqCKIpzAgVNhCI
	WZC8v9Yf6X+LMzYscqivt83Q+t7W/RFT00jInSIQOjrgE++w2uC77Q1LMSJLFJvxtLhJ
	T+5JPD8+HbKAGIYEfSRweS8c1qcyzG15p/9zXepUoKcntLgDaEBZjZBnlEZIJnmUVhLD
	jpQ3Rh+wAESf1feJh9U7xDfA+l3eqR9tjnoxMrtgL8mLgINkKcbc+z0tnUsXUk4gzzwq
	Z/ow==
X-Gm-Message-State: APt69E3FSoRut9EWEOkVQUEUfS1Ozbuv/BJuqTkL2go4/N0mfsRXbGGm
	yBsq7NZv3cYqw2kH6NDfnl2kC9P3
X-Google-Smtp-Source: AAOMgpeSH/8r2jFrDpXpLZxluIv6QCHJM5KxXOzJp2nBJTSeWQnXNkDIDZhjCvsqEYAuCStMpemStA==
X-Received: by 2002:a1c:69c6:: with SMTP id
	z67-v6mr8444194wmh.159.1530623058994; 
	Tue, 03 Jul 2018 06:04:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm1863006wrr.52.2018.07.03.06.04.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:04:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:04:10 +0100
Message-Id: <20180703130412.26102-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703130412.26102-1-ross.burton@intel.com>
References: <20180703130412.26102-1-ross.burton@intel.com>
Subject: [PATCH 2/4] meson: map architecture to correct values in cross file
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
X-List-Received-Date: Tue, 03 Jul 2018 13:04:18 -0000

The cross file specifies the host/target cpu_family, which should be one of a
defined set of values[1] but if it isn't Meson won't complain and instead
recipes may behave unexpectedly.

[1] http://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index c36b634b43d..d615a84cfb0 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -45,6 +45,18 @@ def meson_array(var, d):
     items = d.getVar(var).split()
     return repr(items[0] if len(items) == 1 else items)
 
+# Map our ARCH values to what Meson expects:
+# http://mesonbuild.com/Reference-tables.html#cpu-families
+def meson_cpu_family(var, d):
+    import re
+    arch = d.getVar(var)
+    if arch == 'powerpc':
+        return 'ppc'
+    elif re.match(r"i[3-6]86", arch):
+        return "x86"
+    else:
+        return arch
+
 addtask write_config before do_configure
 do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
 do_write_config() {
@@ -70,13 +82,13 @@ gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
 system = '${HOST_OS}'
-cpu_family = '${HOST_ARCH}'
+cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
 cpu = '${HOST_ARCH}'
 endian = '${MESON_HOST_ENDIAN}'
 
 [target_machine]
 system = '${TARGET_OS}'
-cpu_family = '${TARGET_ARCH}'
+cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
 cpu = '${TARGET_ARCH}'
 endian = '${MESON_TARGET_ENDIAN}'
 EOF
-- 
2.11.0


