Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACA978F1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so9094347wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=THfVFp+H1ZC0XZNQp6cahfGAlePcJ9SRW4GlgLrW6ds=;
	b=T21JlFShgUin1NrLw2rKim15G88kZgK0+fIA8T4Da+nDJ0Nxb030ytfRh4FsNlXi/t
	AITcPIiU51xYt7n7/A/R/QcLF1B2uobHAAgt3Z6DHfY5NUt6UunffQujsNCaOKU3h0Z8
	qWQjwqpAst3WxMzFRDL+/DHAehdFtuSUDNh8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=THfVFp+H1ZC0XZNQp6cahfGAlePcJ9SRW4GlgLrW6ds=;
	b=RMtPItMDIfpux47klDWZiB8W8dD3ite+JW3sGb6ABQpSPxgzstSHQ7SnGiA99yfB8a
	urq90ZYGKENxsEiQPJUX6Xlyl7dCYXm2TaD/xhSQXxUCUlBJV4XZKH8gWS19TbxfnMCi
	OkCiKtYMDU5/wV+2UoRW6ykTapopUUxzlKy7nxBaS/vqSSIlDkmbK3TZiOPo2H1KhPhw
	EvpJGF18auESYqyX2l16IzUIZXIWY6yG2tWi1bX+B1OUI2s52QCM2gyzXv/tIQJOM5Cs
	6/INx8rxMYI55lVUyLPPTCqyHgd1lh5tdacb64Q38bSaIlINSPcdcTu5XoYiHYHHjrRR
	g8aQ==
X-Gm-Message-State: AOUpUlFFz+XEvP2cusyY+VDJw9g/9czTkOo4gcxkTB1m02w3nMaA6taJ
	wUmtvvKvAbLwG4GjZpWaD9CGqYlm4gw=
X-Google-Smtp-Source: AA+uWPxtks/1A72qGXGB06EGcvdWCDVvfvrBWRbQCyTZ1guXCh40Xlopb/cSdLM2LhbJS6eZs3ahVA==
X-Received: by 2002:a1c:ae94:: with SMTP id
	x142-v6mr8833022wme.125.1534170521748; 
	Mon, 13 Aug 2018 07:28:41 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:32 +0100
Message-Id: <20180813142835.5309-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/7] package: Fix file copying to preserve sparse files
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:41 -0000

We want to preserve sparse files when building the system, add the option
to tar to ensure we do this when copying files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8459d39b27e..a1169489522 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -649,7 +649,7 @@ python perform_packagecopy () {
     # Start by package population by taking a copy of the installed
     # files to operate on
     # Preserve sparse files and hard links
-    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (dest, dvar)
+    cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (dest, dvar)
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
-- 
2.17.1


