Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7C45E6CA24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 12:15:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Dec 2013 04:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,865,1378882800"; d="scan'208";a="447628589"
Received: from unknown (HELO helios.localnet) ([10.252.122.53])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2013 04:15:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Tue, 10 Dec 2013 12:15:38 +0000
Message-ID: <3004077.UQdCbJxAtD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51a89b7ff6efb35278daf3373040434a9673dba8.1386669285.git.Qi.Chen@windriver.com>
References: <cover.1386669285.git.Qi.Chen@windriver.com>
	<51a89b7ff6efb35278daf3373040434a9673dba8.1386669285.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] image.bbclass: remove zap_root_password
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
X-List-Received-Date: Tue, 10 Dec 2013 12:15:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Tuesday 10 December 2013 17:58:51 Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This function replaces the root password with '*' if 'debug-tweaks'
> is not in IMAGE_FEATURES. As a result, if we don't have 'debug-tweaks',
> we would be locked out of the system. That means, if the user uses a
> bbappend file for base-passwd to set the root password, he would not be
> able to login as root; if the user uses 'EXTRA_USERS_PARAMS' to set
> the root password, he would still not be able to login as root.
> 
> In a word, this function should be removed to make things work correctly.

Er, unless I'm missing something about what you're adding in the other patch, 
you *cannot* simply remove this. The intentional design of the existing code 
is that having "debug-tweaks" in IMAGE_FEATURES means that you can log in as 
root with no password; but most importantly if "debug-tweaks" is not present 
you cannot log in at all as root (in the absence of anything that sets the 
root password, of course). Any changes must preserve this behaviour.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

