Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id B192979389
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:41 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id s198-v6so2457401oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b5b2SaNYiGfnIwykx0E/hhBeM1B8Fmkr9zPcGne88k8=;
	b=ENu8kvtJMxOv+rs7TINrOABJZHe0i55Fz/iDJUTG0T6kTCOChRiErPBydtLSOhdhV7
	0ucXCn3Hvi5SwYxE3bHcu/dBqvEpfLrfqvS9HMKdlWm74H72CrNZv3ZAfLdtoySl+XuF
	StdjlX6sqehkPPLNGXPtLZUODvBPMtURSz3vTBO2CwBgiL6NQ0dN/Aa9dAB6mVViSyZu
	U5rt4TCLoA7Qa0/AH8BD0kWhCcj9bUC4j27QKGNPEwYy3uBGbwaZoiHPRai9uHCot5Zp
	HjPh6xNLEueFb4NXstx3Gs/f5bPRDr/ZRT7lksZyzbgBusz1Xuz2I1AUgx6L2VxeUqOv
	jjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b5b2SaNYiGfnIwykx0E/hhBeM1B8Fmkr9zPcGne88k8=;
	b=IFibA4bFNom6FFpvuFrUHxktVn2cvtjiNiK/fM0Nv6suoGdB+C6UCOT5Q46aYkBhy+
	qnzMov+OsNUujjcdTK/pydXb30XLeIIs/ipP2KeQ+iQHfikkuDRPxqxWAS8WpL+ZYqAs
	s1dCxb4hy95OjoJj/G/rPHLy19szHt2Mw8Qc659ELXSctNWE2VFxqhHKredqs/AcxkQa
	kwm55gb5pHlWnY+XII0wmO2n6fU3WmmYuZ1zKmqKHG3B4YuGl4MZCpP8Nv/o+4wAgOgc
	Pawko6Z16/it4JHRq2+Oifgoryn3HX/uWKdpELiN9kgDp7TLLGvtnrzMt+8v5AD9mYAm
	64tw==
X-Gm-Message-State: APzg51AQ71mgf1wJgpnAB8D6RcgH3d36At2DR+61HnymjKlUbYuxUbol
	O9KINTbRvkzHf1ci/iDFpQDSYgNZsKg=
X-Google-Smtp-Source: ANB0VdbWSFTdda+aZ+xYWkytqpKmAEL55X1CG2D9AXFSWBVGnDVv0BfH43Ce9w3SDeEyp7UCC3nB7Q==
X-Received: by 2002:aca:45d6:: with SMTP id
	s205-v6mr3603772oia.147.1534936782703; 
	Wed, 22 Aug 2018 04:19:42 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:42 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:11 +0530
Message-Id: <1534936692-11736-33-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 33/34] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:42 -0000

Remove existing files before overwriting them

Archive should extract only the latest same-named entry.
Extracted regular file should not be writtent into existing block
device (or any other one).

https://rt.cpan.org/Ticket/Display.html?id=125523

Affects perl <= 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../perl/perl/CVE-2018-12015.patch                 | 48 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
new file mode 100644
index 0000000..a2b0109
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
@@ -0,0 +1,48 @@
+From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 8 Jun 2018 11:45:40 +0100
+Subject: [PATCH] [PATCH] Remove existing files before overwriting them
+
+Archive should extract only the latest same-named entry.
+Extracted regular file should not be writtent into existing block
+device (or any other one).
+
+https://rt.cpan.org/Ticket/Display.html?id=125523
+
+CVE: CVE-2018-12015
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5]
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/Archive/Tar.pm | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 6244369..a83975f 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -845,6 +845,20 @@ sub _extract_file {
+         return;
+     }
+ 
++    ### If a file system already contains a block device with the same name as
++    ### the being extracted regular file, we would write the file's content
++    ### to the block device. So remove the existing file (block device) now.
++    ### If an archive contains multiple same-named entries, the last one
++    ### should replace the previous ones. So remove the old file now.
++    ### If the old entry is a symlink to a file outside of the CWD, the new
++    ### entry would create a file there. This is CVE-2018-12015
++    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
++    if (-l $full || -e _) {
++	if (!unlink $full) {
++	    $self->_error( qq[Could not remove old file '$full': $!] );
++	    return;
++	}
++    }
+     if( length $entry->type && $entry->is_file ) {
+         my $fh = IO::File->new;
+         $fh->open( $full, '>' ) or (
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index aec30c8..8dfe34a 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -72,6 +72,7 @@ SRC_URI += " \
         file://CVE-2018-6798-2.patch \
         file://CVE-2018-6797.patch \
         file://CVE-2018-6913.patch \
+        file://CVE-2018-12015.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


