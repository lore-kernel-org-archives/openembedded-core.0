Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMMci-0007k4-5J for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 17:55:52 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMMZw-00063g-Rc
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 17:53:01 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305634164.2429.193.camel@phil-desktop>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
	<1305634164.2429.193.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 16:52:59 +0100
Message-ID: <1305647579.2429.271.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v3] image-prelink: remove hardcoded path assumptions, don't generate cache file
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
X-List-Received-Date: Tue, 17 May 2011 15:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Pass -N option to prelink so that no cache file is generated (obviates need for deleting it afterwards).
Use symbolic names, ${sysconfdir} et al., rather than hardcoded paths. 
Pass explicit -c option to prelink in case ${sysconfdir} and ${sysconfdir_native} are different.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/image-prelink.bbclass |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index ee0951c..350c29d 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -12,25 +12,22 @@ prelink_image () {
 	echo "Size before prelinking $pre_prelink_size."
 
 	# We need a prelink conf on the filesystem, add one if it's missing
-	if [ ! -e ${IMAGE_ROOTFS}/etc/prelink.conf ]; then
-		cp ${STAGING_DIR_NATIVE}/etc/prelink.conf \
-			${IMAGE_ROOTFS}/etc/prelink.conf
+	if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf ]; then
+		cp ${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf \
+			${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
 		dummy_prelink_conf=true;
 	else
 		dummy_prelink_conf=false;
 	fi
 
 	# prelink!
-	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
+	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
 
 	# Remove the prelink.conf if we had to add it.
 	if [ "$dummy_prelink_conf" == "true" ]; then
-		rm -f ${IMAGE_ROOTFS}/etc/prelink.conf
+		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
 	fi
 
-	# Cleanup temporary file, it's not needed...
-	rm -f ${IMAGE_ROOTFS}/etc/prelink.cache
-
 	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
 	echo "Size after prelinking $pre_prelink_size."
 }
-- 
1.7.1






