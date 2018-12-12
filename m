Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1B476C04D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 20:18:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b14so18978534wru.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VmX8JTbIVlBHl+joQ3IGZRVxy4JNu0ekr1Jq9UNwdMo=;
	b=Nu94StnNqkz7sC9jDHYP4c83wyYTZY0/ohwNNB7lYM8oq9c2jouU1Q5eQRqFlmijVL
	pPn8Ndm8CHnxZgB3wQi1qXiapC9IMEbPu2l+wn3nYf8fwmudAC6XeBwE9tXBCpwHE8rz
	uWSwlHbbcymX2Q34w7Jak3NrElobLPiKWN5enijUBY1BwNXgiR00QEkJpHmhtGk0IA4w
	h58YHIrZWY52Z5Q7enM4yXglKL2l8I0FbhxjoJdaQOK3owuRgUXQCGR1jETLKsA7n9m2
	T+OvteRUfMT7s1EBVuaMbCUla9GEizqbpq4hKrgjjiAMU3ag4wcucPvK0qbNaIUIvaUo
	BDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VmX8JTbIVlBHl+joQ3IGZRVxy4JNu0ekr1Jq9UNwdMo=;
	b=rBWol4T+D1/HPb5d7Nso97jzbFZGByZRgDfzMso1dHw6CcaLRLN55tiZX1k/ny0GIf
	Oi/ruUnar6EpAL/FnWCEkPfzuFPrJdq3WfmcyPUtFo/AAOgOwakBHohszDzlwd5PEWO5
	vmD/0cQV7hbevUcXF1H0cssWyVl0JIzmua3FpU6SxbSuAudzzdnnBM+SKsvuZg90cMWR
	jLxI+2GjXPWwA9DWDKLz+hqydWMAkvygAupUoJLNFugYI7l6qWcbMX4csuhujdybth7q
	NV+HLUOvTJeUVxd5oemtAPEBSIUsik7ZSLzG+8108VFvy+WQkDCDHvEJphtqnOjCWjNh
	iJFA==
X-Gm-Message-State: AA+aEWa8ScY22TswFyBgtSr2XU8+KeLM/hirIFVnvYNWOg25HjN9zJGm
	m2LyzHZ/6+NSrKt1eVswVNJOgaPwKbkOTA==
X-Google-Smtp-Source: AFSGD/VPpxnZL2pUSQHwoVxSSoiSy740+b+RUnF5PThtcauOwMXObcv6imHdkt0Y/OPWInsRhtLkag==
X-Received: by 2002:adf:f785:: with SMTP id q5mr19825768wrp.9.1544645932294;
	Wed, 12 Dec 2018 12:18:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	h2sm12549906wrv.87.2018.12.12.12.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Dec 2018 12:18:51 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2018 20:18:46 +0000
Message-Id: <1544645927-18002-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] uboot-sign.bbclass: silence warnings when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Wed, 12 Dec 2018 20:18:52 -0000

When UBOOT_DTB_BINARY is set to "", the keys for signed booting are
expected to be already present in U-Boot's DTB, so don't issue warnings
for this.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 03100b8a5fa1..9e3d1d6fc1ad 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -70,7 +70,7 @@ concat_dtb() {
 		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 			cd ${DEPLOYDIR}
 			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
-		else
+		elif [ -n "${UBOOT_DTB_BINARY}" ]; then
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 		fi
 	fi
@@ -86,7 +86,7 @@ do_install_append() {
 			# need both of them.
 			install ${B}/${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
 			ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
-		else
+		elif [ -n "${UBOOT_DTB_BINARY}" ]; then
 			bbwarn "${B}/${UBOOT_DTB_BINARY} not found"
 		fi
 	fi
-- 
2.7.4


