X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7d8e033f-0066-a403-f084-988bec763a75@berginkonsult.se>
Date: Tue, 31 May 2022 20:36:32 +0200
MIME-Version: 1.0
Subject: Re: [oe-core][PATCH v2] libavtp: add recipe to be able to use aaf config for alsa-plugins
References: <20220531155704.682685-1-marcel@ziswiler.com>
 <CAMKF1so133M+wX7a8QPBLoyYsyz7R7SS4fOJJY9ZRRp=q=Gm7g@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <CAMKF1so133M+wX7a8QPBLoyYsyz7R7SS4fOJJY9ZRRp=q=Gm7g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>

Hi,

thanks Marcel for bumping this patch again!

On 2022-05-31 18:38, Khem Raj wrote:
> On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler <marcel@ziswiler.com> wrote:
>> From: Peter Bergin <peter@berginkonsult.se>
>>
>> In order to enable configuration option aaf (AVTP Audio Format)
>> used for AVB the library libavtp is a dependency but no recipe for
>> this library was present. aaf support for alsa-plugins was
>> introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>>
>> ---
>> Resurrect from mailing list [1] as this is still not upstream.
>> End-to-end tested on Verdin iMX8M Plus.
>> Will talk about it at the Embedded World in the TSN & Linux track next
>> month [2].
>>
>> [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
>> [2] https://events.weka-fachmedien.de/embedded-world-conference/program/
>>
>> Changes in v2:
>> - Updated SRC_URI specifying mandatory protocol as https.
>> - Updated SRCREV to latest.
>>
>>   meta/recipes-multimedia/libavtp/libavtp_git.bb | 16 ++++++++++++++++
> There was a 0.2.0 release https://github.com/Avnu/libavtp/releases/tag/v0.2.0
> so I wonder if we should use the release tagged SRC_URI and call the PV = 0.2.0
This tag was set after I sent my initial patch. I think this is a good 
thing to do.
>
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-multimedia/libavtp/libavtp_git.bb
>>
>> diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb b/meta/recipes-multimedia/libavtp/libavtp_git.bb
>> new file mode 100644
>> index 0000000000..aefbee56ea
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
>> +               specified in IEEE 1722-2016 spec."
>> +HOMEPAGE = "https://github.com/Avnu/libavtp"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
>> +
>> +PROVIDES = "avtp"
> why is this provides needed ?

It is because recipe meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb 
has this PACKAGECONFIG:

   PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"

So either this PROVIDES or also change PACKAGECONFIG for alsa-plugins?

/Peter

>> +
>> +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
>> +SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig
>> +
>> +EXTRA_OEMESON = "-Dtests=disabled"
>> --
>> 2.36.1
>>
>>
>>
>>
>>
>> 
>>
