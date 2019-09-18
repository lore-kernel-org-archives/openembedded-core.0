Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD1190185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 12:16:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h7so6645836wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SWlc3FnISzzqhwPiPVVosUp4Ez4erz+PRjv3m7flv6w=;
	b=q76CM4FSl8BAs3lBEns/tW/h9p2rNI+Rhn1skr5/dWTx4X+WlAYOwjDUGMTpCUusY3
	2BbrFe5kbHPMgAQetNOqYeXyquUN6Y6xcJuVcc7eYZBgE96zAPtR4yEYP4Kb7p1Xr8E0
	Hx8LQPnsaQSDC0cqfYY9jBNQuTtX+LGWMcXgIbkJNBg7TUjlzqXsuaFPwtDJ10X91Hri
	MfRPZt9Do+JpfhdlSxs81C6JdgN4+pcfNCCg7YN2cDf3kZaEyNZbm1ej1J/7IPRShFjv
	pbqRzXAZqteo35uTbFQjxB4EL3SI5WCpQujiyQt4gKeRwnqiKuTUlt6/z5iOUsJgv6Oy
	F0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SWlc3FnISzzqhwPiPVVosUp4Ez4erz+PRjv3m7flv6w=;
	b=rrwSiQgDENKzscaEDvwRunSXoWpOcl6URcXdkcPUfJkm7FkY8rDf7seXTL3qoQG6Gc
	qPNDbm8KuYhQPcWYL6Uy5vxHrVCrY3K7xZti1cc+LTzQMdGdowRYDNNx5s1af7GPyEPd
	6UqyxRPUQPU4RUejF5gGO9qDMCGDI+T24PNG+TULlIiAaIc/ysdaVPsRrOqMmx4zxlDM
	GxjVC5yl/NkqHd6dl5g47ct9LYcV+UVeW4/7Ud75AP3ApibnmOdDnaHfAm56kiyygJh1
	66b8JEbt6MR95EgEiTa/h7TPb2ZAE+lvfhxhINtV6TG7TGrJvKTvOKM5TF2YGxzrkAud
	xU8g==
X-Gm-Message-State: APjAAAXinWtfaXMzs9f5F4bez5aIT4g+Mq2QgNv8ykpYtXNwv3PTKBm0
	k6l6/b/cxUp9AEZMMoCsybRFkRPZpDA=
X-Google-Smtp-Source: APXvYqy+j7Yb2BBZEjt+lMMTHQ1OlTn/OCUOyCfOMB2BZRAS2o8lIZhzs1DCWSS8xepIAClkOkXa6g==
X-Received: by 2002:adf:f303:: with SMTP id i3mr3005027wro.242.1568809003510; 
	Wed, 18 Sep 2019 05:16:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d78sm3344254wmd.47.2019.09.18.05.16.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 05:16:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 13:16:40 +0100
Message-Id: <20190918121640.31682-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] rootfs-postcommands: check /etc/gconf exists before working on it
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
X-List-Received-Date: Wed, 18 Sep 2019 12:16:43 -0000
Content-Transfer-Encoding: 8bit

Check that /etc/gconf exists before trying to find files under it, to avoid
writing find error messages to the rootfs log.

Also use ${sysconfdir}/gconf instead of hardcoding /etc/gconf.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index fc338161c4d..88f75d0f442 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -361,7 +361,9 @@ rootfs_reproducible () {
 		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
 		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
 
-		find ${IMAGE_ROOTFS}/etc/gconf -name '%gconf.xml' -print0 | xargs -0r \
-		sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
+		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/gconf ]; then
+			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
+			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
+		fi
 	fi
 }
-- 
2.20.1


