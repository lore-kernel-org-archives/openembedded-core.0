Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC5DB7D264
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:08:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7G78PB6002864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 00:08:35 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 16 Aug 2019 00:08:14 -0700
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Message-ID: <675ad270-18cc-32ad-414a-1b008d50298b@windriver.com>
Date: Fri, 16 Aug 2019 15:08:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.188]
Subject: Bug report: util-linux: circular dependencies occurs when enable systemd in PACKAGECONFIG
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
X-List-Received-Date: Fri, 16 Aug 2019 07:08:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,


Some DISTRO_FEATURES related to systemd have been enabled in local.conf

     DISTRO_FEATURES_append = " systemd"
     DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
     VIRTUAL-RUNTIME_init_manager = "systemd"
     VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
     KERNEL_FEATURES_append = " cfg/systemd.scc"


1.

meta/recipes-core/util-linux/util-linux.inc has below codes:

(

PACKAGECONFIG[systemd] = "--with-systemd 
--with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd 
--without-systemdsystemunitdir,systemd"

BBCLASSEXTEND = "native nativesdk"

)


2.

Now I want to enable systemd feature, then I add below code to 
util-linux.inc:

(

PACKAGECONFIG_class-target += " systemd"

)


3.

Then bitbake util-linux

You will below errors:(I just cut out a bit)

These are usually caused by circular dependencies and any circular 
dependency chains found will be printed below. Increase the debug level 
to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
   Task 
/buildarea/raid0/hsong/proj/lykerneldevsrc/layers/oe-core/meta/recipes-core/systemd/systemd_242.bb:do_package 
(dependent Tasks ['base-files_3.0.14.bb:do_packagedata', 
'kmod_git.bb:do_packagedata', 'glibc_2.30.bb:do_packagedata', 
'util-linux_2.34.bb:do_packagedata', 'libcap_2.27.bb:do_packagedata', 
'opkg-utils_0.4.1.bb:do_packagedata', 'libpam_1.3.1.bb:do_packagedata', 
'base-passwd_3.5.29.bb:do_packagedata', 
'pseudo_git.bb:do_populate_sysroot', 'systemd_242.bb:do_install', 
'rpm_4.14.2.1.bb:do_populate_sysroot', 
'dwarfsrcfiles.bb:do_populate_sysroot', 'shadow_4.6.bb:do_packagedata', 
'bash-completion_2.9.bb:do_packagedata', 
'shadow-sysroot_4.6.bb:do_packagedata', 'xz_5.2.4.bb:do_p


4. I tried some other code:

PACKAGECONFIG[systemd] = "--with-systemd 
--with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd 
--without-systemdsystemunitdir,systemd"

 >> PACKAGECONFIG[systemd] = "--with-systemd 
--with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd 
--without-systemdsystemunitdir"


or PACKAGECONFIG_append += " systemd"


There are still other errors.


Best Regard,

--Hongzhi


