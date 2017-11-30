Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE3EB6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 11:34:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2017 03:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,341,1508828400"; d="scan'208";a="11408027"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2017 03:34:16 -0800
To: openembedded-core@lists.openembedded.org,
	"liezhi.yang@windriver.com >> Robert Yang" <liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
	<f8f2799d5b4c51969c904a7a09b75caae1020b31.1512006081.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bddd691d-b200-a99a-9909-99ab33da7adb@linux.intel.com>
Date: Thu, 30 Nov 2017 13:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f8f2799d5b4c51969c904a7a09b75caae1020b31.1512006081.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 4/5] webkitgtk: fix compile error when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 11:34:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/30/2017 03:45 AM, Robert Yang wrote:
> One of the gcc command line was too long (longer than 160,000 characters) when
> len(TMPDIR) == 410, so there was an "Argument list too long" error:
> $ bitbake webkitgtk
> i586-poky-linux-g++: error trying to exec [snip] execv: Argument list too long
> 
> The cmake doesn't support relative path, so we have to edit flags.make to fix
> the problem:
> - Replace -I${RECIPE_SYSROOT} with -I=
> - Replace "-I${S}/path1/in/S -I ${S}/path2/in/S" with
>    "-iprefix ${S} -iwithprefixbefore /path1/in/S -iwithprefixbefore /path2/in/S"

Where does flags.make come from? Can you fix the problem at the source, 
rather than patch the file with a custom, unwieldy function after the fact?

Alex

