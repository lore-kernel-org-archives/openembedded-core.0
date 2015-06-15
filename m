Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F01E974115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 05:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5F5L8eK024626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Jun 2015 22:21:08 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 14 Jun 2015 22:21:07 -0700
Message-ID: <557E60C0.90708@windriver.com>
Date: Mon, 15 Jun 2015 13:21:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1434079315.git.liezhi.yang@windriver.com>
	<2fbbbb9e2098904f488bc585288cb7ca1b88ff2e.1434079315.git.liezhi.yang@windriver.com>
	<CAJTo0LaAv9NoBrGgW=52aTg0dRUTAvAP4SNw+3B4jVu5a3GM6w@mail.gmail.com>
In-Reply-To: <CAJTo0LaAv9NoBrGgW=52aTg0dRUTAvAP4SNw+3B4jVu5a3GM6w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] insane.bbclass: check invalid ac_cv value
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
X-List-Received-Date: Mon, 15 Jun 2015 05:21:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2015 07:06 PM, Burton, Ross wrote:
>
> On 12 June 2015 at 04:23, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +        for var in tocheck.split():
>     +            if var.startswith('ac_cv_'):
>     +                varname = var.split('=')[0]
>     +                cfgscript=d.expand("${S}/configure")
>     +                if os.path.exists(cfgscript):
>     +                    statement = "grep -q -F %s  %s > /dev/null" % (varname,
>     cfgscript)
>
>
> So your assumption that ac_cv_* variables are referenced in full in configure is
> bad.  This is what strace has for the giant AC_CHECK_HEADERS block:

Yes, it doesn't work well, I will try to figure out other ways.

// Robert

>
> for ac_header in asm/cachectl.h asm/sysmips.h bluetooth/bluetooth.h elf.h
> inttypes.h ioctls.h linux/bsg.h linux/falloc.h linux/filter.h linux/hiddev.h
> linux/mmtimer.h linux/perf_event.h linux/seccomp.h linux/securebits.h
> linux/utsname.h mqueue.h netinet/sctp.h poll.h scsi/sg.h stropts.h sys/conf.h
> sys/epoll.h sys/fanotify.h sys/filio.h sys/ioctl.h sys/poll.h sys/reg.h
> sys/vfs.h sys/xattr.h
> do :
>    as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
> ac_fn_c_check_header_mongrel "$LINENO" "$ac_header" "$as_ac_Header"
> "$ac_includes_default"
>
> The variable name is constructed, so this test can't work.
>
> Ross

