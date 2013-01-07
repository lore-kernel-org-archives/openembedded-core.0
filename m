Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TsEEf-00009p-E1
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:03:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 06:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="240866337"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 07 Jan 2013 06:48:08 -0800
Message-ID: <50EAE052.3060703@intel.com>
Date: Mon, 07 Jan 2013 16:48:50 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1357560325-8260-1-git-send-email-constantinx.musca@intel.com>
	<1357565664.25855.12.camel@ted>
In-Reply-To: <1357565664.25855.12.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gsettings-desktop-schemas: add missing elements from meta-gnome
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 15:03:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 03:34 PM, Richard Purdie wrote:
> On Mon, 2013-01-07 at 14:05 +0200, Constantin Musca wrote:
>> - add postinst using gsettings.bbclass
>> - modify the recipe according to the meta-gnome variant
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
>> index 720858a..1242741 100644
>> --- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
>> +++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
>> @@ -4,10 +4,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>>   
>>   LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>> +PR = "r1"
>>   
>> -DEPENDS = "glib-2.0"
> It doesn't need glib-2.0?
>
>> -
>> -inherit gnome pkgconfig autotools gettext
>> +inherit gnome gsettings
> It doesn't need gettext?
>
> Cheers,
>
> Richard
>
I removed the dependencies because the original recipe from meta-gnome 
didn't contain them and gsettings-desktop-schemas builds OK without 
them. I have checked the gsettings-desktop-schemas autotools files and 
discovered:

PKG_CHECK_EXISTS([gio-2.0 >= $GIO_MIN_VERSION],[],
                  [AC_MSG_ERROR([Minimum Gio requirement 
($GIO_MIN_VERSION) was not met])])


Also I have discovered that the configure script checks for gettext. I 
have sent patch v3 which adds back the dependencies.

Cheers,
Constantin


