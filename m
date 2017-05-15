Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED2072F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:12:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 08:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="261807417"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 15 May 2017 08:12:24 -0700
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170512135918.25150-1-awais_belal@mentor.com>
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
	<1494838882617.45509@mentor.com>
	<d5c91712-63e4-b855-e508-a638de7cf916@linux.intel.com>
	<1494860635949.47847@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2f2b263c-5b85-3622-ea62-c01825da24be@linux.intel.com>
Date: Mon, 15 May 2017 18:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494860635949.47847@mentor.com>
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
X-List-Received-Date: Mon, 15 May 2017 15:12:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2017 06:03 PM, Belal, Awais wrote:
> Hi Alex,
>
>> The first line will guarantee a short shebang, while the second one
>> may result in a very long shebang which may hit the hardcoded
>> kernel limit.
>
> I do not see how the second one can be longer in any case than the
> first one but that's probably because of my lack of knowledge. I can
> confirm that the changes around perl setting are not required and I
> only stepped over it because I was using an older commit of core
> however the change for sh is still required. Should I submit a v2
> with that change only or is there a concern around that as well?

The sh part is also using readlink, which produces full paths, and 
therefore is incorrect. You simply should not use full paths in #!, as 
depending on your setup they may be still too long.

The standard way to fix too long #! lines in oe is to patch upstream 
code to use
#!/usr/bin/env something
(where something is just the binary name).

Why not simply replace ${POSIX_SHELL} with /bin/sh? Where and how is it set?

Alex

