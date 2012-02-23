Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0NwZ-0000t0-0E
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 02:58:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E40D131592E9;
	Thu, 23 Feb 2012 02:49:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id J2cgyQGT7snB; Thu, 23 Feb 2012 02:49:37 +0100 (CET)
Received: from [172.22.22.61] (drms-590edffa.pool.mediaWays.net
	[89.14.223.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B738C31592D7;
	Thu, 23 Feb 2012 02:49:36 +0100 (CET)
Message-ID: <4F459B2E.1060601@opendreambox.org>
Date: Thu, 23 Feb 2012 02:49:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
	<4F458F3F.50409@linux.intel.com>
In-Reply-To: <4F458F3F.50409@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-plugins-base: depend on libx11 and libxv conditionally
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 01:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23.02.2012 01:58, Saul Wold wrote:
> On 02/17/2012 02:56 PM, Andreas Oberritter wrote:
>> * gst-plugins-base currently doesn't build if x11 is
>>    unavailable, due to unconditional dependencies on libx11
>>    and libxv. However, they are not required to build
>>    gst-plugins-base.
>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>>   .../gstreamer/gst-plugins-base_0.10.35.bb          |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git
>> a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
>> b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
>> index e49a00c..0b287bc 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
>> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>                      
>> file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
>>                      
>> file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>>
>>
>> -DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis
>> libxv libtheora avahi util-linux tremor"
>> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11',
>> 'virtual/libx11 libxv', '', d)}"
>> +DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi
>> util-linux tremor"
>>
>>   SRC_URI += " file://gst-plugins-base-tremor.patch"
>>
> As with the other patches do you need to have some configure option to
> ensure that these will be exculded if perhaps the build already contains
> these libraries?

No, unless it should be supported to first build with
DISTRO_FEATURES="x11" and later on with DISTRO_FEATURES="" without
cleaning tmp in between. I don't think it's possible to get a consistent
build and feed repository that way.

If x11 is unset, libx11 can't be built and therefore gst-plugins-base
can't be built either (as noted in the commit message), currently.

Regards,
Andreas

> This also pertains to your mpeg2dev patch
> 
> Sau!



