Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53F1D782D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:29:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 08:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,435,1511856000"; d="scan'208";a="23623473"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2018 08:29:24 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 30 Jan 2018 08:29:23 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.11]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.73]) with mapi id
	14.03.0319.002; Tue, 30 Jan 2018 08:29:23 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] tzcode: remove unused patch files
Thread-Index: AQHTmVIIc/h1+FeM4kyypHC390OQ/KOMImoAgABbKICAAB20AQ==
Date: Tue, 30 Jan 2018 16:29:23 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B640535753@ORSMSX112.amr.corp.intel.com>
References: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
	<1517265587-84623-2-git-send-email-juro.bystricky@intel.com>
	<90d6d504-1abe-43b9-b25c-008de4e96039@gmail.com>,
	<ac3ea8c3-402e-229a-768c-7c305540b59c@gmail.com>
In-Reply-To: <ac3ea8c3-402e-229a-768c-7c305540b59c@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] tzcode: remove unused patch files
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
X-List-Received-Date: Tue, 30 Jan 2018 16:29:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
> I wonder if we can cook up a script which can check for unused patches,=
=0A=
> it will be very helpful to keep the code tidy=0A=
> perhaps it already exists and I am the only one who doesn't know=0A=
=0A=
This highly unoptimized Q&D script will list patches not referenced anywher=
e=0A=
(will barf on filenames with spaces, but typically there are none such file=
s ):=0A=
=0A=
$1 =3D filoder to (recursively) check, i.e called from meta:  ./recipes-dev=
tools=0A=
=0A=
#!/bin/bash=0A=
=0A=
findpatchesall=3D`find $1  -name '*.patch' -exec readlink -f {} \;`=0A=
findall=3D`find -L $1 -name '*.*' -not -name "*.patch" -exec readlink -f {}=
 \;`=0A=
=0A=
echo "patches: $findpatchesall"=0A=
echo "recipes: $findall"=0A=
=0A=
# Go through all patches and see if any file references them=0A=
for patch in $findpatchesall=0A=
do=0A=
	#echo "checking $patch"=0A=
	patch_referenced=3D"0"=0A=
	for file1 in $findall=0A=
	do=0A=
	patch1=3D`basename $patch`=0A=
	if [ -f "$file1" ]; then=0A=
		if grep -q $patch1 "$file1"; then=0A=
			#echo "referenced in: $file1"=0A=
			patch_referenced=3D"1"=0A=
		fi=0A=
	fi=0A=
	done=0A=
	if [ "$patch_referenced" =3D=3D "0" ]; then=0A=
		echo "*** $patch ***"=0A=
    fi=0A=
done=0A=
=0A=

