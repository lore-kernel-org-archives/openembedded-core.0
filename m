Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id A028D6EC7B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 15:29:00 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id f8so1253405wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 07:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZr9M6wDX5SefOnp7Ibxr32PXnD6IAfdaia+0Xfhf58=;
	b=gbAopL17yQzhNI2VEie2L+ArPsM3xptosg/iyRKo7ESjDactb8iYPrKNvjv4RMl0Gl
	ub4srZ2sFU7/8xYSmgiD/YjNtTDh82+JUqGT7hHmCP8L4KNtDhw42k4ne92xWJL4mteN
	pdtE0VLQ57e/+CSZ3u4Qy68wKu5T7rRKvugWdpuxGZz/e5Z20u9R7epQ4+3Yz6Ht+LWf
	5ZM7x7XT5UbihK+hA5bgtxclSDo6pL9YzaX4E+Lp6fuUlpQ8GbxsRxG10fUNSZi/2XsB
	pDuqbgS9df1TZ/MzfwJdf1UO7Xmc1CxKCC8gHUw6THmDoCbmDQunByLnhWlUfkpN6ZuH
	Zscw==
X-Gm-Message-State: ALoCoQlANJVLbBkZ+6YsovxciQ2KWfHGb0KRVlXa8hGRG3fiV1NoUu/L3tkEqYCSeKmtrmL7ua0r
X-Received: by 10.194.110.41 with SMTP id hx9mr10630231wjb.28.1392478139970;
	Sat, 15 Feb 2014 07:28:59 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id
	bj3sm21285662wjb.14.2014.02.15.07.28.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Feb 2014 07:28:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2014 16:28:55 +0100
Message-Id: <1392478135-10219-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.5.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bitbake-prserv-tool: make help text show .conf suffix
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
X-List-Received-Date: Sat, 15 Feb 2014 15:29:01 -0000

'export' will accept any output filename, but 'import' needs a '.conf'
suffix to work. Otherwise you'll get:

koen@beast:/build/v2013.12$ bitbake-prserv-tool import x.txt
ERROR: Traceback (most recent call last):
  File "/build/v2013.12/sources/bitbake/lib/bb/cookerdata.py", line 162,
in wrapped
    return func(fn, *args)
  File "/build/v2013.12/sources/bitbake/lib/bb/cookerdata.py", line 172,
in parse_config_file
    return bb.parse.handle(fn, data, include)
  File "/build/v2013.12/sources/bitbake/lib/bb/parse/__init__.py", line
100, in handle
    raise ParseError("not a BitBake file", fn)
ParseError: ParseError in x.txt: not a BitBake file

ERROR: Unable to parse x.txt: ParseError in x.txt: not a BitBake file
Importing from file x.txt failed!

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/bitbake-prserv-tool | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index 96a3470..28c2416 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -5,8 +5,8 @@ help ()
     base=`basename $0`
     echo -e "Usage: $base command"
     echo "Avaliable commands:"
-    echo -e "\texport <file>: export and lock down the AUTOPR values from the PR service into a file for release."
-    echo -e "\timport <file>: import the AUTOPR values from the exported file into the PR service."
+    echo -e "\texport <file.conf>: export and lock down the AUTOPR values from the PR service into a file for release."
+    echo -e "\timport <file.conf>: import the AUTOPR values from the exported file into the PR service."
 }
 
 clean_cache()
-- 
1.8.3.4


