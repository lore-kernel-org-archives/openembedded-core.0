Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1U3aux-0003mY-5D
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:30:14 +0100
Received: by mail-wi0-f179.google.com with SMTP id ez12so199563wid.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 15:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=vLrZtzy/DGJfY/kQXaaTe9HWe1klqZPRGwnyb8WNXCk=;
	b=RmMkmq2noqV2PGQeLWUiePzG0L9uVh9PA+ru0271yE8oa6yS3UP0H90x3gf8GwR8Ec
	eYJdtWsNPiM+Bfk2cwS4esyzT1vjHNFCdgLHFwlTWbgy7b+kkNTAXyCRF18AbqR3JUtf
	/adAZcXT+AEm/mJjdBEHRtlT8M61rVogvAGWAZ+cYF6SMYaIZxC62sNhi5qUoWQwcT0R
	0Yy2p9rAdksCePV7Z2ZEnH9Qbgnp2ZbEgCpcWGIP96MQo/OHJqQunp/o0tqT/vmguAqB
	1e6pIQQ0ndNnswVuTcLMVMd/UWEAE/avF9eLjgO0uOVcjQcVF6JbVdvkp0AZsm/RhIWZ
	9PWg==
X-Received: by 10.194.85.234 with SMTP id k10mr1235945wjz.53.1360231255662;
	Thu, 07 Feb 2013 02:00:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id gy2sm8282232wib.3.2013.02.07.02.00.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Feb 2013 02:00:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 45878408E41; Thu,  7 Feb 2013 11:00:28 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:00:26 +0100
Message-Id: <1360231226-6093-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Bugfixes for create-recipe easy_install handling.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:30:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. Tell easy_install to always download, regardless of python
   install content.
2. Support https/ftp et.c. URLs provided by easy_install

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 scripts/create-recipe |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/create-recipe b/scripts/create-recipe
index 1b10e1b..5613e92 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -1918,9 +1918,9 @@ if ( -e "$dir/setup.py" ) {
 	    if ($recurse_python == 1) {
 		foreach (@rawpythondeps) {
 		    my $ptempdir = tempdir();
-		    $purl = `easy_install -eb $ptempdir "$_" 2>/dev/null`;
-		    $purl =~ s/#.*//;
-		    @purllist = $purl =~ m/Downloading (http:\/\/.*\n)/g;
+		    $purl = `easy_install -aeb $ptempdir "$_" 2>/dev/null`;
+		    $purl =~ s/#.*//g;
+		    @purllist = $purl =~ m/Downloading (.*:\/\/.*\n)/g;
 		    chomp(@purllist);
 		    
 		    # Remove empty lines
-- 
1.7.9.5



