Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C327734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:41:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 09:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,662,1432623600"; d="scan'208";a="624215143"
Received: from sgwillia-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.17.140])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2015 09:41:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 12 Aug 2015 17:41:48 +0100
Message-ID: <3935378.IqU2tRR2HN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <80d099504def0a839ca7961e91db3ba15034a5be.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<80d099504def0a839ca7961e91db3ba15034a5be.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] devtool: add sdk.py plugin
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
X-List-Received-Date: Wed, 12 Aug 2015 16:42:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 August 2015 11:18:06 Chen Qi wrote:
> E.g.
> devtool sdk-update /mnt/sdk-repo/
> devtool sdk-update http://mysdkhost/sdk

As noted by Chris we definitely need a better commit message here.

> +        logger.debug("Updating meta data via git ...")
> +        ret = subprocess.call("rm -rf layers && git clone %s/layers" %
> args.updateserver, shell=True) 
> +        if ret != 0:
> +            logger.error("Updating meta data via git clone failed")
> +            return ret

If we're using git we should at least try to pull (assuming we update the 
remote URL first in case the update server is different); if the pull fails we 
can fall back to rm -rf and clone. (Actually, would git pull -f work if the 
remote repo is completely different?)

> +
> +def register_commands(subparsers, context):
> +    """Register devtool subcommands from the sdk plugin"""
> +    parser_sdk = subparsers.add_parser('sdk-update', help='Update SDK
> components from a nominated destination')
> +    parser_sdk.add_argument('updateserver', help='The update server to
> fetch latest SDK components')
> +    parser_sdk.set_defaults(func=sdk_update)

Could you please add a check here for context.fixed_setup before adding the 
sdk-update command - since this command is only useful within the extensible 
SDK and should not be accessible when devtool is running next to a full 
install of the build system.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

