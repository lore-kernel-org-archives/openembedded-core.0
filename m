Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC427FCA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:31:40 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z26so140696lfg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dsZgwfjUhRMFYXEu3uvnP/aZbaeRD9IYk0eFvAwIJRo=;
	b=pS9Uageg5TH1+E0OK7U4pFCqPUsWtQ91UIgPydPQXBad+dXkob7lOzMvK+7DDhuLvt
	Vfqx6OTwDGfLJNx6b3qV8u0Na7tR90aX0V6u7gch+epyv0seOI9PhbAJVX5e8436h/8V
	0fmxVUFcBhp29TQvSkMlljSrBDRgObrP32NqNDlJMcqZ7iBuVqPyRtd2lwoBs4+ibLkX
	b+HsPR5zFsl9TEe0ChuI06LQ5UrdXafQGbuZ7KC1o/43mWLhQhuVGrcLi8BgdjC6CiJW
	up4mUywRHduWKXC6ASfLjzLz4YVpKRBWQBNgSXaSoDbEuwhXPi9n5TXTvAYBdyqBLZKm
	YGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dsZgwfjUhRMFYXEu3uvnP/aZbaeRD9IYk0eFvAwIJRo=;
	b=lm/tWqOTpV8l2KOODxLHp9OcTDYqWvSgaVnRDsWKo/ectgQfWDyIPivTRd3Gmfg73G
	hyeHMtVaxrGtOitUQnJoI33w3wUughz3dv28rAzuL6Q41DfVJA+Jr8jdN40jJLEZPSbN
	W84ekI5YW6+oHth8a+3krANVzwQat6vv75Ti9LKJU0s+HP98TICI4AmmTk8vRU03qv36
	pRgImxvOtP+lkv0qkwPInwb4FzQU7BmwblfOdZcn2L7WduT/GEYfEXrfXjuXVx7y4+dT
	81itWpLs8YovOepGD8vFF5QUyx9SZ63fvXEu7OIDTomvxm5PwZUd/bpt+KkMXoFDr3jQ
	LaYQ==
X-Gm-Message-State: APjAAAXAtpMRyT3jqRFndtNTAXJByKZI3zPWYynrX3mO+D0YjMo2OwiF
	dKhC1UeitFfIcG2G31LXbbbj+Xz8fAo=
X-Google-Smtp-Source: APXvYqz5gStxNE9P2kLMWyg5EpyFdJLsD5BX/C06kiKUeqJw0/4o1ZOKCUZmsAhO44Juvrn1o05vPg==
X-Received: by 2002:a19:8b88:: with SMTP id n130mr148222lfd.210.1579548700860; 
	Mon, 20 Jan 2020 11:31:40 -0800 (PST)
Received: from localhost.localdomain (128-68-30-100.broadband.corbina.ru.
	[128.68.30.100]) by smtp.gmail.com with ESMTPSA id
	f11sm20790898lfa.9.2020.01.20.11.31.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 11:31:40 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 22:31:36 +0300
Message-Id: <20200120193136.3663-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic: bootimg-efi: implement --include-path
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
X-List-Received-Date: Mon, 20 Jan 2020 19:31:41 -0000

--include-path can be used for placing files on ESP,
like dtbs.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..fa320a50b8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -289,6 +289,10 @@ class BootimgEFIPlugin(SourcePlugin):
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
+        for path in part.include_path:
+            mcopy_cmd = "mcopy -i %s -s %s/ ::/" % (bootimg, path)
+            exec_native_cmd(mcopy_cmd, native_sysroot)
+
         chmod_cmd = "chmod 644 %s" % bootimg
         exec_cmd(chmod_cmd)
 
-- 
2.17.1


