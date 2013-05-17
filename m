Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHVB-00019S-C7
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:08 +0200
Received: by mail-ee0-f54.google.com with SMTP id e50so2346193eek.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sDS8h5CTBvI5Qc36gUZ54W7GOIAIhpqD2621Cg3K5IY=;
	b=S5VPwZX0MLXFQ353o5lM5w362BzkWCn/+VpvqP578YadU6Fsp7dQmgX92sCZ5TdAHz
	YVdKEKz/Aq+2dW7eO4pf9RbnrLWVYlQMMHSkamXyAohKdlQi0etesm83p5TTx2IXIhWL
	ofJ6vKIqK78r+36petaW4pw7zijxAijx3jriXklFNNUcEiKPHF0cYwvre8s4+dQZ2KBc
	wGU/pzai2H8aZINJvKmYw4Z0CvnyNOgydj3XWtdQ1LYJdw/Vqgr4AlAZaq3pva+AyngE
	1e4dpJq7dzfazznmftoJmk/WRT9fwJKIBKnQenDGof2iCJKqpWBJLTPpTFDJTQcOmTP8
	aZAA==
X-Received: by 10.14.216.201 with SMTP id g49mr97332843eep.42.1368783890069;
	Fri, 17 May 2013 02:44:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:44 +0100
Message-Id: <c18afe68e7b5ddac6671600fe73ad44f49cbfd0b.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmE6+z4Fmp08KcKyGmgEo+F/6vAbyDtWNj7lcDsRSeeJlpbZHbq5jmu8Mty0krkZgQp1FmS
Subject: [PATCH 4/5] librsvg: clean up native depends
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
X-List-Received-Date: Fri, 17 May 2013 10:03:31 -0000

inherit gnome was only used for the SRC_URI, so just inherit gnomebase and
remove the native-specific DEPENDS which was only required as the gnome class
pulls in an impossible hicolor-icon-theme-native dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 980c01c..f50c1a8 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/utils"
 DEPENDS = "cairo glib-2.0 gdk-pixbuf fontconfig freetype libxml2 pango"
-DEPENDS_class-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
 PR = "r12"
 
-inherit autotools pkgconfig gnome gtk-doc pixbufcache
+inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 
 EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
 
-- 
1.7.10.4



