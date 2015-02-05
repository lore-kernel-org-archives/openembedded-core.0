Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5950D60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:16 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2404543pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=n1uWyIXmQIt7ZztuXV2ec/IgA7RHtqSc6f6bmXGpSCA=;
	b=V6dVpAIjcb2vbOTMHAyZObJJNIbd+dx+RYyQTb4/MQIKrE82kIZotMEggm3GVAAm89
	04lcC2ANDYyuXFDI8SEDL7XIqy1UHE3Xs/cjAY4n/Drz8457K0ie79wHpjir96HFKw8t
	gtJBYiIACkaCIKX1raULWzgA4XmySLuYAOoLGNSSMuxx2Ns/gJfJBVZZzlf6X32oNlhL
	0djAnxaK6j0cjMUCjZ58bKYYpRMLvYKcYeMQl2wVgQwwhBSbm6RwZgJ3bAMHfIDx1M1L
	TVybrCLXOR/BsdJa0Fi1jA9sYxukH6h0eAG6VQ/ZsmfNmz4/LS+PD3gMx/28wI/FVXhm
	RwgA==
X-Received: by 10.69.27.105 with SMTP id jf9mr6742022pbd.126.1423152257779;
	Thu, 05 Feb 2015 08:04:17 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:10 -0800
Message-Id: <68d8a45093d476270e0a78c3c443f7a71fd3cf16.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
MIME-Version: 1.0
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 02/61] coreutils: Fix CVE-2014-9471
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Maxin B. John" <maxin.john@enea.com>

Fiedler Roman discovered that coreutils' parse_datetime() function
has some flaws that may be exploitable if the date(1), touch(1),
or potentially other programs, accept untrusted input for certain
parameters. While researching this issue, he discovered that it
was independently discovered by Bertrand Jacquin and reported at
http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16872

$ touch '--date=TZ="123"345" @1'
*** Error in `touch': free(): invalid pointer: 0x00007fffd33e55e0 ***
Aborted

$ date '--date=TZ="123"345" @1'
date[394]: segfault at 7fff24000000 ip 00007f6dd5b73404 sp 00007fff27cce8f8
error 4 in libc-2.20.so[7f6dd5af7000+199000]
Segmentation fault

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../coreutils/coreutils-8.22/date-tz-crash.patch   | 43 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
new file mode 100644
index 0000000..570e4fd
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
@@ -0,0 +1,43 @@
+This was reported in http://bugs.gnu.org/16872
+from the coreutils command: date -d 'TZ="""'
+
+The infinite loop for this case was present since the
+initial TZ="" parsing support in commit de95bdc2 29-10-2004.
+This was changed to a crash or heap corruption depending
+on the platform with commit 2e3e4195 18-01-2010.
+
+* lib/parse-datetime.y (parse_datetime): Break out of the
+TZ="" parsing loop once the second significant " is found.
+Also skip over any subsequent whitespace to be consistent
+with the non TZ= case.
+
+Fixes: CVE-2014-9471
+
+Upstream-Status: backport
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+Signed-off-by: Pádraig Brady <P@draigBrady.com>
+---
+diff -Naur coreutils-8.22-origin/lib/parse-datetime.y coreutils-8.22/lib/parse-datetime.y
+--- coreutils-8.22-origin/lib/parse-datetime.y	2013-12-04 15:53:33.000000000 +0100
++++ coreutils-8.22/lib/parse-datetime.y	2015-01-05 17:11:16.754358184 +0100
+@@ -1303,8 +1303,6 @@
+             char tz1buf[TZBUFSIZE];
+             bool large_tz = TZBUFSIZE < tzsize;
+             bool setenv_ok;
+-            /* Free tz0, in case this is the 2nd or subsequent time through. */
+-            free (tz0);
+             tz0 = get_tz (tz0buf);
+             z = tz1 = large_tz ? xmalloc (tzsize) : tz1buf;
+             for (s = tzbase; *s != '"'; s++)
+@@ -1317,6 +1315,10 @@
+               goto fail;
+             tz_was_altered = true;
+             p = s + 1;
++            while (c = *p, c_isspace (c))
++              p++;
++
++            break;
+           }
+     }
+ 
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index f85baca..4a1aee6 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://dummy_help2man.patch \
            file://fix-for-dummy-man-usage.patch \
            file://fix-selinux-flask.patch \
+           file://date-tz-crash.patch \
           "
 
 SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
-- 
1.9.1


