Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A6A4171951
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:12:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 23 May 2017 06:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,382,1491289200"; d="scan'208";a="1173205692"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2017 06:12:06 -0700
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170519154856.21505-1-max.krummenacher@toradex.com>
	<ea81f53d-203f-183b-3a51-b0d71301b384@linux.intel.com>
	<1495488738.2723.18.camel@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8ab9f3a0-a3cf-e77d-e615-bfda3b016840@linux.intel.com>
Date: Tue, 23 May 2017 16:10:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495488738.2723.18.camel@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Tue, 23 May 2017 13:12:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2017 12:32 AM, Max Krummenacher wrote:
>> Sorry Max, this is actually worse than the first version. HAVE_RPM_DB_H
>> has to accurately reflect the presence or absence of the header, as that
>> header is later included or not included depending on that. You cannot
>> set it based on checking some library.
> Well, that is somewhat true.
> The test explicitly tests that the header file is available, but then
> implicitely assumes that when the header file is available no standalone
> needs be linked.
>
> Turning that assumption to explicitly test that rpm.so provides the db
> functionality and from that assuming that rpm/db.h is available is IMHO
> equally right or equally incomplete testing.

The first version of the patch assumes that rpm in oe-core is configured 
to use external db, and hardcodes that assumption.

The second version of the patch assumes that both the library and the 
header are available at the same time. This may be true right now when 
building with bitbake, it is certainly not true in other situations.

I would rather make assumptions about oe-core content, rather than 
bitbake behaviour.

>> So please either fix CHECK_INCLUDE_FILE,
> The reason why I didn't fix it as follows is that this would break
> the test for the non native (target and nativesdk) case.
>
> +  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H "-nostdinc")
>
> For the non native case the OE rpm headers are actually stored in
> the compiler's standard include path, so searching for rpm/db.h
> with -nostdinc wouldn't pick up the file even if it would exist.

This is not the fix I meant. You are fixing the *use* of 
CHECK_INCLUDE_FILE, but I wanted you to fix the internal content of 
CHECK_INCLUDE_FILE itself, so that it behaves correctly in 
bitbake-driven environment, and does not go out to check host machine 
include paths.

It's fine if the code to be fixed is too arcane or tricky and you cannot 
do it, then let's just revert to the first version of the patch.

Alex

