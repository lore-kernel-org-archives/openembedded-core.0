Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPh3t-0002YH-C7
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 23:58:29 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so1160260wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 14:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=t/BHIS455jt5QBXggEee2/tn1ZXZ/8iEJnJBuM4rqMg=;
	b=U5JDISsKBki4zme22kHA1/QjU4DozXBAHEMLBxQfwiI0WFtXwEtOLAA71qej7bBIfB
	mUHUf14pSN+DEayUzQlIEIsRtoUUqKkF5VUCWbinTXTit61v//4s68gF4/WBg7JWkieA
	ajVuSl1tQpwCzX83gHgZKp7SB7y/jWIuVdrxrEvKeTNpp6Ut4oMXcu4nZwPmJSDKvB7R
	phmdZCaVz5phvXu9wErD7QVl0v1x3aIQq3APkJhSZsf9ygl9nEge6LGY/dOx/hB8sJ42
	r/AA9yVgBe+9Z0U2I3xrs4rA2xVFphFqOv8Yb697CyotItGGcDkqiD40b2PgmSX2+g0I
	9q4A==
Received: by 10.180.99.133 with SMTP id eq5mr27049774wib.21.1350769509126;
	Sat, 20 Oct 2012 14:45:09 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id ei1sm11996502wid.7.2012.10.20.14.45.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Oct 2012 14:45:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 00:44:57 +0300
Message-Id: <dce705cf201278411e230dd004688af5f3a8e7f1.1350769062.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350769062.git.andrei@gherzan.ro>
References: <cover.1350769062.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkzurE5WyJW4D7Bp8G7DsvHnexnJlWVRIRiS0MNEGs8bx6BwHTr5sXibVaA/ul9eGfefIgZ
Subject: [PATCH 4/4] rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
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
X-List-Received-Date: Sat, 20 Oct 2012 21:58:29 -0000

While removing packaging data files in rootfs_ipk_do_rootfs use the
remove_packaging_data_files function. By using this function we ensure
that /var/lib/opkg directory is created. opkg needs this directory to
create lock files.
Some extra spaces / tabs were removed / formated.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/rootfs_ipk.bbclass |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 9d716fb..f69cc0e 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -111,11 +111,11 @@ fakeroot rootfs_ipk_do_rootfs () {
 			fi
 
 			# Also delete the status files
-			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+			remove_packaging_data_files
 		fi
 	fi
 	set +x
-	log_check rootfs 	
+	log_check rootfs
 }
 
 rootfs_ipk_write_manifest() {
@@ -134,8 +134,8 @@ rootfs_ipk_write_manifest() {
 
 remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
-        # We need the directory for the package manager lock
-        mkdir ${IMAGE_ROOTFS}${opkglibdir}
+	# We need the directory for the package manager lock
+	mkdir ${IMAGE_ROOTFS}${opkglibdir}
 }
 
 list_installed_packages() {
-- 
1.7.9.5



