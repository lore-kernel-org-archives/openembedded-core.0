Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E9BA3747F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 06:43:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 May 2018 23:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,435,1520924400"; d="scan'208";a="44345837"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 23 May 2018 23:43:34 -0700
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1527128380-337444-1-git-send-email-changqing.li@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dafac5e8-2ff2-5935-b469-f23fd224876f@linux.intel.com>
Date: Thu, 24 May 2018 09:43:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527128380-337444-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] systemd/pixbufcache/gio-module-cache/fontcache: fix build warning when using qemu usermode
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
X-List-Received-Date: Thu, 24 May 2018 06:43:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/24/2018 05:19 AM, changqing.li@windriver.com wrote:
> udev-hwdb/pixbufcache/gio-module-cache/fontcache uses qemu usermode by default,
> but some architecture such as Intel skylake does not support qemu usermode, this can
> lead to a build warning as below:
> warning: %post(udev-hwdb-1:234-r0.skylake_64) scriptlet failed, exit status
> "WARNING: The postinstall intercept hook 'update_pixbufcache' failed".
> "WARNING: The postinstall intercept hook 'update_gio_module_cache' failed".
> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
> 
> Add a judgement of qemu usermode to fix the build warning.

Using 'exit 1' in postinst is now deprecated and will soon become a real 
failure. The better way is to make qemuwrapper-cross determine whether 
qemu usermode is supported, and print the warning only if it is 
supported and running qemu fails.

Alex

