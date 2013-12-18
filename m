Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 665CD60D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:55:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2013 08:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="446415809"
Received: from unknown (HELO helios.localnet) ([10.252.122.56])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2013 08:55:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Date: Wed, 18 Dec 2013 16:55:24 +0000
Message-ID: <3313957.6S11psWhHj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1387277093-3051-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1387277093-3051-1-git-send-email-corneliux.stoicescu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-selftest: New tests for sstate related operations
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
X-List-Received-Date: Wed, 18 Dec 2013 16:55:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Corneliu,

On Tuesday 17 December 2013 11:44:53 Corneliu Stoicescu wrote:
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/lib/oeqa/selftest/sstate.py |  226
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 226 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/sstate.py
> 
> diff --git a/meta/lib/oeqa/selftest/sstate.py
> b/meta/lib/oeqa/selftest/sstate.py new file mode 100644
> index 0000000..d1fe20a
>...
> +        # buildhistory needs to be disabled for this test. It may report errors otherwise. 
> +        if 'buildhistory' in get_bb_var('USER_CLASSES'):
> +            remove_buildhistory_config = 'USER_CLASSES_remove = "buildhistory"' 
> +            self.append_config(remove_buildhistory_config)

I'm not sure this is the right way to go about this. buildhistory typically
wouldn't  be enabled via USER_CLASSES by the end user (since it's not 
the way we recommend in the manual, although there's no reason why it 
shouldn't work.) Assuming it's the "version going backwards" check that
is the problem, I'd suggest disabling the QA check instead like this:

ERROR_QA_remove = "version-going-backwards"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

