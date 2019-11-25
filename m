Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3B97F29D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 13:58:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2019 05:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="260406004"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2019 05:58:14 -0800
To: openembedded-core@lists.openembedded.org
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<20191120093358.11622-9-jean-marie.lemetayer@savoirfairelinux.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <68585549-4230-aa1f-35e0-7dcf09c3be99@intel.com>
Date: Mon, 25 Nov 2019 13:58:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120093358.11622-9-jean-marie.lemetayer@savoirfairelinux.com>
Subject: Re: [PATCH v3 08/17] npm.bbclass: split the do_compile task
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
X-List-Received-Date: Mon, 25 Nov 2019 13:58:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/11/2019 09:33, Jean-Marie LEMETAYER wrote:
> +python do_fetch_append() {
> +    """
> +        Fetch all dependencies tarball to DL_DIR.
> +    """
> +    bb.fetch2.npm.fetch_dependencies(d)
> +}
> +
> +python do_unpack_append() {
> +    """
> +        Unpack all dependencies tarball to the 'node_modules' directory and add
> +        them to the npm cache. The dependencies needs to be unpacked to have
> +        access to the licenses files checksum feature (LIC_FILES_CHKSUM). They
> +        also have to be in the cache to properly execute the 'npm install'.
> +    """
> +    bb.fetch2.npm.unpack_dependencies(d)
> +}

I'd say that appends are a little ugly for introduction of core 
behaviour, maybe using do_fetch[postfuncs] would be neater.

Ross

