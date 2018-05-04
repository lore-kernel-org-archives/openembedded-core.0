Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE42574D6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 19:31:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j5so18193600pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UPdRowXYJwUpuU/qUmeV3Zq5Clot4U21ko+92NZiPQc=;
	b=nRkEJgRX/RphPbe23KGAP97EFexhAc/KoKNj/iAnYQZ2q1u7nSsvco3mtVHGYTVEyP
	o+pafUhUfDH6T3lgsgPxqEyaETSiQ3vnXHbyx0/wVa/81qVxGYWNCgtN8+kn1anuHrss
	ZISPYVlpzI3lCqWdvKyzOclZb2ti1ETqrgeLBHxD1RTjgCAXPi86YDDJFH1sSoRkN3PK
	wyiJflvTTLsLUNb/Qu691PgIJMkGJF9o0TN6+gC7TmVNH8sq4oqxTaMUS9ymGCoXhMra
	H8PtMew2h+jieKQYOAxH5pvTbjKLP9LxoLmHV7GDF+2HQj5aobHP8bFTqPXwnpjNl24+
	f3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UPdRowXYJwUpuU/qUmeV3Zq5Clot4U21ko+92NZiPQc=;
	b=i9ayg7dVPRmTHutszo2+bV5n2oJRXbIcgH1Hqh0nivMqQ0Z2fXV80mREKl+c/yC1O7
	ev1+K1UISi5U4qOcpmlDHdy8G5W2GR+6M4jlP8g1uYn3pBBW9K3t6BOq34t02FHnfXLj
	AmUaesndXdSKkCrS28q3vZKlY7CEZp54zgV0ekmZJCrJmhuoMu8HCTOWVmbcTmhJzZve
	5w6PmeE6ge8ylunFtE8nGiBRktt+wIRIYo5/eNFkh141vB4ae58HA+OxdeWxZZm1SI8J
	iEnmLugqT78H86RsbOeRmQNHX1RBxPwc8dyK5MGNDXt0rXO1bVTFJD7rne5e2OdZUqxv
	Spsg==
X-Gm-Message-State: ALQs6tBlFU/PwF5JXPTpwo5AuHact/6SgPPKbWO6I5hLsUkxEqhVl8vw
	qoJ2gynOd74KGiZWA6yBAaDL9Q==
X-Google-Smtp-Source: AB8JxZqG8rBc46wphqBQ3QFW8oGApTL3hlLDRL9/5byrzbV1/1i0/pKP2AwtOSlfMpEvIFtCQ9coFw==
X-Received: by 2002:a17:902:8f94:: with SMTP id
	z20-v6mr14702982plo.391.1525462301505; 
	Fri, 04 May 2018 12:31:41 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g207sm32105371pfb.18.2018.05.04.12.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 12:31:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 12:31:31 -0700
Message-Id: <1525462293-28047-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
References: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
Subject: [rocko][PATCH 2/4] package.bbclass: use single quotes for path passed to file in isELF()
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
X-List-Received-Date: Fri, 04 May 2018 19:31:40 -0000

Apparently there are recipes in the wild which generate files with
filenames containing '$' characters - which cause errors during
packaging.

Instead of adding another special case to escape '$' characters when
constructing the command passed to oe.utils.getstatusoutput(), switch
to using single quotes to quote the path - and therefore make isELF()
consistent with the way filenames and paths are quoted by every other
caller of oe.utils.getstatusoutput() in oe-core.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 7877761534b0c2492da6289e9f2269d41b6ed464)
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46..e68299e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -901,7 +901,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.9.1


