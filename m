Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id A80537F1E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:49:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v19so30344997wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y5IBymkKq7E6E4xbj++m896i+IKNsvYkPd196ZceJns=;
	b=ONKDxsGyAKYMJXk0K1qKIXWnHhuHDjmqY02qwyzhlECKVuzMPdfkp8TbyGU/pQz4os
	d6UM0FRtB0c2fQgpUJK5oa/7/rUDBnznSk0k3/fC/DiAa81nA0ssi6mATawco580PUrl
	0k546UTgzzUnf4kr/aZghH3VjRQZO0XECJwQKE9CKN/5MSVA+RU4ubkG9WO1JPSFvPYS
	TXqzFLm3gsNr0UlkeEMdfSaBEE3xk2sdZEfStRWsSmbV2gJBc9WxPbcHFw0L2w0iuRTs
	qWB/hcYalfN7WZ3rWOuRgsAjUZVsHLvyUY/GXt3ZyTqmG/+JL78w3L8iI1xR+4hBc7OF
	FAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y5IBymkKq7E6E4xbj++m896i+IKNsvYkPd196ZceJns=;
	b=Qo2H6XSyNnbSxDi3I90//KgTTMzP3FHKl3G+t3QjJbPwBN3txCfBvikWVsycaCnkNK
	1Cc4gsyLtprtqi4mpfcDTTsOqk0CwyBAVyAvJ6C9Br6pk9mSGonW31jhMScYjYhhyPLl
	VqI1jzLfPZvNRueXwJtfO7ibzlI9V9TTDudOBX6Q7S00NkmbjSpEn7NjuZDyOPrXJHZ9
	9DWkrBH6I0uz+WtzHbchkW8pOuUqjsMoH3JOqz0bQh4IHrkZ0GVHFuQmYthjNpK3PEU8
	+ToplQSG379spM6KBBguCuIg2++en3ThZxc3fOAHkxCu9ROSBV1cYgveFb0zVnyrQQzg
	jluw==
X-Gm-Message-State: APjAAAXBi6M2MCyLdXLCtUguQAg7CDYKc7l8F6CoMAwymETmTs+xCXmP
	JHZnaPyyEt/e8D/pW1/XyEHn7/L1rBU=
X-Google-Smtp-Source: APXvYqxfC8GWXiW49T9UY9ObdDmUsEXj1fjRC8FgZpcBFMSybMRpi8XSSoRzS3rB6DD2bu1ThsEx3w==
X-Received: by 2002:a1c:20c3:: with SMTP id g186mr37924075wmg.15.1563576559079;
	Fri, 19 Jul 2019 15:49:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c1sm62791729wrh.1.2019.07.19.15.49.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 15:49:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 23:49:15 +0100
Message-Id: <20190719224915.4581-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson.bbclass: export STRIP=${BUILD_STRIP}
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
X-List-Received-Date: Fri, 19 Jul 2019 22:49:18 -0000
Content-Transfer-Encoding: 8bit

In Meson the environment variables are always the native tools, so export
STRIP=${BUILD_STRIP} along with CC et al to silence this Meson warning:

ARNING: Env var STRIP seems to point to the cross compiler.
This is probably wrong, it should always point to the native compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 893853142c7..7267e58b101 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -130,6 +130,7 @@ override_native_tools() {
     export CXX="${BUILD_CXX}"
     export LD="${BUILD_LD}"
     export AR="${BUILD_AR}"
+    export STRIP="${BUILD_STRIP}"
     # These contain *target* flags but will be used as *native* flags.  The
     # correct native flags will be passed via -Dc_args and so on, unset them so
     # they don't interfere with tools invoked by Meson (such as g-ir-scanner)
-- 
2.20.1


