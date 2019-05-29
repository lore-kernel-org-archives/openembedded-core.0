Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F42177E327
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:48:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so2165710wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AxjMhLA9wcNnHSwZoTtS2PiNswkcQkrhVYcNbHTjSqE=;
	b=KMkD/HgKlUteKuCekLg+87vZEdI+MHj4Uk0jYpBTHY6H1il3wQMdUijtn1H1xVOweY
	FqJA1RWf2Q3gkrX92fYyRwzkpiMeJ44f/IVZEJdQsy60eTo9fXmMZOXKShcyXXgTXW/5
	LmorK0UOGz607mNG05A54Jsn9JvpGPVmMSIk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AxjMhLA9wcNnHSwZoTtS2PiNswkcQkrhVYcNbHTjSqE=;
	b=jQqJOJJh99oKZgAWWvq7a2s/I1DmU9ScN7S2zIksKzkOEedktHy6F/b2AcfP59Pof4
	hlG9T2yvrv0IU0RM79hCmopKLfcYrYhgbsTU38iXlI9FmiiijqvH/oFTu0gCOZwSC10+
	J7TLZPSJaNeumVinsvglY4LYO85yhA+U4JORD1gHARSnQFAr9Ho8/z8iDSB/5RuNAEe6
	0wyk77G7LverJOkucUDlaz3M7OJRcIeyf0SuEC3FpZiga0ocmuUb5NlUTocteDAyi3Z+
	QyU42XNSx8aMMfK8esdtCEsBKuAK6QIC2kH1zrybuE08jygYRtZdfNz4zyxYBcgwP2nh
	dthw==
X-Gm-Message-State: APjAAAU1rXx0V0QCT3+hltLHKaRROrxRwvhNlXCwMtWBZZDi72RnPwns
	xXwALghV3DBx8y2FjSxvjAb22vUszww=
X-Google-Smtp-Source: APXvYqx+i9YaZeWWnhNO5yWbkCWypjmMUn+qTDHIjyZbtoMe/HiRJSDy+Apd8ijlP9Kktw/OK8FiGA==
X-Received: by 2002:a5d:644e:: with SMTP id d14mr60954455wrw.42.1559144898539; 
	Wed, 29 May 2019 08:48:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i9sm5593322wmf.43.2019.05.29.08.48.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:48:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 16:48:13 +0100
Message-Id: <20190529154814.2996-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
References: <20190529154814.2996-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/4] util-linux: Fix ptest dependencies
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
X-List-Received-Date: Wed, 29 May 2019 15:48:18 -0000
Content-Transfer-Encoding: 8bit

We should append to the ptest RDEPENDS and RRECOMMENDS otherwise the bbclass
defaults are overwritten. This leads to ptest-runner not being installed in
minimal images. Also drop the duplicate ${PN} value which is unneeded once
we do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6dfbe0b6835..7b9b4d2a307 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -142,8 +142,8 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest = "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm ${PN} procps sed socat which xz"
-RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
+RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
-- 
2.20.1


