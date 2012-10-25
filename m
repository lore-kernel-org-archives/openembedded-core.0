Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TROJd-0001oP-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 16:21:46 +0200
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Oct 2012 07:07:47 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so1380854bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 07:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=T0dRWiDHU5MbcZxhb6CwRbeAvQSGjEDTlSMlSRXO/z0=;
	b=JHdz3+fiae+2LzqLftNbZYzaSdN3l2g/vjayioSwKEpzLUduRH0S5wujWtZy/fmPP3
	OaM3EqWyst7MR6AsQzsfTQDgJw5m4a7R/DqEW6fvfpI0RK6OC9owDveb3Iusd4uO3wpY
	fvIpv7v4GGqAdg8oBa7tIpCaIhswKeoRodOSac4N354oz19sdlg0B8F3iEuafw8COyVc
	D3ppO8ckLwOeIkUYYFUTqeIax7cvhOOgR7Aw8eGFHChkcBdIhqE9mEWKD+A7FdS3mEHi
	5+ynNE04+btR5s8XUrsUcRfxMMj5s8nHTaRZ8UkEkMo58w+6lb1vFSkxVthdKyJJcaV8
	/0RQ==
Received: by 10.180.82.35 with SMTP id f3mr14158505wiy.6.1351174093511;
	Thu, 25 Oct 2012 07:08:13 -0700 (PDT)
Received: by 10.180.82.35 with SMTP id f3mr14158489wiy.6.1351174093433;
	Thu, 25 Oct 2012 07:08:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j8sm10089149wiy.9.2012.10.25.07.08.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 07:08:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2012 15:07:04 +0100
Message-Id: <1351174024-6300-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl03djZgSC60nSAWcmby5F1qzniqax9jcz6+Zd1OThU3JbdQqlbFF93WltuE1fw4kqY/vzkRfhcmWvBSdf0xWfeJs3i1P0x+5P3/ONxJrHuJFIWwAIxTqyuAhIvp0Ks0XmOukA9aCiLjCae/3ekoqnPS33CdPdiunBj9pmwTSK29wP44A8WscBQ2TORjcWS991G3lds
Subject: [PATCH] diffutils: fix rebuilds
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
X-List-Received-Date: Thu, 25 Oct 2012 14:21:46 -0000

If diffutils rebuilds it tries to remove with "rm" files that don't exist
anymore, resulting in an error.

Use rm -f so the removal always succeeds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/diffutils/diffutils_3.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
index dc87190..400c8a6 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
@@ -6,7 +6,7 @@ require diffutils.inc
 do_configure_prepend () {
 	# Need to remove gettext macros with weird mix of versions
 	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
-		rm ${S}/m4/$i
+		rm -f ${S}/m4/$i
 	done
 }
 
-- 
1.7.10



