Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4220F7F2D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:56:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h7so2394650wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rlWqG6aDc2WWUzaul8hfFpltXu3afehSMPCFUzR5OL0=;
	b=b8Ksr81gYpHXivrdf57OB5D5hpQrCsYeSv/OcwKVDtJqcH6EJCo25EXB0N3pq1hZxC
	wul9eCmxCGcjz7V+STjrG5bSB/7GvR7z3oBq7vGKHe66OV+zRxvvuN9aFEVB4PSAiaf0
	JiRS0nP2QYMi9jVEGUcGXJInZASBHkz06U8RRGHvEahsZjC5DdTQe7uHp7D70SJtApiA
	+er1H+/cu+tvPbphukYPcCEtCJo2N/YCWKe0tDXCG3XMdo0ppSg7y9w3H5bNwPk7Z1Kr
	Dh8WZKFWKD7V8/INEOhTQEyTuS0eyKOUk8TD8lpID9F5wI7U/KLq+rdxzB4BlSsjp/ow
	LnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rlWqG6aDc2WWUzaul8hfFpltXu3afehSMPCFUzR5OL0=;
	b=eZdpvdlShJ7gBV4AMcHRiDxjwNTf1OiRH9/Hk/NfopqTyzjX5Gt/8LmmrHlf7e7COY
	Rri0Q0DBS0vJAjOcLYW/b41aitDFPDq3S/OW9qIT0iXw88FK0uiKlPlJZIdwzpIcIw6i
	eLuFO/wWIWOgdWA2tHlDAzzTZBLVRRl36EKNUh95MV53wt8MO89KO/lLEUXK4fQgxg22
	Q0SCEZ2SVjKTFy6O8i9YBYuTMFPO01u43lfr5TbnxPIR7N8lGvcB2N7SQY+NKKBIQBe7
	4LbXiC+2UpTvHZ0WtRS05o7Fzw3Smm02LTKpxOjLrJSxkFr2hEMbvJeSoLSLx3/8qK1W
	iI6A==
X-Gm-Message-State: APjAAAX5SHtKEwjR58RtjuQqWu5eC3HdAaBFi8yRqENBAqfuinzPqC99
	M5yOOHxMyAJI0tjq4F6Ndw3U3405+SY=
X-Google-Smtp-Source: APXvYqwbIvmPdTlzEnIQg0X8+oPGvJKbULKXW4xQx2hDIITI+dbXaZw9gqNE+wXk5ga1avcWYIIr8w==
X-Received: by 2002:a5d:5612:: with SMTP id l18mr3287367wrv.177.1567698985650; 
	Thu, 05 Sep 2019 08:56:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e20sm1861797wrc.34.2019.09.05.08.56.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:56:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 16:56:20 +0100
Message-Id: <20190905155620.24610-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] core-image-sato: don't use 512MB in qemumips
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
X-List-Received-Date: Thu, 05 Sep 2019 15:56:25 -0000
Content-Transfer-Encoding: 8bit

qemumips doesn't appear to work well with 512MB of RAM and randomly hangs.  As
the bump to 512MB was primarily motivated by the memory needs of virtualised GL
which doesn't work in qemumips currently, drop the memory back to 256MB for
qemumips.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 878e0eaa8d2..673106eb6d3 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -12,3 +12,4 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+QB_MEM_qemumips = "-m 256"
-- 
2.20.1


