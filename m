Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06DDC77D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490961599; x=1522497599;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=eVXyWYxLK9emtZ+EpMn0lVirWMNdY+JqoQVsqNgbM2E=;
	b=dT1RDrsb2Zf/VEEIbfuFhXWei/5h2QwDkIqc8wHz3gj8PfRbfDQc12jR
	jw2sajl5xUV/N1RcnL2YKmxTL1ujhw==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 04:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,251,1486454400"; d="scan'208";a="840385848"
Received: from summit.tm.intel.com (HELO [10.237.55.181]) ([10.237.55.181])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2017 04:59:57 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
	<CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
	<4cf87faa3852485a820c7526323ef2ab@XBOX02.axis.com>
	<0b00658b-a9c7-680c-9ec3-c6cee05b7f67@linux.intel.com>
	<CAJTo0LbtX-r+wp+1+taeimS7P0jGC1ygZHftfSeqJRRQY72iCg@mail.gmail.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <4210425e-9602-9573-e3e6-43a515a9b7d1@linux.intel.com>
Date: Fri, 31 Mar 2017 15:00:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbtX-r+wp+1+taeimS7P0jGC1ygZHftfSeqJRRQY72iCg@mail.gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Fri, 31 Mar 2017 11:59:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 30/03/17 19:15, Burton, Ross wrote:
>
> On 30 March 2017 at 07:59, Mikko Ylinen <mikko.ylinen@linux.intel.com 
> <mailto:mikko.ylinen@linux.intel.com>> wrote:
>
>     I'm fine. Perhaps 'efi' should not be a PACKAGECONFIG at all (and
>     unconditionally disabled here) and
>     the functionality (just bootctl?) is moved in systemd-boot. Thoughts?
>
>
> I'm not fully aware of the details here but this seems like a good 
> idea.  Can you prepare a patch?
>

Looks like it's not very easy to build bootctl part of systemd-boot 
(without re-building the whole
systemd there too).

Therefore, I'd just:

-                   ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam 
selinux ldconfig', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam selinux 
ldconfig', d)} \

and perhaps:

-PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
+PACKAGECONFIG[bootctl] = "--enable-efi,--disable-efi"

efi/bootctl can then be added in PACKAGECONFIG by those who need bootctl.

-- Mikko

