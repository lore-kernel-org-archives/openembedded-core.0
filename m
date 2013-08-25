Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5246010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 14:20:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7PEKn2D026766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 07:20:49 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 25 Aug 2013 07:20:47 -0700
Message-ID: <521A12BF.1050102@windriver.com>
Date: Sun, 25 Aug 2013 10:20:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<03d9de265ca50b2182016c8335193e2f2302698a.1377405083.git.bruce.ashfield@windriver.com>
	<5219A5DA.5040708@gmail.com>
In-Reply-To: <5219A5DA.5040708@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] gst-plugins-good: fix 3.10 libc-headers build failure
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
X-List-Received-Date: Sun, 25 Aug 2013 14:20:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-25 2:36 AM, Jonathan Liu wrote:
> On 25/08/2013 3:16 PM, Bruce Ashfield wrote:
>> kernel commit 24b9f5017 [[media] V4L: Remove deprecated image
>> centering controls]
>> removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after
>> three
>> years of depreciation.
>>
>> The ioctl values are still free, and the case statement which
>> processess them
>> in v4l2 userspace falls through to the proper replacement. So in the
>> short
>> term, we can explicitly define them using the old absolute values, and
>> everything
>> will work.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45
>> ++++++++++++++++++++
>>   .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
>>   2 files changed, 46 insertions(+)
>>   create mode 100644
>> meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>>
>>
>> diff --git
>> a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>> b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>>
>> new file mode 100644
>> index 0000000..bd0de58
>> --- /dev/null
>> +++
>> b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>>
>> @@ -0,0 +1,45 @@
>> +From ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 2001
>> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
>> +Date: Thu, 22 Aug 2013 12:15:54 -0400
>> +Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and
>> V4L2_CID_VCENTER
>> +
>> +kernel commit 24b9f5017 [[media] V4L: Remove deprecated image
>> centering controls]
>> +removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER
>> after three
>> +years of depreciation.
>> +
>> +The ioctl values are still free, and the case statement which
>> processess them
>> +in v4l2 userspace falls through to the proper replacement. So in the
>> short
>> +term, we can explicitly define them using the old absolute values,
>> and everything
>> +will work.
> Missing Upstream-Status.

The patch is RFC, and I'm really doing in on behalf of khem .. so 
honestly, I knew this wasn't in the patch and it wasn't on the top of
my list when sending it out at 1:30 AM. I don't use them in kernel
changes, so they aren't in my typical workflow.

Saul or Richard can add the status if they take the patch.

Cheers,

Bruce

>
> Regards,
> Jonathan
>> +
>> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> +---
>> + sys/v4l2/v4l2_calls.c |    9 +++++++--
>> + 1 file changed, 7 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
>> +index 309bfb6..3c64544 100644
>> +--- a/sys/v4l2/v4l2_calls.c
>> ++++ b/sys/v4l2/v4l2_calls.c
>> +@@ -54,11 +54,16 @@
>> + #include "gst/gst-i18n-plugin.h"
>> +
>> + /* Those are ioctl calls */
>> ++
>> ++/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
>> ++   the ioctl space is still present. Since these values fall through
>> ++   to their replacement, it is safe (in the short term) to re-use the
>> ++    old values explictily */
>> + #ifndef V4L2_CID_HCENTER
>> +-#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
>> ++#define V4L2_CID_HCENTER V4L2_CID_BASE+22
>> + #endif
>> + #ifndef V4L2_CID_VCENTER
>> +-#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
>> ++#define V4L2_CID_VCENTER V4L2_CID_BASE+23
>> + #endif
>> +
>> + GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
>> +--
>> +1.7.10.4
>> +
>> diff --git
>> a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> index daffcf1..d18e155 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> @@ -23,6 +23,7 @@ DEPENDS += "gst-plugins-base gconf cairo libpng zlib
>> libid3tag flac \
>>   inherit gettext gconf
>>   SRC_URI +=
>> "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
>> +SRC_URI +=
>> "file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
>>   EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2
>> --disable-libcaca --disable-hal --without-check \
>>                    --disable-examples --disable-taglib"
>


