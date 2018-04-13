Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D2CE86FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 21:09:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 14:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="43163684"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2018 14:09:48 -0700
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
	<94fbeffa-e80a-2160-d6b7-d76aa779b941@linux.intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C6A8201@ORSMSX112.amr.corp.intel.com>
	<5c94de57-180e-d723-f5cb-135aefd8790a@linux.intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C6A939E@ORSMSX112.amr.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ac957064-a261-4de6-ff19-b751e12a65c0@linux.intel.com>
Date: Sat, 14 Apr 2018 00:03:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64C6A939E@ORSMSX112.amr.corp.intel.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 21:09:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/13/2018 11:29 PM, Bystricky, Juro wrote:
> Yes, I do get warnings, but in both cases (skipping the renaming and also if renamed  with MLPREFIX):
> WARNING: core-image-minimal-1.0-r0 do_populate_sdk: The postinstall intercept hook 'update_gio_module_cache-nativesdk' failed, details in /data/master-master/poky/build-x86_64-mingw32-sdk-core-image-minimal/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_populate_sdk
> 
> So skipping the renaming will at least give me a correctly named executable in the package.

The correctly named executable is the renamed one, as it is then 
consistent with what is in every other nativesdk- package (Linux-hosted 
ones), so the intercept script can properly pick it up. It is not used 
anywhere else except there.

> Are you sure the postinst-intercepts can even work with Windows .exe executables?
> If I understand this correctly, you use a qemuwrapper attempting to run Windows executable, and I
> cannot imagine this would work. But maybe I am missing something here.

This is tangential to how the executable should be called. Yes, the 
qemuwrapper is allowed to fail, that why it's a warning and not a hard 
failure. When building target images, the fallback to this failure is 
deferring the script to first boot. For SDKs we currently do nothing, 
which means package installation isn't really completed. If SDKs aren't 
able to function properly because of this, we can implement a similar 
deferral of some kind to the environment where those binaries can be 
executed natively without emulation.

Alex

