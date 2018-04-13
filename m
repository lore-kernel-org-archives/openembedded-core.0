Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8943774624
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 19:38:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 12:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="43146835"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2018 12:38:19 -0700
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
	<94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C6A8201@ORSMSX112.amr.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5c94de57-180e-d723-f5cb-135aefd8790a@linux.intel.com>
Date: Fri, 13 Apr 2018 22:32:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64C6A8201@ORSMSX112.amr.corp.intel.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 19:38:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/13/2018 05:43 PM, Bystricky, Juro wrote:
>> I think the better approach is to accommodate the exe suffix when doing
>> the move:
> 
>> mv -v ${D}${libexecdir}/gio-querymodules${EXEEXT}
>> ${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}
> 
> This was actually the first thing I tried. However, I ended up with "nativesdk-gio-querymodules.exe"
> in the mingw tarrball (in my case poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-2.4+snapshot.tar.xz).
> I am not sure what you expect postinst to do for Windows toolchains/SDKs, but I would expect
> "gio-querymodules.exe", as it used to be until recently.

"nativesdk-gio-querymodules.exe" is totally fine. This utility is used 
in only one place:
poky/scripts/postinst-intercepts/update_gio_module_cache, to generate 
the cache file of gio modules whenever the gio modules are installed or 
removed.

That script is called by postinst_intercept mechanism, which is 
triggered via meta/classes/gio-module-cache.bbclass every time a package 
that inherits that class is installed.

I am fairly sure that with the patch you sent it is not going to work 
for the nativesdk mingw case, as the script does prepend the MLPREFIX to 
the utility name (to call the correct version among many when multilib 
is in use). We would probably need to append the .exe suffix in there as 
well though.

Please do try populate_sdk with nativesdk-glib-2.0 included into it and 
watch for any warnings about failed postinst_intercepts.

Alex

