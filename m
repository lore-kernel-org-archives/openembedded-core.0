Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 893466BC9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 00:05:58 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so108786lbh.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ePb75YDx9p+0w5KZchryO3ZGCRW39vbrTC70GQ0unGw=;
	b=bbGVkc6zRnT6IEGaaAocQPOg59UNivpkIaOdGS5NpVOI6Ji5+3TQgKOs/6GoRrfOil
	pA2rAxYdxa07Wzi9cGV247H2ray1mZoPCmSm0SGbwuIRxO+FTiDjpfSOcuxVs/X4zY5Q
	cp9hLFBDxPGYdPsKle77AD9Hn8QriBUwl1V/5qhltffy7UfC3FrCgKylUFcgjzoLfipU
	62/y7RlCAZcisLerq48OckdeDSkHvRaqAVb0WdAjYtPqVdGE0ul4yUTyTUC3LkrXygHX
	73weOGmdE0X8Bjfb0nXVv33Gq+xvoRiv1QhIObH41xseXgPyV0VRb/NteE5e1Lq4GoH7
	aqzQ==
X-Received: by 10.112.51.166 with SMTP id l6mr749904lbo.5.1377734758356; Wed,
	28 Aug 2013 17:05:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.53.197 with HTTP; Wed, 28 Aug 2013 17:05:38 -0700 (PDT)
In-Reply-To: <521E8414.8060309@linux.intel.com>
References: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
	<521E8414.8060309@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 28 Aug 2013 17:05:38 -0700
Message-ID: <CABcZANn4xsTBz-K+cq3ALD076t3cuYw_Q_qRo_Hb_Yip+VUdGw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: don't split immodules if we have none
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
X-List-Received-Date: Thu, 29 Aug 2013 00:05:59 -0000
Content-Type: multipart/alternative; boundary=001a113366bcdddde704e50ade11

