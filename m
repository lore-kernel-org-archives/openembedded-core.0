Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSD71-0007ee-OC
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 20:59:20 +0200
Received: by bwz5 with SMTP id 5so1389354bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=TGCACuK0ejXeBODA5X48bqjXGulgA6EKGa1qNMZ/IBg=;
	b=bATa9308eOApmqy9rTiopxkH6Q2oaRANZ1twWOPEOpWSjLbAd28t2PTl8asa8+F5Eo
	EJJokMIicNyl1nwnobvufmX19U8mr0eegwBjr62eE/esxOknzsR6Ougj9e50mu4yTym8
	stzyapGpx83WaB9hTZw4bgs2L9vD7eF9llEFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rbyWH71WWnv+CQWGNQ5sMrWPqxnUeA4afyg21/rgx6NVbA6+h7i36dJ+0XNOClW/BM
	AckQhxudy3UaK3/G15tQpjmfE35hHpHg+PGwzVIR1BDScj72/LtWGATc/qPfpbEXdTY2
	sgLLPIDTAaa3RLeATPAj/gI+HK2mSBQ/9EzUU=
Received: by 10.204.42.69 with SMTP id r5mr1035853bke.52.1307040967865;
	Thu, 02 Jun 2011 11:56:07 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id z1sm686008bka.20.2011.06.02.11.56.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 11:56:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 20:56:04 +0200
Message-Id: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [PATCH] base.bbclass: add cleansstate task between clean and cleanall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2011 18:59:20 -0000

* sometimes it's usefull to remove only sstate cache and keep downloaded sources for rebuild

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8f4ef1e..6f0484e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -408,10 +408,13 @@ def check_gcc3(data):
 	
 	return False
 
-addtask cleanall after do_clean
-python do_cleanall() {
+addtask cleansstate after do_clean
+python do_cleansstate() {
         sstate_clean_cachefiles(d)
+}
 
+addtask cleanall after do_cleansstate
+python do_cleanall() {
         src_uri = (bb.data.getVar('SRC_URI', d, True) or "").split()
         if len(src_uri) == 0:
             return
-- 
1.7.5.3



