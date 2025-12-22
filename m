Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DDFE6ADDC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87690.1766434109154886406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q31sRI3d;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8052725de4so272323866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434107; x=1767038907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FGydQMwjzC5Yx2Eo/OkaVMnE9IgneFQ6MXqnd+LuTA=;
        b=Q31sRI3dRtfZsswgNT8/fFmvWBKv8OkayfoPuVfsd4Y3U3LxwHWyUdfmiZ590RTCNf
         kOJDhMxcyNpEAQ6vs2CGfyoK/o/Nis34wfOh4RhmthP2egDgcAKKfwzWyWHGozym+ucG
         il3UfwW65QE2aGp1nMjN2kI542uwkI/Vhzt2HVXc+MPouVatMt+veLYKTlQg1tPglEu+
         Tzo+ZOAbeIIc/+az7lwkPbEflkAt1+uz9RKKiUGHHzbqp1FBHMBmIDeOHq4niOggsmkW
         OwDYFhbv/HlO8xSwfU0kzcIqZSHH3oA7a2e9x+9FTGCNNhq7t7U+13oXiWlWT8A4/f2o
         YZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434107; x=1767038907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FGydQMwjzC5Yx2Eo/OkaVMnE9IgneFQ6MXqnd+LuTA=;
        b=ujNG8Jlw214cFWI+u2eMisa4LscMAJyL/vOFk4rJT4KYwOBsouTCv3788w0myjil6Q
         B+fR2Mx1+f/OCZ3IYIx0iwXdcciZmpCQswzazn/E4uV9LynVZHvFgcM8tHntr+SjV6Dn
         a0fdRJ58NRY7W26UCQ6Os1nKMes5Lc45Kss60FlFozeFl6GAhy3JfNkc8nf+oXOKOElr
         PdFWMMyck6VJYJ/4UNXAc08++X/qmLSXzklxJC174oe1kZTbOvzGvpx1WHsVo8Q2CTTC
         iigJIW8wUZdyCLbqOHdhVpLVQVuvNsU01P7sIM5zsct5Ec3/mE3KKtos4MGlL0NiethW
         SeKA==
X-Gm-Message-State: AOJu0YxkxRRhaES8EaWuZAlyIotH1KNzwHC8lRv8uWVbhMwm9eoX5UGk
	H4V9A6FZFGd1AV7WUsLCkbojCQJYCXGIEHK4F90Dfd0BhCquGTQmz4793eA9zQ==
X-Gm-Gg: AY/fxX646rxKKhA48Z6t/3akr077VWyq0rcbnEOO2i1CanegFLYyHlf98n1RNejjfvg
	SMS91jkGRPSnz62U4w+vnvBAniKdghDagwjom68qxLhIjoKmnVIt0T54kJSKqYbinAckgwsQMyq
	Q1RsjAjZ/veXKrtg0Hg6GdN43csSUvkZKQ83Adef+6saDPNt2JUOgcHUBlgf0V/g4N6R0OhGoRp
	8PiY7SSJKqPQwbaNE4PpRaKKXRSc9gCXjFD/bl6atXSBCjeXJOPnLuRQbyEIkF1iV2mZaHPfEs4
	+9MXym984wJx7lzKJytuwlA/5pidFfmPgvkjvhPlBtsfgu0YLFLRWQXRK3bKiZ/xLEdXMMMzglf
	uzzmkQUEOC3Qy8nZYMwldXaQbnbew7EMK9PzC7D4p73Ac34ET3+uiQYauRdTP+I5Io5BxOLMQKG
	d3hwoiD6arLzQ6U4p5EPPFUS1UWNlmj7xu37VESBePnUC1FrM=
X-Google-Smtp-Source: AGHT+IGY9OYf6eJAQcXy/nliRtLTaYAbBBfDMW7a0ZIz66yhokCExJ7mC3AasrB/frsYokTjAtjzrA==
X-Received: by 2002:a17:906:9f91:b0:b72:5d9c:b47b with SMTP id a640c23a62f3a-b8037051eb2mr1114018966b.36.1766434107362;
        Mon, 22 Dec 2025 12:08:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 060/114] python3-iniconfig: upgrade 2.1.0 -> 2.3.0
Date: Mon, 22 Dec 2025 21:06:42 +0100
Message-ID: <20251222200739.2278706-60-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228385

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-iniconfig_2.1.0.bb => python3-iniconfig_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_2.1.0.bb => python3-iniconfig_2.3.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
index d9b31aea4a..1937285c3b 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/iniconfig/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
 
-SRC_URI[sha256sum] = "3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7"
+SRC_URI[sha256sum] = "c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-- 
2.47.3


