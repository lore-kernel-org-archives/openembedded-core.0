Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 08BE190088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 07:45:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n14so1932957wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHQ+a/khgTrl41H7+XbM4RHXWIX1Dn+MFUaHNyXYncU=;
	b=m83k6YhAGJVL3fAVh3nqHIdwb6JlqSPdaZuhhF1k/EA2TlGrb4+Fq0I+f3dd3yA31V
	5AHqKVfHkEKX5RdSyfp5/jFBB7KpNWGkZNBy26Nlj7GAAULQCaBFJdT+uqN5fZiSWvts
	WUFNLujxVXkfhjcArxxITwP5NMW64P2gv5itFq9814vYlSZZvwmfkphD8zdunjTSSkBp
	hllQFy7QAlzvMxD1I8lXtnppYbCKHfD3C3eHFzHMxiLQd2bAFq3cVx9za0rdZoKVlzka
	+ddpsyXPjhAyGL0bYdG7FCzSJVx8vUKIcZGj5DXUb5AWIaZsHzR+v14XiatUS55i1J+V
	OxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHQ+a/khgTrl41H7+XbM4RHXWIX1Dn+MFUaHNyXYncU=;
	b=NLwdGlYhfItCy0f7kpeXlanfKG4dGoeAiUO/JrBtdrVQpZvgLqSbvnI18ZyIOi82Vg
	cLoiHgmOOQHeUvfjlMfjUuWUFKh5pqHho3RrRhZ8GjC2e0lqoCxEHJ+i5CQ/djt1mUPP
	UobuRqAtTalQMmTQvcYmmyatQyg1uV45SHjQtZ+jTOJWMAjuTbGW5q3FLeWz0Jcmjq4e
	lGmT1xp/MFItXrb2gcupGfnNvtwcMLT4Dvcj+pDEDSwt9OvmoOVeBQ4cZzIKGTrVS5e4
	h3pc65edTaooEEsBzxcQObxQidDOS8AeZg8g9eXSn8KIPqK7kiAnUn2M7Xca5xDY/l6o
	Ml2Q==
X-Gm-Message-State: APjAAAXJ7/zq0v87XHlbBa3P24RQ8LzYXlVEyMzgcZHQiXYRTR1gTTrG
	TvCM8eToJgn2UOeJoSOYOvayEzricjJTiA==
X-Google-Smtp-Source: APXvYqwBWOi8JS+DwlzBUfMmnuyd0YROcG28VCtMSwsuOQ7lmo+vpCtdAf7whNphSnBCwqA/K+N2Wg==
X-Received: by 2002:a5d:4444:: with SMTP id x4mr5990640wrr.11.1568879119482;
	Thu, 19 Sep 2019 00:45:19 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it.
	[217.133.17.98]) by smtp.gmail.com with ESMTPSA id
	r9sm11480389wra.19.2019.09.19.00.45.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 00:45:18 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 09:45:09 +0200
Message-Id: <20190919074509.30077-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH v2] initramfs-framework: support PARTLABEL option
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
X-List-Received-Date: Thu, 19 Sep 2019 07:45:19 -0000
Content-Transfer-Encoding: 8bit

Since commit (kernel >= 4.20):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f027c34d844013d9d6c902af8fa01a82d6e5073d
specifying rootfs by PARTLABEL is supported. This commit adds support to
specify root by GPT partition label.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
Changes in v2:
 - renamed misleading variable name root_uuid to more appropriate name root_partlabel
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 76fa84d354..2e400bff41 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -31,6 +31,11 @@ rootfs_run() {
 				bootparam_root="/dev/disk/by-partuuid/$root_uuid"
 			fi
 
+			if [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
+				root_partlabel=`echo $bootparam_root | cut -c11-`
+				bootparam_root="/dev/disk/by-partlabel/$root_partlabel"
+			fi
+
 			if [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
 				root_label=`echo $bootparam_root | cut -c7-`
 				bootparam_root="/dev/disk/by-label/$root_label"
-- 
2.21.0


