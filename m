Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 930FA719F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:05:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9B95Wuf026000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2016 02:05:32 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 11 Oct 2016 02:05:31 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
	<CAJTo0LbyTob6_exkY1Qw-xvLRRo-SUgd5E_E8pojoe2fg=QGkw@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <9fcfc727-d2a8-c56b-c681-7ad39856c1df@windriver.com>
Date: Tue, 11 Oct 2016 17:04:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbyTob6_exkY1Qw-xvLRRo-SUgd5E_E8pojoe2fg=QGkw@mail.gmail.com>
X-Originating-IP: [128.224.162.234]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] guile: Remove bashisms
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
X-List-Received-Date: Tue, 11 Oct 2016 09:05:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Thanks for pointing out.

This seems caused by the correction of installation path of guile-config(from ${STAGING_BINDIR_CROSS} to ${SYSROOT_DESTDIR}${bindir_crossscripts}). We first put things in ${SYSROOT_DESTDIR}. And then do_populate_sysroot collects them from ${SYSROOT_DESTDIR} and install them into ${STAGING_BINDIR_CROSS}. But if we first put guile-configin ${STAGING_BINDIR_CROSS}, as we did before, and then apply this patch and then rebuild, the system will find guile-confighas existed in ${STAGING_BINDIR_CROSS} but cannot find who installed it(Matched in b''). So this is probably a wrong report. This error will not appear if I manually delete ${STAGING_BINDIR_CROSS}/guile-config and rebuild, or rebuild in a brand new project.

Zhe


On 10/10/2016 09:15 PM, Burton, Ross wrote:
>
> On 26 September 2016 at 07:51, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
>
>     Remove bashisms from do_populate_sysroot task
>
>
> This causes a change of behaviour that results in a stage error:
>
> ERROR: guile-2.0.12-r0 do_populate_sysroot: The recipe guile is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/bin/crossscripts/guile-config
>  Matched in b''
> Please verify which recipe should provide the above files.
>
> Ross


