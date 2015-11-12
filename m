Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 732B0771BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:06:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC96uQH018161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 01:06:56 -0800 (PST)
Received: from [128.224.163.148] (128.224.163.148) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 01:06:55 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
	<CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <564456AE.6020909@windriver.com>
Date: Thu, 12 Nov 2015 17:06:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Thu, 12 Nov 2015 09:07:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/2015 05:00 PM, Andreas Müller wrote:
> On Thu, Nov 12, 2015 at 9:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Fix dangling dependns on gudev, and systemd doesn't provide libgudev, so
>> it can't be enabled when systemd either.
>>
>> Fixed:
>> libtool: error: cannot find the library 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la' or unhandled argument
>> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
>>   .../0001-configure.ac-add-enable-gudev.patch       |   45 ++++++++++++++++++++
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch
>>
>> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>> index d4fed71..c29bc7a 100644
>> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>> @@ -4,7 +4,12 @@ LICENSE = "LGPLv2+"
>>
>>   inherit clutter
>>
>> -SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
>> +SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch \
>> +            file://0001-configure.ac-add-enable-gudev.patch \
>> +            "
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[gudev] = "--enable-gudev,--disable-gudev,udev"
>>
>>   DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
>>   RDEPENDS_${PN} += "gstreamer1.0-meta-base"
>> @@ -12,6 +17,14 @@ PACKAGES  =+ "${PN}-examples"
>>
>>   EXTRA_OECONF += "--disable-introspection"
>>
>> +python () {
>> +    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, False, d) and \
>> +        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
>> +            bb.warn("%s: gudev can't be enabled since systemd doesn't provide libgudev" % \
>> +                    d.getVar("PN", True))
>> +            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
>> +}
>> +
> I think this part of the patch is wrong: You have to replace udev by
> gudev in DEPENDS part of packageconfig above and skip python function

I think that there is no gudev but udev ? udev provides gudev, but systemd
only provides udev, no gudev.

// Robert

> complete.
>
> Andreas
>

