Return-Path: <matt@madison.systems>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14A3C6059F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 13:20:07 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t12so5270912pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Da/0wFQi5CImO8kxA3IXZuphOL066+RGPPu3nhwqBK4=;
	b=qTiYnLE80ia05mJbPZS2yJ7dEb8Adz01RzavSo1AFxEmlVeQsSUCMk3+9fqX/J8lVS
	dILPP0lb/me3+ZsTOwCpnjbSfD1fHhCcINTagHFuGau6lrzNU0LXuD1Bo3wS6iCmj2AS
	1zyTv9a+jMv0k5BC8KGfAXlGtb2rv90Xb68FfwjlFAZ5x6bgIVt4hfdYtLPbynf1yRUe
	gXzbYtKCOw2u/YWiFo28IiLKPrKMUHrIkmFaAMxjopWtt80XXPu/L5QAn9oypNCE6LZC
	v05yF3M9sEPIRFzwJnuLM0bFyRtv3W4yoH4/+6YAIORUEY1Npw7gztRej8xavg3CbSkZ
	HjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Da/0wFQi5CImO8kxA3IXZuphOL066+RGPPu3nhwqBK4=;
	b=R2cj8A7xje3lNuOEuX0fnpwBi3g98WD6TsZmM/VFhbINzlGOyd3S2GDWdi3CZPNN50
	5zrpUs6eTI6NrHHlfmVSCz4nGIT3VcwJlSVq32mbvp3KSWc0+io0h7az08pGh8Zm1YDh
	TVN+TQ0Dr276UdUmD9+ELlCDMs8II3aPqAPf/W0G3ljG7AaxFgvMiRqTp3gl/vbTG+oJ
	jJZbVanvqmaIdlaROS0Md7alDaAf3xyHNF95vyweByd8AcDoCtri1tt92XzvkGbM0oTj
	AU96RlozlT51xsCarnrKLPOqpJUeVnprsIKcDeKXPPeq19UCiwfTpxi8bzxmX+mZWEj7
	PHUg==
X-Gm-Message-State: ALQs6tDbdAvN9wKXRWlP3PtPA89Jx4H/+cwgzJRgUHPVeFgRO11QmarP
	y+cqvKIF57qcYFnOJ8l0k9dVjD8d
X-Google-Smtp-Source: AIpwx4/iQTnW8/tXhtlhv5MIg+VsGiDUfzaMlDK9KCCH/bHIADDurbBfZSYZazOzkb8zB5cwJrDzPQ==
X-Received: by 10.101.64.70 with SMTP id h6mr11464810pgp.135.1524316807621;
	Sat, 21 Apr 2018 06:20:07 -0700 (PDT)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o88sm28465527pfa.29.2018.04.21.06.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Apr 2018 06:20:06 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Apr 2018 06:19:37 -0700
Message-Id: <20180421131937.13745-1-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
Cc: otavio@ossystems.com.br
Subject: [PATCH] go-runtime_1.9: pass BUILD_ flags to cgo for host-side build
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
X-List-Received-Date: Sat, 21 Apr 2018 13:20:07 -0000

When running the make.bash script to build the host-side
tools, make sure that cgo is using CFLAGS and LDFLAGS for
the build host, rather than those for the target.

[YOCTO #12704]

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-runtime_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-devtools/go/go-runtime_1.9.bb
index a99cc30f63..d5279ea897 100644
--- a/meta/recipes-devtools/go/go-runtime_1.9.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.9.bb
@@ -11,7 +11,7 @@ do_compile() {
 	export CC=$BUILD_CC
 
 	cd src
-	./make.bash --host-only
+	CGO_CFLAGS="${BUILD_CFLAGS}" CGO_LDFLAGS="${BUILD_LDFLAGS}" ./make.bash --host-only
 	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
 	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
 	./make.bash --target-only
-- 
2.14.1