--001a113366bcdddde704e50ade11
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 28, 2013 at 4:13 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/28/2013 09:12 AM, Christopher Larson wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Currently we don't enable any immodules for gtk+3, yet we unconditionally
>> call
>> do_split_packages on a nonexistent path. This results in a return value of
>> None, which it then tries to join, resulting in a TypeError. Only split
>> the
>> modules if we have any modules to split.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>>   meta/recipes-gnome/gtk+/gtk+3.**inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+**3.inc
>> b/meta/recipes-gnome/gtk+/gtk+**3.inc
>> index f4d5254..204a425 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+**3.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+**3.inc
>> @@ -94,7 +94,8 @@ python populate_packages_prepend () {
>>       immodules_root = os.path.join(gtk_libdir, 'immodules')
>>       printmodules_root = os.path.join(gtk_libdir, 'printbackends');
>>
>> -    d.setVar('GTKIMMODULES_**PACKAGES', ' '.join(do_split_packages(d,
>> immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for
>> %s')))
>> +    if os.path.exists(os.path.join(d.**getVar('D', True),
>> immodules_root)):
>> +        d.setVar('GTKIMMODULES_**PACKAGES', '
>> '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$',
>> 'gtk3-immodule-%s', 'GTK input module for %s')))
>>       do_split_packages(d, printmodules_root,
>> '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend
>> module for %s')
>>
>>       if (d.getVar('DEBIAN_NAMES', 1)):
>>
>>
> This seems to give me the following QA error:
>
>  ERROR: QA Issue: gtk+3: Files/directories were installed but not shipped
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-viqr.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-am-et.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-xim.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-multipress.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cedilla.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-et.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ipa.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-inuktitut.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-er.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-thai.so
>>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cyrillic-**translit.so
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/**
>> work/x86_64-poky-linux/gtk+3/**3.8.2-r0/temp/log.do_package.**17386
>> ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-**gnome/gtk+/gtk+3_3.8.2.bb,
>> do_package) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn't need to be
>> rerun and 1 failed.
>
>
Huh, interesting, on this box it doesn't build any modules at all, hence
the need for this.. oh, I see what I did wrong, I used os.path.join(), so
gtk_libdir squished ${D} down to nothing. I'll send a v2 using the
oe.path.join, and also try to determine why it builds modules for you but
not me :) I expect we should be passing an explicit autoconf argument to
enable all modules, or not.
-- 
Christopher Larson

--001a113366bcdddde704e50ade11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 28, 2013 at 4:13 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<=
/span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 08/28/2013 09:12 AM, Christopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
Currently we don&#39;t enable any immodules for gtk+3, yet we unconditional=
ly call<br>
do_split_packages on a nonexistent path. This results in a return value of<=
br>
None, which it then tries to join, resulting in a TypeError. Only split the=
<br>
modules if we have any modules to split.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-gnome/gtk+/gtk+3.<u></u>inc | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+<u></u>3.inc b/meta/recipes-gnome/=
gtk+/gtk+<u></u>3.inc<br>
index f4d5254..204a425 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+<u></u>3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+<u></u>3.inc<br>
@@ -94,7 +94,8 @@ python populate_packages_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 immodules_root =3D os.path.join(gtk_libdir, &#39;immod=
ules&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 printmodules_root =3D os.path.join(gtk_libdir, &#39;pr=
intbackends&#39;);<br>
<br>
- =C2=A0 =C2=A0d.setVar(&#39;GTKIMMODULES_<u></u>PACKAGES&#39;, &#39; &#39;=
.join(do_split_packages(d, immodules_root, &#39;^im-(.*)\.so$&#39;, &#39;gt=
k3-immodule-%s&#39;, &#39;GTK input module for %s&#39;)))<br>
+ =C2=A0 =C2=A0if os.path.exists(os.path.join(d.<u></u>getVar(&#39;D&#39;, =
True), immodules_root)):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;GTKIMMODULES_<u></u>PACKAGES&#39=
;, &#39; &#39;.join(do_split_packages(d, immodules_root, &#39;^im-(.*)\.so$=
&#39;, &#39;gtk3-immodule-%s&#39;, &#39;GTK input module for %s&#39;)))<br>
=C2=A0 =C2=A0 =C2=A0 do_split_packages(d, printmodules_root, &#39;^libprint=
backend-(.*)\.so$&#39;, &#39;gtk3-printbackend-%s&#39;, &#39;GTK printbacke=
nd module for %s&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (d.getVar(&#39;DEBIAN_NAMES&#39;, 1)):<br>
<br>
</blockquote>
<br></div></div>
This seems to give me the following QA error:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
ERROR: QA Issue: gtk+3: Files/directories were installed but not shipped<br=
>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-viqr.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-am-et.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-xim.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-multipress.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-cedilla.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-ti-et.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-ipa.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-inuktitut.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-ti-er.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-thai.so<br>
=C2=A0 /usr/lib/gtk-3.0/3.0.0/<u></u>immodules/im-cyrillic-<u></u>translit.=
so<br>
ERROR: QA run found fatal errors. Please consider fixing them.<br>
ERROR: Function failed: do_package_qa<br>
ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/<u></u>work/=
x86_64-poky-linux/gtk+3/<u></u>3.8.2-r0/temp/log.do_package.<u></u>17386<br=
>
ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-<u></u>gnome/gtk+/gtk+<a href=
=3D"http://3_3.8.2.bb" target=3D"_blank">3_3.8.2.bb</a>, do_package) failed=
 with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn&#39;t need to =
be rerun and 1 failed.</blockquote></blockquote></div><br>Huh, interesting,=
 on this box it doesn&#39;t build any modules at all, hence the need for th=
is.. oh, I see what I did wrong, I used os.path.join(), so gtk_libdir squis=
hed ${D} down to nothing. I&#39;ll send a v2 using the oe.path.join, and al=
so try to determine why it builds modules for you but not me :) I expect we=
 should be passing an explicit autoconf argument to enable all modules, or =
not.<br>

-- <br>Christopher Larson</div></div>

--001a113366bcdddde704e50ade11--
