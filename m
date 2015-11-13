Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B136C7729B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 05:54:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD5sTO0016649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 12 Nov 2015 21:54:29 -0800
Received: from [128.224.163.148] (128.224.163.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 21:54:28 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
	<CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
	<564456AE.6020909@windriver.com>
	<CALbNGRSVOnr5+rScvstYDou7u-ngdx=9mGgwa9cdtBWVvus2Fg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56457B13.3080402@windriver.com>
Date: Fri, 13 Nov 2015 13:54:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSVOnr5+rScvstYDou7u-ngdx=9mGgwa9cdtBWVvus2Fg@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 05:54:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/2015 05:17 PM, Andreas Müller wrote:
> On Thu, Nov 12, 2015 at 10:06 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>
>> On 11/12/2015 05:00 PM, Andreas Müller wrote:
>>>
>>> On Thu, Nov 12, 2015 at 9:51 AM, Robert Yang <liezhi.yang@windriver.com>
>>> wrote:
>>>>
>>>> Fix dangling dependns on gudev, and systemd doesn't provide libgudev, so
>>>> it can't be enabled when systemd either.
>>>>
>>>> Fixed:
>>>> libtool: error: cannot find the library
>>>> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la' or unhandled argument
>>>> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
>>>>    .../0001-configure.ac-add-enable-gudev.patch       |   45
>>>> ++++++++++++++++++++
>>>>    2 files changed, 59 insertions(+), 1 deletion(-)
>>>>    create mode 100644
>>>> meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch
>>>>
>>>> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>>> b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>>> index d4fed71..c29bc7a 100644
>>>> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>>> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>>> @@ -4,7 +4,12 @@ LICENSE = "LGPLv2+"
>>>>
>>>>    inherit clutter
>>>>
>>>> -SRC_URI +=
>>>> "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
>>>> +SRC_URI +=
>>>> "file://0001-Install-example-binary-needed-for-core-image-clutter.patch \
>>>> +            file://0001-configure.ac-add-enable-gudev.patch \
>>>> +            "
>>>> +
>>>> +PACKAGECONFIG ??= ""
>>>> +PACKAGECONFIG[gudev] = "--enable-gudev,--disable-gudev,udev"
>>>>
>>>>    DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad
>>>> clutter-1.0"
>>>>    RDEPENDS_${PN} += "gstreamer1.0-meta-base"
>>>> @@ -12,6 +17,14 @@ PACKAGES  =+ "${PN}-examples"
>>>>
>>>>    EXTRA_OECONF += "--disable-introspection"
>>>>
>>>> +python () {
>>>> +    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, False,
>>>> d) and \
>>>> +        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
>>>> +            bb.warn("%s: gudev can't be enabled since systemd doesn't
>>>> provide libgudev" % \
>>>> +                    d.getVar("PN", True))
>>>> +            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
>>>> +}
>>>> +
>>>
>>> I think this part of the patch is wrong: You have to replace udev by
>>> gudev in DEPENDS part of packageconfig above and skip python function
>>
>>
>> I think that there is no gudev but udev ? udev provides gudev, but systemd
>> only provides udev, no gudev.
>>
> Sorry I meant libgudev - it is in meta-oe.
>
> I think there two cases of interest (packageconfig 'gudev' not set is
> boring - so not a case :)
>
> * distros with system: If packageconfig 'gudev' is set and meta-oe is
> not layers a parse error will occure similar to your python code.
> * non-systemd-distros: If packageconfig is set udev is pulled in (udev
> provides gudev for non systemd distros)


Sorry, what did you mean, please ? Are fine with this patch ?

// Robert

>
> Regards
>
> Andreas
>

