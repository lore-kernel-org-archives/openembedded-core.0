Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E050976FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 10:21:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8PALgun029786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Sep 2015 03:21:42 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 25 Sep 2015 03:21:42 -0700
Message-ID: <56052034.4000702@windriver.com>
Date: Fri, 25 Sep 2015 18:21:40 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
	<CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
	<CAJTo0LaJeeLRqmADYQ2DNGWs9VxwJMCRViwSvEX84FEbqVVTYA@mail.gmail.com>
In-Reply-To: <CAJTo0LaJeeLRqmADYQ2DNGWs9VxwJMCRViwSvEX84FEbqVVTYA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Fri, 25 Sep 2015 10:21:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2015 07:55 PM, Burton, Ross wrote:
>
> On 24 September 2015 at 12:49, Jussi Kukkonen <jussi.kukkonen@intel.com
> <mailto:jussi.kukkonen@intel.com>> wrote:
>
>     I'm not seeing this problem and gnutls.pc.in <http://gnutls.pc.in>
>     file looks ok to me. Any idea how I could reproduce this?
>
>
> Also, just sedding them out of the resulting file seems suboptimal
> compared to finding out where the path is coming from and fixing that,
> so it would be good to see an analysis as to where the path comes from.
> Last timeI fixed a number of those it exposed real problems or bad
> assumptions in the makefiles.
>
> Ross

For this case, or such cases that use pkg-config to compute paths for 
LIBS (such as zlib), they have different behaviors:

* multilib enabled build:

$ bitbake gnutls -cdevshell
$ pkg-config --libs zlib

-L/buildarea/raid5/wfan/yocto/builds/poky-build/tmp/sysroots/qemux86-64/usr/lib64 
-lz

* build w/o multilib

$ bitbake gnutls -cdevshell
$ pkg-config --libs zlib

-lz

This is where the buildpaths from for target pkgconfig files. Ideally it 
should be fixed from pkg-config side, but just fix it with sed is 
acceptable I think if the former is impossible.

I'll investigate more about that. Do you know where the difference from?

Thanks
Wenzong

