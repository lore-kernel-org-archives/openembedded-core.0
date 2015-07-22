Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C851973CB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 11:02:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2015 04:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="733340130"
Received: from gwhaley-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.55])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2015 04:02:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 12:02:12 +0100
Message-ID: <4892088.sb1qBAebDq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <019657e96ff75872fb4bf93661118fcd3d670188.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
	<019657e96ff75872fb4bf93661118fcd3d670188.1437430369.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 11:02:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 July 2015 15:15:54 Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This makes it easier to extend, as a layer can add its own sub-commands.
> 
> tinfoil is now passed into the commands, as we needed to parse the
> configuration metadata to get BBPATH, and we don't want to construct tinfoil
> more than once, otherwise we have to deal with startup and shutdown of
> cooker.

Hmm, but tinfoil is being constructed twice, right? I think what you've 
implemented is correct (and the only way it can really work), but this comment 
doesn't seem to match up with the actual changes.

> +    tinfoil = setup_tinfoil(config_only=True)
> +    for path in ([scripts_path] +
> +                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
> +        pluginpath = os.path.join(path, 'lib', 'devtool')
> +        scriptutils.load_plugins(logger, plugins, pluginpath)
> +    tinfoil.cooker.shutdown(force=True)
> +    tinfoil.cooker.unlockBitbake()

FYI I think Richard is about to add a shutdown method to tinfoil itself that 
will do what's needed here; however we can tidy this up after that's added.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

