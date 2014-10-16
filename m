Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B76A60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:48:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9GBmZIm016173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 04:48:35 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 16 Oct 2014 04:48:35 -0700
Message-ID: <543FB0DF.4020209@windriver.com>
Date: Thu, 16 Oct 2014 19:49:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1413451107.git.Qi.Chen@windriver.com>	<222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
	<543FA509.1040203@pabigot.com>
In-Reply-To: <543FA509.1040203@pabigot.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 1/1] systemd: fix runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 11:48:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2014 06:59 PM, Peter A. Bigot wrote:
> On 10/16/2014 04:19 AM, Chen Qi wrote:
>> Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach login
>> in systemd systems. The problem is that several runtime dependencies are
>> coded as 'recommended' in our project.
>>
>> This patch makes the following changes.
>> 1. Add util-linux-agetty as a runtime dependency.
>>     Otherwise, getty services in systemd cannot start correctly.
>> 2. Add systemd-serialgetty as a runtime dependency.
>>     Otherwise, serialgetty services cannot start correctly in systemd 
>> and
>>     we would have problem when using `runqemu qemux86 nographic'.
>> 3. Remove 'systemd' from RDEPENDS of systemd-serialgetty.
>>     systemd-serialgetty justs ships systemd unit files, even if the init
>>     manager is 'sysvinit', these files do no harm.
>
> This looks really weird.  It doesn't make any sense that systemd 
> should depend on systemd-serialgetty; the original dependency was right.
>

If systemd-serialgetty should rdepends on systemd, then in the same 
logic, we should also change sysvinit-inittab to rdepend on sysvinit. I 
don't think this is right.

> serialgetty works fine under systemd with all my configurations as-is.
>

Yes. But it needs to be first installed to work correctly.

> I think you need to look more closely at your project-specific 
> configuration to understand why things aren't getting set up correctly 
> for you.
>

You can hand-edit local.conf with IMAGE_INSTALL_remove/_append to 
workaround a lot of runtime dependency issue. The problem is that 
setting 'NO_RECOMMENDATIONS' to "1" is valid, however, such valid 
configuration would raise a non-workable minimal image.

Try the following steps with the current project.
1. set NO_RECOMMENDATIONS to "1" in local.conf
2. Change in local.conf to use systemd as the init manager
3. bitbake core-image-minimal
4. runqemu qemux86 nographic

My point is that a system should let users login in on serial console. 
Our sysvinit based system does this, and our systemd based system should 
also do this.

> Peter
>
>
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
>>   meta/recipes-core/systemd/systemd_216.bb         | 5 ++---
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb 
>> b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> index 1c34d5c..f3acaad 100644
>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>> @@ -36,8 +36,6 @@ do_install() {
>>       fi
>>   }
>>   -RDEPENDS_${PN} = "systemd"
>> -
>>   # This is a machine specific file
>>   FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-core/systemd/systemd_216.bb 
>> b/meta/recipes-core/systemd/systemd_216.bb
>> index ebf9395..62fe5c7 100644
>> --- a/meta/recipes-core/systemd/systemd_216.bb
>> +++ b/meta/recipes-core/systemd/systemd_216.bb
>> @@ -267,11 +267,10 @@ FILES_${PN} = " ${base_bindir}/* \
>>   FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug 
>> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>>   FILES_${PN}-dev += "${base_libdir}/security/*.la 
>> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>   -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>> +RDEPENDS_${PN} += "kmod dbus systemd-serialgetty util-linux-mount 
>> util-linux-agetty udev (= ${EXTENDPKGV})"
>>   RDEPENDS_${PN} += "volatile-binds"
>>   -RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units 
>> udev-hwdb\
>> -                      util-linux-agetty \
>> +RRECOMMENDS_${PN} += "systemd-compat-units udev-hwdb\
>>                         util-linux-fsck e2fsprogs-e2fsck \
>>                         kernel-module-autofs4 kernel-module-unix 
>> kernel-module-ipv6 os-release \
>>   "
>


