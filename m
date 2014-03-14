Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53D236F626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 10:17:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2EAH7sw025275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Mar 2014 03:17:07 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 14 Mar 2014 03:17:07 -0700
Message-ID: <5322D720.8080309@windriver.com>
Date: Fri, 14 Mar 2014 18:17:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LbpZ=aSRwcu8TAZsqXKb+jmtCqgj07YAm7kdrLUawQkRg@mail.gmail.com>
	<CAJTo0LZXYBmSy4bme8Y3MaYCZ=X2VRabbXOeSNVX7TEubVOKPg@mail.gmail.com>
In-Reply-To: <CAJTo0LZXYBmSy4bme8Y3MaYCZ=X2VRabbXOeSNVX7TEubVOKPg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] patch.bbclass: do_patch: unset TMPDIR from environment
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
X-List-Received-Date: Fri, 14 Mar 2014 10:17:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2014 12:54 AM, Burton, Ross wrote:
> On 13 March 2014 16:46, Burton, Ross <ross.burton@intel.com> wrote:
>> On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> We need unset it after we use it, otherwise it would affect the env
>>> after we run "bb.build.exec_func('do_patch', d)", and will cause
>>> unexpected errors.
>>
>> This assignment has been there since October 2012, so what are the
>> problems that this causes?
>
> So what bothers me about this (and the original patch) is that TMPDIR
> has special meaning to bitbake and the conflict with patch's temporary
> directory is unfortunate.  Maybe a better solution is to change
> meta/lib/oe/patch.py to set TMPDIR when invoking patch so the changed
> TMPDIR is constrained to the patch process and nothing else.
>

Hi Ross,

The problem is that:
1) do_patch set "TMPDIR" in env, it would remove the directory but didn't
    unset the "TMPDIR".

2) autoconf will use the "TMPDIR" from the env:
autoconf/Autom4te/General.pm:  my $TMPDIR = $ENV{'TMPDIR'} || '/tmp';

And if the dir doesn't exist, there would be errors.

I had met this problem because I used the do_patch and do_configure
in one task:

bb.build.exec_func('do_patch', d)
bb.build.exec_func('do_configure', d)

I had split them into 2 tasks, so the "TMPDIR" doesn't affact the
archiver.bbclass any more.

I've tried to set the TMPDIR in meta/lib/oe/patch.py, but met more
problems, the PATCHTOOL = "patch" doesn't work (Seems only on
OpenSuse 12.2), I've filed a bug for it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5968

I think that we can fix it in another thread since it doesn't affect
the archiver.bbclass, as we have talked, we may drop the
PATCHTOOL = "patch"

// Robert

> Ross
>
>

