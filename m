Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B72E792C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:58:13 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v8-v6so11720488oie.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 19:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BmKcglpYWbfEcVhut2Fo9npvTdzykMcJmZ0O9SccmjI=;
	b=s4u6XLw/q96ZyEVgyRFahWkTeKp82fRsYXgTljogOGoc+WaV/1q6Iv7wf0t5e29Iff
	MmEiMx8usNxbdavbLo0r6fk3Fxyel1GJvPvhuE38IMGyJLYfRmtX6NfiYScpXWsQUKBL
	yA3CqMcAO6Kbc7VY0UckioOuhzYw3EvVZJ+LSVIa24AemEPcIo2SuA8TXxK1ddOJs3nA
	5GXiN+JYZgweh7S4F7XnDqaJ5Z6ya25dyx1+GD0lB+VMMPFBmpQuVcdvgpMN5h+7iQkE
	XS33KZsU31Xtdd9OgJgeqFfCTrtXaVhRaQompH9gO/Nlhh59oZPZO0jy5K52r82tHa96
	nPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BmKcglpYWbfEcVhut2Fo9npvTdzykMcJmZ0O9SccmjI=;
	b=PvfvI9elXiJ3D9M+voZHplCK3enXrxUuG2CgZAxiST24cYokzNkZmB694CAzXJ7x26
	JP92tvPs08YRJzNuhIr1hbcJm2rgA8SKH1DRZkoO4IiRoVFHTLFP30ttHbbjR+tn6bu6
	WH94XoSxljHhSFW8dQk292Ue1XwPcylX5gENn5al/0FKxSzht5kD8rgnnAsi2r3WdqtQ
	6ynqg9LbKzFzl4c6GuL6qKE/Sz9vN9rU4VTr33RKQTJDcROy50avGRmjAQQIAClORamx
	am9gZLC2UvtxfdJ7IWKa4cEY1nHVWD5CjXUpHPUDNksGDckZ27ZVdhcHNrCl/XsNBXD/
	L9GA==
X-Gm-Message-State: AOUpUlERaJUPTNKTs71/0jNYEtrqLif7HHoKJixiDIFR10PZaeVlqqsW
	5ynvICSJJukaFss5yZJQPRFUAQXKFWo=
X-Google-Smtp-Source: AA+uWPxNedNj4ZS8OBV8PAfzKefp9q9LG+yXJvV/1eKYHgCJ2pIVtquiL+AEo8FKUaQwhjJyGC28ew==
X-Received: by 2002:aca:4bc6:: with SMTP id
	y189-v6mr567413oia.181.1534474694195; 
	Thu, 16 Aug 2018 19:58:14 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.79.78])
	by smtp.gmail.com with ESMTPSA id
	i19-v6sm449019oii.30.2018.08.16.19.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 19:58:13 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 08:28:01 +0530
Message-Id: <1534474681-13923-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH resend v3] oe-run-native: Add *-native directories under STAGING_BINDIR_NATIVE to PATH environment
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
X-List-Received-Date: Fri, 17 Aug 2018 02:58:13 -0000

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

* v3 changes:
  Make commit shortlog < 90 characters.
  
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


