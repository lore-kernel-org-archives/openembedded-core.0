Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECEB460138
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 00:57:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t460v01x024089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 May 2015 17:57:01 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 5 May 2015 17:57:00 -0700
Message-ID: <554966DB.4070907@windriver.com>
Date: Wed, 6 May 2015 08:56:59 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1429759127-1927-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZ=0w_VY4jmhS5qPTrKh3iU66S+gWYjXC34JT059qkH1g@mail.gmail.com>
In-Reply-To: <CAJTo0LZ=0w_VY4jmhS5qPTrKh3iU66S+gWYjXC34JT059qkH1g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Wed, 06 May 2015 00:57:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年05月05日 23:43, Burton, Ross wrote:
>
> On 23 April 2015 at 04:18, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +export FORITY="${@base_conditional( "DEBUG_BUILD", "1", "",
>     "-D_FORTIFY_SOURCE=2", d )}"
>     +EXTRA_OEMAKE = 'AM_CFLAGS="-D_FILE_OFFSET_BITS=64 ${FORITY}"'
>
>
> "FORTIFY" not "FORITY", and why does that need to be exported?
>

typos, but it still fix the building failure.


> I'm also curious as to why fortify and debug builds are incompatible,
> and if there's a sufficient number of problems should we just disable
> fortify in security_flags.inc when debug builds are enabled?
>

the mmc-utils always uses the _FORTIFY_SOURCE, so we
need to override AM_CFLAGS to remove FORTIFY.


mmc-utils/git$ grep AM_CFLAGS Makefile
AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2
override CFLAGS := $(CHECKFLAGS) $(AM_CFLAGS) $(CFLAGS)
mmc-utils/git$


-Roy

> Ross

-- 
Best Reagrds,
Roy | RongQing Li

