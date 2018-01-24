Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C97C771AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:59:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c6so2974857pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=rOeOmZwkeqI6B4q2SsVoMup6OPN1qiIKzaZVAR+AV10=;
	b=cr4N6r6HkwrARXWIQBukF1c19DbbJ3CgZdb1CRZvv8KVmN3DfIV22si+p7MzAw1F7o
	RPy9i5VkZnD0WfneadiQXT7yyURmIH85nbK9mcvvhrmBMWP+fN92etmcexJWxedPA9HR
	RIZlIEjun8m3YEZs58e0s7HTKgGUUptoBKt2gr7lcSyOAMqqaVOLLQAjvgXM8bzdU8OY
	PvhS7pYGT29sQLS5DfN2LCau4OHQq3FoiGWzcbUzWFd3u/6Lu2VOhEMM0nUggP6W5ioi
	b/8eE5ener+ZVGuN4GflzkOXGaX+8S+xMH0G/luZQ/MAOi6K7B1zPCYqO95a76HfYnRU
	PJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=rOeOmZwkeqI6B4q2SsVoMup6OPN1qiIKzaZVAR+AV10=;
	b=F3TLsqOB4O7XaqP7NCdCt/jyANA2ZyTT5mTE6se6GpnlKzh7AlJd+V2yGC7G5REq1X
	99wnnkR9sf9fgjNxeKLIIWHW7HLhkhB3sjcNhB6DgtU+YQCwLwLNsudi01g+ECQKsY+a
	03adTrPgCSgkmSkYIrei0XAFGILngjxMlRf6RfAYz3ANDouOENiUCmy6FmihR7CFTYqP
	ENtLsneI59oHkldJDaJJ7LsguSZHJUwB0B6Up6DUrzMPceO/ub8zfW4e0Ddwj3Ir9PCn
	+NrNUqvK3hdDM7nTPR/homodtmiXGnfwGwxkyUSGmdLy7bAFsnVshoDeYFbdO8BGyWdu
	scLA==
X-Gm-Message-State: AKwxytdNth5cp2TDdppy9a0IYFusbcginQ67hQokYgNfRrm+I2qxwT+l
	V+7KnFTfiys1oe2iV2vnyuGzAtqLeIk=
X-Google-Smtp-Source: AH8x2246BnrOsZeKYihGvn/0kXdFUS3dZvcwvq41BWsZfjPJOjbvXp6U88cnkbQT1yE6E9JJERSsWw==
X-Received: by 2002:a17:902:1e5:: with SMTP id
	b92-v6mr8027925plb.144.1516798783564; 
	Wed, 24 Jan 2018 04:59:43 -0800 (PST)
Received: from [127.0.1.1] ([121.223.19.215]) by smtp.gmail.com with ESMTPSA id
	14sm10959538pfn.125.2018.01.24.04.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 04:59:42 -0800 (PST)
Date: Wed, 24 Jan 2018 22:59:28 +1000
Message-Id: <20180124125928.17702-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2] busybox.inc: Add sanity check to test if the suid binary provides sh
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
X-List-Received-Date: Wed, 24 Jan 2018 12:59:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a sanity check during the do_compile task to fail if the suid
busybox provides /bin/sh. This is considered as a hard fail since not
only is providing sh as suid problematic for security reasons but also
because the sh configured for suid is less functional than the nosuid
configured sh and breaks a number of required features (e.g. 64-bit
test).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
 * Rebase on master
---
 meta/recipes-core/busybox/busybox.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4012f921c6..157aea3968 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -183,6 +183,12 @@ do_compile() {
 			oe_runmake busybox.links
 			mv busybox.links busybox.links.$s
 		done
+
+		# hard fail if sh is being linked to the suid busybox (detects bug 10346)
+		if grep -q -x "/bin/sh" busybox.links.suid; then
+			bbfatal "busybox suid binary incorrectly provides /bin/sh"
+		fi
+
 		# copy .config.orig back to .config, because the install process may check this file
 		cp .config.orig .config
 		# cleanup
-- 
2.15.1


