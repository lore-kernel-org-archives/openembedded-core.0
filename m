Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBB877D58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 11:34:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 04:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="87952302"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 May 2017 04:34:31 -0700
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>
	<d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
	<1494860635949.47847@mentor.com>
	<2f2b263c-5b85-3622-ea62-c01825da24be@linux.intel.com>
	<1494912962159.30415@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <51bb3192-0566-418f-9448-4db95e29b567@linux.intel.com>
Date: Tue, 16 May 2017 14:32:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494912962159.30415@mentor.com>
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Tue, 16 May 2017 11:34:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 08:36 AM, Belal, Awais wrote:
>> The standard way to fix too long #! lines in oe is to patch
>> upstream code to use #!/usr/bin/env something (where something is
>> just the binary name).
>
>> Why not simply replace ${POSIX_SHELL} with /bin/sh? Where and how
>> is it set?
>
> POSIX_SHELL is being set to "/usr/bin/env sh" already through the
> recipe but it gets resolved/expanded to
> <build-dir>/hosttools/<shell-bin> during the configuration process so
> it's not usable for shebang in deep directory hierarchy scenarios. I
> guess a better way would be simply to use the same technique that
> we're using for perl. So for shell we'll have
>
> #!/usr/bin/env sh
>
> in mk-tpl-config.sh directly. I'll submit the change as v2 if you
> think this is okay.

You should not patch out the use of POSIX_SHELL after the fact. Find 
where it is resolved/expanded in the source code in the first place, and 
patch it there. Also, please check why setting POSIX_SHELL in the recipe 
no longer has any effect - there is a patch called 
0001-config-libopts.m4-regenerate-it-from-config-libopts.patch which 
should do the trick, but does not.

Alex


