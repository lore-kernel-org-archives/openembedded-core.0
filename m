Received: from mx2.garz-fricke.com (mx2.garz-fricke.com [213.23.127.198])
 by mx.groups.io with SMTP id smtpd.web09.5341.1617950127955392823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 23:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garz-fricke.com header.s=key2020r header.b=I+8ldaxh;
 spf=pass (domain: garz-fricke.com, ip: 213.23.127.198, mailfrom: jonas.hoeppner@garz-fricke.com)
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=Key2020e; 
 t=1617950124; bh=yZPdeeufiT7LNMvK71D3Kwi+iCw0zt70WaO4y1MlHLo=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id"; 
 a=ed25519-sha256; b=
 VWe1ocs90uKzI1Tij0npfKVkQntFeOD9r+D88YAf3mGwUqgDMATOL3jNSy4xsTlPK3YWGU2frrszMb/ZLVEqBA==
DKIM-Signature: v=1; c=relaxed/relaxed; d=garz-fricke.com; s=Key2020r; 
 t=1617950124; bh=yZPdeeufiT7LNMvK71D3Kwi+iCw0zt70WaO4y1MlHLo=; h=
 "Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id"; 
 a=rsa-sha256; b=
 I+8ldaxhyWdBvbggvPQp//dS4DFN6cxMQC2AJvqAL+aFW/uKKcAmthtPJq0nOZrtxJ7Td5sbSqex1NAVi5NjMHBPINEijbeb7i3NPrUd2qwhkC6iQdRx9EJAugq/gRLN4qOsXZVpQUy5Z7ITSMQGNhpGPZEs66yOZlKbXsGV7rzpJDBHttxHm4KV+hzkApKwOffBE4X9txXLcMf3Wi97ezsvsWQg2DsQmFB5VhVO2ia1wKko1cT4Ui31gc3vijZpELvIEygIE/OZ16s9tqJg7mMraVZm5A9dOEJ53OAl2LzIfisqyET4nKCmksN0B9ZEVIKw+Xn3kXj2w6DlpqU4aw==
From: "Jonas" <jonas.hoeppner@garz-fricke.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ltp: fix empty ltp-dev package
Thread-Topic: [OE-core] [PATCH] ltp: fix empty ltp-dev package
Thread-Index: AQHXLFGjNQOuWgXoIkSwe0rKZQ+Cgaqrut1T
Date: Fri, 9 Apr 2021 06:35:22 +0000
Message-ID: <56789ce8dfb04be7bf2724b24487b4f4@garz-fricke.com>
References: <20210408083152.26118-1-jona.hoeppner@gmail.com>
In-Reply-To: <20210408083152.26118-1-jona.hoeppner@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Jonas H=F6ppner <jonas.hoeppner@garz-fricke.com>

Currently the headers are not installed and the ltp-dev package is
empty.

This patch adds an include-install make target in the do_install step to
install them in sysroot which ends up as a working ltp-dev package.

Signed-off-by: Jonas H=F6ppner <jonas.hoeppner@garz-fricke.com>
---
=A0meta/recipes-extended/ltp/ltp_20210121.bb | 2 +-
=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-exten=
ded/ltp/ltp_20210121.bb
index f58ca2eb2c..d98c9fdc25 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -61,7 +61,7 @@ EXTRA_OECONF +=3D " --without-tirpc "
=A0
=A0do_install(){
=A0=A0=A0=A0 install -d ${D}${prefix}/
-=A0=A0=A0 oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install
+=A0=A0=A0 oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install include-insta=
ll
=A0
=A0=A0=A0=A0 # fixup not deploy STPfailure_report.pl to avoid confusing abo=
ut it fails to run
=A0=A0=A0=A0 # as it lacks dependency on some perl moudle such as LWP::Simp=
le
--=20
2.31.0
    =

