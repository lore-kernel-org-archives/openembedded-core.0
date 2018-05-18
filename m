Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id E8B056FF0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 22:50:46 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id m11-v6so10933425otf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MOvMmMmR8rT0t0jo+U2imftyyGV+nqjjh9AHsDgd0s8=;
	b=vBBxRZdXf6fHwwympWAOcxQasElUF7jTneZBqqh/pTSNWBWcNiJ144LsqvpFBoxUNz
	dzmFozesu1mdYQSxjZt5dxxHNtwynVrmqXF0Mpks3XfcVsFSKoqhc7GMKFw9TyUnEePa
	1SM6gzTbRAMw5cRJvJxUKDrwy8OglpRhXaRdEynD7+O/6A1+bVgoy+v0HBJiAsqttVLp
	Fr6PzOM+kmtlXqQHXlNtA+f8ty+mrYxFOtit0yFPaZXvp9qEvCLCJDtoHhVa7vLi3Xwu
	rjzSQApHW2fOkFXF0bdqUjxv7Vz8VJRCL3ikROM5h4ipezvR/3jRYS3c7om4pRqhJzSV
	H4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MOvMmMmR8rT0t0jo+U2imftyyGV+nqjjh9AHsDgd0s8=;
	b=IjpTfAMPcpJVulE4is1cg5XHKQkrGSEYjtVnc6ufdqbf91QoAZWkU2rB5eqAXUIAgv
	idgqBlBSIB1k1oMOtRbsGdJKvgtaMAn7UDmR3bpDmcLALgDZM+BGfi1JNkZGlmDj3j9q
	6/+3KwX+WsLpKiR5jB67BcunNxwuU/tN/nlTwb8p7R2BVBxnYqzY+0HBYyI1EYSt79Ze
	eDyVAYr3oVvAmB12wtfbfxjUh+iXh3fuOpWC9HPzIGVGH/9aq3JtTrk37DvIIpUPZnUm
	jpi8/BQtkIEyEqpK2uyFR0m0dj0bWYj4tKR/2MchaEkRQINW/GRKzcln+2W032jnDYGx
	lkVQ==
X-Gm-Message-State: ALKqPweAkugVEFcBRrJY+bmgnP1GkVq+I2MGpX6D/uWHZtuHuXriRseW
	fixnvM5FedT0yUBNT+SYzpd4oQ==
X-Google-Smtp-Source: AB8JxZp8vHaW6hiEuXCLjJpb/vQEqadR6/6/ddrsGs5Xod0/RpDd+atiHdjS5PA0+CICwXUx0nhQOw==
X-Received: by 2002:a9d:bf3:: with SMTP id
	106-v6mr7333211oth.285.1526683847609; 
	Fri, 18 May 2018 15:50:47 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p200-v6sm4481629oic.51.2018.05.18.15.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 15:50:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 15:50:40 -0700
Message-Id: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Fri, 18 May 2018 22:50:47 -0000

Although there may still be specific cases which can benefit from the
ARM instruction set, the Thumb2 instruction set is generally a better
default for armv7a class CPUs. Distros such as Debian and Fedora have
been targeting Thumb2 by default for some time.

Note that setting ARM_INSTRUCTION_SET has no effect unless
TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
of tree machine configs may need to update their DEFAULTTUNE to take
advantage of this change.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index bad1c27..a2663d8 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -1,4 +1,5 @@
 DEFAULTTUNE ?= "armv7athf"
+ARM_INSTRUCTION_SET ?= "thumb"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-- 
1.9.1


