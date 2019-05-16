Return-Path: <chee.yang.lee@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF4F7D672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:31:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 18:31:34 -0700
X-ExtLoop1: 1
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga008.jf.intel.com with ESMTP; 15 May 2019 18:31:33 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.93]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.128]) with mapi id
	14.03.0415.000; Thu, 16 May 2019 09:31:32 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] add wic based image installer
Thread-Index: AQHVBW1w2X//NissAkCppoTTkrxGTKZs//pQ
Date: Thu, 16 May 2019 01:31:32 +0000
Message-ID: <231DEE2556DE094BBC743089035D8B2A1F23F467@PGSMSX103.gar.corp.intel.com>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzk0OGE3YzgtNWVlNS00NjIzLTg4YjQtZDE0ZjcwYjA4OTdlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRTNkbHRaeW9IbjdZNFJpRytZUncrRlBtVm16TzB0RFwvdGsyRTRHb1FBTGhyOHl4N1Ardm84UkpvZE05UndYZmUifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Thu, 16 May 2019 01:31:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any comments on these patches?

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of chee.yang.lee@intel.com
Sent: Wednesday, May 8, 2019 2:41 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/4] add wic based image installer

From: Chee Yang Lee <chee.yang.lee@intel.com>

Existing installable image (hddimg/ISO) has limit of 4GB size, so to build =
larger installable image, we can build it in wic based image.

2 partition needed for installable image
 - first partition build using source plugin bootimg-efi and configure to r=
un install
 - second partition build with root.img, systemd-boot and kernel to be inst=
all on target machine (this partition build using new source plugin install=
er-partition)

These patches:
 - add new source plugin for second partition
 - add new .wks
 - add new wic dependency and set default value for required variable
 - allow source plugin bootimg-efi to configure to install


To build the image, set WKS_FILE=3D"wic-installer.wks.in" in local.conf.


Chee Yang Lee (4):
  wic: add new installer-partition plugin
  wic: bootimg-efi: add label source parameter
  wic: add new wic-installer.wks for wic based image installer
  image_types_wic: add dependency for wic based image installer

 meta/classes/image_types_wic.bbclass               |   6 +
 scripts/lib/wic/canned-wks/wic-installer.wks.in    |   7 +
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  20 ++-
 .../lib/wic/plugins/source/installer-partition.py  | 192 +++++++++++++++++=
++++
 4 files changed, 220 insertions(+), 5 deletions(-)  create mode 100644 scr=
ipts/lib/wic/canned-wks/wic-installer.wks.in
 create mode 100644 scripts/lib/wic/plugins/source/installer-partition.py

--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

