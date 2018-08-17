Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCFC748D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:24:02 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 8-v6so11651530oip.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 19:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8VmnTHyd+T/HpJbAjCkeLtObaoF2atq3YzjGyeaiZrc=;
	b=FY/ADiiJKMlU2/1OuMEzt9yMzQ4Ec8uPYWlT8QxLVLnXhSirBDS2DDxOg6ee3AHMRm
	e97NB8CwkzLyVvcKZZk5+ywodnJZbUC0rjZqQx2BYl03nxJQbDG7OlfmlSK5M9JLIXwq
	ERrKFeZ/evORWbOWVwMPPmabig1pAergPI1NOUgukn9bBUilnCUpXHql+O+5rrHlsfiH
	3/J/F+5IvCru/GivqYM6n+rG8+sDwUGO4Q9j6xA+uERa8B3w9bsz8BW6LXBf4Cyc9HQp
	285Fn6lQVHf9xR6NiVX+RzJS4YC6ruxS2qoBkZ1m7A9L7psTO48BCYq4QD6s+V3sZPME
	RElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8VmnTHyd+T/HpJbAjCkeLtObaoF2atq3YzjGyeaiZrc=;
	b=I1XaEgA5JgrBpieYGNLuKeALeSX99MXO8sEkkKt+H84hwCMhyzvX0DH5s7+8YOA+aF
	1vTN8T6vxzNnRjQ8IXdROeliRsoJ7u/S1sYEyLA1dNIHjblDrfKfwMvoPYr47AfG7hlX
	nBK7k88OjlD8NjrzbvF7/llHujkRdEViCK/WKmAne9F5CW+y8nNfcH/8P1ytm/cbtB3c
	zw8VIhzIRlaSqcr0iFUeyIu7VqfVHNajuC/s2qnPKdnvGYZWZyZLRnkaz5pCYIyGkYnf
	3U7QKzwAfeY3Y6h1YIMeyx6klSzeMGlk9J/mHkLSjN1MnORkvoiqIwEjtzhpf/ysarat
	/KXg==
X-Gm-Message-State: AOUpUlF8Svw5gmGAXURQd5ZXNNAhinDqL2SgTvAkOVR/9g+3F0SeNA2z
	WsixwbDUJg5pb6kP2YXlrrFxdSxh8/Q=
X-Google-Smtp-Source: AA+uWPw7r+XOUU7XgMCuUByDA7QzDH/o7tcQvw72oICn3HeM0xLcSzkYxNzAt+T7C/Fvl2ogI86c2g==
X-Received: by 2002:aca:e8c9:: with SMTP id
	f192-v6mr498004oih.87.1534472643377; 
	Thu, 16 Aug 2018 19:24:03 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.79.78])
	by smtp.gmail.com with ESMTPSA id
	d5-v6sm494969oia.57.2018.08.16.19.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 19:24:02 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 07:53:54 +0530
Message-Id: <1534472634-13554-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] oe-run-native: Add *-native directories under STAGING_BINDIR_NATIVE to PATH environment variable
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
X-List-Received-Date: Fri, 17 Aug 2018 02:24:02 -0000

It helps to find/use native tools under ${STAGING_BINDIR_NATIVE}/*-native.

Solving below error:

$ oe-run-native python3-native python3
Running bitbake -e python3-native
Error: Unable to find 'python3' in .../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native/usr/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native/bin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native/usr/sbin:.../tmp/work/x86_64-linux/python3-native/3.5.5-r1.0/recipe-sysroot-native/sbin
Error: Have you run 'bitbake python3-native -caddto_recipe_sysroot'?
-- snip --

After this change we have native python3 to be found:

$ oe-run-native python3-native python3
Running bitbake -e python3-native
Python 3.5.5 (default, Aug  8 2018, 17:45:49)
[GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
-- snip --

[YOCTO #12889]

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
* v2 changes:
  Removed extra colon (":") at the end of the PATH value, if no *-native
  subdirectories are not found.
  
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index bbdd1d8..8412b18 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -55,7 +55,7 @@ fi
 OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
-PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
+PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p")
 tool_find=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool_find" ] ; then
-- 
2.7.4


