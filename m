Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A07CF758DB;
	Wed, 14 Oct 2015 14:33:25 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9EEXP3K032423; Wed, 14 Oct 2015 09:33:25 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015101409332527-1903572 ;
	Wed, 14 Oct 2015 09:33:25 -0500 
To: Martin Jansa <martin.jansa@gmail.com>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<1444373887-24315-1-git-send-email-adrian.ratiu@ni.com>
	<20151013105339.GC2396@jama> <561CFBB4.4000404@ni.com>
	<20151013130825.GE2396@jama> <561E614F.4070909@ni.com>
	<20151014141650.GC22448@jama>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <561E67B3.7010304@ni.com>
Date: Wed, 14 Oct 2015 17:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151014141650.GC22448@jama>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/14/2015 09:33:25 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/14/2015 09:33:25 AM,
	Serialize complete at 10/14/2015 09:33:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-14_07:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Wed, 14 Oct 2015 14:33:27 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 14.10.2015 17:16, Martin Jansa wrote:
> On Wed, Oct 14, 2015 at 05:06:07PM +0300, Ioan-Adrian Ratiu wrote:
>> On 13.10.2015 16:08, Martin Jansa wrote:
>>> On Tue, Oct 13, 2015 at 03:40:20PM +0300, Ioan-Adrian Ratiu wrote:
>>>> On 13.10.2015 13:53, Martin Jansa wrote:
>>>>> On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
>>>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>>>> ---
>>>>>>     .../libvncserver/libvncserver_0.9.10.bb               | 19 +++++++++++++++++++
>>>>>>     1 file changed, 19 insertions(+)
>>>>>>     create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>>>>>> new file mode 100644
>>>>>> index 0000000..afa303c
>>>>>> --- /dev/null
>>>>>> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
>>>>>> @@ -0,0 +1,19 @@
>>>>>> +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
>>>
>>> Use SUMMARY for such short description.
>>>
>>>>>> +HOMEPAGE = "https://libvnc.github.io"
>>>>>> +SECTION = "libs"
>>>>>> +PRIORITY = "optional"
>>>
>>> Drop PRIORITY, we don't use it anywhere.
>>>
>>>>>> +LICENSE = "GPLv2"
>>>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
>>>>>> +
>>>>>> +DEPENDS += "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
>>>>>> +RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
>>>>>> +
>>>>>> +RCONFLICTS_${PN} = "x11vnc"
>>>>>
>>>>> This isn't enough to resolve conflicts with x11vnc in sysroot, this only
>>>>> prevent installing both packages in the same image.
>>>>>
>>>>>> +
>>>>>> +inherit autotools pkgconfig
>>>>>> +
>>>>>> +SRC_URI  = "git://github.com/LibVNC/libvncserver.git;tag=LibVNCServer-0.9.10"
>>>>>
>>>>> Set SRCREV matching with this tag, otherwise bitbake will always use git
>>>>> ls-remote to convert tag name to git SHA, which won't work for builds
>>>>> from premirror (possibly without access to network)
>>>>>
>>>>
>>>> This is easy to fix, however the above x11vnc conflict is not and I have
>>>> to check with upstream developers which might take awhile.
>>>>
>>>> Is it ok to blacklist libvncserver in patch v3 in order to not break
>>>> x11vnc until this is solved?
>>>
>>> I don't want to introduce more blacklisted recipes in meta-oe, so this
>>> won't be merged until it's resolved.
>>
>> Quick question: Fixing this involves adding a PACKAGECONFIG dependency
>> inside x11vnc on libvncserver. x11vnc is in the openembedded-core layer.
>
> If such PACKAGECONFIG can be disabled by default, then it's ok.
>
>> Should I move libvncserver to oe-core, move x11vnc in meta-oe or should
>> I just let them reside in separate layers even though there is this
>> dependency?
>
> oe-core (x11vnc) cannot by default depend on meta-oe (libvncserver), it
> can be optional dependency, but without looking at the code my guess is
> that this won't fix the issue.
>
> Is the PACKAGECONFIG about using external libvncserver instead of
> building own version inside x11vnc recipe? If my guess is right, then
> oe-core will need to build own and meta-oe will need to remove such
> PACKAGECONFIG in order to unblock building separate libvncserver.
>
> If that's the case then moving libvncserver to oe-core or x11vnc to
> meta-oe would be easier way forward.

Yes, this is correct (x11vnc's configured --with-system-libvncserver)

>
> Adding oe-core ML for their opinion.
>
> Regards,
>>>
>>>>>> +
>>>>>> +S = "${WORKDIR}/git"
>>>>>> +
>>>>>> +EXTRA_OEMAKE_append=" SUBDIRS='libvncserver' "
>>>>>> --
>>>>>> 2.1.4
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>>
>>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>>
>


