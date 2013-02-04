Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2Joa-0008Q6-TY
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:30 +0100
Received: from mail-ea0-f199.google.com ([209.85.215.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:46:30 -0800
Received: by mail-ea0-f199.google.com with SMTP id j10so6833392eaa.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=bOf2rAdNVdoUAqSdVw1WHP9zaYXLMnhOhNnu/mArt3Y=;
	b=JClZrXlUO9jdJu8TFlmxy5N62QsBtdXU6El/YAsnPyzmfKpOeD5Ic2X/VcK6B3wV1V
	eCcsQwCsflXld8CoBmZlSmK6B9/Pct+/ONII53uj8y7inihAa6LnMxHekorAOA3PkWIC
	aXEAnKx81k5sXC3BglwuXtup385xBd85nz9pv1ezU9wZhZrt8uPe9rEsiai5iVHx0m65
	bh6Fz9/z0XwP9nL5kQ4+lCMKNKgheyWCAqinX1uo+tmr112hbbj/rwT9Aq2swwEUtigF
	aA+f74tmyEPu7Y1ZzAu+VzmeFO5EU1cA235OZrh1/UMeCEF+LC6pJcJePoXmgb4vQa7s
	Bxug==
X-Received: by 10.180.88.134 with SMTP id bg6mr9354718wib.26.1359974788766;
	Mon, 04 Feb 2013 02:46:28 -0800 (PST)
X-Received: by 10.180.88.134 with SMTP id bg6mr9354708wib.26.1359974788683;
	Mon, 04 Feb 2013 02:46:28 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:13 +0000
Message-Id: <1359974656-21894-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
References: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkAZNfwOyOMJMmpAqbA+44F4hLZN1t7oj1h2kPwN4XazCdHkGeo75Kfh9bvgfErG062wa/EZSHLn4o6cEWhsjiGKt8+qxEiNoayfavbd3M7SFRcnuMD39tVddGvyrx8sEPmtDpwTq/9PQOTuiftYTLkgZZJIweFVv3vWKQdGeVVkcTGAxNLDTxVU6RbRQXhiu7GkhBC
Subject: [PATCH 2/5] gdk-pixbuf: use correct build path when installing
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
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000

The native install was invoking a binary in $S, but it's been built into $B.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
index 5a9cd9b..64f1450 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
@@ -111,7 +111,7 @@ python populate_packages_prepend () {
 
 do_install_append_class-native() {
 #Use wrapper script rather than binary as required libtool library is not installed now
-	GDK_PIXBUF_MODULEDIR=${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders ${S}/gdk-pixbuf/gdk-pixbuf-query-loaders > ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
+	GDK_PIXBUF_MODULEDIR=${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders ${B}/gdk-pixbuf/gdk-pixbuf-query-loaders > ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 	sed -i -e 's#${D}##g' ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
-- 
1.7.10.4



