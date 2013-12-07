Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3118F6D3DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 00:11:40 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z10so1867232pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2013 16:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tEnIfndZ74V3Vy107NFctshgg1qb4UIlnRX+5+OTSLc=;
	b=JsyDl7d99u9kmHlm2sg6ppe5zDNGfyq49WDSgAJQz1h6oATLoNdFMA9Dip5hdwKqZG
	RC59QkxkKhWHS1F4Yw7Xk+RiVATvIcxIkPar+HRkqiv4lEBa8cp5wOrLE5ph90T8JD+z
	M6x0ls/ibk8gjWuCP0DBIfHftcfXT5jeyaB5jyLTWv0xjrDK4WxnrIRu3y8q9Ql6L92v
	5Omkzw6d3QZ7nGY2hLcmJrwUlTrgZvyu2VmJVx1+vvh1MvDg1BZpT+sbXpwZQCWUDZ6O
	aBbti4NqZbnmPbuj0I0lSB2KGddpQbwRUV2gXE8WUPEo3qwSVuS5PCMUX+5ChH4ArzYq
	8EUw==
X-Received: by 10.68.130.39 with SMTP id ob7mr7168197pbb.63.1386375100065;
	Fri, 06 Dec 2013 16:11:40 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id vh3sm320658pbc.8.2013.12.06.16.11.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 16:11:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 16:11:54 -0800
Message-Id: <1386375114-7702-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] buildhistory.bbclass: Specify lang in decoding strings
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
X-List-Received-Date: Sat, 07 Dec 2013 00:11:41 -0000

On systems where default locale is utf-8 we get errors like

File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
0034: if pkginfo.rconflicts:
0035: f.write("RCONFLICTS = %s\n" % pkginfo.rconflicts)
0036: f.write("PKGSIZE = %d\n" % pkginfo.size)
0037: f.write("FILES = %s\n" % pkginfo.files)
*** 0038: f.write("FILELIST = %s\n" % pkginfo.filelist)
0039:
0040: for filevar in pkginfo.filevars:
0041: filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
0042: val = pkginfo.filevars[filevar]
Exception: UnicodeEncodeError: 'ascii' codec can't encode character
u'\xed' in position 337: ordinal not in range(128)

This patch specifies decode to use utf-8 so ascii and utf-8 based
locales both work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1e6d968..4ff39a0 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
                 key = item[0]
                 if key.endswith('_' + pkg):
                     key = key[:-len(pkg)-1]
-                pkgdata[key] = item[1].decode('string_escape')
+                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
 
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
-- 
1.7.10.4


