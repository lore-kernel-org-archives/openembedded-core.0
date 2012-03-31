Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SDn9e-00051T-3H
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 03:30:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2V1LpkA026241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 18:21:51 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 30 Mar 2012 18:21:52 -0700
Message-ID: <4F765C2E.1090308@windriver.com>
Date: Sat, 31 Mar 2012 09:21:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1332318835.git.liezhi.yang@windriver.com>
	<89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
	<1332333371.9740.150.camel@ted> <4F69E9A1.2080505@windriver.com>
	<1333113898.18082.67.camel@ted>
In-Reply-To: <1333113898.18082.67.camel@ted>
Subject: Re: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
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
X-List-Received-Date: Sat, 31 Mar 2012 01:30:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/30/2012 09:24 PM, Richard Purdie wrote:
> On Wed, 2012-03-21 at 22:45 +0800, Robert Yang wrote:
>> Hi Richard,
>>
>> Please see my comments inline ...
>>
>> On 03/21/2012 08:36 PM, Richard Purdie wrote:
>>> On Wed, 2012-03-21 at 16:38 +0800, Robert Yang wrote:
>>>> Remove the do_configure_prepend which is used for removing
>>>> ${S}/m4/lib-link.m4 to compile under libtool 2.2.2, but our libtool has
>>>> been upgraded to 2.4.2, and:
>>>>
>>>> for the 3 recipes:
>>>>       gst-plugins-bad_0.10.22.bb
>>>>       gst-plugins-base_0.10.35.bb
>>>>       gst-plugins-good_0.10.30.bb
>>>>
>>>> They don't have m4/lib-link.m4 any more.
>>>>
>>>> For the gst-plugins-ugly_0.10.18.bb, though it has m4/lib-link.m4, our
>>>> libtool version is now 2.4.2, so we can remove the do_configure_prepend
>>>> from all of them.
>>>>
>>>> [YOCTO #2148]
>>>>
>>>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>>>> ---
>>>>    .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
>>>>    .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
>>>>    .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
>>>>    .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
>>>>    4 files changed, 4 insertions(+), 24 deletions(-)
>>>
>>> Not so easy I'm afraid. We need to ensure our libtool is being used.
>>> Even if the version matches, our libtool is patched to ensure the
>>> sysroot and rpaths work correctly. I'm therefore a little nervous about
>>> removing these at this point.
>>>
>>
>> Yes, I agree with you, though I checked the log.do_configure and log.do_compile,
>> it used our libtool. The safe way maybe just remove the
>> do_configure_prepend from gst-plugins-bad, gst-plugins-base and
>> gst-plugins-good since they don't have the ${S}/m4/lib-link.m4 any more.
>>
>> For gst-plugins-ugly, we can remove when it would not have ${S}/m4/lib-link.m4.
>>
>> I noticed this because there was error when build gst-plugins-base/bad/good:
>>
>> rm: cannot remove `/path/to/m4/lib-link.m4': No such file or directory.
>>
>> Here is an updated patch and pull request which only removes
>> do_configure_prepend for gst-plugins-base/bad/good:
>> (I'm not sure whether send a V2 is preferred or not for such case).
>>
>> git://git.pokylinux.org/poky-contrib robert/gst_v2
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gst_v2
>>
>> Subject: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
>>
>> Remove the do_configure_prepend which is used for removing
>> ${S}/m4/lib-link.m4, but the 3 recipes don't have m4/lib-link.m4 any
>> more:
>>       gst-plugins-bad_0.10.22.bb
>>       gst-plugins-base_0.10.35.bb
>>       gst-plugins-good_0.10.30.bb
>
> For what its worth, I just looked at the tarballs for these and the .m4
> files are still there in the two I checked. This patch is therefore not
> right in its current form.
>

I'm very sorry for this, it seems that I had checked in a wrong way before,
I checked them after the build, but I should check the tarball directly or
in do_patch stage, I will drop this.

// Robert

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


