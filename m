Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 277A26E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:45:04 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 8-v6so9538020oip.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iqbrn1CxxPRNXoQmAfaJycJ2W081bners3aJZD5wToo=;
	b=z5e0BDoZDrPdks7PJAwB7bQRt/yjjVSHVlL2RWo581u2tnHHSlNwsRfUGnJmuyMf9Y
	/WvMee+ILfUEu9HmbVOR64Q+wjc2WMjBfA8YnPpL8WI4K+jGoODVIJ4aYjrlB6Ail5DL
	23NFpG+HDemTqnKUwaPmJcZg89NEOpNUCbiCJ9V2zQKxIVM+00wgLiu+Jidq/q6+45Kr
	LD3un2zVHWcRfID5BF/WRh8TXXVZNtpvZTejkALKhlhJ7zzy4itLZmLm8IpzEYyTi4QN
	O6n5jnYKd17PV5FkJdzKWg8m4KqHuY6ZCkOx0B4Mza3zs+nf8uw8kqzPVNyUB5ggdYIo
	EwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iqbrn1CxxPRNXoQmAfaJycJ2W081bners3aJZD5wToo=;
	b=IGHL+PgiVvPAJeHW7SQBHzhkXLXVDSmeufReuCTNiLOhpffpK1451J8e7MI/NVEZ6/
	Up/2HmFzlCykdszCawlYz7zEQDU2iuUT0sR+17m8aMHzsZyOE4L0lZxe1AXbkZuGRSqv
	qaZSD8A9xJh7haVWs+GkA4jLv8OxSZnaT/UxzS9QNRufYSKPnLQtUPN0uIDKI6jeas3k
	LTe/s+AD0aA7IqoTfnhL/HUnb60UoADFDjEQqJBCU1LlvlyQL5uiwWXDcCFuj4hDkID7
	QsAOikvGDfv4+9s/xL9G24uNNui+lYrHBWKng1q9xXUkcNXAm5bvfQqJrcDvOijBEXpj
	mF2A==
X-Gm-Message-State: AOUpUlEPLgz/ewGKvOQuphhFLc8CZPBFQ1VhWKdDlBkHiathB2HHSZPh
	8fCZLSTWNj4AuLcyGjftMq5Y3QdYVxs=
X-Google-Smtp-Source: AA+uWPxE5wNLTKj6Tyh9XkPnrFMs8/2bNr6cTJ7Z22CVR2IKELtg3p5YsiUNXuhV5clvASSfjxW0xg==
X-Received: by 2002:a54:4f94:: with SMTP id
	g20-v6mr32905725oiy.130.1534441505884; 
	Thu, 16 Aug 2018 10:45:05 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.97.164])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm23306050oif.27.2018.08.16.10.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 10:45:05 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 23:14:58 +0530
Message-Id: <1534441498-4659-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-run-native: Add *-native directories under STAGING_BINDIR_NATIVE to PATH environment variable
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
X-List-Received-Date: Thu, 16 Aug 2018 17:45:05 -0000

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
+PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin:$(find $OECORE_NATIVE_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p")
 tool_find=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool_find" ] ; then
-- 
2.7.4


