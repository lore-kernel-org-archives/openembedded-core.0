Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDA1605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:53 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h12so3043122qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/AcFXtD5cJozbWlOnE8J2ATr0tEuelC8gFcqoFeiJ50=;
	b=uHRgmJZ5RFD4dL8GCtemtfXcknp77jhsUWgKpRkfvQaB8ERqaLiqgO1Zcpo81sKhrB
	MoYHlh3eBPBuuhLydoWPO+ppZie15VUy3Mg88nEc0pVNzKxGgAfUCj6TJli9HzQ1wszq
	tre8Fd3zRJWEuwusRl/PuwWu4++TieOk4ltDgWNZL9KV7azVEoraJkZvcSwB+wQf6gvk
	8HgcfAKe77a78ALI5pa7il5xyZlgm1ZxFxekgE9zo8Ult2W0zl649WdFrOxELelwOUrF
	P3KoASOgt+ZD/dqIZa/ziXBIO+FhwntK7N37NRPTuoV+UC+pGBwV/BxCUanPpXVK9ETv
	hYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/AcFXtD5cJozbWlOnE8J2ATr0tEuelC8gFcqoFeiJ50=;
	b=j1j8madQR3D4yc8iyZ8LwuwsoPT4ADEHu+E2XeJAoOQo+Uro+ahA+j+5ha5jyFo5Nk
	IcrFy6O+xrq5yq82O8bWxIC8DgSDRt0RCr6YruPLn88tQPozp+tLNw6K8mICU+4XE5n8
	V2K/TgTnFq8BYL/nRBP/qcho7VZ2aMBYCBpZacHzImMIKLPSD8Rs+rIVfD2iX4RIUJxF
	shigTe5LPI/J1X2yWXJEns8v9UoOqXuqly47z40B+n0ml13DyHGgVGGme5oqdbriGx8j
	x2SP+uPo9rD2ELKTJLCLvYoyAKdsR3S8NBaIa23zEYtoU5SApQyCovZFEi4oqZ6hrVYY
	YvEQ==
X-Gm-Message-State: APjAAAWxwFCZpOfS8fCPza7ewh7mKaj8I6tJIfz4NXnqyV54Bqo6lan7
	ZEgG8/SY2g0AFZ2PVti6exZUFPceR8bC1A==
X-Google-Smtp-Source: APXvYqw9cvt3zgMIiWpSMtBZv5h80I7qDMmYPV7g9Yr4JHAzv/wgeKU60b3Tkuann4z24OFMvi2Wbw==
X-Received: by 2002:ac8:5283:: with SMTP id s3mr154967qtn.47.1580944374463;
	Wed, 05 Feb 2020 15:12:54 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:42 -0500
Message-Id: <d038fa25f2cb9bb5a85dec66d8aeb8fbe468e8f3.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:53 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the SRCREV to pickup tweaks to symbol_why.py to be
python3 safe:

  - we explicitly call /usr/bin/env python3
  - we full specifiy our symbols
  - do not assume that 'None' can be converted to a string

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index a4c0b6fb8a..57ec1abc6d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "7465c8497893ef8f6503c918aeede969f7e9753b"
+SRCREV = "5358eb293399867db05fd73d04ce908d69a03bed"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


