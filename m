Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3BD6176F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:20:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so1836174pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 12:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=UU0g/1rgxJzrfo+/U/o4HWgdlokh/6EzcajWcvUDszc=;
	b=JhvJtAVT5aH+fZNO211amgpMrbk5KnmYXnd7zt8mzNuMi7Bnqydd8qTbpMuaURfPZt
	Pv/o2hmwdJVHth+5/mLLU0LlO1vH9pvVPfIMi3zrYUELyBJuTByNq7DnYmthxTbZ/4m2
	5tXLPAkqnSEgLM2vxBYHl52PRlTYX/ttVtmyUFRvO/XuAcTc1znk2b80s8T0S2BIzp+a
	gE74YO86g5126dC6mlGP/ufuhnL698kYegAr+LIWirCyH1y6UP5WT1P8wmJeV/qt6V3R
	YnogSCniLaCmbobcrhnBkeOrwxuNDFdPQwHja2othbxjFIFClM8mJvB6esHYnZjAX86G
	6ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=UU0g/1rgxJzrfo+/U/o4HWgdlokh/6EzcajWcvUDszc=;
	b=XuUGwxGfExdeSW0VGmWMZzCqBeKcGJSECoUx9FXyPOdEBPwp6q5uGNUk4JIlEXAI5J
	AIHU7pXbi+1GHxl7Sy3vEajA+gyV1lWyguGdmgaLlB2+ox1T2ddNhibtCOhc6ZHbdiuR
	Jlh/MVBzDvG7nDfoqYLULyni4wiUG6oCGga1LA6MHpzi+cWpZAVzRfnveup15Xf3gyBf
	rT1WkQ70xScEuPhFVkH+aaWcLnIu5PUP3eu0qFHPJ6/KSfvOYfIe0NXKJykOblGL9WU0
	MWdxXT5ywn/8V7ZYjlcmPTaQi2erVDXtpQy1ifAYycehU8S4JurJceM1Qv6zozgLpYu/
	sHdw==
X-Gm-Message-State: APjAAAVvfPI8LrtpgEDNxt7YxKqGn9e4vyBDl9obSBYu3VXCShXyURzc
	Xv4061KYOtHwbdFV79p6JREiu3EgJwQ=
X-Google-Smtp-Source: APXvYqzXq6F/SDgdO3TJE9LsuA30ouYELSv4HKTduc5hypA/D78mdljAEgmBK/m8SdtOPrxbZpstng==
X-Received: by 2002:aa7:8193:: with SMTP id g19mr39528913pfi.172.1582316420043;
	Fri, 21 Feb 2020 12:20:20 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	c15sm3545834pja.30.2020.02.21.12.20.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 12:20:19 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id AEFF12A04DC; Fri, 21 Feb 2020 12:20:17 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 12:20:15 -0800
Message-Id: <20200221202015.32647-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] toolchain-shar-extract: ignore timestamp on decompress
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
X-List-Received-Date: Fri, 21 Feb 2020 20:20:20 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Installing on centos7, which the extended version of the
buildtools tarball is supposed to fix and with reproducable
builds turned on, all the time stamps are for epoch. This
results in the following output for every file:

tar: ./sysroots/x86_64-pokysdk-linux/usr/include/c++/9.2.0/cstdalign: implausibly old time stamp 1969-12-31 16:00:00
tar: ./sysroots/x86_64-pokysdk-linux/usr/lib/libstdc++.so.6: implausibly old time stamp 1969-12-31 16:00:00

Ignore the timestamps during the uncompession step.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index ccc4f4e1ac..4c4b4deb4c 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -249,7 +249,7 @@ if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
         rm sdk.zip && exit 1
     fi
 else
-    tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
+    tail -n +$payload_offset $0| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
 
-- 
2.13.3


