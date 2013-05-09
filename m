Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UaHYM-0001b2-DR
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 05:30:03 +0200
Received: by mail-da0-f51.google.com with SMTP id h15so1340551dan.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=GcYBzxHgb6HZH66uv7xRNwMtR7i5EuKseK3VQnqDu6E=;
	b=MCRDyJwec1AGH+0NbCJI9egatkeIp9+rY8PePN4YYBPjoea9K2imd98KvLtWPd2gQN
	1WInaxdSwqwApNYHtHSLibvqhPStsviBNSWu3WE0vOIUEJkvroK0JIui0CsY0LCJsKDA
	321SABnorF8lBV5u6xYfLlfJneJ90L+hT89TYKScGeZeMFoabIfCUoD2INodKDV/ixHb
	5eesBoXWtIwpHTTKDK23DNUR1XlfwWCGwlvUnFzkQKWTm6sl2mLAogiB067gtbZOcq4V
	7vHcOAxNTMwywHfhT/2zdk0j/j23+gxuH7Z7E1/anLgR32S77vHYbk15AlBePF+GS4h5
	KuLA==
X-Received: by 10.66.122.163 with SMTP id lt3mr1434013pab.219.1368069114614;
	Wed, 08 May 2013 20:11:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id li15sm1664929pab.2.2013.05.08.20.11.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 20:11:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 13:24:04 +1000
Message-Id: <1368069844-13706-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1368069844-13706-1-git-send-email-net147@gmail.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
Subject: [PATCH 3/3] image-vmdk: Fix error recreating symbolic link
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
X-List-Received-Date: Thu, 09 May 2013 03:30:30 -0000

If the vmdk image symbolic link already exists from a previous build,
overwrite it instead of returning an error.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image-vmdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 6f7df3f..c225bed 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -18,8 +18,8 @@ inherit boot-directdisk
 
 create_vmdk_image () {
 	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
+	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
 	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
-
 }
 
 python do_vmdkimg() {
-- 
1.8.2.1



