Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id D2EA57FFA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p17so2172172wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LGRAdmdUaYaBNO8j1SpXGMIo2NlQWsMnUJ46jfXa2S8=;
	b=INU3GKoyicLdBwvdQrDNYHA+cbg2fKu6cfxIDbFr2wJM9g/F7j1MQTH5jHdL7X/lHH
	8NrGnLbP3Ocm26kZ1TuuTElEVHpzp805FWKSdwPiK2BRCWMvCUkwzYdk7dtcHpENJP/5
	HoOu0FGNMp1krZmdySeGLCfHulgtECkVdMfZxwCV3WzreExPvhw/7zRqg4mn8EqjG/hx
	XB8fMhXoUOZW/KXFJVgwn9l5WdUa8C7cWxjPliEAmJxqYUgAD1RA+ouCAc9ak3jkKlR0
	IrXZ7TdHPk3tpA5lktnuO+8WIoq+PJQYCRacsLihEkuHnyidIZLjdbActFDNiyzOZhLQ
	MnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LGRAdmdUaYaBNO8j1SpXGMIo2NlQWsMnUJ46jfXa2S8=;
	b=Ey6ai41rLoKH6K94aXfsbWQrdqZBwBVPHt3QVJiCMj1N2xT/YlIVaVCISB/ndUXgtF
	ul1hrSxDI4No4rqYWXJ2sboXtCV7k67Ig9ZlTjj4/c/7tbYrY/rS17Der6VOIZaYo+Jz
	iaUczybO0FzKTGPIToV1/+bzsjAn4Ye3OhvuH184DQdiCpEIy5kW6XsLV3gWdKEMNY+3
	lE929ixN/UPhxXZPwKyA77DO07rVxhjsxirceC3R7ZWrJKr3hu54QrfooT1G4Ws6AYh+
	8lIkEoFSGymhP39Dt+NZESCjAStR6EzhTV2SmMiNOxhiBJSx0GtB6o2DKF4ZUrf3RafX
	PoWg==
X-Gm-Message-State: APjAAAWjXSfuxndOFozW6s3iA0YoSqeiRJ5kPXFIfMd2rznRagVroJuO
	vTNfjVb7fg2qGeOoThwa3tizYX0qPaQ=
X-Google-Smtp-Source: APXvYqxhBN7TnbpCO6dAHiIO1Zar6yMoiHF3xD+1boA4s8+1y+SZEjN9h/tv6ubulBQ4Oc1TKSIAOA==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr3554782wma.72.1576679903402; 
	Wed, 18 Dec 2019 06:38:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:56 +0100
Message-Id: <20191218143758.129308-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/25] vim: fix upstream version check
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:23 -0000

Only new x.y versions will be reported, as upstream creates a new
x.y.z tag for every commit.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vim/vim.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0a31e68cb7c..5a1bea69854 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -14,6 +14,9 @@ SRC_URI = "git://github.com/vim/vim.git \
 "
 SRCREV = "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
 
+# Do not consider .z in x.y.z, as that is updated with every commit
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-- 
2.17.1


