Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxarN-00020o-Vc
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 11:41:26 +0200
Received: by obcva7 with SMTP id va7so2237988obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 02:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GPf3SgbV3guY+t8JdeB571Y7USlDhNVoiMU2Fy9Qhlg=;
	b=lG0TMSM+XkxBdF3SIvaZacBtyuZ5yiiDua/X3jOE4JgNJrChbzAXhnAtEjBlc5hI+r
	lK9yHuCRDlUNEwEkjDX82S5Yf0q+wWEgQrTEmBtgKq7zjDloK0b1hwlnEfuPrI33ZwTV
	1NjHKHF/zFI9PjXPWMsr/wWdsQWuRT5wfvm2ERcxLQcIqaSd+Pm/B5Cv+AQcSkPw5mOe
	GLpepZSbol/lMcgR0f572fmfX+uugnP+sZBZ1skEkBOzTQ91o7qkHSP/ju4/wMexfEcU
	SPqXvQp0FFAIuXYPA0D+FUWYdFOh3p52H+g0PCBVOUc9XYFf6gqmW9Nrixsai4YyLs+S
	E03Q==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr829346igc.5.1344072583005; Sat, 04
	Aug 2012 02:29:43 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Sat, 4 Aug 2012 02:29:42 -0700 (PDT)
In-Reply-To: <501CD3EE.3080100@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
Date: Sat, 4 Aug 2012 11:29:42 +0200
Message-ID: <CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 09:41:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 4, 2012 at 9:49 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>
>
> On 08/04/2012 02:22 AM, Andreas M=FCller wrote:
>> On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>> This will improve first boot time because building the icon cache is
>>> done on host, with more processing power than the target.
>>>
>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>> ---
>>>  meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-ico=
n-cache.bbclass
>>> index 01fb2f3..2d82c54 100644
>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>> @@ -1,18 +1,12 @@
>>>  FILES_${PN} +=3D "${datadir}/icons/hicolor"
>>>
>>> -DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D 'hicolor-i=
con-theme']}"
>>> +DEPENDS +=3D "${@['hicolor-icon-theme', '']['${BPN}' =3D=3D 'hicolor-i=
con-theme']} gtk+-native"
>>>
>>> -# This could run on the host as icon cache files are architecture inde=
pendent,
>>> -# but there is no gtk-update-icon-cache built natively.
>>>  gtk_icon_cache_postinst() {
>>> -if [ "x$D" !=3D "x" ]; then
>>> -        exit 1
>>> -fi
>>> -
>>>  # Update the pixbuf loaders in case they haven't been registered yet
>>>  GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pix=
buf-query-loaders --update-cache
>>>
>>> -for icondir in /usr/share/icons/* ; do
>>> +for icondir in $D/usr/share/icons/* ; do
>>>      if [ -d $icondir ] ; then
>>>          gtk-update-icon-cache -fqt  $icondir
>>>      fi
>>> --
>>> 1.7.9.5
>>>
>> Long time ago there was a patch introducing gtk-icon-cache to be only
>> run once on the machine [1] and I am still using that. At that time I
>> was asked for a more generic approach. Now I ask:
>>
>> 1. Wouldn't it be better to have gtk-icon-cache run once even on host
> But this is what these patches do. Make gtk-update-icon-cache run on
> host, when the target rootfs is constructed, rather than running it on
> target, at first boot.
As far as I can see gtk-icon-cache is run for each package - how much
extra build time at do_rootfs is to expect?

Andreas
>
> Thanks,
> Laurentiu
>
>> 2. Or better: How about a postinst 'runonce' framework for host/machine?
>>
>> Andreas
>>
>> [1] http://patches.openembedded.org/patch/24179/
>>


