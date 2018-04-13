Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C2FE57472A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 20:29:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 13:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="34113634"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga006.jf.intel.com with ESMTP; 13 Apr 2018 13:29:39 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.141]) by
	ORSMSX108.amr.corp.intel.com ([169.254.2.171]) with mapi id
	14.03.0319.002; Fri, 13 Apr 2018 13:29:39 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glib-2.0/glib.inc: fix broken mingw build
Thread-Index: AQHT0q2OlMiqcCGGfUWLhK4wX8FAQqP+tvwAgAANnOGAAMeagP//j5dV
Date: Fri, 13 Apr 2018 20:29:38 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C6A939E@ORSMSX112.amr.corp.intel.com>
References: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
	<94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C6A8201@ORSMSX112.amr.corp.intel.com>,
	<5c94de57-180e-d723-f5cb-135aefd8790a@linux.intel.com>
In-Reply-To: <5c94de57-180e-d723-f5cb-135aefd8790a@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH] glib-2.0/glib.inc: fix broken mingw build
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
X-List-Received-Date: Fri, 13 Apr 2018 20:29:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I do get warnings, but in both cases (skipping the renaming and also i=
f renamed  with MLPREFIX):=0A=
WARNING: core-image-minimal-1.0-r0 do_populate_sdk: The postinstall interce=
pt hook 'update_gio_module_cache-nativesdk' failed, details in /data/master=
-master/poky/build-x86_64-mingw32-sdk-core-image-minimal/tmp/work/qemux86_6=
4-poky-linux/core-image-minimal/1.0-r0/temp/log.do_populate_sdk=0A=
=0A=
So skipping the renaming will at least give me a correctly named executable=
 in the package.=0A=
=0A=
Are you sure the postinst-intercepts can even work with Windows .exe execut=
ables?=0A=
If I understand this correctly, you use a qemuwrapper attempting to run Win=
dows executable, and I =0A=
cannot imagine this would work. But maybe I am missing something here.=0A=
=0A=
BTW, I cannot remedy this in the meta-mingw layer via a .bbppend, as the co=
de that needs to=0A=
be modified is in do_install_append, so it is not possible (or not easy) to=
 use overrides.=0A=
=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin [alexander.kanavin@linux.intel.com]=0A=
Sent: Friday, April 13, 2018 12:32 PM=0A=
To: Bystricky, Juro; openembedded-core@lists.openembedded.org=0A=
Cc: richard.purdie@linuxfoundation.org; jurobystricky@hotmail.com=0A=
Subject: Re: [PATCH] glib-2.0/glib.inc: fix broken mingw build=0A=
=0A=
On 04/13/2018 05:43 PM, Bystricky, Juro wrote:=0A=
>> I think the better approach is to accommodate the exe suffix when doing=
=0A=
>> the move:=0A=
>=0A=
>> mv -v ${D}${libexecdir}/gio-querymodules${EXEEXT}=0A=
>> ${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}=0A=
>=0A=
> This was actually the first thing I tried. However, I ended up with "nati=
vesdk-gio-querymodules.exe"=0A=
> in the mingw tarrball (in my case poky-glibc-x86_64-core-image-minimal-co=
re2-64-toolchain-2.4+snapshot.tar.xz).=0A=
> I am not sure what you expect postinst to do for Windows toolchains/SDKs,=
 but I would expect=0A=
> "gio-querymodules.exe", as it used to be until recently.=0A=
=0A=
"nativesdk-gio-querymodules.exe" is totally fine. This utility is used=0A=
in only one place:=0A=
poky/scripts/postinst-intercepts/update_gio_module_cache, to generate=0A=
the cache file of gio modules whenever the gio modules are installed or=0A=
removed.=0A=
=0A=
That script is called by postinst_intercept mechanism, which is=0A=
triggered via meta/classes/gio-module-cache.bbclass every time a package=0A=
that inherits that class is installed.=0A=
=0A=
I am fairly sure that with the patch you sent it is not going to work=0A=
for the nativesdk mingw case, as the script does prepend the MLPREFIX to=0A=
the utility name (to call the correct version among many when multilib=0A=
is in use). We would probably need to append the .exe suffix in there as=0A=
well though.=0A=
=0A=
Please do try populate_sdk with nativesdk-glib-2.0 included into it and=0A=
watch for any warnings about failed postinst_intercepts.=0A=
=0A=
Alex=0A=

