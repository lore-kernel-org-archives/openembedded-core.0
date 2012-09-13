Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCDG8-0002nf-Nw
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 19:31:24 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so4055858pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 10:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=axM75vrAzp25hWOTp5aZYqwODDEUg/i/RNRgeNkEegU=;
	b=nqLCIH3C++mEnNNI77NlQgmqAlI0reGaUxFqmNNPHVa+Bg96DgvvV/Iheaqv4AO2Ah
	4vYQaa+oSZnLvl4HCdl8V5ognbgFV3KDZSjxgScoFuciSOK2MGTUnROtzQsh39SNQBhQ
	3vEe7LcA/aD8rWHn3g+dGjiZvGyvYJQprylUboNgtZNdti6cQe8He9qTHW2pmmPPg0k+
	tEZjGOKc/1v5355yaRt8moXjrL6KPPlBbfFojA/eKySFh5JCho6mGlkaeFiQVFs2nqZd
	reebYxEAISLY1h0LfIh3qg/QgfX7pGg8n/09Y3XdTJOgdsoW/IxU7VEoJ8YrsuvbY4lW
	OPAw==
Received: by 10.66.83.8 with SMTP id m8mr4164408pay.48.1347556732984;
	Thu, 13 Sep 2012 10:18:52 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id py9sm12698110pbb.20.2012.09.13.10.18.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 10:18:52 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 20:18:42 +0300
Message-Id: <505f5629a3a91bb1b101b31cd7e5754aba76fc74.1347556625.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347556625.git.andrei@gherzan.ro>
References: <cover.1347556625.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn5+iMk9O2YrTatxIyDd1L2yLlCp0SV/siaZdqAz/y8ToRhLlCn/OBDvFxIEBdzFGVcRWK5
Subject: [PATCH V3 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Thu, 13 Sep 2012 17:31:24 -0000

If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
let's add the round up code after the base_size calculus and it's
comparison.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d286eea..aa1a785 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -82,9 +82,9 @@ runimagecmd () {
 	# The base_size gets calculated:
 	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
 	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
-	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
-	#  - finally tested against IMAGE_ROOTFS_SIZE
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+	#  - tested against IMAGE_ROOTFS_SIZE
+	#  - round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS} | awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR}; base_size = ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}); if (base_size != int(base_size)) base_size = int(base_size + 1); base_size = base_size + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print base_size }'`
 	${cmd}
 	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
-- 
1.7.9.5



