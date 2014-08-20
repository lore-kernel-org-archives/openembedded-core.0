Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id ADEA565D53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 13:28:57 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so7927547wes.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xxSbhLrm1j3TXm/i2s7RhYWv/YbSYQPasrEynIucVzE=;
	b=ERWwJoy26XNSL6r3kIH24yhfiB33ZySHmxdwI0eqME9W2HMtXu1VN/TaEJxrJ7+P8/
	0NcIzhmQ6SklW8vb5wWGDwzbWrCIAHmAOj39Y2XsVcpjFo57OCDfNDffuZHbI/f80hKp
	mFnhodA9/4djhn6c69+UaqLl0KMMN+vwIl+PuOBuyJhZzkJMRIlaFlH+9LL5lPw0vn6C
	ibG6rkm5QF1iNio3dIxYIIM/ghG3LEdpBaWwTaBSCq9MDtIuvaIV2eRZnONd7+NsAGNp
	oD5HAAfN3at+kKEPbiIVbwUEEp8zZ7CBtzSeoUbUdZwpu+h7wNPuxfwfCCSzXe36Ctzw
	3y4A==
X-Gm-Message-State: ALoCoQnV8J+vkF/ON/MKTLarfe2eUC64Pb/4e5V9VVizbeuD6wuy0QHbjTxP8LmEFGfDyEUO7mLY
X-Received: by 10.194.57.237 with SMTP id l13mr10373455wjq.102.1408541337988; 
	Wed, 20 Aug 2014 06:28:57 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	fv10sm9259998wic.23.2014.08.20.06.28.56 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Aug 2014 06:28:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Aug 2014 15:28:50 +0200
Message-Id: <1408541330-3969-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] nss-myhostname: fix postinst/prerm scripts
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
X-List-Received-Date: Wed, 20 Aug 2014 13:28:59 -0000

${D} is expanded by bitbake which means the postinst looks like this:

sed -e '/^hosts:/s/\s*\<myhostname\>//' \
    -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
    -i /build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc/work/armv5te-angstrom-linux-gnueabi/systemd/1_216+gitAUTOINC+5d0ae62c66-r0/image/etc/nsswitch.conf

Change ${D} to $D to stop it from being expanded by bitbake.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index d8ec863..1237602 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -16,11 +16,11 @@ inherit autotools
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-		-i ${D}${sysconfdir}/nsswitch.conf
+		-i $D${sysconfdir}/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e '/^hosts:/s/\s*myhostname//' \
-		-i ${D}${sysconfdir}/nsswitch.conf
+		-i $D${sysconfdir}/nsswitch.conf
 }
-- 
1.9.0


