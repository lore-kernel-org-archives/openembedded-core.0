Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 06DEF74BF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:04:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2018 12:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,427,1520924400"; d="scan'208";a="56273265"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 May 2018 12:04:49 -0700
To: Jens Rehsack <rehsack@gmail.com>, openembedded-core@lists.openembedded.org
References: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
Date: Mon, 21 May 2018 22:04:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
Subject: Re: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Mon, 21 May 2018 19:04:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/21/2018 06:55 PM, Jens Rehsack wrote:
> Move scripts/bashrc from meta-jens/scripts to oe-core to share user-friendly
> oe builddir management with community. Using this script will help manage
> multiple BSPs and targets like perl developers using perlbrew.

Please explain in detail what this does, and why is it superior to 
existing tools. What are the typical usage scenarios? Where and how this 
should be documented and tested? It is not a good idea to just add 
something into scripts/, as no one will know or use it, and so it will 
just quietly bitrot.

> +__oe_check_py () {
> +    # Make sure we're not using python v3.x. This check can't go into
> +    # sanity.bbclass because bitbake's source code doesn't even pass
> +    # parsing stage when used with python v3, so we catch it here so we
> +    # can offer a meaningful error message.
> +    py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
> +    if [ "$py_v3_check" != "" ]; then
> +        echo >&2 "Bitbake is not compatible with python v3"
> +        echo >&2 "Please set up python v2 as your default python interpreter"
> +        return 1
> +    fi

Bitbake has in fact been compatible with Python 3.x for several 
releases. The above check is not particularly useful, as /usr/bin/python 
nearly always points to a 2.x version.

Alex

