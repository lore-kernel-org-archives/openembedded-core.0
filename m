Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A04077E94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 02:31:13 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id i206so25341615ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 19:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LbzCQMq/3I+a7nEIiWypka8C6+zJNc9fDKtQSf1CGK8=;
	b=DISBtLhp9bicVG2MpvXbZmRcWP6G4ZKmxlb6LsOB1523/j/v7HFqnqYhj5GG5ydA14
	rePz1N3MSOYA2oWOLpR1Y7gO3JF2EsdMz6o4CbnjK1yo8i5MSgv3OeJz354lPGcSrkKj
	EmNTGlRqopITvuVtXIIUKEdBI2V1ZryxOQwJ5oT8nkX+P92bAOjubGzb96YtJrqo8tBx
	GPHEj5+n1JqUk4eBJlvbAgwbigE0h1bi7f+iO4H8iSJ/lsqueRLj0xAFCaqQIArHQLgW
	eXL0DtPG4rSoEjzH3PqBrie1kfyhSfm+EEFSSjTQJe9l9MyoCr+5HmQX1J8LflqrbaHq
	rkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LbzCQMq/3I+a7nEIiWypka8C6+zJNc9fDKtQSf1CGK8=;
	b=GNG3D+4w8cwaMqRLiD2Z9CkN6Q4OUeJepVVjLqBLDFiOomcDPHGZ0KzaCJKUkkAL9q
	5uZ9/FyjXNC70rLSJSORyNk/04yVjdQMRx+VYSgPfneJRmV3zlKmwZB355hTzefCrNNJ
	k9hj3436Ufo/6NEdt4nJmt/EvGam2L1kMvjsB6Va1bJ1n31OYvm9Mu1rkPJdWKk0t2nJ
	zcbsdjOpf2uzG1/MYYSFpq+DBM6cXSCLOEGHrY5DDIouJBS1W70PaCEv/VFWxIqEe4Go
	AyfGMxNOrAlWoTRPddVDSm53B4VWx0xi+mIIjd6DcIgrg8dlPjToRswdYIGmDHiUQrVV
	cWaA==
X-Gm-Message-State: AODbwcCwFBhkTc4C+jbgoomPGk6ddOjebe1x20RmWgA2dk8KWsNhviqp
	A8DVU1UslcLq7K7Eiok=
X-Received: by 10.107.142.135 with SMTP id q129mr4608427iod.186.1496716273998; 
	Mon, 05 Jun 2017 19:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id b1sm5828791itb.30.2017.06.05.19.31.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 19:31:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 21:30:49 -0500
Message-Id: <20170606023049.6415-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
Subject: [morty][PATCH] archiver: Escape recipe name in regex
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
X-List-Received-Date: Tue, 06 Jun 2017 02:31:13 -0000

From: Joshua Watt <jpewhacker@gmail.com>

The recipe name needs to be escaped when using it in a regular expression so
that and special characters are treated literally

(From OE-Core rev: 53c8cceb744adda1bf899d62071d11b20a5dea98)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3543ca9..188f8c0 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -349,8 +349,8 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED', True).split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
-    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
-    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
     for file in bbappend_files:
         if bbappend_re.match(file) or bbappend_re1.match(file):
             shutil.copy(file, outdir)
-- 
2.9.4


