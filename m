Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2754D6212F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:09:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2LA9QlG002044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Mar 2016 03:09:26 -0700 (PDT)
Received: from [128.224.163.174] (128.224.163.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 03:09:25 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1458213205.git.pkj@axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56EFC854.2020605@windriver.com>
Date: Mon, 21 Mar 2016 18:09:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
Subject: Re: [PATCHv2 0/7] Improve oe-init-build-env/-memres
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
X-List-Received-Date: Mon, 21 Mar 2016 10:09:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


I got strange errors, I think that it is caused by one of these patches:

$ . ../poky/oe-init-build-env .
$ bitbake core-image-minimal
ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
     Either fix the cause of this error or at your own risk disable the checker 
(see sanity.conf).
     Following is the list of potential problems / advisories:

     PATH contains '.', './' or '' (empty element), which will break the build, 
please remove this.

$ echo $PATH
/buildarea/lyang1/poky/scripts:/buildarea/lyang1/poky/bitbake/bin:/folk/lyang1/bin:/folk/lyang1/gbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/dell/srvadmin/bin:


Without running oe-init-build-env:
$ echo $PATH
/folk/lyang1/bin:/folk/lyang1/gbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/dell/srvadmin/bin:/buildarea/lyang1/poky/bitbake/bin

// Robert

On 03/17/2016 07:14 PM, Peter Kjellerstedt wrote:
> I started looking at the oe-init-build-env (and
> oe-init-build-env-memres) scripts since I wanted to add support for
> specifying $OEROOT from the outside. This is because we want to wrap
> those scripts with our own while keeping the official names (so anyone
> reading the official Poky documentation will not be too confused).
>
> While fixing the above, I had noticed a number of inconsistencies in
> the scripts, so I continued to fix those. I also improved the code
> that adds paths to $PATH, and the code that adds variable names to
> $BB_ENV_EXTRAWHITE.
>
> New in version 2:
>
> * Make sure oe-init-build-env and oe-init-build-env-memres actually
>    return failures from other scripts they source and call.
>
> //Peter
>
> The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:
>
>    local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib pkj/oe-init-build-env
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-init-build-env
>
> Peter Kjellerstedt (7):
>    oe-init-build-env*: Allow $OEROOT to be predefined
>    oe-init-build-env*: Update/correct comment about specifying arguments
>    oe-init-build-env*: Remove unnecessary differences between the scripts
>    oe-init-build-env*: Make them actually return failures
>    oe-buildenv-internal: Add paths to $PATH individually
>    oe-buildenv-internal: Add variables individually to BB_ENV_EXTRAWHITE
>    oe-buildenv-internal: Some clean up
>
>   oe-init-build-env            | 51 +++++++++++++++------------
>   oe-init-build-env-memres     | 60 ++++++++++++++++++--------------
>   scripts/oe-buildenv-internal | 83 ++++++++++++++++++++++++++++----------------
>   3 files changed, 114 insertions(+), 80 deletions(-)
>

