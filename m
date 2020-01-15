Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A08537F9AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:08:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so972116wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sj8U2Cvwt1zbnJW1WU6yqwOhQWok0Ed0w6x/X6qp+kY=;
	b=iTRoM7dMU7iyDz36tit+EtBPKsPyxyV3VNizCGsTZ09jG9MZMc2cbk+Cg2wnz4RPOV
	a3i+NgQF+zXmFZjRL/fbYadwN9s0bYOMVr6zvp2ORUkZSTZ089OyfXcVdjALxk2tfzHo
	zij91zhnoLq3K8hQZ8R/fJyY6MlyzSXXjFKJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sj8U2Cvwt1zbnJW1WU6yqwOhQWok0Ed0w6x/X6qp+kY=;
	b=C5hyUV0EVem2R2Dn0du8WQlDyKsv9lxGoVpg/SGjTNJhromIFUveHjwVbH8K90QH7i
	9Niatn7Y1S0ZgAKn3+ribtg4JO7aq3JAeMAOuMHaeNiV0BjZY+KkNC0Qes/rnRdO4JpN
	M/c5tZZELCUKhHaBJrB0+ONGV9xrx1jMU2nJZFXy9wdz5+KmIPwMHmnk9xLGuoO/P/C9
	KP7wNpC3ihG6aFfaBmYMp3A4vl84NV020Klks0urgYOMUQIovXBAufAzfrvWulPXaM4s
	k8sUM7qoOYR/ynbvQQKp/O7u9KIUdbuJO4wuar6RxPOL7uYG5gPKUVZnlneSYIMS5DCT
	1IgQ==
X-Gm-Message-State: APjAAAXnCj4uZHgkjmK3pKKS5RD2J4fay0LrVZGWKVvv3AvoXlbxvBrY
	j4pWAuJy6uCx0aOZhJPjNkoWJfB+YEHTIJsw
X-Google-Smtp-Source: APXvYqwl7evuUrYni3w2F2gsL6m9UtQ7exBrGCP8eQ0a5YQfzKgBImE42kyS33jd60ULL5+atYbLbQ==
X-Received: by 2002:a1c:3dd5:: with SMTP id k204mr1228364wma.92.1579111728218; 
	Wed, 15 Jan 2020 10:08:48 -0800 (PST)
Received: from ub1910.Hitronhub.home
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net. [82.4.207.62])
	by smtp.gmail.com with ESMTPSA id
	s10sm25407454wrw.12.2020.01.15.10.08.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 10:08:47 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 18:08:28 +0000
Message-Id: <20200115180828.17399-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115180828.17399-1-pbarker@konsulko.com>
References: <20200115180828.17399-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] kernel-yocto: Only override CONFIG_LOCALVERSION if LINUX_VERSION_EXTENSION is set
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
X-List-Received-Date: Wed, 15 Jan 2020 18:08:48 -0000
Content-Transfer-Encoding: 8bit

CONFIG_LOCALVERSION may already be set in a defconfig or config fragment
and this should not be unconditionally overridden.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 70e131101e..597abe7727 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -359,8 +359,10 @@ do_kernel_configme() {
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-	echo "# Global settings from linux recipe" >> ${B}/.config
-	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
+		echo "# Global settings from linux recipe" >> ${B}/.config
+		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.20.1


