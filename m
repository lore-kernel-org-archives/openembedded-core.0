Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id E64376A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:45:16 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s8so6284783pji.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 00:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s8Yn+KN2laV4GujjeaSFpvohUKhNZDFIBSN6YLJB5IY=;
	b=Sd9AAIFy6ico3w+gMfqzY7i9+8d/sMT3vRVM5Xoz8Lj+Py9PJOZ1L0Kw3fI/UIBYs/
	gu2Ol7e6+e2CbJjcZ+zvvWf2xiR8UgLqHwOoKBBviW9y0LDxsEOACPrd4ctTr13rn2I0
	4XqxW9QSwoNSRKBjjvNKXs4ukQQ33i/9fq0xAp3Spj2ACf1T7pk15W5hb03PHchaMUCG
	B/CIk9zT+mNnEM2RU/N0klEPU2jtTJi2F02ZSiIybUxosi7neBDUVWmoP1ygdE0tAvTx
	8FAFVgMLN+0ZEcCdMR00oGjATI7mpGX4OsB611LNFJ6a+lbdSmaVkOOoBxcTStdKEkJX
	ewYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s8Yn+KN2laV4GujjeaSFpvohUKhNZDFIBSN6YLJB5IY=;
	b=PDdGwsDNaHIuJWpD5e9AT4HUBoppPiaRtldP6GMe6PQvW+vky7goY4QivnArv8KIXs
	tfxVJ3JmPdHU6/GKLBKJQUZWTQho+NLitDh5uA10Zw0nJJb1k+fq9bX1R+NI11o4GdhS
	MjQxXep2nr2sA07/FlsIFPSuhijRnQcgwo2QStpZBKHi5ZUjXXLIEnlZ96ryhDw9WcXL
	sg/JldWLtjaoeyXzbZ4nh3UmoyrJAOBxz2Sbn66tRhaZ1MBB4zF+irGBlqePyWfjPoX4
	MOO+EaRVlwR/iqnDcPvHWNH14ZtEkRndgefyAWXScwFEuWZg3Amws7h0HH/E6QIGHmsa
	SwlQ==
X-Gm-Message-State: APjAAAV/6I4HCi44mDsP8yaKiLU8UYZBk45/C0n6rq+nNuxsYo2wsBUh
	ixMy5IDlQZyi3Brav+hZH3hdvEvIEuw=
X-Google-Smtp-Source: APXvYqyFFZMfzjkO1xjdhEszTzbKeBNYkiu7lf8TfIPriQBHNeoV/4d325FB5ZOlGRDeRcrchYVzKA==
X-Received: by 2002:a17:902:900b:: with SMTP id
	a11mr26599001plp.116.1574671517516; 
	Mon, 25 Nov 2019 00:45:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	136sm7472257pfb.49.2019.11.25.00.45.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 00:45:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 00:44:51 -0800
Message-Id: <20191125084452.1515325-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125084452.1515325-1-raj.khem@gmail.com>
References: <20191125084452.1515325-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] xf86-input-synaptics: Fix build on 32bit arches when using 64bit time_t
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
X-List-Received-Date: Mon, 25 Nov 2019 08:45:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../64bit_time_t_support.patch                | 51 +++++++++++++++++++
 .../xorg-driver/xf86-input-synaptics_1.9.1.bb |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
new file mode 100644
index 0000000000..4bb7fb3e23
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
@@ -0,0 +1,51 @@
+This patch avoids using time field of input_event structure which is not available
+on 32bit arches supporting 64bit time_t structs, Patch makes it compatible with new
+and keeps old input.h implementation functional as well.
+
+See https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/eventcomm.c
++++ b/src/eventcomm.c
+@@ -575,10 +575,12 @@ SynapticsReadEvent(InputInfoPtr pInfo, s
+         ev->type = EV_SYN;
+         ev->code = SYN_REPORT;
+         ev->value = 0;
+-        ev->time = last_event_time;
+-    } else if (ev->type == EV_SYN)
+-        last_event_time = ev->time;
+-
++	ev->input_event_sec = last_event_time.tv_sec;
++	ev->input_event_usec = last_event_time.tv_usec;
++    } else if (ev->type == EV_SYN) {
++        last_event_time.tv_sec = ev->input_event_sec;
++        last_event_time.tv_usec = ev->input_event_usec;
++    }
+     return TRUE;
+ }
+ 
+@@ -725,7 +727,7 @@ EventReadHwState(InputInfoPtr pInfo,
+             case SYN_REPORT:
+                 hw->numFingers = count_fingers(pInfo, comm);
+                 if (proto_data->have_monotonic_clock)
+-                    hw->millis = 1000 * ev.time.tv_sec + ev.time.tv_usec / 1000;
++                    hw->millis = 1000 * ev.input_event_sec + ev.input_event_usec / 1000;
+                 else
+                     hw->millis = GetTimeInMillis();
+                 SynapticsCopyHwState(hwRet, hw);
+--- a/src/eventcomm.h
++++ b/src/eventcomm.h
+@@ -34,6 +34,11 @@
+ #include <xf86Xinput.h>
+ #include "synproto.h"
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ /* for auto-dev: */
+ #define DEV_INPUT_EVENT "/dev/input"
+ #define EVENT_DEV_NAME "event"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
index dc31890f69..388350c96e 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
@@ -10,6 +10,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
+SRC_URI += "file://64bit_time_t_support.patch"
+
 SRC_URI[md5sum] = "cfb79d3c975151f9bbf30b727c260cb9"
 SRC_URI[sha256sum] = "7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576"
 
-- 
2.24.0


