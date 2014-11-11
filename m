Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-06.prod.phx3.secureserver.net
	(p3plsmtpa12-06.prod.phx3.secureserver.net [68.178.252.235])
	by mail.openembedded.org (Postfix) with ESMTP id 9573D65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 00:03:51 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-06.prod.phx3.secureserver.net with 
	id E03q1p00J0BVjqb0103rgj; Mon, 10 Nov 2014 17:03:52 -0700
Message-ID: <54615266.60803@pabigot.com>
Date: Mon, 10 Nov 2014 18:03:50 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1415647839.git.pab@pabigot.com>
	<01cb8ceb7576735c0034283281f38cfe03aad4b2.1415647839.git.pab@pabigot.com>
	<20141110232051.GF2440@jama>
In-Reply-To: <20141110232051.GF2440@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 08/14] gstreamer1.0-plugins-bad: switch to virtual/bluez
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
X-List-Received-Date: Tue, 11 Nov 2014 00:03:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2014 05:20 PM, Martin Jansa wrote:
> On Mon, Nov 10, 2014 at 03:13:05PM -0600, Peter A. Bigot wrote:
>> Be aware that current versions of gstreamer1.0-plugins-bad (through
>> 1.4.3) do not currently support bluez5, and will silently disable
>> bluetooth support until that has been addressed upstream.
>>
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>>   meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc    | 4 ++--
>>   meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> index dab0bf5..913a338 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>> @@ -18,7 +18,7 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2',
>>   PACKAGECONFIG ??= " \
>>       ${PACKAGECONFIG_GL} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez', '', d)} \
> There isn't any virtual/bluez PACKAGECONFIG

True; reverted this piece in the branch.  Thanks.

Peter

>
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
>>       orc curl uvch264 neon sndfile \
>>       hls sbc dash bz2 smoothstreaming \
>> @@ -49,7 +49,7 @@ PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
>>   PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>>   PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
>>   PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
>> -PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
>> +PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,virtual/bluez"
>>   PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
>>   PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
>>   PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> index e1a5904..8f37be8 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>> @@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
>>   
>>   SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
>>   
>> -PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
>> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez"
>>   PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
>>   PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
>>   
>> -- 
>> 1.8.5.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


