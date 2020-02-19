Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A72AE615BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:08:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so2370642wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nSYxhSxqbZcAUjwwNIY/Ksqo+BajNtKh79vSC4I2BWs=;
	b=fx2vzkvM97xl36S7Rz+o1kiuGJZ833T3wU15LtqIGOZDEJn1Jvqmb76j7yaS2b0Gui
	USwDw6zdmjxuqGmcdNfohPc8QNwqG9WygE5FWeGpPtaXQiD9Gz8y0r6TLwycqriGopD3
	Y8HKkK4qgy6HTorQjBegZ7zlyaEhjGXEwuDmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nSYxhSxqbZcAUjwwNIY/Ksqo+BajNtKh79vSC4I2BWs=;
	b=qgclISw7C/8a9AaTF9p7YlPi07nckbe7iZo82bM539kTJyVFrPHhMvAg22mdV4Ddyw
	Cp2qy80xmdXNMOGmT3zbKLYL0AnaJx5erG8Xy+T4tNmLxo+kOGgJRI3w6iFEJQJgAc2F
	H8uyPeBiKKFuGmq4pl5PspobmsalT8cMtVAsMtwiCLnWx/9UXabINMj7l+HeZTyzQPDL
	pg28qDKzHjCvxfrM+IRXiHjzDbB2UrZascp1rju21vQpVfMfzyDdAQP/a+f4uht63FcJ
	2S8+LXUGNiAWRBn812LIn31wt7y8QIKTe+ZS3tK66m2d7NcTyV0VQma1FVCtNfNFuJGS
	t5UA==
X-Gm-Message-State: APjAAAWcAtI0s3GvZtXFxuK3qBPAzEKKXbbkSEaoRjHzqx/LWIL3aLsY
	SPJubyjwrobEZ+qfN4fA6H/GH8cgVPI=
X-Google-Smtp-Source: APXvYqx4TtvxZneGtJhTGUOG4YZCxGohYlq/kpnVPx5pRZRtxylUGeByJVu1pJuv4tHZSL0643h6Uw==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr38112774wrs.395.1582150118921; 
	Wed, 19 Feb 2020 14:08:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b10sm1495037wrw.61.2020.02.19.14.08.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 14:08:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:08:37 +0000
Message-Id: <20200219220837.139051-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] local.conf.sample.extended: Document how to limit parallel fetch tasks
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
X-List-Received-Date: Wed, 19 Feb 2020 22:08:40 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13235]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/local.conf.sample.extended | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index fcf4a9b7c1a..443b4e83f9a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -23,6 +23,14 @@
 #
 # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
+#
+# Some users are behind firewalls or use servers where the number of parallel connections
+# is limited. In such cases you can limit the number of fetch tasks which run in parallel by
+# setting the option below, in this case limiting to a maximum of 4 fetch tasks in parallel:
+#
+#do_fetch[number_threads] = "4"
+#
+
 
 #DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget usbhost wifi nfs zeroconf pci"
 
-- 
2.25.0


