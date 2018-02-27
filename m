Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3CE77FED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 14:15:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 06:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,401,1515484800"; d="scan'208";a="204118210"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 27 Feb 2018 06:15:45 -0800
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180227134541.147175-1-ovidiu.panait@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <af855f84-4b86-d8d6-94ee-7ef56915ef05@linux.intel.com>
Date: Tue, 27 Feb 2018 16:09:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227134541.147175-1-ovidiu.panait@windriver.com>
Subject: Re: [PATCH] nativesdk-rpm: Add wrappers for nativesdk support
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
X-List-Received-Date: Tue, 27 Feb 2018 14:15:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/27/2018 03:45 PM, Ovidiu Panait wrote:
> +do_install_append_class-nativesdk() {
> +        tools="\
> +                ${bindir}/rpm \
> +                ${bindir}/rpm2archive \
> +                ${bindir}/rpm2cpio \
> +                ${bindir}/rpmbuild \
> +                ${bindir}/rpmdb \
> +                ${bindir}/rpmgraph \
> +                ${bindir}/rpmkeys \
> +                ${bindir}/rpmsign \
> +                ${bindir}/rpmspec \
> +                ${libdir}/rpm/rpmdeps \
> +        "
> +
> +        for tool in $tools; do
> +                create_wrapper ${D}$tool \
> +                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
> +                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
> +                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
> +                        RPM_NO_CHROOT_FOR_SCRIPTS=1
> +        done
> +
> +        rm -rf ${D}/var
> +}

Can this be done without copy-pasting an existing function please?

Alex

