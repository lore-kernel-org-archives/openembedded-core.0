Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98E1F772C0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 09:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAE9J66S007523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 14 Nov 2015 01:19:06 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 01:19:05 -0800
Message-ID: <5646FC87.1020005@windriver.com>
Date: Sat, 14 Nov 2015 17:19:03 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1447482114-165655-1-git-send-email-wenzong.fan@windriver.com>
	<CA+chaQdbNP38CKVzf_O8y4o4MExSpddf5eB_EavXOB36J_p_tQ@mail.gmail.com>
In-Reply-To: <CA+chaQdbNP38CKVzf_O8y4o4MExSpddf5eB_EavXOB36J_p_tQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 14 Nov 2015 09:19:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2015 04:23 PM, Martin Jansa wrote:
> NAK, see
> http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112685.html

Hi Martin

Thanks for your reply.

If we build oe-core + systemd only (without meta-oe), it will fail with:

ERROR: Nothing PROVIDES 'libgudev' (but 
/path/to/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb 
DEPENDS on or otherwise requires it)
ERROR: udev PROVIDES libgudev but was skipped: 'systemd' in DISTRO_FEATURES
ERROR: Required build target 'gstreamer1.0-plugins-bad' has no buildable 
providers.
Missing or unbuildable dependency chain was: 
['gstreamer1.0-plugins-bad', 'libgudev']

We should not get oe-core depends on meta-oe, I incline to disable 
libgudev for systemd by default.

Does it make sense?

Thanks
Wenzong

>
> On Sat, Nov 14, 2015 at 7:21 AM, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     From: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>
>     Disable uvch264 to remove the dependency to libgudev which has been
>     removed from systemd project.
>
>     Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>     ---
>       meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 3 ++-
>       1 file changed, 2 insertions(+), 1 deletion(-)
>
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>     index cdedb60..863925d 100644
>     --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>     +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>     @@ -20,7 +20,8 @@ PACKAGECONFIG ??= " \
>           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
>     '', d)} \
>           ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez',
>     '', d)} \
>           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
>     'directfb', '', d)} \
>     -    orc curl uvch264 neon sndfile \
>     +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
>     'uvch264', d)} \
>     +    orc curl neon sndfile \
>           hls sbc dash bz2 smoothstreaming \
>           "
>
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

