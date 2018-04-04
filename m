Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BADE971BF2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:38:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40602280"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:38:39 -0700
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1522837858.git.Qi.Chen@windriver.com>
	<2e27990d1f27a0de84fc204caf77c28e5015173e.1522837858.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <11a298c3-7fed-c73e-be12-0ed099fca145@linux.intel.com>
Date: Wed, 4 Apr 2018 14:32:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <2e27990d1f27a0de84fc204caf77c28e5015173e.1522837858.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] rpm: remove dbus dependency for rpm-native
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
X-List-Received-Date: Wed, 04 Apr 2018 11:38:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/04/2018 01:45 PM, Chen Qi wrote:
> +# dbus dependency is deliberately omitted for rpm-native to prevent it from attempting to
> +# inhibit shutdown via session dbus, even when some layer enables plugins support for rpm-native.
> +DEPENDS_remove_class-native = "dbus"
> +
>   inherit autotools gettext pkgconfig python3native
>   export PYTHON_ABI
>   
> @@ -63,7 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
>   #
>   # --localstatedir prevents rpm from writing its database to native sysroot when building images
>   #
> -# Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
> +# Disable plugins for rpm-native.
>   EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"


This should definitely be a PACKAGECONFIG option. Actually, two 
different options: "plugins" (pulls in dbus) and "plugins-native" (does 
not pull in dbus). Then both can be enabled for target and native, 
respectively.


Alex



