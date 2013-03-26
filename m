Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNy-00076o-Az
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-we0-f178.google.com with SMTP id z53so1949002wey.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=wbPDfPs0RNvcU5AGuZVv8Z9ZhDDQ/s3SPX8zfYAkrI4=;
	b=oVXDiKgDG33WqzhPNihBMKRx0mXTYhh8VKR++dPeNU41QEptT2BTk3DHRHxySb/HGj
	1f5SSCzOXFvXOhxWMDpXXs2kYMU0aDZ1fMbK/a3q+CFK+Z7UVdKZUe4gjfF0lb8/9dNG
	8IXH0BwnpJTFPNz+6a/FtNNj1QNJVzKSQOKk5E3JAowrfQfNoAnEg6D6/nh948Ux+0Da
	9nDYa8Lhlp1hSYQbgGLANSl8iExPaYhy359mQsMq/YZlfea7Ka7fo+CeM0geb7Vgqf7r
	hCZ15B3/k6eVK/cHmOmOvG2vpS/D8nxLxRfyYjCvxn1xXloUauKgQb+cieLEMmvJNXBL
	ZtnA==
X-Received: by 10.180.103.65 with SMTP id fu1mr4570385wib.4.1364316790743;
	Tue, 26 Mar 2013 09:53:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:04 +0000
Message-Id: <ab23b1fe4892a03af5b59cd0dfa0fcf190f339df.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlLCCgZYn9QgLtAhsJKPpxgn6OUaZvWt/9FCFc6+ZZ3z7hq8HuFatPUj0CnTaiIbLtX4oQt
Subject: [PATCH 06/24] systemd: don't depend on the PCI/USB databases
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000

systemd ships its own databases (hwdb), so we don't need another copy.
--with-pci-ids isn't recognised by configure, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 9a66a4e..56ced66 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -61,7 +61,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-manpages \
                  --disable-coredump \
                  --disable-introspection \
-                 --with-pci-ids-path=/usr/share/misc \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
@@ -187,7 +186,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf usbutils-ids pciutils-ids"
+RRECOMMENDS_udev += "udev-extraconf"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
-- 
1.7.10.4



