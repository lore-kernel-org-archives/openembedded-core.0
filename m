Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2746B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:33:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7DHXH4A019252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 13:33:18 -0400 (EDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 10:33:17 -0700
Message-ID: <520A6DDC.5060609@windriver.com>
Date: Tue, 13 Aug 2013 12:33:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
	<CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
	<CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
In-Reply-To: <CAOMwXhNFwVwt4G_v-SMMph=J3zvv=Z6Jh=LvEKZGVO=_zpChrg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:33:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/13 12:23 PM, Laszlo Papp wrote:
> s/which files/which lines/

The kernel configuration mechanism has a tool that will combine the original 
configuration, and any listed configuration fragments (.cfg files).  It will 
combine these, and then filter them in such a way that last-in wins.

See the Yocto Project Linux Kernel Development manual, section 2.2.3:

http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration

--Mark

> On Tue, Aug 13, 2013 at 6:23 PM, Laszlo Papp <lpapp@kde.org
> <mailto:lpapp@kde.org>> wrote:
>
>     How will this know which files exactly to disregard in the busybox include
>     file (".inc")?
>
>     Could you please give that to the commit message as explanation?
>
>
>     On Tue, Aug 13, 2013 at 6:11 PM, Saul Wold <sgw@linux.intel.com
>     <mailto:sgw@linux.intel.com>> wrote:
>
>         This shows an example of the config fragment support that
>         both the linux-yocto and busybox recipes use. This example
>         is specific to busybox.
>
>         By adding busybox CONFIG options into a .cfg file and then
>         adding that .cfg file to SRC_URI the merge_config.sh script will
>         correctly handle these CONFIG options during the do_configure task.
>
>         v2: fixed FILESEXTRAPATHS
>
>         Signed-off-by: Saul Wold <sgw@linux.intel.com <mailto:sgw@linux.intel.com>>
>         ---
>           meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>           meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
>           2 files changed, 6 insertions(+)
>           create mode 100644
>         meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>           create mode 100644
>         meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>
>         diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>         b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>         new file mode 100644
>         index 0000000..42c6730
>         --- /dev/null
>         +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>         @@ -0,0 +1 @@
>         +CONFIG_RFKILL=n
>         diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>         b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>         new file mode 100644
>         index 0000000..641f04a4
>         --- /dev/null
>         +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>         @@ -0,0 +1,5 @@
>         +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>         +
>         +SRC_URI += " \
>         +           file://no_rfkill.cfg \
>         +           "
>         --
>         1.8.1.4
>
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


