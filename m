Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Te4Se-0000Qu-H0
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 14:47:32 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4ACDAF811FE; Thu, 29 Nov 2012 06:33:14 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 443D0F811FD;
	Thu, 29 Nov 2012 06:33:12 -0700 (MST)
Message-ID: <50B76443.9070203@mlbassoc.com>
Date: Thu, 29 Nov 2012 06:33:55 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1354194369-17500-1-git-send-email-gary@mlbassoc.com>
	<20121129132627.GG3477@jama.jama.net>
In-Reply-To: <20121129132627.GG3477@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: Fix plugin builds
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
X-List-Received-Date: Thu, 29 Nov 2012 13:47:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-29 06:26, Martin Jansa wrote:
> On Thu, Nov 29, 2012 at 06:06:09AM -0700, Gary Thomas wrote:
>> Not all gstreamer plugins have localized documentation trees.
>
> This change looks good, just curious, which plugins recipe does not have
> po subdirectory?
>
> Something outside oe-core? Because all 4 included in oe-core worked fine:
> meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb:require gst-plugins.inc
> meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb:require gst-plugins.inc
> meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb:require gst-plugins.inc
> meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb:require gst-plugins.inc

Yes, this is for a plugin I'm working on for meta-ti (gst-plugin-ducati)

>>
>> The commit
>>    commit f50e2984d9411a059b86d6c158e9416fceb84c3d
>>    Author: Martin Jansa <martin.jansa@gmail.com>
>>    Date:   Wed Nov 28 15:59:48 2012 +0100
>> breaks the build for such packages because the file "po/Makefile.in.in"
>> is not present.
>>
>> This change allows building without the po/ subdirectory.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   meta/recipes-multimedia/gstreamer/gst-plugins.inc |    4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> index 07b26a3..fc9567a 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> @@ -23,5 +23,7 @@ PACKAGES_DYNAMIC += "^${PN}-.*"
>>   # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
>>   # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
>>   oe_runconf_prepend() {
>> -	sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
>> +	if [ -e ${S}/po/Makefile.in.in ]; then
>> +		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
>> +	fi
>>   }
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


