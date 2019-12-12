Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id BC5127FB36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:52:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d5so4290564wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CA4+JAImPXvpAChHTF687kQ2dDiWtzSaYqB8jZzfBXQ=;
	b=CgR3DxlZajs9U0wUhcvQBxh7SUixOAHZvh1sLbwYA+DyEDF0mRGCsKVpIhX8ZjtSX9
	um6VBLGvGvMMtBs06kxEmDtyJ/YoSLyHZxkkKd7eU/81P4w3me6t/x3LB7dpP8mBIMU1
	kNBR6aGxzcn3OUhrQ2YrMeVnedj49jHC1KT+G++BsTPHvcf1UP3Vh7ix4ajMAqek3CZJ
	tuXMlgb4A7U0iMb9gb7MDdF0Ko5959Y7CJyAM9k2oIjU0hAqOlVNwY9l6ZgVyDeB2PwG
	wSBuP+FQVsSgKVrfZMWwBhunq27JYRTcaVq7FM9irHZtphx4DJ82M79wdf2gtfiWCVLF
	wb2g==
X-Gm-Message-State: APjAAAV5fHuSAXQYqPA5l0zNbQ8guKnJv8OyLQedJFHN6jvTVP/cisZn
	xh/iuQnyW1ZDRCqk4af/PvVw8/XC
X-Google-Smtp-Source: APXvYqzMSjM+OzUNiTRVbyD0m7E31z7saY/daXRSPsDXWpG2HVGWRn3r0qdFO84JD50n/3+C2WMU9w==
X-Received: by 2002:a05:600c:2144:: with SMTP id
	v4mr8697712wml.141.1576187536253; 
	Thu, 12 Dec 2019 13:52:16 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	v188sm7723704wma.10.2019.12.12.13.52.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:52:15 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:52:10 +0000
Message-Id: <20191212215212.27089-3-git@andred.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212215212.27089-1-git@andred.net>
References: <20191212215212.27089-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] oeqa/runtime/context.py: support listening port in TEST_SERVER_IP
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
X-List-Received-Date: Thu, 12 Dec 2019 21:52:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to the existing possibility to specify a port in
TEST_TARGET_IP, allow TEST_SERVER_IP to also contain a
port.

The intention is for this port to be passed into e.g.
the http server from the apt / dnf / opkg tests, or
any other (custom) tests that might need the target to
connect to a service spawned by bitbake / oeqa, where
bitbake is actually running inside a docker container.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/context.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index ef738a3359..2ecb1a8f01 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -98,6 +98,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 target_ip = target_ip_port[0]
                 kwargs['port'] = target_ip_port[1]
 
+        if server_ip:
+            server_ip_port = server_ip.split(':')
+            if len(server_ip_port) == 2:
+                server_ip = server_ip_port[0]
+                kwargs['server_port'] = int(server_ip_port[1])
+
         if target_type == 'simpleremote':
             target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
         elif target_type == 'qemu':
-- 
2.24.0


