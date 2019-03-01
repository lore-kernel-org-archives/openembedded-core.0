Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2E0A7CD37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:34:33 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id f186so9528173ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FomxVYnJI+dMCUWWJYObd5/NbgbjMsiln3Vti31a5Bg=;
	b=KsYP3Qe68eatvoNLaVMH1Cx9A9iT+hN81D+iBJ2I1A+T/k6f78Cg3X8eCKP6lxoAmR
	IWSkvPdUf20lagViMpcLOT8DAOZOzAmL6+K9CvcUEsQMq2JgOrY0Qk5yUGT9XlerwHpU
	a4t5X8NgZNBb5W9tHNuZv6oxP1l7nN4j9oivah3PX+1XRaQPjRonnRcYuqQIOSI6lqNO
	V+2uJ/KLZB5sr/QX2u4wfqYIx3AGyL34/bwZEQ7pEifyRgePnU2OmTgjN0AvkNI5C7ff
	/2swentKcjFib3R2u2QNe0HvcnkFCu2++TMWobzviDB59aEfaq30pBiTP6/KfycG0wZB
	AzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FomxVYnJI+dMCUWWJYObd5/NbgbjMsiln3Vti31a5Bg=;
	b=cVZ9riHvoixRVFfyiXclxXQ60fw8tbPm2z5qenGa0UuO5s7/VsYlaMNZmRhrdPQ6I1
	rRjGzYx0yUO8htB7sXfV3IOAiC1CxVg5vL7kd0PViIXYvxxWe0zGC/NYcwMzyZM6JaS5
	h6Y1PIeMC1Ih1dIcfMZUdeo7dLBZ+Xkz0DTEESd3odGSn0oyGpi5ePpECm7QzMWbWCFR
	WP0sfvB13tkHo4f7xhZBh2mPJWvd3clwRTep4D0KrFFlCoqXwqodzOP19LP2M+SevmMp
	75yrChiMQ98H7LrW5BGpsdkBcpBrCwh4KxSlNaqRrmGHciu03x8LlihVh/xitCyCj6yG
	qyNw==
X-Gm-Message-State: APjAAAXrqqrk5zUYin+bsQh4uqYZORQvVmyH5DxzEv1BYhfkqpkRUDa1
	mQnkcQzwS6Cxk+BH4p8hBqw=
X-Google-Smtp-Source: APXvYqx+bov1RJuhI/MkO/nT1aT2DjfHDKTiIsR2D/UnqUCjzosPALtj4lMwI29cmGLWxaDL2gHTPw==
X-Received: by 2002:a24:7c0b:: with SMTP id a11mr2154360itd.161.1551418474823; 
	Thu, 28 Feb 2019 21:34:34 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id k77sm3935110itb.7.2019.02.28.21.34.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 21:34:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Mar 2019 00:34:26 -0500
Message-Id: <397b5a26c0f620f4ccd3d1e610175cac0788d2de.1551418113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551418113.git.bruce.ashfield@gmail.com>
References: <cover.1551418113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel: add objtool to shared workdir when CONFIG_UNWINDER_ORC is set
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
X-List-Received-Date: Fri, 01 Mar 2019 05:34:34 -0000
Content-Transfer-Encoding: 8bit

From: Justin Bronder <jsbronder@cold-front.org>

Based on: https://patchwork.openembedded.org/patch/148047/

When x86_64 enables CONFIG_UNWINDER_ORC [ORC (Oops Rewind Capability)
unwinder for unwinding kernel stack traces], objtool is required to
generate the required information.

If we don't copy objtool to the shared workdir, out-of-tree modules
cannot generate object files.

For instance, meta-skeleton/hello-mod fails with:
    | make[3]: *** No rule to make target 'tools/objtool/objtool', needed by ...

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a5b1df1b0d..9da9818962 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -487,6 +487,15 @@ do_shared_workdir () {
 		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
 		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
+
+	if (grep -q -i -e '^CONFIG_UNWINDER_ORC=y$' $kerneldir/.config); then
+		# With CONFIG_UNWINDER_ORC (the default in 4.14), objtool is required for
+		# out-of-tree modules to be able to generate object files.
+		if [ -x tools/objtool/objtool ]; then
+			mkdir -p ${kerneldir}/tools/objtool
+			cp tools/objtool/objtool ${kerneldir}/tools/objtool/
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.19.1


