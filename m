Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.4019.1594291271675442829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 03:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JqjVLtmp;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1900; q=dns/txt; s=axis-central1;
  t=1594291272; x=1625827272;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=umHFrVz2C5PPYHZN1szlTd6iEXVCit0sYpAriQJCAnE=;
  b=JqjVLtmpQd6aLEhgKzPmVbeL2hqtTKs1GYycu/O7RLiQYXhy5vhlYhyh
   aRBeqMaSLrhDfUM7WEYY7ybyXZ3JGRo3yIQNpJxpEiVRlQJ+4e+CDvk3v
   0uhy0chfi7+39ih3fPIn3A2YsRkOoGTwBHicXiX+B39LbEGjC28Mdc+/S
   AgSqDZHMEmCdr7URaPIvgXsLHMncZeU6rYu1ccnYIRIF47XwRNu5ZwFDQ
   5fVS1MmhbK17HO/mmbNaKuVfFDmvKEAJwFDDb/8etOoLLSuyGMeH6FGZi
   /rIuHS50uSwaL6jITRXkFPyNU0X5zDn7DPD4ey+nwBaf6pxHUuZ7q4BH2
   A==;
IronPort-SDR: gZm/VKWR1ZkCNQioV33hnbnMN7zs5Jecnq2kE0CG/Lk3hUM+hTtQFICWd4m/d7HrP1yfg4zWhx
 I+jKxYXBws+UV1aaIsMrIoc4vk+aBEce84Ilap1Uco4ggcmQE6Y5X2jM1WBHWmHrI70nMI0uPx
 y72uhPkpb7jhKM5GVj3dzA7p1rJrgvR5vkR9EFxKWAgggobGO1w3cUzR3MWO0mB+u51ZSBWXms
 3lGubPSEIekZPIK7kKWBHCLV3nbtkkIUeIf2YAUUNSV/zYNvUcTdlzdmkkpPsowMC5GJ7nhenC
 yg4=
X-IronPort-AV: E=Sophos;i="5.75,331,1589234400"; 
   d="scan'208";a="10631138"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v3] nopackages.bbclass: Get tasks from variable
Thread-Topic: [PATCH v3] nopackages.bbclass: Get tasks from variable
Thread-Index: AQHWT4Qi/qyL/nKnXEmUjFPVItn4maj/G40/
Date: Thu, 9 Jul 2020 10:41:08 +0000
Message-ID: <1594291267890.30391@axis.com>
References: <20200701084634.11428-1-fredrigu@axis.com>,<20200701084634.11428-2-fredrigu@axis.com>
In-Reply-To: <20200701084634.11428-2-fredrigu@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,=0A=
is there something I can do to make this move forward?=0A=
=0A=
/Fredrik=0A=
________________________________________=0A=
From: Fredrik Gustafsson=0A=
Sent: Wednesday, July 1, 2020 10:46 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: tools-cfpbuild-internal; Fredrik Gustafsson=0A=
Subject: [PATCH v3] nopackages.bbclass: Get tasks from variable=0A=
=0A=
Get tasks from a variable instead of having them hardcoded. This will=0A=
enable other layers to add tasks that should be deleted when nopackages=0A=
is used.=0A=
=0A=
Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>=0A=
---=0A=
 meta/classes/nopackages.bbclass | 19 +++++++------------=0A=
 1 file changed, 7 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbcl=
ass=0A=
index 559f5078bd..4c9fe510c5 100644=0A=
--- a/meta/classes/nopackages.bbclass=0A=
+++ b/meta/classes/nopackages.bbclass=0A=
@@ -1,12 +1,7 @@=0A=
-deltask do_package=0A=
-deltask do_package_write_rpm=0A=
-deltask do_package_write_ipk=0A=
-deltask do_package_write_deb=0A=
-deltask do_package_qa=0A=
-deltask do_packagedata=0A=
-deltask do_package_setscene=0A=
-deltask do_package_write_rpm_setscene=0A=
-deltask do_package_write_ipk_setscene=0A=
-deltask do_package_write_deb_setscene=0A=
-deltask do_package_qa_setscene=0A=
-deltask do_packagedata_setscene=0A=
+NO_PACKAGES_DELTASKS +=3D "do_package do_package_write_rpm do_package_writ=
e_ipk do_package_write_deb do_package_qa do_packagedata do_package_setscene=
 do_package_write_rpm_setscene do_package_write_ipk_setscene do_package_wri=
te_deb_setscene do_package_qa_setscene do_packagedata_setscene"=0A=
+=0A=
+python () {=0A=
+    list =3D d.getVar("NO_PACKAGES_DELTASKS").split()=0A=
+    for task in list:=0A=
+        bb.build.deltask(task, d)=0A=
+}=0A=
--=0A=
2.20.1=0A=
=0A=
