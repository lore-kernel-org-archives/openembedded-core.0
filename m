Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 365856DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:11:10 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 131so2237775ykp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=eGsdj8OkOPyGJ3alJLCybrIPbF1iR4Xu/zoFNAqvO7Y=;
	b=SMICXXz5F9iuDY3eJ1VpEFHLoqrqKUxTDcviaByIBELvLeLOZx0stR+GgA93OI+fVb
	UllDh6OpfZwqXG//dR6rzSW+LlJfEFsbuYEyDNweztN/PkUHcGoIKJ0mD01gft/olX1Z
	QQcHoO334yiq0MfBrYDqvGFSq2erQJmfgdgNU2kiB+qp86NemYOlUdqbSFgWkqLXE2+n
	EaiKRK9AVAyfexDxH+VFOUFDgEa2Fgi5JAh8Wx3dLbRG61Ofp+L5d6yCt7AbkDsKcTDv
	dcEMhSWoPt9bPzPT7ymq+jm5I6wClCelKWPfnrwXeRG5COVCUi1Cw7L7fncHyjRwM5GZ
	vdDw==
X-Received: by 10.236.85.237 with SMTP id u73mr7306279yhe.67.1390479070512;
	Thu, 23 Jan 2014 04:11:10 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h23sm35374732yhc.0.2014.01.23.04.11.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 04:11:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 73F8217B128AA; Thu, 23 Jan 2014 10:11:06 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 10:11:05 -0200
Message-Id: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Thu, 23 Jan 2014 12:11:11 -0000

The filenames sometimes may have strange names. With the 'awk' script
it handled a limited number of spaces in the filename and a package
installing a file named "test file with spaces" would have its name
truncated.

This patch uses the find's printf formating to simplify the code and
proper handle this case. From a testing image, the only diff produced
is:

,----[ files-in-image.txt diff ]
| --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
| +-rwxr-xr-x root       root                0 ./usr/bin/test file with spaces
`----

The options used are available since findutils 4.2.5, released in 19
Nov 2004, making it available in all supported host distributions.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e9a9c3b..545a42f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -385,7 +385,7 @@ buildhistory_get_sdk_installed() {
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
-	( cd $1 && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 | sed 's/ *$//' > $2 )
+	( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
 }
 
 
-- 
1.8.5.3


