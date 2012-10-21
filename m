Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxqy-0003TY-SZ
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:54:16 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1000662wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Vi04vkOWHLzs9ZkelJRkeglj5nlXGQ4IsOqCHj1mfOI=;
	b=ZqT7XTz/JQSSh8sPETTDAs3HwMpW7l3QDyRXf24jnMhOh8GjxcjJRgt2oYcfC1pvDw
	oALROeMM9341lG++6xGqOj8Qe3F56parHTZGZDpRoOBL69IUxN9O59TrcZNl8dMxJqQ4
	n7gtv23S4hL2SLQKC9MoLmo1/zAfLEUNbgNQmj/VTIRl8se35J89R09fKpufcUF+i029
	PUODtqBDDlm//SUKkPbX9Zs3FMMMI3HrAdVRD1BJbEzuauCfFMwVXutO3iW6r04Eo/YJ
	c2lfz+YMVTzv2TUvbhZM/nIGh5je3I9kgwUDDOFxU1qB7SNaRwPEOca4vnqIHqkgKwah
	Eurw==
Received: by 10.180.91.71 with SMTP id cc7mr15446021wib.2.1350834055669;
	Sun, 21 Oct 2012 08:40:55 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id j8sm46423462wiy.9.2012.10.21.08.40.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:55 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:42 +0300
Message-Id: <cb8eaacdb9930ae1c0a362f2925572266729ec91.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQm8WPXtY/kUELDfQRNO/l4YyafCMAQLwHmfCu5mFNLIwJb4DWw41xvtiTOx63U9rs5+zAYG
Subject: [PATCH V2 4/5] rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
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
X-List-Received-Date: Sun, 21 Oct 2012 15:54:16 -0000

While removing packaging data files in rootfs_ipk_do_rootfs use the
remove_packaging_data_files function. By using this function we ensure
that /var/lib/opkg directory is created. opkg needs this directory to
create lock files.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/rootfs_ipk.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 9d716fb..25f15ee 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -111,7 +111,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 			fi
 
 			# Also delete the status files
-			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+			remove_packaging_data_files
 		fi
 	fi
 	set +x
-- 
1.7.9.5



