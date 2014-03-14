Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 598066F7D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 02:14:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2E2E3MZ018838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Mar 2014 19:14:03 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 13 Mar 2014 19:14:02 -0700
Message-ID: <532265E8.1010907@windriver.com>
Date: Fri, 14 Mar 2014 10:14:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<7337ad5ac0c8f13c3b23160f2a2ea6e9dc383f64.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LYPyrTpEN6w4g5KcmsXMB6=GvaKxcshObb1Co6Lh3A8VA@mail.gmail.com>
In-Reply-To: <CAJTo0LYPyrTpEN6w4g5KcmsXMB6=GvaKxcshObb1Co6Lh3A8VA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] package_rpm.bbclass: archive the source to srpm package
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
X-List-Received-Date: Fri, 14 Mar 2014 02:14:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2014 01:39 AM, Burton, Ross wrote:
> On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
>> -        # Remove the source (SOURCE0, SOURCE1 ...)
>> -        cmd = cmd + " --rmsource "
>
> You probably want to keep this as otherwise
> deploy/sources/MACHINE/RECIPE/ contains both the .src.rpm and the
> separate sources.
>

I'd like to remove the sources in the first thought, but that would
cause a problem: if we only re-run the do_package_write_rpm, for example,
when the FILES is changed, then the sources are gone, and we would get
nothing in the .src.rpm. I thing that keep both the .src.rpm and.tar.gz
is not a big problem, so I changed the usage to:

We will always get .tar.gz and other sources, and the .src.rpm is optional:

ARCHIVER_MODE[srpm] ?= "1"


I think that we can move the rpmbuild related code to archiver.*bbclass to
fix  the problem, but that would change a lot of the code, I'd like to fix
it in  the next release:-)

// Robert

> Ross
>
>

