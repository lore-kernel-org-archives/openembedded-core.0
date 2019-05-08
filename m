Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 084147DE54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:13:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h4so9584165wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GN6jDtsML9vuMDUijMd0d8k54mArqe/CSQwX9ENRTc=;
	b=W0rdQowWm2+Vpm9q4hm+0+w4ctrEju8arCXDSSKjpGtkioOxeAFI9F1J7XfH5YoidK
	5pj9Q3Ef5zwqgebi2SDSS2vyF1h87j5VnE2aHonXXjUUr46hn8rbnE8ZMDvVmampVrBo
	N7Yzxdsr5nu6Vy/v+PYTZsMBm7aYSVSb4P6AH3e8RBZvQokVg8Zlpk4Id+pT5aMTW1tg
	BkrJG861C+dClHK4UqqTVGGzCSmM9HG/KuX0ThNOs1ZSgmsyIxVILaWms9r235JxvQUB
	wYtA7m+EOhmqwp2OTuk71VC3D1uvJX0Io39SOxAzL9IasfuvvcBQAsWzYBVkJUClPqGX
	Zsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1GN6jDtsML9vuMDUijMd0d8k54mArqe/CSQwX9ENRTc=;
	b=bi/+jowXTCglELcqKh7tH6sCm8xGAhOmGLb183yueHcnP82LwnU4hZieGiVrWapgEN
	nLPQ7Le6dZ8/g+051KVr8u5YlHd1Igyx0eZzXjBNsIGU+iT+yRBjnpldSSFvrqVJNdw2
	/DqY7yC/HWVGhmIM7JV3s4fvvNbcjNkarURGbdXflq8tYAzcmUuhrXBqnNznWpMNz5N2
	ssTIkoarGvG9Mtthgesa6Mu6CLiq0HCF30tFxuuuOjYaLdM0jANImJb4TGI7YHDZzrKg
	3xWM7OjzYc2r0FvSuAzx4AUeA48Y3t8EUC6hpz6OLqKYJ70B3yjvvaO8th49+2pl4dsc
	e9ag==
X-Gm-Message-State: APjAAAVzA0CwqnoK9OwXCCqOpSxVt43Rn4QUUynxAIdEMCJN2viEW/Bm
	SHaHr/MuqknZC/U5vmQWObhZyhb3jeY=
X-Google-Smtp-Source: APXvYqyI63QpUI+lRqXLULW/8Wi63DBGNPKJwcUnasOe0pue90kFPgcQ6tyP+jbvlnqOhXAy+fWq+w==
X-Received: by 2002:a05:6000:1209:: with SMTP id
	e9mr3728411wrx.205.1557346423705; 
	Wed, 08 May 2019 13:13:43 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0B31751CB5D2150A46C45C.dip0.t-ipconnect.de.
	[2003:f0:7f0b:3175:1cb5:d215:a46:c45c])
	by smtp.gmail.com with ESMTPSA id
	a4sm15731756wrr.39.2019.05.08.13.13.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 13:13:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 22:13:35 +0200
Message-Id: <20190508201335.1732-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:13:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some projects rely on (cross)specific properties e.g [1]. By setting

MESON_CROSS_EXTRA_PROPS="var1='value1' var2=true"

the required properties can be passed to meson.build. The contents of
MESON_CROSS_EXTRA_PROPS behave same as known by e.g EXTRA_OEMESON.

[1] https://gitlab.gnome.org/GNOME/tracker/blob/master/meson.build#L91

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/meson.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 115d1aedcb..b9cd1deaef 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -45,6 +45,11 @@ def meson_array(var, d):
     items = d.getVar(var).split()
     return repr(items[0] if len(items) == 1 else items)
 
+def meson_cross_extra_properties(d):
+    cross_properties = "\n"
+    cross_properties = cross_properties.join((d.getVar('MESON_CROSS_EXTRA_PROPS') or '').split())
+    return cross_properties
+
 # Map our ARCH values to what Meson expects:
 # http://mesonbuild.com/Reference-tables.html#cpu-families
 def meson_cpu_family(var, d):
@@ -76,7 +81,7 @@ def meson_endian(prefix, d):
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS MESON_CROSS_EXTRA_PROPS CC CXX LD AR NM STRIP READELF"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
@@ -98,6 +103,7 @@ c_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
 cpp_args = ${@meson_array('MESON_CPP_ARGS', d)}
 cpp_link_args = ${@meson_array('MESON_LINK_ARGS', d)}
 gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
+${@meson_cross_extra_properties(d)}
 
 [host_machine]
 system = '${HOST_OS}'
-- 
2.20.1


