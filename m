Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEB2177323
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 10:07:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAEA7uTi020369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 14 Nov 2015 02:07:56 -0800
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 02:07:55 -0800
Message-ID: <564707F9.3080701@windriver.com>
Date: Sat, 14 Nov 2015 18:07:53 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1447482114-165655-1-git-send-email-wenzong.fan@windriver.com>
	<CA+chaQdbNP38CKVzf_O8y4o4MExSpddf5eB_EavXOB36J_p_tQ@mail.gmail.com>
	<5646FC87.1020005@windriver.com> <20151114094923.GC2564@jama>
In-Reply-To: <20151114094923.GC2564@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: disable uvch264 for systemd
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
X-List-Received-Date: Sat, 14 Nov 2015 10:08:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2015 05:49 PM, Martin Jansa wrote:
> On Sat, Nov 14, 2015 at 05:19:03PM +0800, wenzong fan wrote:
>> On 11/14/2015 04:23 PM, Martin Jansa wrote:
>>> NAK, see
>>> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112685.html
>>
>> Hi Martin
>>
>> Thanks for your reply.
>>
>> If we build oe-core + systemd only (without meta-oe), it will fail with:
>>
>> ERROR: Nothing PROVIDES 'libgudev' (but
>> /path/to/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
>> DEPENDS on or otherwise requires it)
>> ERROR: udev PROVIDES libgudev but was skipped: 'systemd' in DISTRO_FEATURES
>> ERROR: Required build target 'gstreamer1.0-plugins-bad' has no buildable
>> providers.
>> Missing or unbuildable dependency chain was:
>> ['gstreamer1.0-plugins-bad', 'libgudev']
>>
>> We should not get oe-core depends on meta-oe, I incline to disable
>> libgudev for systemd by default.
>
> udev should provide libgudev for oe-core, but I see it was skipped:
> ERROR: udev PROVIDES libgudev but was skipped: 'systemd' in DISTRO_FEATURES
>
> How is that supposed to work when systemd is enabled as well as udev?
>
> Does the sysvinit image nowadays use udev package from systemd recipe?

No, sysvinit image uses the independent "udev" package. But systemd 
image used the one from itself.

It may conflicts build both systemd and independent udev package:

commit e07e0f80d6c794adf154be74eca503d191c35cc6
Author: Ross Burton <ross.burton@intel.com>
Date:   Mon Jan 21 12:15:31 2013 +0000

     udev: skip in systemd distros, to fix world builds

     (From OE-Core rev: 1179e43d67c96367480e563a36684d550d83fcbe)

     Signed-off-by: Ross Burton <ross.burton@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/udev/udev.inc 
b/meta/recipes-core/udev/udev.inc
index 9f60b17..facad0c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -99,3 +99,9 @@ do_install_append () {

         echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
  }
+
+# As systemd also builds udev, skip this package if we're doing a 
systemd build.
+python () {
+    if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}


Thanks
Wenzong

>
> Regards,
>
>> Does it make sense?
>>
>> Thanks
>> Wenzong
>>
>>>
>>> On Sat, Nov 14, 2015 at 7:21 AM, <wenzong.fan@windriver.com
>>> <mailto:wenzong.fan@windriver.com>> wrote:
>>>
>>>      From: Wenzong Fan <wenzong.fan@windriver.com
>>>      <mailto:wenzong.fan@windriver.com>>
>>>
>>>      Disable uvch264 to remove the dependency to libgudev which has been
>>>      removed from systemd project.
>>>
>>>      Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
>>>      <mailto:wenzong.fan@windriver.com>>
>>>      ---
>>>        meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 3 ++-
>>>        1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>>      diff --git
>>>      a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>>      b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>>      index cdedb60..863925d 100644
>>>      --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>>      +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>>>      @@ -20,7 +20,8 @@ PACKAGECONFIG ??= " \
>>>            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
>>>      '', d)} \
>>>            ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez',
>>>      '', d)} \
>>>            ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
>>>      'directfb', '', d)} \
>>>      -    orc curl uvch264 neon sndfile \
>>>      +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
>>>      'uvch264', d)} \
>>>      +    orc curl neon sndfile \
>>>            hls sbc dash bz2 smoothstreaming \
>>>            "
>>>
>>>      --
>>>      1.9.1
>>>
>>>      --
>>>      _______________________________________________
>>>      Openembedded-core mailing list
>>>      Openembedded-core@lists.openembedded.org
>>>      <mailto:Openembedded-core@lists.openembedded.org>
>>>      http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>

