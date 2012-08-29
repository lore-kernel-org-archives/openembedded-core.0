Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6jOM-00077P-6J
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:37:14 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 07:24:58 -0700
Received: by wgbdr1 with SMTP id dr1so452121wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=4RfiGSF/VD1xQ0TsLxIx9IDkDGVt4icfytY/nIHuM6c=;
	b=OGaMt5dCD60SAmT2sC96C0LTn4Ccz/7wNib9cBSDLgfui/6U+g3U5naAImJDSQstdm
	v9/9iO9imHWN8Tvb7iApGJ5EDenaUCM/1AJypMJeBQuctD3JQ4Zb1J1FkIDttcPCKGec
	RqsubSNCwEb2ouG37ep21EU4Aw0kJFgjWPPbxM6OEbp0itFhTDd9RhfFbgi+mwpw9uKZ
	Q7ls5MdOa3jKxpEnFoF/1LwKq9EuUIiYZRHEH0NlX6nUtDj8WhlTPsDbYXdjAkiZC29j
	U3uCO3sYmSBDJoRDLhvJbW7d4JSLaKZ9sVmKglKtTW8lhqOZMkQQVA4emHW0z8uppDot
	kqBA==
Received: by 10.180.103.4 with SMTP id fs4mr4125435wib.16.1346250295983;
	Wed, 29 Aug 2012 07:24:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eu4sm10501531wib.2.2012.08.29.07.24.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:24:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 15:24:14 +0100
Message-Id: <ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
In-Reply-To: <cover.1346250187.git.ross.burton@intel.com>
References: <cover.1346250187.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmdmy3yCaKHljxHbSMGDoRKT+CimLEeaNgkO+vWRGELc5xhsPPnqd2v0TqVaiA5vJFXHgTH
Subject: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 14:37:14 -0000

Lots of code (such a GLib) expects this to exist and link to the current
timezone data.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/tzdata/tzdata_2012d.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
index 31e1266..9741101 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
@@ -49,6 +49,7 @@ do_install () {
         # Install default timezone
         install -d ${D}${sysconfdir}
         echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+        ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
 
         chown -R root:root ${D}
 }
-- 
1.7.10



