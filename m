Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ea-0007gd-SI
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:35 +0100
Received: by mail-wi0-f181.google.com with SMTP id hj8so955242wib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=wbPDfPs0RNvcU5AGuZVv8Z9ZhDDQ/s3SPX8zfYAkrI4=;
	b=LqGTZfbjP5FXnvAljtrr/UWgO93mT3Np+sY+gW/JUIO+6baK5imwy0wQ+ET0Fwe6Ly
	H4XZhHeJz1kp65lEpnmxonix9T4eiJ14lEL0sdGRKvW1SSLm4GYOjwUHAp9AD9alYhsO
	Bfng+jKh3tnsgpgBW2bM++racMoXZobRpApzyu51ThmFjRmyN691p83Rz8RHZ+Uik5n/
	/5ijmgmW4qnoMvv2A/VGMUX/aujjz/b5vrgGK465s7yQYurMz/7K2nn+dxShRRGwg/kg
	4V/h+sCbmvx60CmPdaq3qMzxqA2F/BZa1bWSBoQjO0IU3ZlOx2RGPOjFo+V/FMj+JhG0
	izWA==
X-Received: by 10.194.158.161 with SMTP id wv1mr4741498wjb.38.1363974099061;
	Fri, 22 Mar 2013 10:41:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:26 +0000
Message-Id: <94f31413dfa8c338acad119fe886441bbb80549a.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlaXKR8iJjKu9EhGjFdATp3w79SFwvFEF5KggUMZRAhe/46I6W6bKHMgoigT6Id2wKwlk4B
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/22] systemd: don't depend on the PCI/USB databases
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:29 -0000

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



