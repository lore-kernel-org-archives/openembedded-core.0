Return-Path: <prvs=767f4520c=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCC6795F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1535121813; x=1566657813;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=zotmuMa2OmsNyQEQ+TjYd4BEy9AMDm3o1gobF/B2VwA=;
	b=XhKT3SN1n0KGJLJo7brbrG1fHHM4L9L25zy3OZBe8BywTYoFyAjFP8GJ
	MhkEnkPMg8PPwJY1ucaDpZ5GNAa/jkOg0M9lCbnRPsHR4pJm31J/maula
	w2aGHMn2zl6dTtULmxLHs8Whejod3Vj1WMWEioztWtkAubRnDeJ5F4jHd o=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Aug 2018 16:43:31 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw4.muc with ESMTP/TLS;
	24 Aug 2018 16:43:23 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 24 Aug 2018 16:43:23 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Fri, 24 Aug 2018 16:43:23 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Fri, 24 Aug 2018 16:43:23 +0200
From: <Mikko.Rapeli@bmw.de>
To: <pascal.bach@siemens.com>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO7TfP39PtwdlbkOrx+nUTU/G7KTO2KyA
Date: Fri, 24 Aug 2018 14:43:23 +0000
Message-ID: <20180824144323.GJ20864@hiutale>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale>
In-Reply-To: <20180824141512.GG20864@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.44]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 14:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D192640E5A867B42B4A5F57A8445DC60@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

> Fixes problems which we have also seen on sumo branch. Thanks for this!

Sorry, spoke too soon. This fixes compilation on a few recipes in my tree
but there are still lots failures with the same error message. We had a hac=
ky
patch to cmake as a workaround but that too causes some problems:

--- a/Modules/Compiler/GNU.cmake
+++ b/Modules/Compiler/GNU.cmake
@@ -45,7 +45,7 @@
   set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "<CMAKE_${lang}_COMPILER> <=
DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
   set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "<CMAKE_${lang}_COMPILER> <DEFI=
NES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")
   if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS 4) # wor=
k around #4462
-    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
+    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
   endif()
=20
   set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)

I wonder what the real fix could be...

-Mikko=

