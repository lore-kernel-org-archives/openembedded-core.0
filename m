Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-09.prod.phx3.secureserver.net
	(p3plsmtpa11-09.prod.phx3.secureserver.net [68.178.252.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9E9AB65CED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 13:48:25 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa11-09.prod.phx3.secureserver.net with 
	id EdoQ1p0060BVjqb01doQMo; Wed, 12 Nov 2014 06:48:26 -0700
Message-ID: <54636528.6060403@pabigot.com>
Date: Wed, 12 Nov 2014 07:48:24 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1415647839.git.pab@pabigot.com>	
	<4df30acac92f854aa92f221c7663c952da8d9f1f.1415647839.git.pab@pabigot.com>
	<1415790370.2820.45.camel@linuxfoundation.org>
In-Reply-To: <1415790370.2820.45.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 07/14] qt-mobility: switch to virtual/bluez
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
X-List-Received-Date: Wed, 12 Nov 2014 13:48:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2014 05:06 AM, Richard Purdie wrote:
> On Mon, 2014-11-10 at 15:13 -0600, Peter A. Bigot wrote:
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> index ae1769d..61b5281 100644
>> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> @@ -3,7 +3,7 @@ DEPENDS = "gstreamer util-linux"
>>   
>>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>> -PACKAGECONFIG[bluetooth] = ",,bluez4"
>> +PACKAGECONFIG[bluetooth] = ",,virtual/bluez"
>>   PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
>>   
>>   LICENSE = "LGPLv2.1"
> I think its examples like this where I start to get concerned. I don't
> think the problem we're trying to solve here (bluez4 verses bluez5) maps
> well to the way virtual/* is meant to work.
>
> virtual/* things are meant to be equivalent, it doesn't matter which
> ones the recipe builds against, it works. A compiler or a kernel are
> good examples. That isn't the case for v4 verses v5 since some software
> works with 4, some with 5 and some with both.

You raise some good questions.  I'll come back to whether the name for 
"whatever provides build-time support for bluetooth" should be spelled 
"virtual/bluez" or something else.

I think using bluez5 (bluetooth5) and bluez4 (bluetooth) as distinct 
PACKAGECONFIG options would be a mistake, because it propagates the 
assumption that "bluetooth" in Linux is a multivalent concept. Bluetooth 
in Linux is bluez.  Bluez is bluez5.  Work stopped on bluez4 over two 
years ago, and nobody's come up with third alternative.  IMO, the 
packageconfig option should be "bluetooth", not "bluez*".  I did see 
what Chris Larson wrote in 
http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091008.html 
but I just don't see the value in adding extra infrastructure for a 
bunch of options that either don't exist now or won't exist in the near 
future.

Of the roughly 16 recipes I had to touch, only one (pulseaudio) clearly 
distinguishes between bluez4 and bluez5 when being configured, and I 
suspect that's just to simplify transition.  The others either figure 
out which version they were given and use it, or will only work with one 
or the other.  They all at least build with virtual/bluez, though they 
might internally disable bluetooth support or fail at runtime if bluez5 
is what's available.  (Qt 5.4 will support bluez5; it's unclear to me 
whether it still supports bluez4.)

There are and will continue to be certain recipes that will never move 
beyond bluez4, because they're no longer maintained or nobody has found 
it worthwhile (obex stuff) or a priority (headset stuff) to re-implement 
the functionality they depend on under the new API. So we do need to 
support using bluez4 and bluez5 as alternatives. But most recipes don't 
seem to care who provides "bluetooth", and if it's currently bluez4 and 
the package is maintained it'll eventually become bluez5.  Thus 
"virtual/bluez".  AFAIK the libbluetooth API is unchanged; it's the dbus 
API that's different.  If consensus is to substitute something like 
"distro/bluez" instead of "virtual/bluez" to remove the implication it's 
completely API-equivalent that'd be fine, but I think we do need some 
name to serve that role without putting the conditional in every recipe 
that might reference the selected bluetooth solution.

> So what do we need to do?
>
> I think this needs a:
>
> PACKAGECONFIG[bluetooth5] = ",,bluez5"
>
> and then we add a bluetooth5 DiSTRO_FEATURE and a:
>
>                      ${@bb.utils.contains('DISTRO_FEATURES',
> 'bluetooth5', 'bluetooth5', '', d)}"
>
> We could probably use a mechanism to flag two options as conflicting,
> e.g. both bluetooth and bluetooth5 in DISTRO_FEATURES or in
> PACKAGECONFIG however that is a separate issue.

Using bluez4 and bluez5 in DISTRO_FEATURES makes some sense, as a 
parallel to systemd vs sysvinit.  (I don't like "bluetooth5" because 
there's no such thing; since we already have "bluetooth" I'd suggest 
making "bluez4" the canonical spelling and interpreting "bluetooth" in 
the absence of "bluez5" as being an alias for "bluez4".)  This provides 
a way to set the PREFERRED_PROVIDER for "distro/bluez" and possibly to 
set the PNBLACKLISTs to exclude the recipes that are not appropriate 
under bluez4.

Then we just use "distro/bluez" instead of "virtual/bluez" in all the 
recipes.

Is that any closer to acceptable?

Peter

>
> We'll of course still need VIRTUAL-RUNTIME_bluez but that isn't a new
> problem.
>
> Does that approach work for people?
>
> Cheers,
>
> Richard
>


