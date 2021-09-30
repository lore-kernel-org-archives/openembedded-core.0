Return-Path: <oleh.matiusha@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26094C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 08:36:17 +0000 (UTC)
Received: from us-smtp-delivery-110.mimecast.com
 (us-smtp-delivery-110.mimecast.com [170.10.133.110])
 by mx.groups.io with SMTP id smtpd.web12.9774.1632990974338823367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@globallogic.com header.s=mimecast20210517
 header.b=ei0EDJCD;
 spf=permerror,
 err=parse error for token &{10 18 _spf.psm.knowbe4.com}: limit exceeded
 (domain: globallogic.com, ip: 170.10.133.110,
 mailfrom: oleh.matiusha@globallogic.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
	s=mimecast20210517; t=1632990972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4bxZjnXJ+Rf6m/3oSerqmRc6mn24JHxxi5EZ2CFQ890=;
	b=ei0EDJCD+sKBcIczce1xGdLnUhUQ8DVB603g79NFMq7JfF/Fi72aO8D02v/TQmmIxZGerJ
	Mmf4Espb6wMmWlBffq89KMVzVuWU9nOb0tssVQ4Ix0b8hYLRr2CfZesWyUgB9kiAWuExX1
	DnDeymXUMcZlXELApYGoaDMpeIJxAQSh5hoG3GWqWmG0xLrdMYs6DSl3EGAXpfZU9v3Xr8
	jyIgrCq14Cw54F0hlZoPfG5cuiA7I/ZNGkWq0nuJ4OyAA/7a2916xJwkRuGSigdji0Loyp
	EzsOUEso2M9Ciw09qwSOZ/Vx0u2RzlXS1aNI+a1rlZvhtrQOn/cyVYg77XBp3A==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582--gjhnpLvP72gTi3hmIsckQ-1; Thu, 30 Sep 2021 04:36:10 -0400
X-MC-Unique: -gjhnpLvP72gTi3hmIsckQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w8-20020a50f108000000b003da70d30658so5484850edl.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42xzFEGY5PhYfLu8uU2i/9JcFij6cltk2/TsT2xtG9g=;
        b=ncc4tUCBVYHpxvmHz+MepsI+4FBw40TlvfyT3dh4ms1ehzEuOzCGR901rcHb/T2wzB
         1c7ahvJ9gvlKWY7wwSeuvFKJrMC1b1ewsAGuAdOVMQp9UNT0zRxNbCPZqW1Roeulatum
         D7aY40CZADFalm1wjlMysIL7wU04h0lnwoPWpaNFWCpqYSUKwAdIp4cA4BLK5zZa900L
         ZkoCQCRS4HtjVMoTe5ghjN56x/0FdeyS70pYkdqwc2hG33rlSmPIaibEPPrBHNqsTVwq
         j39iiDi//5bxO7SW2gDx955p+gsg8KFd7gkh4fnLDQ5gvfntY3ydZ9PARVp2oBgT1Qa3
         F54w==
X-Gm-Message-State: AOAM533R8XXsPU1jCdhhJF2fIC9jV97c7rMkTNg2UH7T7b6G3nWSkyL1
	7jx4ef5Ou+RAJjEXDbZjuBkbzpr6LgGVQnbIrVo7aQ8ya/tUfOCSYa7ZOz8JwycIpWcCZiYX11F
	rS8ZNZOGCf6/1lFlZOtr7tonMYIna6jHEr7h2uuo=
X-Received: by 2002:a50:d98d:: with SMTP id w13mr5688644edj.51.1632990968961;
        Thu, 30 Sep 2021 01:36:08 -0700 (PDT)
X-Google-Smtp-Source: 
 ABdhPJzizTroOOiJdj2aEEheNUU+jbLVCM1mq0wLoeMq5V0TNKj3AFJZytX0RIDkqHULZNqLkQvBLg==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr5688606edj.51.1632990968487;
        Thu, 30 Sep 2021 01:36:08 -0700 (PDT)
Received: from kbp1-lhp-f71885.bcm.net.ua ([178.54.245.173])
        by smtp.gmail.com with ESMTPSA id
 q6sm1013011ejm.106.2021.09.30.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:36:08 -0700 (PDT)
From: Oleh Matiusha <oleh.matiusha@globallogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleh Matiusha <oleh.matiusha@globallogic.com>
Subject: [PATCH v2] findutils: add ptest
Date: Thu, 30 Sep 2021 11:34:25 +0300
Message-Id: <20210930083424.2002792-1-oleh.matiusha@globallogic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA110A380 smtp.mailfrom=oleh.matiusha@globallogic.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: globallogic.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 08:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156486


Fixed warning in v1 by adding findutils-ptest to ptest-packagelists.inc.
Placed it in PTESTS_SLOW since it takes 36s to execute this ptest on qemu.

Signed-off-by: Oleh Matiusha <oleh.matiusha@globallogic.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/findutils/findutils.inc |  6 +-
 .../findutils/findutils/run-ptest             | 57 +++++++++++++++++++
 .../findutils/findutils_4.8.0.bb              | 11 ++++
 4 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index e0ae1dd971..2cd97d90ec 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -71,6 +71,7 @@ PTESTS_SLOW =3D "\
     coreutils-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
+    findutils-ptest \
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-e=
xtended/findutils/findutils.inc
index ea8a1b7afe..ddcc05750b 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -6,9 +6,11 @@ HOMEPAGE =3D "http://www.gnu.org/software/findutils/"
 BUGTRACKER =3D "http://savannah.gnu.org/bugs/?group=3Dfindutils"
 SECTION =3D "console/utils"
=20
-SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
+          file://run-ptest \
+          "
=20
-inherit autotools gettext texinfo update-alternatives
+inherit autotools gettext texinfo update-alternatives ptest
=20
 ALTERNATIVE:${PN} =3D "find xargs"
 ALTERNATIVE_PRIORITY =3D "100"
diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/rec=
ipes-extended/findutils/findutils/run-ptest
new file mode 100644
index 0000000000..ec71583c51
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/run-ptest
@@ -0,0 +1,57 @@
+#!/bin/bash
+
+# create temporary symlink to workaround missing oldfind
+ln -s /usr/bin/find /tmp/oldfind
+# make oldfind visible
+export PATH=3D"/tmp:${PATH}"
+
+export built_programs=3D"find xargs locate updatedb"
+
+# this gets substituted by sed during build
+export VERSION=3D"__run_ptest_version__"
+
+# define missing functions for tests/init.sh
+fu_path_prepend_ () {
+=09path_prepend_ $@
+}
+
+print_ver_ () {
+=09:
+}
+
+skip_if_root_ () {
+=09[ $(id -u) =3D 0 ] && exit 77;
+}
+
+require_root_ () {
+=09[ $(id -u) =3D 0 ] || exit 77;
+}
+
+expensive_ () {
+=09:
+}
+
+export -f fu_path_prepend_
+export -f print_ver_
+export -f skip_if_root_
+export -f require_root_
+export -f expensive_
+
+
+for f in tests/*/*.sh; do
+=09bash $f ;
+=09case $? in
+=09=090 )
+=09=09=09echo -n "PASS";;
+=09=0977 )
+=09=09=09echo -n "SKIP";;
+=09=09* )
+=09=09=09echo -n "FAIL";;
+=09esac
+=09echo ": $f"
+done
+
+#remove symlink
+rm -f /tmp/oldfind
+
+echo
diff --git a/meta/recipes-extended/findutils/findutils_4.8.0.bb b/meta/reci=
pes-extended/findutils/findutils_4.8.0.bb
index 675e53c0da..356fb05be6 100644
--- a/meta/recipes-extended/findutils/findutils_4.8.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.8.0.bb
@@ -12,3 +12,14 @@ SRC_URI[sha256sum] =3D "57127b7e97d91282c6ace556378d5455=
a9509898297e46e10443016ea1
 CACHED_CONFIGUREVARS +=3D "gl_cv_func_wcwidth_works=3Dyes"
=20
 EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
+
+RDEPENDS:${PN}-ptest +=3D "bash sed grep"
+
+do_install_ptest:class-target() {
+=09mkdir -p ${D}${PTEST_PATH}/tests/
+=09cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+=09# substitute value in run-ptest with actual version
+=09sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
+
+}
--=20
2.25.1


